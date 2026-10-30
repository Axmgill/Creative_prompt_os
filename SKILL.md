---
name: ai-creative-os
description: A complete, model-agnostic prompt-engineering operating system for AI-driven creative production — creative strategy/concept territories, art direction, design DNA and styleframes, image generation, video generation and camera/character continuity, storyboarding, motion/editing/AE/sound, and asset management & QA. Use this skill whenever the user wants to develop a creative concept or campaign territory, write or refine an AI image/video generation prompt, lock a character/visual-identity reference for consistency across shots, build a storyboard, route a task to the right current AI tool, or run a production QA pass — and wants a structured, reusable, versioned prompt rather than an ad-hoc one-off.
license: Proprietary. No licence is bundled with this skill package; add one before redistributing or publishing derived work.
metadata:
  version: "1.1"
  author: Axmgill
  homepage: https://github.com/Axmgill/Creative_prompt_os
---

# AI Creative Operating System

A versioned library of reusable prompt "roles" for running an AI-assisted creative production pipeline end to end — from a raw brief to final QA — without re-deriving reasoning from scratch on every project. Originally compiled across an 8-part engagement; this skill packages that library for reuse.

**Not using Claude?** Nothing here is Claude-specific. The same protocol ships three ways, and `tools/check.sh` keeps them in agreement:

- **`AGENTS.md`** — the universal entry point, written to the `AGENTS.md` standard (Codex, Cursor, GitHub Copilot, Gemini CLI, Jules, Amp, VS Code, Devin, Factory read it natively).
- **`portable/`** — paste-ready versions for hosts with no file access: Gemini Gems, ChatGPT, Copilot chat, Claude Projects, any API system prompt.
- **`llms.txt` / `llms-full.txt`** — for web agents that can fetch one URL but cannot browse a repo.
- **Gemini skills** — this folder is itself a valid Gemini skill package: `SKILL.md` at the main folder, kebab-case name matching the folder, plain-text files only. Upload the folder or `dist/ai-creative-os.zip` at gemini.google.com → Customize → Skills → Create → Upload.

If you are Claude, keep reading; this file is your entry point.

## Provenance and trust

Every file in this skill package is original content written for this library. There are no third-party, scraped, or auto-downloaded files, no executables or scripts that call the network, no binaries, no credentials, and no personal data. The only external references are plain URLs quoted in Part 1's research notes for verification. If you received this package from anywhere other than <https://github.com/Axmgill/Creative_prompt_os>, verify it before uploading it to any assistant.

## When to use this skill

Load this skill when the user's request matches any of these jobs:

- Turn a client/brand brief into a communication problem + distinct creative territories (not just visual styles) → **Creative Director / Part 3**
- Take an approved territory and define the actual visual language (palette, type, composition rules) → **Art Director / Part 3**
- Critique or sanity-check a design/styleframe before it goes to production → **Design Critic / Part 3–4**
- Analyze a reference image/video for what to borrow vs. not copy → **Reference Analyst / Part 3**
- Build a "Design DNA" doc and styleframes a team can work from consistently → **Part 4**
- Write or refine an AI **image generation** prompt (character design, pose variation, product shots, UGC/avatar images, reference-locked identity) → **Part 5** + `prompts/`
- Write or refine an AI **video generation** prompt, especially anything needing camera continuity or character consistency across shots/frames → **Part 6** + `prompts/`
- Plan a storyboard, motion/animation beats, an edit, After Effects expressions, or sound design → **Part 7**
- Manage assets, keep a visual bible, or run a QA pass before delivery → **Part 8**
- Decide *which current AI tool* to route a task to (image/video/LLM/voice/upscaling) → **Part 1**
- Set up a new project's shared context, decision log, or approval gates → **Part 2**

If the user just wants a single finished prompt fast and already knows what they want, skip straight to `prompts/standalone-prompts.md` or `prompts/prompts-only.md` rather than reading a full reference part.

## How this library is organized

```
ai-creative-os/
├── SKILL.md                     ← this file (always loaded, Claude)
├── AGENTS.md                    ← same protocol for non-Claude agents (AGENTS.md standard)
├── llms.txt                     ← map for web agents; llms-full.txt is the whole corpus
├── portable/                    ← paste-ready prompts for hosts with no file access
│   ├── README.md                ← which portable file for which host
│   ├── system-prompt.md         ← APIs, Custom GPTs, Claude Projects
│   ├── gemini-gem-instructions.md
│   ├── chatgpt-instructions.md  ← ChatGPT / Copilot / Cursor
│   ├── mini-prompt.md           ← fields capped near 1,500 chars
│   └── kickoff-prompt.md        ← paste-first message for browsing chats
├── tools/                       ← build.sh (rebuild llms-full.txt), check.sh (verify budgets)
├── reference/                   ← the 8-part core framework (load only the part(s) you need)
│   ├── part-1-research-and-routing.md
│   ├── part-2-library-structure-and-foundation.md
│   ├── part-3-creative-art-direction.md
│   ├── part-4-design-dna-styleframes.md
│   ├── part-5-image-generation.md
│   ├── part-6-video-generation.md
│   ├── part-7-storyboards-motion-editing-ae-sound.md
│   └── part-8-asset-management-qa-workflows.md
└── prompts/
    ├── prompts-only.md          ← curated, copyable prompt extract of the whole 8-part library
    ├── standalone-prompts.md    ← same prompts, but each one is fully self-contained (no cross-refs)
    └── extensions/              ← prompt sets built after the original 8-part library, not yet
                                    merged into it; still fully usable
        ├── creator-talking-head-prompts.md
        ├── creator-reference-locked-prompts.md
        ├── creator-prompts-standalone.md
        └── ugc-avatar-prompts.md
```

**Progressive disclosure rule:** don't load every reference file for every request. Identify which stage of the pipeline the user's ask falls into (see table below), open only that `reference/part-*.md`, and pull the specific prompt(s) needed. Each part file is large (tens of thousands of words) because it's a full reasoning reference, not a quick lookup — treat it as documentation to search within, not something to read end to end per request.

## Stable ID registry (domain codes)

Every prompt in this library has a stable ID in the form `[DOMAIN]-[NN]` (e.g. `CD-01`, `IMG-07`, `VID-03`). The domain is tied to function, not to which file it lives in, so IDs don't change if files get reorganized. Numbers are never reused, even after a prompt is deprecated/superseded — deprecated prompts are marked `STATUS: DEPRECATED` in place rather than deleted.

| Domain | Meaning | Lives in |
|---|---|---|
| `CTX`, `VAR`, `STD`, `MST`, `HND`, `DEC`, `APR`, `CHG` | Core/foundation templates (project context, variables, handoffs, decision log, approvals, change requests) | Part 2 |
| `BA` | Brief Analysis | Part 2 |
| `RD` | Research/routing reference (tool landscape, task routing matrix) | Part 1 |
| `CD` | Creative Director (concept/territories) | Part 3 |
| `AD` | Art Director (visual language) | Part 3 |
| `DC` | Design Critic | Part 3 / Part 4 |
| `RA` | Reference Analyst | Part 3 |
| `DD` | Design DNA | Part 4 |
| `SF` | Styleframes | Part 4 |
| `MEN` | Mentorship / self-review | Part 4 |
| `IMG` / `IP` / `CC` | Image generation, image-prompt patterns, character consistency | Part 5 |
| `VID` | Video generation, camera/character continuity | Part 6 |
| `SB`, `MO`, `ED`, `AEX`, `SND` | Storyboard, motion planning, editing, After Effects expressions, sound | Part 7 |
| `ASM`, `CTY`, `QA`, `WF` | Asset management, continuity, quality assurance, full workflows | Part 8 |

## Usage conventions (apply these whenever you fill in a prompt from this library)

1. **Fill every `[BRACKETED_PLACEHOLDER]`** with the real project's specifics before running a prompt. Never leave a placeholder in what you hand to a generation tool.
2. **Label every claim or guess**: `[CONFIRMED]` (stated by the client/brief), `[ASSUMPTION — reason]` (a reasonable working guess), `[UNKNOWN]` (not yet known, flag if it becomes critical), `[APPROVED: id, date]` (locked by a logged decision), `[SKIPPED: stage — reason]` (a stage deliberately not run, so its output is provisional). Never present a guess as a fact.
3. **Respect inherited context**: if a project already has `[APPROVED]`/`[CONFIRMED]` fields (character identity, locked outfit, approved territory, approved palette, etc.), treat them as binding in every downstream prompt. Don't silently re-derive or contradict them — if new input conflicts, flag it explicitly rather than overwriting it.
4. **Core vs. adapter**: the reasoning in a prompt is model-independent. Only add tool-specific syntax (e.g. Midjourney `--oref/--sref`, a JSON block for a specific image API) as a thin adapter on top of the core prompt — don't rewrite the underlying reasoning per tool.
5. **Chain roles in order only when the user asks for the full pipeline**: Brief Analysis → Creative Director (territories) → [human selects one] → Art Director (visual language) → Design DNA/Styleframes → Image/Video generation prompts → Storyboard/Motion/Edit → Asset/QA. The chain is a map, not a gate — see convention 6. Skip stages already confirmed in the project context rather than redoing them.
6. **Never block on a missing dependency.** Most requests arrive mid-chain with the upstream work missing. Use what the user already said, derive a provisional upstream artifact inline (`[PROPOSED]`/`[ASSUMPTION]`), ask **at most one blocking** follow-up question with a default attached, and if the gap persists **skip that stage** (`[SKIPPED: stage — reason]`) and deliver what was actually asked for. A prompt may still *list* further critical questions inside its output (as `BA-01` does) — it just never waits for the answers. Never answer with a prerequisites checklist, never tell the user to go run another prompt first, never send a questionnaire instead of a deliverable. A prompt built on labelled assumptions beats a perfect chain the user abandons.
7. **Tool/model names in Part 1 are a dated snapshot** (see its own research-date header) — treat specific model version claims there as something to re-verify periodically, not permanent fact.

## Quick start

- New project, nothing decided yet → start at `reference/part-2-library-structure-and-foundation.md` (project context template), then Part 1 for tool routing if needed.
- Have a brief, need a creative concept → `reference/part-3-creative-art-direction.md`, prompt `CD-01`.
- Have an approved concept, need a visual identity/character locked across images → `reference/part-5-image-generation.md`, plus `prompts/extensions/creator-reference-locked-prompts.md` if working from a real reference photo.
- Need one prompt right now, know exactly what you want → `prompts/standalone-prompts.md`.
