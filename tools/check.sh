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

echo "7. Gemini skill bundle in dist/ is in sync"
if [ ! -f dist/ai-creative-os.zip ]; then
  fail "dist/ai-creative-os.zip missing — run tools/build-gemini-skill.sh"
else
  before=$(git hash-object dist/ai-creative-os.zip)
  bash tools/build-gemini-skill.sh >/dev/null 2>&1 || fail "build-gemini-skill.sh failed"
  after=$(git hash-object dist/ai-creative-os.zip)
  if [ "$before" = "$after" ]; then
    ok "dist/ai-creative-os.zip matches its sources ($(( $(wc -c < dist/ai-creative-os.zip) / 1024 )) KB)"
  else
    fail "Gemini skill bundle was stale — rebuilt in place; commit the result"
  fi
fi

echo
echo "8. Gemini skill upload requirements (support.google.com/gemini p=pn_skills)"
# Hard limits Google documents and enforces at upload time.
python3 - "$FAIL" <<'PY_CHECK'
import re, sys, zipfile, pathlib

fail = 0
def ok(m):   print(f"  ok    {m}")
def bad(m):  global fail; fail = 1; print(f"  FAIL  {m}")

md = pathlib.Path("SKILL.md")
if not md.exists():
    bad("SKILL.md missing from the main folder")
    sys.exit(1)

text = md.read_text(encoding="utf-8")
m = re.match(r"^---\n(.*?)\n---\n", text, re.S)
if not m:
    bad("SKILL.md does not start with YAML frontmatter between --- delimiters")
    sys.exit(1)
fm = m.group(1)

def field(name):
    mm = re.search(rf"^{name}:\s*(.+)$", fm, re.M)
    return mm.group(1).strip() if mm else None

name = field("name")
desc = field("description")
lic  = field("license")

# name: required, kebab-case, <=64, no leading/trailing/double hyphens
if not name:
    bad("frontmatter has no name")
elif len(name) > 64:
    bad(f"name is {len(name)} chars (limit 64)")
elif not re.match(r"^[a-z0-9]+(-[a-z0-9]+)*$", name):
    bad(f"name '{name}' is not kebab-case (lowercase letters, digits, single hyphens)")
else:
    ok(f"name '{name}' is kebab-case, {len(name)}/64 chars")

# YAML safety: an unquoted ': ' or ' #' inside a plain scalar breaks parsing
# on strict hosts (Gemini validates frontmatter before accepting an upload).
yaml_issues = []
for line in fm.splitlines():
    if not line.strip() or line.startswith((" ", "\t")):
        continue
    k, _, v = line.partition(":")
    if ": " in v:
        yaml_issues.append(f"{k.strip()}: unquoted ': ' in value")
    if " #" in v:
        yaml_issues.append(f"{k.strip()}: ' #' starts a YAML comment")
if yaml_issues:
    bad("frontmatter is not YAML-safe: " + "; ".join(yaml_issues))
else:
    ok("frontmatter is YAML-safe (no unquoted ': ' or ' #')")

# description: required, 1..1024
if not desc:
    bad("frontmatter has no description")
elif len(desc) > 1024:
    bad(f"description is {len(desc)} chars (hard limit 1024)")
else:
    ok(f"description is {len(desc)}/1024 chars")

# license: optional, but must not be empty if present
if lic is not None and not lic:
    bad("license is present but empty")
elif lic:
    ok(f"license present ({len(lic)}/1024 chars)")

zpath = pathlib.Path("dist/ai-creative-os.zip")
if not zpath.exists():
    bad("dist/ai-creative-os.zip missing")
else:
    with zipfile.ZipFile(zpath) as z:
        names = [n for n in z.namelist() if not n.endswith("/")]
        # exactly one SKILL.md, in the root or a single wrapper folder
        skill_md = [n for n in names if n.split("/")[-1] == "SKILL.md"]
        if len(skill_md) != 1:
            bad(f"expected exactly one SKILL.md in the zip, found {len(skill_md)}")
        else:
            parts = skill_md[0].split("/")
            if len(parts) == 2:
                ok(f"SKILL.md sits in the main folder ({skill_md[0]})")
            elif len(parts) == 1:
                ok("SKILL.md sits at the archive root")
            else:
                bad(f"SKILL.md is nested too deep ({skill_md[0]}) — must be in the main folder")

        # the wrapper folder name must equal the skill name
        tops = {n.split("/")[0] for n in names}
        if len(tops) == 1 and name and tops == {name}:
            ok(f"folder '{name}' matches the skill name")
        elif len(tops) == 1:
            bad(f"folder '{sorted(tops)[0]}' does not match skill name '{name}'")
        else:
            bad(f"expected one top-level folder, found {len(tops)}: {sorted(tops)[:4]}")

        # supported file types only
        allowed = {".md", ".markdown", ".txt", ".rst", ".csv", ".json", ".yaml",
                   ".yml", ".py", ".sh", ".html", ".css", ".pdf", ".jpg", ".png"}
        bad_types, junk = set(), []
        for n in names:
            ext = pathlib.PurePosixPath(n).suffix.lower()
            if ext not in allowed:
                bad_types.add(ext or "(none)")
            if pathlib.PurePosixPath(n).name in (".DS_Store",) or ext == ".pyc":
                junk.append(n)
        if bad_types:
            bad(f"unsupported file types in zip: {sorted(bad_types)}")
        else:
            ok("only supported file types (plain text / markdown)")
        if junk:
            bad(f"junk files that break uploads: {junk}")
        else:
            ok("no .DS_Store / .pyc junk")

        # size, count, nesting
        if len(names) > 100:
            bad(f"{len(names)} files (limit 100)")
        else:
            ok(f"{len(names)} files (limit 100)")
        depth = max(len(pathlib.PurePosixPath(n).parts) for n in names)
        if depth > 11:
            bad(f"nesting depth {depth} (limit 10 below the skill root)")
        else:
            ok(f"nesting depth {depth} (limit 10)")

sys.exit(fail)
PY_CHECK
[ $? -eq 0 ] || FAIL=1

echo
if [ "$FAIL" -eq 0 ]; then
  echo "All checks passed."
else
  echo "Checks failed — see FAIL lines above."
fi
exit "$FAIL"
