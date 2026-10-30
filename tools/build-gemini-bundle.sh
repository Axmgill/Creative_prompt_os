#!/usr/bin/env bash
# Build dist/ai-creative-os-gemini.zip — the download-and-go Gemini Gem bundle.
#
# Assembled from single sources so nothing can drift out of sync with the repo:
#   instructions <- portable/gemini-gem-instructions.md (code block, fences stripped)
#   knowledge    <- SKILL.md, prompts/standalone-prompts.md, reference/part-{2,3,5,6}
#
# Run after changing any of those files, and commit the regenerated zip.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT

BUNDLE="$STAGE/ai-creative-os-gemini"
mkdir -p "$BUNDLE/2-upload-as-knowledge"

# 1. Instruction text: first fenced block, fences stripped, so it pastes cleanly.
awk 'BEGIN{n=0} /^```/{n++; next} n==1{print}' portable/gemini-gem-instructions.md \
  > "$BUNDLE/1-PASTE-INTO-GEM-INSTRUCTIONS.txt"
if [ ! -s "$BUNDLE/1-PASTE-INTO-GEM-INSTRUCTIONS.txt" ]; then
  echo "build-gemini-bundle: could not extract the instruction block" >&2
  exit 1
fi

# 2. Knowledge files, renamed for readability inside the Gem's knowledge list.
cp SKILL.md                                        "$BUNDLE/2-upload-as-knowledge/SKILL.md"
cp prompts/standalone-prompts.md                   "$BUNDLE/2-upload-as-knowledge/prompts-standalone-prompts.md"
cp reference/part-2-library-structure-and-foundation.md "$BUNDLE/2-upload-as-knowledge/reference-part-2-structure-and-foundation.md"
cp reference/part-3-creative-art-direction.md      "$BUNDLE/2-upload-as-knowledge/reference-part-3-creative-art-direction.md"
cp reference/part-5-image-generation.md            "$BUNDLE/2-upload-as-knowledge/reference-part-5-image-generation.md"
cp reference/part-6-video-generation.md            "$BUNDLE/2-upload-as-knowledge/reference-part-6-video-generation.md"

# 3. Read-me written into the bundle.
cat > "$BUNDLE/0-READ-ME-FIRST.txt" <<'READ_ME'
AI CREATIVE OS — GEMINI GEM BUNDLE
==================================

This bundle turns Gemini on the web into a working AI Creative OS agent.
Setup takes about three minutes. Everything below happens in Gemini.

WHAT'S IN HERE
--------------
1-PASTE-INTO-GEM-INSTRUCTIONS.txt   the Gem's instruction text, sized to fit
                                    Gemini's ~4,000-character field
2-upload-as-knowledge/              the reference library the Gem reads from:
                                    SKILL.md (the routing map — most important)
                                    prompts-standalone-prompts.md (the workhorse)
                                    reference-part-2 .. part-6

The instruction text is already stripped of code fences. Paste it as-is.


STEP 1 — CREATE THE GEM
-----------------------
1. Go to gemini.google.com
2. In the left sidebar, open "Gems", then "New Gem".
3. Name it: AI Creative OS
4. Open 1-PASTE-INTO-GEM-INSTRUCTIONS.txt, select all, copy, and paste it into
   the Instructions field.


STEP 2 — ATTACH THE KNOWLEDGE
-----------------------------
In the same Gem, use the "Add files" / "Knowledge" control and upload, in this
order:

    SKILL.md
    prompts-standalone-prompts.md
    reference-part-3-creative-art-direction.md
    reference-part-5-image-generation.md
    reference-part-6-video-generation.md
    reference-part-2-structure-and-foundation.md   (optional, but includes the
                                                    project context, decision log
                                                    and handoff templates)

Part 1 (tool/model routing, dated) and Parts 4, 7, 8 are not included — they are
large and less frequently needed. Get them from the repo if you want them:

    https://github.com/Axmgill/Creative_prompt_os/tree/main/reference


STEP 3 — SAVE AND TEST
----------------------
Save the Gem, open it, and try one of these:

    "Concept territories for a 30-second launch film for a Karachi coffee brand."

    "Write an image prompt for a photoreal hero shot of a ceramic pour-over
     brewer on a wet concrete counter, 4:5, morning light."

    "I only have an outline. Storyboard 4 shots for a 20-second reel."

A working Gem will: name the pipeline stage and prompt ID it is using, ask at
most ONE question (with a default attached), and hand you a copyable prompt in
a code block. If it asks you to complete three other steps first, or replies
with a list of questions instead of a prompt, the instructions did not paste.


HOW IT BEHAVES (so you know what good looks like)
-------------------------------------------------
- It answers the step you asked for. If that step usually needs an earlier one
  that was never done, it improvises a provisional version marked [PROPOSED]
  and carries on. It never sends you back to do the earlier step.
- It asks one blocking question at most, always with a default, so you can
  ignore it and still get output.
- It labels every claim: [CONFIRMED], [ASSUMPTION - reason], [UNKNOWN],
  [PROPOSED], [LOCKED], [APPROVED], [SKIPPED].
- It will not approve work on your behalf, and it will ask for documented
  consent before writing a prompt around a real person's likeness.


IF THE PASTE IS REJECTED (field too small)
------------------------------------------
Character limits change without notice. Delete the BOUNDARIES section first,
then rules 8-9 (Gemini handles images and video natively anyway). If it is still
too long, use the mini prompt instead:

    https://raw.githubusercontent.com/Axmgill/Creative_prompt_os/main/portable/mini-prompt.md


WITHOUT A GEM (just a chat)
---------------------------
You don't need a Gem. Start a chat, paste this first message, and Gemini will
fetch the library itself when browsing is enabled:

    https://raw.githubusercontent.com/Axmgill/Creative_prompt_os/main/portable/kickoff-prompt.md


WHICH FILES ARE TRUSTWORTHY
---------------------------
reference-part-1 (tool and model routing) is a dated research snapshot from
October 2026. Model names, version numbers, limits and prices in it will drift —
treat them as something to re-verify, not as current fact. The behavioural rules
and the prompt structures are model-independent and do not drift.


MORE
----
Repository:  https://github.com/Axmgill/Creative_prompt_os
Other hosts: portable/README.md in the repo (ChatGPT, Copilot, Cursor, API,
             Claude Projects, browsing chats)

No licence is bundled with this library. Add one before redistributing it
beyond your own use.
READ_ME

# 4. Zip into dist/ deterministically, so tools/check.sh can tell a stale bundle
#    from a rebuild: fixed mtimes, sorted entries, no directory entries, no
#    extra attributes. Same sources -> byte-identical zip.
find "$BUNDLE" -exec touch -t 202601010000 {} +
mkdir -p dist
rm -f dist/ai-creative-os-gemini.zip
( cd "$STAGE" && find ai-creative-os-gemini -type f | LC_ALL=C sort \
    | zip -qX -D "$ROOT/dist/ai-creative-os-gemini.zip" -@ )

chars=$(python3 -c 'import sys;print(len(open(sys.argv[1],encoding="utf-8").read()))' \
  "$BUNDLE/1-PASTE-INTO-GEM-INSTRUCTIONS.txt" 2>/dev/null || wc -m < "$BUNDLE/1-PASTE-INTO-GEM-INSTRUCTIONS.txt" | tr -d ' ')

printf 'build-gemini-bundle: wrote dist/ai-creative-os-gemini.zip\n'
printf '  instructions: %s chars (Gemini Gem field allows ~4000)\n' "$chars"
printf '  knowledge:    %s files\n' "$(ls -1 "$BUNDLE/2-upload-as-knowledge" | wc -l | tr -d ' ')"
printf '  size:         %s KB\n' "$(( $(wc -c < dist/ai-creative-os-gemini.zip) / 1024 ))"
