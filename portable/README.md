# Portable mode — use AI Creative OS in any agent

The rest of this repository assumes the agent can read files: Claude Code, Codex, Cursor, Gemini CLI, Copilot, Jules, and other agents that load `SKILL.md` or `AGENTS.md` from disk. **Portable mode exists for every agent that cannot** — a Gemini Gem, a Custom GPT, a Copilot chat window, an API call, a plain web conversation, a phone app.

Same protocol, compressed to fit. No repository access required.

## Pick your file

| Your host | File | Field size |
|---|---|---|
| Gemini Gem (web) | [`gemini-gem-instructions.md`](gemini-gem-instructions.md) | ~3,800 chars (field allows ~4,000) |
| ChatGPT custom instructions (paid) | [`chatgpt-instructions.md`](chatgpt-instructions.md) | ~3,900 chars (limit 5,000) |
| ChatGPT custom instructions (free) | [`mini-prompt.md`](mini-prompt.md) | ~1,420 chars (limit 1,500) |
| Custom GPT / Claude Project / API system prompt | [`system-prompt.md`](system-prompt.md) | ~7,200 chars (GPT limit 8,000) |
| Copilot repo instructions, Cursor rule | [`chatgpt-instructions.md`](chatgpt-instructions.md) | no fixed cap |
| Any tiny persona field | [`mini-prompt.md`](mini-prompt.md) | fits ~1,500 |
| Web chat that can browse or fetch URLs | [`kickoff-prompt.md`](kickoff-prompt.md) | pasted per conversation |

Each file contains one fenced block. **Copy the contents of the block only** — the prose around it is instructions for you, not for the agent.

## Install, by host

**Gemini (web) — the Gem route**
1. Gemini → Gems → New Gem → name it `AI Creative OS`.
2. Instructions ← paste `gemini-gem-instructions.md`.
3. Knowledge ← upload `SKILL.md`, `prompts/standalone-prompts.md`, and the `reference/part-*.md` files for the stages you actually use (part-3, part-5, part-6 are the highest value).
4. Save and use the Gem for creative work.

**Gemini (web) — no Gem, just a chat**
Paste `kickoff-prompt.md` as your first message; Gemini will fetch `llms.txt` and the part it needs. Works when browsing is enabled; degrades if a fetch is blocked.

**ChatGPT**
- Custom GPT: Instructions ← `system-prompt.md` (8,000 cap); Knowledge ← `SKILL.md` + the parts you use.
- Custom instructions: `chatgpt-instructions.md`, or `mini-prompt.md` on the free tier.
- Projects: put `system-prompt.md` in the project instructions and drop the reference files into project files.

**Claude (web)**
Projects → project instructions ← `system-prompt.md`; upload the reference parts as project knowledge. This is the closest web equivalent to the real skill.

**GitHub Copilot**
Commit `chatgpt-instructions.md`'s block as `.github/copilot-instructions.md`. Copilot also reads `AGENTS.md` at the repo root natively — if this repo is your workspace, you already have it.

**Cursor**
Add `.cursor/rules/ai-creative-os.mdc` with `alwaysApply: true` in the front matter and the block from `chatgpt-instructions.md` as the body. Cursor also auto-reads `AGENTS.md`.

**Any API / agent framework**
`system-prompt.md` → the system message. Attach `llms-full.txt` or individual reference parts as retrieval documents if you have a knowledge store.

## Dependencies and missing information

The library is a chain — brief → creative direction → art direction → design DNA → styleframes → image → video → storyboard/edit → QA — but **the chain is a map, not a gate**. Every portable prompt carries the same dependency ladder, in this order:

1. Use what the user already said. The missing element is usually implied somewhere in the conversation.
2. Reconstruct it inline and label it `[PROPOSED]` or `[ASSUMPTION — reason]`. A one-line provisional palette or character identity is enough to write the requested prompt.
3. Ask **at most one** follow-up question, with a default attached so the user can ignore it entirely.
4. If the gap remains, skip that stage — `[SKIPPED: stage — reason]` — and deliver what was actually asked for.

What a portable prompt must never do: open with a prerequisites checklist, tell the user to go run another prompt first, send a questionnaire instead of a deliverable, or ask more than one question. That rule is the first item in every paste block here, and `tools/check.sh` fails if it goes missing.

## What portable mode gives up

Be honest with yourself about the trade:

- **Kept:** the routing logic, the status-tag discipline, the ask-vs-assume rule, the conflict rule, the output shape, one-prompt-per-shot craft rules, the consent and approval guardrails.
- **Lost:** the actual 5,900 lines of reference reasoning, the per-model adapters (`ADP-*`, `ADPV-*`), the full `STD-00` entry template, the workflow chains in Part 8, and the specific prompt text in `prompts/`.
- **Consequence:** a portable agent writes *plausible* prompts in the library's style. It cannot quote `VP-07` unless you gave it `part-7`/`part-6` as knowledge. If the work is high-stakes, use a file-reading host.

## Keeping portable prompts honest

Character limits are enforced by the hosts, not by us, and they change without notice. The numbers above were checked in **October 2026** and are recorded in `tools/check.sh`, which fails if any block exceeds its budget.

```bash
tools/check.sh     # verify every portable block still fits, and every path still exists
```

If a limit tightens, trim the `BOUNDARIES` section first, then the craft rules — never the consent or approval clauses.

## Agreement with the rest of the repo

`AGENTS.md`, `SKILL.md`, and these blocks must stay in behavioural agreement. `tools/check.sh` verifies the numbers; a human has to verify the words. If you change a rule, change it everywhere or note the divergence here.
