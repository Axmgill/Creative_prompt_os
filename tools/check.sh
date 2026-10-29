#!/usr/bin/env bash
# Verify the cross-agent packaging stays honest across hosts.
#
#   tools/check.sh
#
# Checks:
#   1. AGENTS.md is under the 32 KiB default cap hosts apply to that file.
#   2. Every portable prompt's copyable block fits its host's character limit.
#   3. Every repo path referenced by AGENTS.md / llms.txt actually exists.
#   4. llms-full.txt is in sync with its sources.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

FAIL=0
ok()   { printf '  ok    %s\n' "$1"; }
fail() { printf '  FAIL  %s\n' "$1"; FAIL=1; }

# Character count: prefer python3 for correct UTF-8 handling, fall back to wc.
charcount() {
  if command -v python3 >/dev/null 2>&1; then
    python3 -c 'import sys;print(len(open(sys.argv[1],encoding="utf-8").read()))' "$1"
  else
    wc -m < "$1" | tr -d ' '
  fi
}

# Print the first fenced code block of a file (the copy-paste payload).
extract_block() {
  awk 'BEGIN{n=0} /^```/{n++; if(n==2) exit; next} n==1{print}' "$1"
}

echo "1. AGENTS.md size (hosts cap this file at 32 KiB by default)"
bytes=$(wc -c < AGENTS.md | tr -d ' ')
lines=$(wc -l < AGENTS.md | tr -d ' ')
if [ "$bytes" -lt 32768 ]; then
  ok "AGENTS.md is $bytes bytes, $lines lines (limit 32768)"
else
  fail "AGENTS.md is $bytes bytes — over the 32768 default limit"
fi
if [ "$lines" -gt 200 ]; then
  printf '  warn  AGENTS.md is %s lines; under 200 is the recommended ceiling\n' "$lines"
fi

echo
echo "2. Portable prompt budgets (limits verified October 2026 — re-check when a host changes theirs)"
check_budget() {
  local file=$1 limit=$2 host=$3 tmp n
  if [ ! -f "$file" ]; then fail "$file missing"; return; fi
  tmp=$(mktemp)
  extract_block "$file" > "$tmp"
  n=$(charcount "$tmp")
  rm -f "$tmp"
  if [ "$n" -eq 0 ]; then fail "$file has no copyable code block"; return; fi
  if [ "$n" -le "$limit" ]; then
    ok "$(printf '%-34s %5s / %s chars  (%s)' "$file" "$n" "$limit" "$host")"
  else
    fail "$(printf '%-34s %5s / %s chars  (%s) — over by %s' "$file" "$n" "$limit" "$host" "$((n-limit))")"
  fi
}
# file                                budget  host limit
check_budget portable/mini-prompt.md          1450 "fits 1500 fields"
check_budget portable/gemini-gem-instructions.md 3900 "Gemini Gem ~4000"
check_budget portable/chatgpt-instructions.md    4900 "ChatGPT 5000 capped"
check_budget portable/system-prompt.md          7900 "Custom GPT 8000"
check_budget portable/kickoff-prompt.md         6000 "pasted per chat"

echo
echo "3. Referenced paths exist"
missing=0
while IFS= read -r p; do
  [ -n "$p" ] || continue
  if [ ! -e "$p" ]; then printf '  FAIL  referenced but missing: %s\n' "$p"; missing=1; FAIL=1; fi
done < <(
  {
    grep -oE '`(reference|prompts|portable|tools)/[A-Za-z0-9._/-]+`' AGENTS.md SKILL.md llms.txt 2>/dev/null \
      | sed 's/.*`\(.*\)`/\1/' | sed 's:[.,]$::' | sort -u
    # llms.txt raw URLs -> repo paths
    grep -oE 'raw\.githubusercontent\.com/Axmgill/Creative_prompt_os/main/[A-Za-z0-9._/-]+' llms.txt 2>/dev/null \
      | sed 's|raw\.githubusercontent\.com/Axmgill/Creative_prompt_os/main/||' | sort -u
  } | sort -u
)
[ "$missing" -eq 0 ] && ok "every referenced file and URL resolves to a tracked path"

echo
echo "4. llms-full.txt is in sync"
if [ ! -f llms-full.txt ]; then
  fail "llms-full.txt missing — run tools/build.sh"
else
  before=$(git hash-object llms-full.txt)
  bash tools/build.sh >/dev/null 2>&1 || fail "tools/build.sh failed"
  after=$(git hash-object llms-full.txt)
  if [ "$before" = "$after" ]; then
    ok "llms-full.txt matches its sources ($(wc -c < llms-full.txt | tr -d ' ') bytes)"
  else
    fail "llms-full.txt was stale — rebuilt in place; commit the result"
  fi
fi

echo
echo "5. Portable blocks agree with AGENTS.md on the guardrails"
guardrail_fail=0
for phrase in "documented consent" "AI-disclosure" "verif"; do
  for f in portable/mini-prompt.md portable/gemini-gem-instructions.md \
           portable/chatgpt-instructions.md portable/system-prompt.md portable/kickoff-prompt.md; do
    if ! grep -qi -- "$phrase" "$f"; then
      fail "$f does not mention \"$phrase\" — guardrails must survive compression"
      guardrail_fail=1
    fi
  done
done
[ "$guardrail_fail" -eq 0 ] && ok "consent / disclosure / verify guardrails present in every portable prompt"

echo
echo "6. Anti-blocking rule survived compression (dependencies, missing info)"
block_fail=0
for f in AGENTS.md SKILL.md portable/mini-prompt.md \
         portable/gemini-gem-instructions.md portable/chatgpt-instructions.md \
         portable/system-prompt.md portable/kickoff-prompt.md; do
  if ! grep -qiE 'never block' "$f"; then
    fail "$f lost the anti-blocking rule (\"never block\")"
    block_fail=1
  fi
  if ! grep -qi 'skip' "$f"; then
    fail "$f never mentions skipping a stage — dependency ladder incomplete"
    block_fail=1
  fi
done
[ "$block_fail" -eq 0 ] && ok "every surface tells the agent to skip a step rather than block the user"

echo
if [ "$FAIL" -eq 0 ]; then
  echo "All checks passed."
else
  echo "Checks failed — see FAIL lines above."
fi
exit "$FAIL"
