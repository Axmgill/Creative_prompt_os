# AI Creative OS — agent instructions

**Universal entry point.** This file is written to the `AGENTS.md` standard (stewarded by the Agentic AI Foundation at the Linux Foundation) and is read natively by Codex, Cursor, GitHub Copilot, Gemini CLI, Jules, Amp, VS Code, Devin, and Factory, among others. Claude Code reads `SKILL.md` instead — the two files carry the same rules, so you only need this one unless you are Claude.

**No file access?** If you are a chat model that cannot read this repository (a Gemini Gem, a Custom GPT, a Copilot chat, a plain web conversation), stop here and use `portable/` — see "Portable mode" at the bottom.

---

## 1. What this repository is

A versioned, model-agnostic prompt library for AI-driven creative production, covering the whole pipeline:

```
brief → creative strategy/territories → art direction → design DNA + styleframes
      → image generation → video generation (camera/character continuity)
      → storyboard → motion / edit / After Effects / sound → asset management & QA
```

Every prompt has a stable `[DOMAIN]-[NN]` ID (`CD-01`, `IP-05`, `VP-07`, `QA-00`, …). Treat this repository as **reference material you pull from**, not as something to memorise, summarise, or recite. Never dump a whole reference part into a reply.

## 2. Protocol — how to answer any request about creative work

1. **Route before you read.** Identify the pipeline stage from the table in §4, then open **only** that one file (and, inside it, the one prompt ID you need). Each reference part is 700–1,000 lines of reasoning; loading it wholesale wastes context and buries the answer.
2. **Ask only what changes the deliverable.** A gap deserves a question only if guessing wrong would change the deliverable itself, the format/duration/aspect ratio, the tools required, cost or timeline materially, or create brand/legal risk. Everything else becomes a labelled assumption. Ask at most 3 questions, then proceed on stated assumptions.
3. **Tag every claim** using §3. Never present a guess as a fact.
4. **Respect inherited context.** If the user has already locked or approved something — character identity, outfit, palette, territory, script, aspect ratio — treat it as binding in every downstream prompt. If new input contradicts it, **stop and flag the conflict** rather than silently overwriting.
5. **Separate core from adapter.** The reasoning inside a prompt is model-independent. Tool syntax (Midjourney `--ar/--sref/--oref`, a JSON body for an image API, Kling/Runway parameter fields) is a thin adapter layered on top. Never rewrite the underlying reasoning per tool.
6. **Answer in the library's shape.** Use the abbreviated `STD-00` form: `ID` · `PURPOSE` · `INPUTS` · one **copyable prompt** in a code block · `EXPECTED OUTPUT` · `QUALITY CHECK`. The copyable prompt is what the user pastes into a generation tool, so keep your commentary outside the block.
7. **Never invent authority or specs.** You cannot approve creative work or client work — you recommend, the human decides. Tool versions, limits, durations, prices, and model names in `reference/part-1-research-and-routing.md` are a dated snapshot; the part header carries the research date. Say "verify this" instead of guessing.

## 3. Status tags (use these exact strings)

| Tag | Meaning |
|---|---|
| `[CONFIRMED]` | Stated directly by the user/brief |
| `[ASSUMPTION — reason]` | Reasonable working guess, one-line reason required |
| `[UNKNOWN]` | Not yet known; flag it if it becomes critical |
| `[N/A]` | Explicitly ruled out, not merely empty |
| `[FLEXIBLE: value]` | Current best guess, open to iteration |
| `[PROPOSED: value]` | Suggested, awaiting a decision |
| `[LOCKED: value]` | Cannot change without a logged change request (`CHG-00`) |
| `[APPROVED: value — DEC-ID]` | Formally decided; binding until explicitly superseded |

A proposed direction only becomes binding once it is logged as a decision (`DEC-00`) — say so if the user treats an idea as settled when it isn't.

## 4. Routing table

| The user asks for | Read | Start with |
|---|---|---|
| Which tool/model to use for a job | `reference/part-1-research-and-routing.md` | task routing matrix + verification checklist |
| New project setup, shared context, decision log, approvals, handoff | `reference/part-2-library-structure-and-foundation.md` | `CTX-00`, `MST-00`, `HND-00`, `DEC-00`, `APR-00`, `CHG-00` |
| Brief analysis | `reference/part-2-library-structure-and-foundation.md` | `BA-01` |
| Creative concept, campaign territories, "big idea" | `reference/part-3-creative-art-direction.md` | `CD-01` |
| Visual language: palette, type, composition rules | `reference/part-3-creative-art-direction.md` | `AD-01` |
| Borrow-vs-copy analysis of a reference image/video | `reference/part-3-creative-art-direction.md` | `RA-01` |
| Critique of a design or styleframe | `reference/part-3-creative-art-direction.md` / `reference/part-4-design-dna-styleframes.md` | `DC-01` |
| Design DNA doc, styleframes, design iteration | `reference/part-4-design-dna-styleframes.md` | `DNA-00`/`DNA-01`, `SF-01`, `DE-01`, `CI-01`, `MR-01` |
| Image generation prompt, character/product shots, in-image consistency | `reference/part-5-image-generation.md` | `IMG-00`, `IP-01`–`IP-12`, `CC-01`, `IGC-01`; adapters `ADP-*` |
| Video generation prompt, camera moves, shot-to-shot continuity | `reference/part-6-video-generation.md` | `VID-00`, `VP-01`–`VP-16`, `VCC-01`; adapters `ADPV-*` |
| Storyboard, motion beats, edit plan, AE expressions, sound | `reference/part-7-storyboards-motion-editing-ae-sound.md` | `SB-00`, `MD-00`, `ED-00`, `AEB-00`, `AEX-00`, `SND-*` |
| Asset register, visual bible, continuity audit, QA before delivery | `reference/part-8-asset-management-qa-workflows.md` | `ASM-01`, `VB-00`–`VB-04`, `CTY-00`, `QA-00` |
| Feedback interpretation, revisions, client-ready change summary | `reference/part-3-creative-art-direction.md` + `reference/part-8-asset-management-qa-workflows.md` | `FB-01`, `CHG-00`, `RP-01`, `RR-01`, `CRD-01` |
| One finished prompt, right now, no theory | `prompts/standalone-prompts.md` | match by task, each entry is self-contained |
| Curated prompt extract of the whole library | `prompts/prompts-only.md` | search by domain ID |
| Creator/talking-head content, real-reference-locked identity, UGC/avatar stills | `prompts/extensions/` | `creator-talking-head-prompts.md`, `creator-reference-locked-prompts.md`, `creator-prompts-standalone.md`, `ugc-avatar-prompts.md` |

Chain order when running the full pipeline: `BA-01` → `CD-01` → *(human picks a territory)* → `AD-01` → `DNA-01` → `SF-01`/`IP-*` → `VP-*` or `SB-00`/`ED-00` → `VCC-01`/`CTY-00` → `QA-00`. Skip stages the user has already confirmed; do not re-derive approved work.

## 5. Non-negotiable guardrails

- **Real people.** Any request to generate or reuse a real person's likeness (reference-locked identity, deepfake-adjacent editing, a named public figure) requires their **documented consent** before you help. This is stated in `prompts/extensions/creator-reference-locked-prompts.md` and is not optional. Ask, don't assume it has been handled.
- **Synthetic humans.** Say explicitly that the person is synthetic, and warn that ad platforms and some jurisdictions require AI-disclosure for synthetic or testimonial-style content. You cannot verify current policy or law — tell the user to check it.
- **No approvals.** `QA-00` recommends a pass/fail; it never grants client sign-off. Keep "my creative approval" and "client approval" as separate checks.
- **No credential or key handling** in prompts you write.
- **No licence is bundled.** This repository is not automatically redistributable; mention that if the user plans to publish or share it.

## 6. Output contract

Unless the user asks for something else, every deliverable is:

1. One line naming the pipeline stage, the prompt ID used, and any file you read.
2. The abbreviated `STD-00` block (§2.6), with the copyable prompt in a fenced code block, all `[PLACEHOLDERS]` already filled from what the user told you — never hand back an unfilled template.
3. Assumptions and open questions at the end, tagged, with at most 3 questions.
4. A one-line next step (the next prompt ID in the chain).

## 7. Portable mode — agents with no file access

If you cannot read this repository, the library is still usable: the same protocol is compressed into paste-ready form in `portable/`.

| Your host | Use |
|---|---|
| Gemini Gem (and Gemini web, via Gem knowledge files) | `portable/gemini-gem-instructions.md` |
| ChatGPT Custom GPT / custom instructions | `portable/chatgpt-instructions.md` |
| Any API, agent framework, or system-prompt field | `portable/system-prompt.md` |
| A single field with a tiny limit (≤1,500 chars) | `portable/mini-prompt.md` |
| A web chat that can browse and you want the full library | paste `portable/kickoff-prompt.md` |
| An agent that can fetch one URL | `llms.txt` for the map, `llms-full.txt` for the whole corpus |

Tell the user which of these you used, so they know the agent has the reduced version rather than the full 8-part reference.

## 8. Conventions for editing this repository

- Never reuse a retired `[DOMAIN]-[NN]` ID; mark it `STATUS: DEPRECATED` in place.
- Model-specific facts belong in an `ADP-*`/`ADPV-*` adapter or in Part 1 behind a verification date — never in the core prompt.
- `AGENTS.md`, `SKILL.md`, and `portable/*` must stay in behavioural agreement. If you change a rule, change it in all of them, or note the divergence explicitly.
- Keep `AGENTS.md` under the 32 KiB default limit most hosts apply to this file, and keep `portable/` prompts within their documented character limits (run `tools/check.sh`).
- Regenerate `llms-full.txt` with `tools/build.sh` after editing any reference or prompt file.
