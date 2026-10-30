#!/usr/bin/env bash
# Build dist/ai-creative-os.zip — the upload-ready Gemini skill package.
#
# Gemini's upload rules (support.google.com/gemini, "Create & manage skills"):
#   - SKILL.md must sit in the root (main) folder of the upload
#   - the skill name in SKILL.md must be kebab-case and match the folder name
#   - supported types only (no archives, .docx, .xlsx, .pyc, .DS_Store)
#   - 100 MB total, 100 files, 10 levels of nesting
#
# The zip therefore contains exactly one top-level folder, named after the
# skill: ai-creative-os/SKILL.md
#
# Assembled from the repository's own files, so nothing can drift. Run after
# editing SKILL.md or any reference/prompt file, and commit the regenerated zip.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

SKILL_NAME="$(awk -F': *' '/^name:/{print $2; exit}' SKILL.md)"
if [ -z "$SKILL_NAME" ]; then
  echo "build-gemini-skill: could not read the skill name from SKILL.md" >&2
  exit 1
fi

STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT

BUNDLE="$STAGE/$SKILL_NAME"
mkdir -p "$BUNDLE"

# --- Skill payload -----------------------------------------------------------
# Folder structure is preserved exactly as in the repo, because SKILL.md and
# AGENTS.md reference these paths (reference/part-*.md, prompts/...). Renaming
# them here would break every internal link.

cp SKILL.md  "$BUNDLE/SKILL.md"          # required, at the main folder
cp AGENTS.md "$BUNDLE/AGENTS.md"
cp README.md "$BUNDLE/README.md"

mkdir -p "$BUNDLE/reference" "$BUNDLE/prompts/extensions" "$BUNDLE/portable"
cp reference/*.md              "$BUNDLE/reference/"
cp prompts/prompts-only.md     "$BUNDLE/prompts/"
cp prompts/standalone-prompts.md "$BUNDLE/prompts/"
cp prompts/extensions/*.md     "$BUNDLE/prompts/extensions/"
cp portable/*.md               "$BUNDLE/portable/"

# tools/ is deliberately excluded: shell scripts are repo tooling, not skill
# content, and Gemini does not execute them.

# --- Read-me ----------------------------------------------------------------
cat > "$BUNDLE/READ-ME-FIRST.txt" <<'READ_ME'
AI CREATIVE OS — GEMINI SKILL PACKAGE
=====================================

Upload this folder (or this .zip) to Gemini as a skill. Setup takes about a
minute. Everything below happens in Gemini.

WHAT'S IN HERE
--------------
SKILL.md                  the skill definition: frontmatter + instructions.
                          Gemini reads the name and description to decide when
                          the skill applies.
reference/part-1..8.md    the 8-part framework, opened only when needed
prompts/                  ready-made prompts (prompts-only.md, standalone,
                          extensions for talking-head / reference-locked / UGC)
portable/                 paste-ready versions for other hosts
AGENTS.md, README.md      the cross-agent entry point and install notes

Structure note: SKILL.md sits in the main folder, and the folder is named
ai-creative-os to match the skill name. Gemini requires both.


HOW TO UPLOAD
-------------
1. Go to gemini.google.com
2. Sidebar → Customize (under More if you don't see it) → Skills
3. Click Create → Upload
4. Select this folder, or this .zip file
5. Review what Gemini extracted, then click Create

You do not need to unzip it if you upload the .zip. If you upload the folder,
keep SKILL.md at its top level — do not move it into a subfolder.

The folder works for the older Gems flow too: create a Gem and upload the
files from reference/ and prompts/ as knowledge. Google is migrating Gems to
skills from November 2026, so the skill route is the one that lasts.


TRYING IT
---------
Type /ai-creative-os in a chat to invoke it explicitly, or just describe the
job and let Gemini match it. Three prompts that should work:

    "Concept territories for a 30-second launch film for a Karachi coffee brand."

    "Write an image prompt for a photoreal hero shot of a ceramic pour-over
     brewer on a wet concrete counter, 4:5, morning light."

    "I only have an outline. Storyboard 4 shots for a 20-second reel."

A working skill will: name the pipeline stage and prompt ID it is using, ask at
most ONE question (with a default attached), and hand you a copyable prompt in
a code block. If it asks you to complete three other steps first, or replies
with a list of questions instead of a prompt, the skill did not load — check
that SKILL.md is at the top level of the upload.


HOW IT BEHAVES
--------------
- It answers the step you asked for. If that step usually needs an earlier one
  that was never done, it improvises a provisional version marked [PROPOSED]
  and carries on. It never sends you back to do the earlier step.
- It asks one blocking question at most, always with a default, so you can
  ignore it and still get output.
- It labels every claim: [CONFIRMED], [ASSUMPTION - reason], [UNKNOWN],
  [PROPOSED], [LOCKED], [APPROVED], [SKIPPED].
- It will not approve work on your behalf, and it will ask for documented
  consent before writing a prompt around a real person's likeness.


PROVENANCE — WHY THIS IS SAFE TO UPLOAD
---------------------------------------
Everything in this package was written for this library. There are no
third-party or scraped files, no executables, no scripts that call the network,
no binaries, no credentials and no personal data. Supported file types only
(.md and .txt). If you got this package from anywhere other than

    https://github.com/Axmgill/Creative_prompt_os

verify it against that repository before uploading it to any assistant.


TWO THINGS TO KNOW BEFORE YOU USE IT
------------------------------------
1. Part 1 (reference/part-1-research-and-routing.md) is a dated research
   snapshot from October 2026. Tool names, versions, limits and prices in it
   will drift — treat them as something to re-verify, not as current fact.
2. prompts/extensions/creator-reference-locked-prompts.md covers generating
   images locked to a real person's photo. That needs documented consent from
   that person, and advertising may require AI-disclosure. The skill will ask.


LIMITS
------
Gemini caps an upload at 100 MB and 100 files; this package is well under both.
Skills also cannot run scripts that need internet access — this one needs none.
If the skill field rejects the description, it is over 1,024 characters: shorten
the `description:` line in SKILL.md.

Repository: https://github.com/Axmgill/Creative_prompt_os
No licence is bundled. Add one before redistributing.
READ_ME

# --- Deterministic zip -------------------------------------------------------
# Fixed mtimes, sorted entries, no directory entries, no extra attributes, so
# the same sources always produce a byte-identical zip and tools/check.sh can
# tell a stale bundle from a rebuild.
find "$STAGE" -exec touch -t 202601010000 {} +
mkdir -p dist
rm -f "dist/$SKILL_NAME.zip"
( cd "$STAGE" && find "$SKILL_NAME" -type f | LC_ALL=C sort \
    | zip -qX -D "$ROOT/dist/$SKILL_NAME.zip" -@ )

desc_chars=$(python3 -c '
import re,sys
t=open("SKILL.md",encoding="utf-8").read()
m=re.search(r"^description:\s*(.*)$",t,re.M)
print(len(m.group(1).strip()))' 2>/dev/null || echo "?")

printf 'build-gemini-skill: wrote dist/%s.zip\n' "$SKILL_NAME"
printf '  skill name:   %s (kebab-case, matches folder)\n' "$SKILL_NAME"
printf '  SKILL.md:     main folder of the package\n'
printf '  description:  %s chars (Gemini limit 1024)\n' "$desc_chars"
printf '  files:        %s (limit 100)\n' "$(find "$BUNDLE" -type f | wc -l | tr -d ' ')"
printf '  size:         %s KB\n' "$(( $(wc -c < "dist/$SKILL_NAME.zip") / 1024 ))"
