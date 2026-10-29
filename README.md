# AI Creative OS — Claude Agent Skill

A packaged [Claude Agent Skill](https://docs.anthropic.com/en/docs/agents-and-tools/agent-skills) version of the **AI Creative Operating System** — a versioned prompt library for running an AI-assisted creative production pipeline end to end: brief → creative strategy → art direction → styleframes → image generation → video generation → storyboard/motion/edit → asset management & QA.

## What's in here

- **`SKILL.md`** — the skill entry point. Contains the trigger description, an overview of the pipeline, a stable ID registry for every prompt domain (`CD`, `AD`, `IMG`, `VID`, etc.), and usage conventions. This is the only file loaded automatically; everything else is loaded on demand.
- **`reference/`** — the original 8-part core framework (tool routing, library structure, creative/art direction, design DNA & styleframes, image generation, video generation & continuity, storyboard/motion/edit/sound, asset management & QA).
- **`prompts/prompts-only.md`** — curated, copyable prompt extract of the full 8-part library.
- **`prompts/standalone-prompts.md`** — the same prompts, each rewritten to be fully self-contained (no cross-references to other files needed to use any single one).
- **`prompts/extensions/`** — additional prompt sets built after the original 8-part library (talking-head "content creator" prompts, reference-photo-locked identity prompts, UGC/avatar prompts). Not yet merged into the numbered domain system but fully usable as-is.

## Installing as a Claude Skill

**Claude.ai (personal skills):** zip this folder (or point to this repo) and upload it via Settings → Capabilities → Skills.

**Claude Code / API (project or user skill):**
```bash
# Project-level (only available in this repo/project)
git clone https://github.com/Axmgill/Creative_prompt_os.git .claude/skills/ai-creative-os

# User-level (available in all your projects)
git clone https://github.com/Axmgill/Creative_prompt_os.git ~/.claude/skills/ai-creative-os
```
Claude will auto-discover `SKILL.md` and load the rest of the files on demand when a request matches the skill's description.

## Notes

- Part 1 (tool/model routing) contains a dated research snapshot of AI tools and model versions — treat specific version claims there as something to re-verify periodically, not permanent fact.
- The `prompts/extensions/` creator-reference-locked prompts require documented consent before generating AI images of a real person's likeness — this is called out directly in that file and is not optional.
- No license file is included by default. Add one (or your organization's internal-use terms) before treating this as redistributable beyond your own use.

## Provenance

Compiled from an iterative, conversation-driven engagement building a reusable AI creative production prompt library, then packaged into the standard Agent Skill format (`SKILL.md` + progressive-disclosure reference files) for reuse across projects.
