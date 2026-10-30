# AI Creative OS — a prompt library any agent can run

A versioned, model-agnostic prompt-engineering operating system for AI-driven creative production, packaged so that **any** agent can use it — not just Claude.

Pipeline it covers: brief → creative strategy and territories → art direction → design DNA and styleframes → image generation → video generation (with camera and character continuity) → storyboard → motion/edit/After Effects/sound → asset management and QA.

## Why it works across agents

The library carries its own protocol in plain Markdown rather than relying on one vendor's feature. Three layers, same rules:

| Layer | File | Read by |
|---|---|---|
| Universal agent instructions | [`AGENTS.md`](AGENTS.md) | Codex, Cursor, GitHub Copilot, Gemini CLI, Jules, Amp, VS Code, Devin, Factory — the `AGENTS.md` standard, stewarded by the Agentic AI Foundation at the Linux Foundation |
| Claude Agent Skill | [`SKILL.md`](SKILL.md) | Claude Code, Claude.ai skills, and any host that implements `SKILL.md` (Codex and Cursor also read it) |
| Portable mode | [`portable/`](portable/) | Gemini skills/Gems *instructions* fields, ChatGPT, Copilot chat, Claude Projects, any API — hosts with no file access |

Plus two machine-readable entry points for web agents: [`llms.txt`](llms.txt) (the map) and [`llms-full.txt`](llms-full.txt) (the whole corpus in one file).

`AGENTS.md`, `SKILL.md`, and the portable prompts say the same things on purpose. `tools/check.sh` keeps them honest.

## How it handles missing information

The prompts form a chain (brief → creative direction → art direction → design DNA → styleframes → image → video → storyboard/edit → QA), and most real requests arrive somewhere in the middle with the upstream work missing. **The chain is a map, not a gate.** Every surface of this repo — `AGENTS.md`, `SKILL.md`, and all five portable prompts — tells the agent to resolve a gap by this ladder:

1. **Use what the user already said** — the missing element is usually implied in the conversation.
2. **Reconstruct it inline** and label it `[PROPOSED]` / `[ASSUMPTION — reason]`. A provisional palette or character block is enough to write the requested prompt.
3. **Ask at most one** follow-up question, with a default attached (`"if you'd rather not say, I'll assume 9:16 and a 35mm lens"`).
4. **Otherwise skip that stage** — `[SKIPPED: stage — reason]` — carry the assumption, and deliver the thing that was actually asked for.

Explicitly forbidden: a prerequisites checklist, "before we can do this you need to…", sending the user off to complete another prompt first, asking more than one question per turn, or returning a questionnaire instead of a deliverable. Skipping is normal and always visible; `tools/check.sh` fails if any surface loses this rule.

## Install, by host

**Claude Code**
```bash
git clone https://github.com/Axmgill/Creative_prompt_os.git ~/.claude/skills/ai-creative-os   # all projects
git clone https://github.com/Axmgill/Creative_prompt_os.git .claude/skills/ai-creative-os     # this project
```
Claude discovers `SKILL.md` and loads the reference files on demand.

**Claude.ai (web)** — Projects → instructions ← [`portable/system-prompt.md`](portable/system-prompt.md); add the reference parts as project knowledge. Or upload this repo as a skill via Settings → Capabilities → Skills.

**Codex, Cursor, Copilot, Gemini CLI, Jules, Amp, VS Code, Devin, Factory** — clone the repo into the workspace. `AGENTS.md` at the root is picked up automatically. Nothing else to configure.

- Gemini CLI also honours `GEMINI.md` if you want a project-local override; it reads `AGENTS.md` natively.
- Cursor: auto-reads `AGENTS.md`; if you prefer `.cursor/rules/`, copy [`portable/chatgpt-instructions.md`](portable/chatgpt-instructions.md)'s block into a rule with `alwaysApply: true`.
- Copilot: reads `AGENTS.md`; `.github/copilot-instructions.md` also works with the same block.

**Gemini on the web (a skill — the current route)** — download **[`ai-creative-os.zip`](https://github.com/Axmgill/Creative_prompt_os/raw/main/dist/ai-creative-os.zip)** (365 KB) and upload it directly:

1. gemini.google.com → **Customize** (under *More* if hidden) → **Skills**
2. **Create** → **Upload** → pick the `.zip` (or the unzipped folder)
3. Review, then **Create**

The package meets Gemini's upload rules: `SKILL.md` sits in the main folder, the folder is named `ai-creative-os` to match the skill name, the name is kebab-case, the description is 708/1024 characters, and it contains only plain-text files. Invoke it with `/ai-creative-os`, or just describe the job and Gemini matches it.

Google is replacing Gems with skills (from November 2026 for personal accounts), so this is the route that lasts. The same folder still works as a Gem: create one and upload `reference/` and `prompts/` as knowledge.

**Gemini on the web (no Gem, just a chat)** — paste [`portable/kickoff-prompt.md`](portable/kickoff-prompt.md) as your first message and let it fetch `llms.txt`. Or give it `https://raw.githubusercontent.com/Axmgill/Creative_prompt_os/main/llms-full.txt` for the whole library in one URL.

**ChatGPT** — Custom GPT: Instructions ← [`portable/system-prompt.md`](portable/system-prompt.md), Knowledge ← `SKILL.md` + reference parts. Custom instructions: [`portable/chatgpt-instructions.md`](portable/chatgpt-instructions.md) (paid) or [`portable/mini-prompt.md`](portable/mini-prompt.md) (free tier).

**Anything else with a system prompt** — [`portable/system-prompt.md`](portable/system-prompt.md) into the system message; attach reference parts as retrieval documents if you have them.

## What's in here

```
AGENTS.md                      ← universal entry point: protocol, routing table, guardrails
SKILL.md                       ← Claude Agent Skill entry point + ID registry
llms.txt / llms-full.txt       ← machine-readable map / whole corpus, one fetch each
reference/                     ← the 8-part core framework (~5,900 lines)
  part-1-research-and-routing.md
  part-2-library-structure-and-foundation.md
  part-3-creative-art-direction.md
  part-4-design-dna-styleframes.md
  part-5-image-generation.md
  part-6-video-generation.md
  part-7-storyboards-motion-editing-ae-sound.md
  part-8-asset-management-qa-workflows.md
prompts/
  prompts-only.md              ← curated copyable extract of the whole library
  standalone-prompts.md        ← same prompts, each fully self-contained
  extensions/                  ← talking-head, reference-locked identity, creator set, UGC/avatar
portable/
  README.md                    ← which file for which host
  system-prompt.md             ← full system prompt (~7,200 chars)
  gemini-gem-instructions.md   ← Gemini skill/Gem instructions (~3,800 chars)
  chatgpt-instructions.md      ← ChatGPT / Copilot / Cursor (~3,900 chars)
  mini-prompt.md               ← tiny fields (~1,420 chars)
  kickoff-prompt.md            ← paste-first message for browsing chats
tools/
  build.sh                     ← regenerate llms-full.txt
  build-gemini-skill.sh        ← regenerate dist/ai-creative-os.zip
  check.sh                     ← verify budgets, paths, corpus, bundle and Gemini upload rules
dist/
  ai-creative-os.zip           ← upload-ready Gemini skill package (365 KB)
```

Every prompt carries a stable `[DOMAIN]-[NN]` ID (`CD-01`, `IP-05`, `VP-07`, `QA-00`, …) so routing works the same no matter which host is reading it.

## Keeping it honest

```bash
tools/check.sh     # AGENTS.md size, portable character budgets, path references, corpus freshness
tools/build.sh     # rebuild llms-full.txt after editing any reference or prompt file
```

Host character limits are enforced by the hosts and change without notice. The budgets in `tools/check.sh` were checked in October 2026; if a limit tightens, trim the craft rules before the consent and approval clauses.

## Notes and limits

- **Part 1 is a dated snapshot** (research date in its header) of the AI tool/model landscape. Re-verify version claims before relying on them.
- **Real people.** `prompts/extensions/creator-reference-locked-prompts.md` requires documented consent before generating images of a real person's likeness. That is not optional, and the portable prompts repeat it.
- **Synthetic humans** need AI-disclosure in many advertising contexts; the library flags this but cannot verify current policy or law for you.
- **No licence is bundled.** Add one before treating this as redistributable beyond your own use.
- **Portable mode is a compression, not a port.** Without the reference files an agent writes in the library's style but cannot quote specific prompts. For high-stakes work, use a host that reads files.

## Provenance

Compiled from an iterative, conversation-driven engagement building a reusable AI creative production prompt library, then packaged three ways — Claude Agent Skill (`SKILL.md`), universal agent instructions (`AGENTS.md`), and paste-anywhere portable prompts — for reuse across projects and hosts.
