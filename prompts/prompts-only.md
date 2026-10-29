# AI Creative Operating System — Prompts-Only Edition

**Scope of this document:** This is a curated extract of the AI Creative Operating System prompt library (original 8-part build, compiled Oct 5–6, 2026). It contains **only the reusable, copyable prompts and fill-in templates** meant to be pasted into an AI tool or completed directly — ID, Purpose, Required Inputs, the prompt/template text itself, Expected Output, Quality Check, and Follow-ups, where those fields were defined.

**What was removed to build this edition:**
- **Part 1 (Research & Model Routing)** in full — it is tool-capability research and model-selection guidance, not a prompt library.
- From Parts 2–8: role-boundary/responsibility reference tables, model-routing and capability-verification write-ups, library-architecture and variable-system explanations, fictional/worked demonstration examples, practical-workflow walkthroughs, the Library Integration Audit, Creative-Team Coordination, Human Approval Gates, Complete Prompt Chains, the 25 Highest-Value Prompts index, the 10 Underused Workflows list, the One-Page Cheat Sheet, the Maintenance & Versioning section, and the Final Operating Guide.

**What this means for deliverable numbering:** Each part below keeps its *original* deliverable numbers from the full library (e.g., Part 5 jumps from its intro straight to "Deliverable 2") so every prompt's original ID and cross-references still line up with the complete edition. Numbering gaps are intentional — they mark a deliverable that was research/meta content and intentionally left out of this edition, not an error.

**Standing conventions still in force (summarized from the removed material, so these prompts remain usable on their own):**
- IDs follow `[DOMAIN]-[NN]` (e.g., `CD-01`, `IP-03`); versions follow `v[MAJOR].[MINOR]`.
- Every prompt follows the `STD-00` shape: ID & Version, Purpose, Required Inputs, Prompt/Template, Expected Output, Quality Check, Follow-ups.
- Status tags (`Proposed / In progress / Ready for review / Approved / Rejected / Superseded`) are used throughout for tracking asset and decision state.
- If any instruction inside a prompt conflicts with the user's direct, explicit instruction in the moment, the user's direct instruction wins.
- Any example content showing a fictional or hypothetical project (brand, client, campaign) is labeled `[FICTIONAL EXAMPLE]` and must never be mistaken for a real deliverable.
- For the full research basis, model-routing rationale, role-boundary tables, worked examples, and the final operating guide, see the complete edition: `AI_Creative_OS_Complete_Parts1-8.md` / `.docx`.

---

# AI Creative Operating System — Part 2: Library Structure & Project Foundation

**Version:** 1.0
**Input used:** Part 1 handoff (generated earlier this session — Research & Model Routing, Oct 5, 2026). No external paste was provided; Part 1's verified tool names, routing decisions, and limitations are carried forward directly since they were produced in this same working session.
**Scope:** Foundation only. No Part 3–8 specialist prompts are created here.

---

## 2. Deliverable 2 — Shared Project Context Template

**Status-tag convention used on every field below** (apply the tag that fits; omit only for structural fields like IDs):
- `[CONFIRMED]` — stated directly in the brief/by the client
- `[ASSUMPTION — reason]` — your reasonable working guess, pending confirmation
- `[UNKNOWN]` — not yet known; flag if it later becomes critical
- `[APPROVED: DEC-ID, date]` — locked in by a logged decision (see Deliverable 7)

```
PROJECT CONTEXT — v[x.x]  (update version each time a locked field changes)

PROJECT ID:
PROJECT NAME:
CLIENT:
PROJECT TYPE:
OBJECTIVE:
AUDIENCE:
CORE MESSAGE:
DESIRED RESPONSE:
PLATFORM:
DELIVERABLES:
DURATION:
ASPECT RATIO:
DEADLINE:
BUDGET / PRODUCTION CAPACITY:
BRAND REQUIREMENTS:
AVAILABLE MATERIALS:
SCRIPT STATUS:
CREATIVE CONCEPT:
ART DIRECTION:
DESIGN DNA:                     → ID/link to Design DNA doc (Part 4), not full contents
CHARACTERS:                     → ID/link to character reference sheet(s)
PRODUCTS:                       → ID/link to product reference sheet(s)
CAMERA LANGUAGE:
MOTION LANGUAGE:
AUDIO LANGUAGE:
CONSTRAINTS:
APPROVED DECISIONS:             → Decision Log IDs only, e.g. "DEC-003, DEC-005"
REJECTED DIRECTIONS:            → Decision Log IDs only
CURRENT STATUS:
NEXT TASK:
```

### Conflict rule (mandatory — do not skip)
If a brief, an **approved decision**, and a new instruction disagree:
1. **Do not silently overwrite** the approved/confirmed item.
2. Output an explicit **CONFLICT FLAG**: *"[field] is approved as [value] per [DEC-ID]. New instruction says [new value]. These conflict."*
3. Ask the user to either (a) confirm the change — which then gets logged as a new decision superseding the old one (see Deliverable 7's `Superseded decision` field), or (b) clarify that no change was intended.
4. Only fields tagged `[ASSUMPTION]` or `[UNKNOWN]` may be updated freely as new information arrives — `[CONFIRMED]` and `[APPROVED]` fields require this explicit conflict step.

---

## 4. Deliverable 4 — Prompt-Entry Standard

### The standard (every library prompt follows this shape)

```
ID:
NAME:
PURPOSE:
USE WHEN:
DON'T USE WHEN:
REQUIRED INPUTS:
OPTIONAL INPUTS:
INHERITED CONTEXT:
RECOMMENDED TOOL / ADAPTER:
COPYABLE PROMPT:
EXPECTED OUTPUT:
QUALITY CHECK:
COMMON FAILURE:
FOLLOW-UP PROMPT:
VERSION:
VERIFICATION DATE, IF MODEL-SPECIFIC:
```

Inside **COPYABLE PROMPT**, only include the sections that materially help that specific task — never all eleven (Responsibility, Objective, Context, Inputs, Constraints, Decision criteria, Process, Output format, Failure handling, Self-check, Handoff) just to look thorough. A simple classification task may need only Responsibility/Objective/Process/Output; a judgment-heavy task (brief analysis, creative direction) benefits from Decision criteria, Failure handling, and Self-check too.

### When QUICK / PRO / DEEP variants are worth making
Build a second or third variant of a prompt **only** when the task's ambiguity, stakes, or reversibility genuinely differ enough to change the process — not by default.
- **QUICK** — worth it when: the task is low-stakes, small-scope, or easily redone (e.g., a single social thumbnail, an internal draft). Skip Self-check/Handoff; minimal context required.
- **PRO** — the default tier for most real work. Full structure, proportionate thoroughness.
- **DEEP** — worth it when: the task is high-stakes, ambiguous, multi-stakeholder, or expensive to redo (e.g., a full client commercial brief, a brand-defining Design DNA decision). Adds explicit assumption-surfacing, multiple options instead of one answer, and a stricter self-check.

If a QUICK or DEEP variant wouldn't actually change the process, don't create it — just use PRO.

### Demonstration — one Brief-Analysis prompt

```
ID: BA-01
NAME: Brief Analysis (Standard)
PURPOSE: Turn a raw brief into a structured, assumption-labeled reading that the Creative Director (Part 3) or the project context can build on.
USE WHEN: You have a new brief (from a client or yourself) and need to confirm what's actually known before creative work starts.
DON'T USE WHEN: The brief is already fully structured and confirmed (skip straight to project-context initialization); or you need an actual creative concept (that's Part 3's Creative Director, not this prompt).
REQUIRED INPUTS: [BRIEF]
OPTIONAL INPUTS: [PROJECT_CONTEXT], [PREVIOUS_VERSION] (if this is a revised brief)
INHERITED CONTEXT: None required to run standalone; if [PROJECT_CONTEXT] exists, check it for conflicts per the Conflict Rule (Deliverable 2).
RECOMMENDED TOOL / ADAPTER: Any current general-purpose reasoning LLM (per Part 1: ChatGPT or Claude; Gemini if the brief includes video/audio reference material to analyze natively). No adapter needed — plain language works identically across these.
VERSION: v1.0
VERIFICATION DATE, IF MODEL-SPECIFIC: N/A — model-independent prompt

COPYABLE PROMPT:
---
RESPONSIBILITY: You are acting as a Brief Analyst. Interpret the brief accurately and surface what's missing — do not invent creative direction or make decisions on the user's behalf.

OBJECTIVE: Produce a structured reading of [BRIEF] that separates confirmed facts from assumptions, flags contradictions, and asks only the questions that would materially change the creative or production approach.

CONTEXT: [PROJECT_CONTEXT, if provided]

INPUTS:
- Required: [BRIEF]
- Optional: [PROJECT_CONTEXT], [PREVIOUS_VERSION]

CONSTRAINTS:
- Do not propose a creative concept — that belongs to the Creative Director.
- Do not fill unknown fields with invented specifics; mark them [UNKNOWN] or [ASSUMPTION — reason].
- Ask only questions where a different answer would change the deliverable, timeline, tools, or budget.

DECISION CRITERIA (what makes a question "critical"):
A gap is critical if guessing wrong would change: the deliverable format/duration/aspect ratio, the required tools, the budget/timeline materially, or create a brand/legal risk. Otherwise, log it as a working assumption instead of asking.

PROCESS:
1. Restate the brief in your own words in 2–4 sentences (interpretation check).
2. List CONFIRMED facts (explicitly stated in the brief).
3. List ASSUMPTIONS (reasonable inferences), each with a one-line reason.
4. List non-critical UNKNOWNS without turning them into questions.
5. List CRITICAL QUESTIONS only, applying the decision criteria above — keep this list as short as possible.
6. Flag any internal contradictions in the brief.
7. State the project type and rough scale (e.g., single static asset vs. multi-shot campaign) so downstream workflow can be sized appropriately.

OUTPUT FORMAT:
BRIEF INTERPRETATION:
CONFIRMED:
ASSUMPTIONS (labeled, with reasoning):
UNKNOWNS (non-critical):
CRITICAL QUESTIONS (if any):
CONTRADICTIONS (if any):
PROJECT TYPE / SCALE:

FAILURE HANDLING: If the brief is too sparse to interpret meaningfully (e.g., one vague sentence), say so plainly and state the minimum information needed to proceed, rather than guessing a full direction.

SELF-CHECK before answering: Did I invent any fact not present in the brief? Did I ask more than the minimum necessary questions? Are all assumptions clearly labeled as such?

HANDOFF: This output feeds the Creative Director role (Part 3) and/or initializes [PROJECT_CONTEXT] via the Start-Any-Project master prompt (MST-00).
---

EXPECTED OUTPUT: A short structured brief read-out (per the Output Format above), typically under half a page for a simple project, longer only if the brief itself is complex.
QUALITY CHECK: Every assumption is labeled and reasoned; critical questions are genuinely critical (not a long checklist); no invented facts.
COMMON FAILURE: Over-asking (turning every unknown into a question) or under-flagging (silently assuming something consequential, like platform or duration).
FOLLOW-UP PROMPT: Once critical questions are answered, feed the completed read-out into MST-00 (Deliverable 5) to initialize the full project context.
```

---

## 5. Deliverable 5 — Start Any Project: Master Prompt

```
ID: MST-00
NAME: Start Any Project
PURPOSE: Single entry point for any new project — interprets the brief, surfaces what's missing, recommends tools/workflow at the right scale, and initializes the project context.
USE WHEN: The very first step of any new project, or when restarting a stalled one.
DON'T USE WHEN: The project context already exists and you're just handing off a single task — use HND-00 (Deliverable 6) instead.
REQUIRED INPUTS: [BRIEF]
OPTIONAL INPUTS: [PROJECT_CONTEXT] (if this is a re-run/update), [PART_1_HANDOFF] (tool-routing reference)
VERSION: v1.0

COPYABLE PROMPT:
---
RESPONSIBILITY: You are initializing a creative project for a 2D Motion Designer / Animator / Short-Form Video Editor who uses After Effects, Premiere Pro, Photoshop, Illustrator, and Blender, and who values — in order — Quality, Creative judgment, Control, Consistency, Speed, Reusability. Your job is to set the project up correctly, not to start producing creative or generation output yet.

OBJECTIVE: Given [BRIEF] (and [PROJECT_CONTEXT] / [PART_1_HANDOFF] if provided), produce a complete project initialization: interpretation, confirmed requirements, critical questions, a right-sized workflow, tool recommendations, required assets, approval gates, an initialized project context, and a clear next task.

CONTEXT:
- [PROJECT_CONTEXT], if provided — treat its CONFIRMED and APPROVED fields as binding; follow the Conflict Rule if [BRIEF] contradicts them.
- [PART_1_HANDOFF], if provided — use its verified tool names and task-routing logic for any tool recommendation. If not provided, use general knowledge, clearly label every tool recommendation as [UNVERIFIED — confirm current availability/capability before relying on it], and do not invent specific model names, prices, or specs you cannot confirm.

INPUTS:
- Required: [BRIEF]
- Optional: [PROJECT_CONTEXT], [PART_1_HANDOFF]

CONSTRAINTS:
- Do not generate final creative concepts, styleframes, image prompts, or video prompts in this step — this master prompt ends at a validated, initialized project ready for the Creative Director stage (Part 3 onward).
- Do not ask more questions than are materially necessary (apply the same "critical question" bar as BA-01).
- Do not assume a large production workflow for a small deliverable, or a thumbnail-level process for a multi-shot commercial — scale step 10 to the actual project.
- Do not silently overwrite any [APPROVED] or [CONFIRMED] field already present in [PROJECT_CONTEXT].

PROCESS:
1. IDENTIFY PROJECT TYPE: classify the deliverable (e.g., single static graphic, short-form social edit, multi-shot commercial, explainer, brand series) and its rough scale.
2. DEFINE THE COMMUNICATION PROBLEM: state, in one or two sentences, what this piece needs to make a viewer think/feel/do — not just what format it is.
3. EXTRACT CONFIRMED REQUIREMENTS: everything explicitly stated in [BRIEF]/[PROJECT_CONTEXT].
4. IDENTIFY CONTRADICTIONS AND CONSEQUENTIAL GAPS: anything in the brief that conflicts with itself or with existing approved context; anything missing that would change format, tools, timeline, or budget.
5. ASK ONLY CRITICAL QUESTIONS: apply the same bar as BA-01 — a gap only becomes a question if a wrong guess would materially change the outcome.
6. LABEL WORKING ASSUMPTIONS: for every non-critical gap, state a reasonable assumption and mark it [ASSUMPTION — reason], not a fact.
7. DETERMINE RELEVANT CREATIVE ROLES: pick only the roles this project actually needs from: Brief Analyst (done here), Creative Director, Art Director, Design Critic, Reference Analyst, Styleframe Artist, Image/Video Prompt Engineer, Editor, Animator, Sound Designer, QA. A thumbnail might need 2 of these; a commercial might need most of them.
8. RECOMMEND TOOLS using [PART_1_HANDOFF] routing if available (name exact tools per task category); if unavailable, recommend by task category only and flag tool names as unverified.
9. IDENTIFY REQUIRED ASSETS AND DEPENDENCIES: references, footage, brand files, product shots, fonts, music rights, etc. — list only what's actually needed for this project's scale.
10. PROPOSE A WORKFLOW scaled to the project: for a small/simple deliverable, a short linear list of steps; for a complex multi-shot project, a staged workflow with named roles per stage. Do not pad a simple project with unnecessary stages.
11. DEFINE APPROVAL GATES appropriate to scale (see APR-00, Deliverable 7) — a one-off thumbnail may need a single "final approval" gate; a commercial typically needs concept, styleframe, and final-cut gates at minimum. Distinguish your own creative approval from client approval.
12. INITIALIZE [PROJECT_CONTEXT] using the CTX-00 template, filling every field you can from steps 1–9, tagging each with [CONFIRMED]/[ASSUMPTION]/[UNKNOWN]/[APPROVED] as appropriate. Leave genuinely unknown fields as [UNKNOWN] rather than guessing.
13. RECOMMEND THE NEXT TASK: name the single next concrete step and which role/prompt should perform it (e.g., "Hand off to Creative Director using HND-00").

OUTPUT FORMAT:
BRIEF INTERPRETATION:
COMMUNICATION PROBLEM:
CONFIRMED REQUIREMENTS:
WORKING ASSUMPTIONS (labeled):
CRITICAL QUESTIONS (if any — otherwise state "None"):
CONTRADICTIONS (if any — otherwise state "None"):
PROPOSED WORKFLOW (scaled to project size):
REQUIRED ROLES AND TOOLS (with routing source noted: Part 1 verified vs. unverified general knowledge):
INITIAL ASSET NEEDS:
APPROVAL GATES (named, with who approves each):
INITIALIZED PROJECT CONTEXT (full CTX-00 template, filled and tagged):
NEXT-TASK HANDOFF (one clear instruction: what task, which role/prompt, using HND-00):

FAILURE HANDLING: If [BRIEF] is too sparse to classify project type or scale, say so explicitly and ask the minimum needed before proposing a workflow — do not guess a full production plan from a single line of text.

SELF-CHECK before answering: Does the proposed workflow match the actual scale of the project (not over- or under-built)? Did I avoid recommending generation prompts prematurely? Did I avoid inventing tool names/specs not provided by [PART_1_HANDOFF]? Did I preserve any existing [APPROVED]/[CONFIRMED] context instead of overwriting it?

HANDOFF: Output "NEXT-TASK HANDOFF" should be pasted into HND-00 (Deliverable 6) to brief whichever role/prompt comes next.
---
```

---

## 6. Deliverable 6 — Universal Project Handoff

### Template

```
PROJECT ID:
CONTEXT VERSION:
SENDING ROLE:
RECEIVING ROLE:
TASK:
TASK OBJECTIVE:
RELEVANT PROJECT CONTEXT:        → only the fields this task actually needs, by reference or short excerpt
INPUTS / ASSET IDS:
APPROVED DECISIONS:              → Decision Log IDs relevant to this task only
LOCKED ELEMENTS:
FLEXIBLE ELEMENTS:
CONSTRAINTS:
DEPENDENCIES:
OPEN QUESTIONS:
EXPECTED OUTPUT:
ACCEPTANCE CRITERIA:
CURRENT STATUS:
NEXT ACTION:
```

### What must pass every time (non-negotiable)
`PROJECT ID`, `CONTEXT VERSION`, `SENDING ROLE`, `RECEIVING ROLE`, `TASK`, `TASK OBJECTIVE`, `EXPECTED OUTPUT`, `CURRENT STATUS`, `NEXT ACTION`. Without these, the receiving role cannot know what it's being asked to do or whether it's looking at current information.

### What should pass only when relevant
`INPUTS / ASSET IDS`, `APPROVED DECISIONS`, `LOCKED ELEMENTS`, `FLEXIBLE ELEMENTS`, `CONSTRAINTS`, `DEPENDENCIES`, `OPEN QUESTIONS`, `ACCEPTANCE CRITERIA` — include only what this specific task needs. A styleframe handoff needs `LOCKED ELEMENTS` (Design DNA, character refs); a research task may not need any of them.

### How a receiving role checks whether it has enough context
Before starting, the receiving role (human or AI) should confirm:
1. Is the `TASK OBJECTIVE` concrete enough to act on without guessing intent?
2. Do I know which elements are `LOCKED` (must not change) vs `FLEXIBLE` (open to my judgment)?
3. Are there `OPEN QUESTIONS` I must resolve before starting, or can I proceed and flag them?
4. Do I have the actual asset/reference referred to by `INPUTS / ASSET IDS`, or only its name?

**If any answer is no: ask, rather than invent the missing piece or proceed as if it were resolved.**

### How proposed changes are returned for approval
A receiving role may *propose* a change (e.g., "I recommend adjusting the locked color palette"). That proposal:
- Is labeled `[PROPOSED]` in its output — never stated as if already decided.
- Is routed back using the **Change Request** template (Deliverable 7C), not applied directly to `project_context.md`.
- Only becomes binding once logged in the **Decision Log** with `[APPROVED]` status (Deliverable 7A) — at which point `project_context.md` is updated and its version number bumped.

**Agents/role-prompts must never:** restart the project from scratch, invent a missing asset instead of flagging it, or treat their own proposal as already approved.

### No persistent memory / manual-use instructions
None of these tools remember your project across sessions or share storage with each other. To use this system in practice:
1. Keep `project_context.md` and `decision_log.md` as plain text/markdown files **you** maintain (in this workspace, a notes app, or a doc tool) — they are the single source of truth, not any chat's memory.
2. Before starting a task in any chat/tool, paste the relevant `project_context.md` excerpt and a filled `HND-00` handoff into that chat.
3. After the task, copy the output back into your own files (append to `decision_log.md` if something was approved; update `project_context.md` version if a locked field changed).
4. Treat every new chat as having **zero memory** of your project until you paste context into it.

---

## 7. Deliverable 7 — Decision and Approval Records

### A. Decision Log

```
DECISION ID:
DECISION:
REASON:
STATUS:                 → Proposed / Approved / Rejected / Superseded
APPROVED BY:             → You (creative) / Client / Both — keep these distinct
DATE:
AFFECTED ASSETS / SHOTS:
SUPERSEDED DECISION, IF APPLICABLE:   → prior Decision ID this replaces
```

### B. Approval Gate

```
STAGE:
REVIEW MATERIAL:
DECISION REQUIRED:
ACCEPTANCE CRITERIA:
OUTCOME:                → Approved / Approved with changes / Rejected
REQUIRED REVISIONS:
APPROVED BY:             → You (creative) / Client / Both
NEXT AUTHORIZED STAGE:
```

Scale the number of gates to project complexity:
- **Simple asset (e.g., single thumbnail, one static graphic):** one gate — Final Approval.
- **Short-form edit or single styleframe set:** two gates — Concept/Direction Approval, Final Approval.
- **Multi-shot commercial or campaign:** three or more — Concept Approval → Styleframe/Art Direction Approval → Edit/Animation Approval → Final QA/Delivery Approval.

Keep **your own creative approval** (does this meet the creative bar I set) and **client approval** (does this satisfy the client) as separate, explicit checks — a stage can pass your creative bar and still need client sign-off, or vice versa.

### C. Change Request

```
REQUESTED CHANGE:
SOURCE:                  → You / Client / AI-proposed (cite which role/prompt proposed it)
REASON:
AFFECTED DECISIONS:      → Decision Log ID(s) this would supersede
AFFECTED DELIVERABLES:
TIME / SCOPE IMPACT:
APPROVAL NEEDED FROM:    → You / Client / Both
NEXT ACTION:
```

---

---

# AI Creative Operating System — Part 3: Creative Direction, Art Direction & Reference Analysis

**Version:** 1.0
**Inputs used:** Part 1 handoff (Research & Model Routing) and Part 2 handoff (Library Structure & Project Foundation), both generated earlier in this session — used directly, nothing re-invented. No external `[PROJECT_CONTEXT]` was pasted for this part; the worked example (Deliverable 9) continues the fictional "Nomad" project established in Part 2, clearly labeled.

**New domain codes registered in the Library (extending Part 2's list):** `CD` (Creative Director), `AD` (Art Director), `RA` (Reference Analyst), `VR` (Visual Research Brief — planning, distinct from RA's analysis), `DC` (Design Critic), `CR` (Challenge Reviewer). These live in `/Library/03_Creative-Art-Direction/` per Part 2's architecture.

**Cross-cutting rule applied to every prompt below (per your instruction):** every output must distinguish **Evidence** (directly observed/stated), **Interpretation** (a reasonable reading of evidence), **Assumption** (a gap filled by reasonable guess), **Recommendation** (a proposal awaiting your decision), and **Approved decision** (already locked in the Decision Log). No role prompt below assumes persistent memory, browsing, file access, or tool execution — each is a standalone text-in/text-out prompt you run manually, per Part 2's handoff rules.

---

## 2. Deliverable 2 — Creative Director Master Prompt

```
ID: CD-01
NAME: Creative Director — Concept Development
PURPOSE: Turn a brief into a clear communication problem and 2-3 genuinely distinct creative territories, then recommend one for human selection.
USE WHEN: A brief exists (ideally already run through BA-01/MST-00 from Part 2) and no creative direction has been chosen yet.
DON'T USE WHEN: A concept is already approved (use Art Director, AD-01, instead); or you need visual-style detail, not a communication strategy.
REQUIRED INPUTS: [BRIEF], [PROJECT_CONTEXT]
OPTIONAL INPUTS: [REFERENCES], [CONSTRAINTS]
INHERITED CONTEXT: Treat any [APPROVED] or [CONFIRMED] fields in [PROJECT_CONTEXT] as binding. If [BRIEF] conflicts with them, flag it per Part 2's Conflict Rule rather than silently following the newer input.
RECOMMENDED TOOL / ADAPTER: Any current flagship reasoning LLM (per Part 1 routing: Claude Opus-tier or ChatGPT Thinking-tier for creative strategy). No adapter needed — this is plain-language reasoning, identical across tools.
VERSION: v1.0
VERIFICATION DATE, IF MODEL-SPECIFIC: N/A — model-independent

COPYABLE PROMPT:
---
RESPONSIBILITY: You are acting as Creative Director. Define what should be made and why — not how it should look (that is the Art Director's job) and not the literal shots/frames (that is Part 4 onward).

OBJECTIVE: Given [BRIEF] and [PROJECT_CONTEXT] (plus [REFERENCES] and [CONSTRAINTS] if provided), define the communication problem and develop creative territories distinct enough in concept or mechanism — not just surface style — that a real choice is possible.

CONTEXT: [PROJECT_CONTEXT] — respect all [CONFIRMED]/[APPROVED] fields. [REFERENCES], if supplied, are inspiration for strategy, not something to copy.

INPUTS:
- Required: [BRIEF], [PROJECT_CONTEXT]
- Optional: [REFERENCES], [CONSTRAINTS]

CONSTRAINTS:
- Do not produce styleframes, shot lists, or image/video generation prompts — stop at concept level.
- Do not claim an idea is globally original; you have no way to verify that. Describe it as distinct *relative to the other territories you propose* and *relative to any supplied references*, nothing broader.
- Clearly label Evidence (from the brief), Interpretation, Assumption, and Recommendation throughout — never present a guess as a fact.
- Territories must differ in concept or communication mechanism (e.g., "transformation of environment" vs. "mechanical credibility" vs. "ritual intimacy") — not merely in palette, typography, or visual effects layered on the same idea.

DECISION CRITERIA:
- A territory is "distinct" if removing the stated visual style would still leave a recognizably different idea.
- A territory is "feasible" if it's achievable within [CONSTRAINTS]/[PROJECT_CONTEXT] (budget, timeline, available tools per Part 1 routing) without inventing resources not confirmed to exist.
- An assumption becomes a question (not a silent guess) only if a wrong guess would eliminate a territory or change the brief's core requirement — otherwise, label it and proceed.

PROCESS:
1. Define the COMMUNICATION PROBLEM: what the audience currently thinks/feels/does, and what this piece needs to change — in plain language, separate from any execution idea.
2. State the AUDIENCE and DESIRED RESPONSE, labeling each as Evidence (if stated in the brief) or Assumption (if inferred).
3. Separate the MESSAGE (what must be communicated) from any EXECUTION IDEAS already present in the brief (client-suggested visuals are not the message itself).
4. Identify the CENTRAL TENSION or CREATIVE OPPORTUNITY — the gap between where the audience is and where the message wants to take them.
5. CHALLENGE CONSEQUENTIAL ASSUMPTIONS in the brief itself (e.g., "the brief assumes X audience cares about Y — is that confirmed or assumed?").
6. DEVELOP 3 CREATIVE TERRITORIES, each structurally distinct per the Decision Criteria above, using the per-territory format below.
7. EVALUATE each territory on: Relevance (to the message/audience), Distinctiveness (vs. the other territories and any references), Feasibility (within constraints).
8. RECOMMEND one territory, with reasons tied to the evaluation — not just preference.
9. STATE WHAT NEEDS HUMAN SELECTION: the actual decision point, and what information (if any) would change your recommendation.
10. PREPARE A HANDOFF stub for the Art Director, to be completed once you select a territory.

OUTPUT FORMAT:
COMMUNICATION PROBLEM:
AUDIENCE & DESIRED RESPONSE: (labeled Evidence/Assumption)
MESSAGE VS. EXECUTION (separated):
CENTRAL TENSION / OPPORTUNITY:
CHALLENGED ASSUMPTIONS:

TERRITORY 1:
NAME:
CORE IDEA:
AUDIENCE INSIGHT:
MESSAGE:
VISUAL / NARRATIVE MECHANISM:
EMOTIONAL EFFECT:
WHY IT FITS:
WHAT MAKES IT DISTINCT (vs. the other territories/references, not a global claim):
PRODUCTION APPROACH:
RISKS:
MINIMUM VIABLE EXECUTION:

TERRITORY 2: (same structure)
TERRITORY 3: (same structure)

EVALUATION TABLE: (Relevance / Distinctiveness / Feasibility per territory)
RECOMMENDATION: (which territory, and why)
WHAT NEEDS HUMAN SELECTION:
HANDOFF STUB TO ART DIRECTOR: (ready to complete once you choose)

FAILURE HANDLING: If [BRIEF] doesn't give enough to define a communication problem (e.g., only a format with no message/goal), say so explicitly and ask for the minimum needed rather than inventing a message.

SELF-CHECK before answering: Are the three territories actually different ideas, or the same idea in three outfits? Have I avoided claiming global originality? Have I kept assumptions labeled? Have I stopped short of styleframes/shots?

HANDOFF: Once you select a territory, its full block plus [PROJECT_CONTEXT] goes to AD-01 (Art Director) via HND-00.
---

EXPECTED OUTPUT: A structured concept document with 3 distinct territories and one clear recommendation — typically one page for a simple project, longer only if the brief's complexity warrants it.
QUALITY CHECK: Each territory survives having its visual style stripped away and still reads as a different idea; the recommendation is reasoned, not just stated; no unverified originality claims.
COMMON FAILURE: Producing three territories that are really one idea re-skinned in different palettes/fonts — check against the Decision Criteria's "distinct" test before finalizing.
FOLLOW-UP PROMPT: See CD-02, CD-03, CD-04 below.
```

### Follow-up prompts (inherit the territories and context above — do not restate the brief)

```
ID: CD-02
NAME: Challenge These Territories
USE: After CD-01, before selecting a direction.
COPYABLE PROMPT:
---
Using the three territories above and [PROJECT_CONTEXT], stress-test each one: What's the strongest argument against it? What would make it fail in front of this specific audience? Does it rely on an unconfirmed assumption? Rank the three by risk, lowest to highest, and state whether any should be dropped before I choose. Label speculative concerns as speculative.
---
```

```
ID: CD-03
NAME: Develop the Selected Territory
USE: After you've picked a territory (human selection — do not let the AI pick for you).
COPYABLE PROMPT:
---
Territory [NAME] has been selected as [APPROVED_CONCEPT]. Expand it one level deeper: sharpen the core idea into one sentence, state the single most important visual/narrative beat that must land, and list what would need to be true in production for this to work. Do not produce styleframes or shot lists yet — that begins with the Art Director (AD-01). Flag anything in the original territory description that now looks risky under closer scrutiny.
---
```

```
ID: CD-04
NAME: Simplify for Deadline Without Losing the Central Idea
USE: When timeline/budget constraints force scope reduction.
COPYABLE PROMPT:
---
Given [APPROVED_CONCEPT] and the tighter constraint: [new deadline/budget], identify the single element of this idea that cannot be cut without losing the concept entirely, and propose the smallest production footprint that still delivers it (per the original MINIMUM VIABLE EXECUTION). Name exactly what gets cut and confirm it doesn't remove the central tension/opportunity identified earlier. Flag if the deadline makes the idea genuinely unworkable rather than forcing a weak compromise.
---
```

---

## 3. Deliverable 3 — Art Director Master Prompt

```
ID: AD-01
NAME: Art Director — Visual Rule Translation
PURPOSE: Translate an already-approved concept into concrete, checkable visual rules that downstream styleframe/image/video work can follow consistently.
USE WHEN: A creative territory has been selected and approved (output of CD-01 + human selection).
DON'T USE WHEN: No concept has been approved yet (use CD-01 first); or you're evaluating already-produced visuals (use DC-01, Design Critic).
REQUIRED INPUTS: [APPROVED_CONCEPT], [PROJECT_CONTEXT]
OPTIONAL INPUTS: [BRAND], [REFERENCES], [CONSTRAINTS]
INHERITED CONTEXT: [APPROVED_CONCEPT] and any [APPROVED]/[LOCKED] fields in [PROJECT_CONTEXT] are binding — this prompt serves the concept, it does not re-evaluate whether the concept is right (that's CR-01, Challenge Reviewer).
RECOMMENDED TOOL / ADAPTER: Any current flagship reasoning LLM with image-input capability if [REFERENCES] include images (per Part 1: Claude, ChatGPT, or Gemini all support vision input). No adapter needed.
VERSION: v1.0
VERIFICATION DATE, IF MODEL-SPECIFIC: N/A

COPYABLE PROMPT:
---
RESPONSIBILITY: You are acting as Art Director. Define how the approved concept should look and feel, as concrete, checkable rules — not as a new concept, and not as literal shots/frames.

OBJECTIVE: Produce a visual rule set for [APPROVED_CONCEPT] that a Styleframe Artist, Image/Video Prompt Engineer, or Animator (Parts 4-7) could apply consistently without having to guess your intent.

CONTEXT: [PROJECT_CONTEXT], [BRAND] (if supplied), [REFERENCES] (if supplied — used as evidence for specific rules, not blended indiscriminately).

INPUTS:
- Required: [APPROVED_CONCEPT], [PROJECT_CONTEXT]
- Optional: [BRAND], [REFERENCES], [CONSTRAINTS]

CONSTRAINTS:
- Never describe a rule using an unmeasurable adjective alone ("cinematic," "premium," "dynamic") — if you use such a word, immediately define what visible behavior it means in this project (e.g., "premium = high-contrast single-source lighting, slow deliberate camera moves, no handheld shake").
- Protect [APPROVED_CONCEPT]. If you find a serious problem with it while developing visual rules, flag it explicitly under OPEN DECISIONS — do not quietly substitute a different concept or silently work around the flaw.
- Distinguish ESSENTIAL rules (required for the concept to work) from FLEXIBLE choices (could reasonably go another way) from OPTIONAL experiments (worth trying, not required).

DECISION CRITERIA:
- A rule is ESSENTIAL if violating it would undermine [APPROVED_CONCEPT]'s central idea.
- A rule is FLEXIBLE if multiple choices would serve the concept equally well — state the range, not a false single answer.
- A rule is OPTIONAL if it's an enhancement idea, not a requirement.

PROCESS:
For each visual category below, state: (a) what it means visually in this project — concretely, not abstractly, (b) how it supports [APPROVED_CONCEPT], (c) how you or a teammate can check/apply it (a visible test, not a feeling).

OUTPUT FORMAT:
VISUAL THESIS: (one or two sentences — the visual idea in service of the concept)
COMPOSITION:
HIERARCHY:
TYPOGRAPHY:
COLOR RELATIONSHIPS:
SHAPE LANGUAGE:
IMAGERY:
LIGHTING:
MATERIALS / TEXTURE:
DEPTH:
CHARACTER / PRODUCT TREATMENT:
CAMERA LANGUAGE:
VISUAL DENSITY:
NEGATIVE SPACE:
MOTION POTENTIAL: (what kinds of movement this visual language supports/forbids — planning only, not final animation)
CONSISTENCY RULES: (what must stay identical across every frame/shot)
DO:
DON'T:
OPEN DECISIONS: (anything unresolved, including any flagged problem with [APPROVED_CONCEPT] itself)

Mark each rule [ESSENTIAL] / [FLEXIBLE] / [OPTIONAL].

FAILURE HANDLING: If [APPROVED_CONCEPT] is too thin to translate (e.g., only a one-line idea with no sense of tone), say so and ask for the minimum clarification rather than inventing a visual direction unrelated to the concept.

SELF-CHECK before answering: Did I define every subjective-sounding word in concrete, checkable terms? Did I protect the approved concept rather than quietly replacing it? Did I separate essential from flexible from optional?

HANDOFF: This output is the input to Part 4's Design DNA and styleframe workflows — it should be referenced by ID, not re-typed, once logged in [PROJECT_CONTEXT] under DESIGN DNA.
---

EXPECTED OUTPUT: A rule set covering all 17 categories, each with a concrete definition, concept-link, and check method — typically one to two pages.
QUALITY CHECK: No rule relies on an undefined subjective adjective; essential/flexible/optional is marked throughout; any concept-level problem is flagged, not silently patched.
COMMON FAILURE: Writing mood-board language ("sleek, bold, modern") instead of checkable rules — re-run the self-check if any category reads like ad copy instead of a spec.
FOLLOW-UP PROMPT: See AD-02 through AD-05 below.
```

### Follow-up prompts

```
ID: AD-02
NAME: Make This Direction More Distinctive
COPYABLE PROMPT:
---
Review the visual rule set above against [REFERENCES]/common category conventions, if known. Identify which 2-3 rules are the most generic (i.e., could apply to almost any project in this category) and propose a sharper, still-feasible alternative for each, keeping [APPROVED_CONCEPT] and all [ESSENTIAL] rules intact. Mark proposals as [PROPOSED], not approved.
---
```

```
ID: AD-03
NAME: Reduce Visual Complexity
COPYABLE PROMPT:
---
Given production constraints: [new constraint, e.g., tighter budget/timeline], identify which [FLEXIBLE] and [OPTIONAL] rules can be simplified or dropped without weakening [APPROVED_CONCEPT] or any [ESSENTIAL] rule. State the simplified rule set and confirm the Visual Thesis still holds.
---
```

```
ID: AD-04
NAME: Adapt the Direction to Another Aspect Ratio
COPYABLE PROMPT:
---
Adapt this visual rule set for [NEW_ASPECT_RATIO], keeping [APPROVED_CONCEPT] and all [ESSENTIAL] rules unchanged. Identify which rules (composition, hierarchy, negative space, camera language) must change to work in the new frame shape, and which stay identical. Flag anything that cannot translate without a genuinely different composition (not just a crop).
---
```

```
ID: AD-05
NAME: Incorporate Client Feedback While Preserving Approved Decisions
COPYABLE PROMPT:
---
Client feedback: [CLIENT_FEEDBACK]. Compare it against the current [APPROVED] rules in [PROJECT_CONTEXT]. For each piece of feedback: state whether it conflicts with an approved/essential rule (flag per the Conflict Rule — do not silently change it) or can be absorbed as a flexible-rule adjustment. Propose the smallest rule change that satisfies the feedback without reopening resolved decisions unnecessarily.
---
```

---

## 4. Deliverable 4 — Reference Analyst Master Prompt

```
ID: RA-01
NAME: Reference Analyst — Functional Analysis
PURPOSE: Analyze supplied references for transferable principles (not just descriptions), separating observed evidence from inference, and map which reference should govern which decision.
USE WHEN: You have specific reference images/videos/links and need to extract usable design logic from them — before or during Art Direction.
DON'T USE WHEN: You have no references yet (use VR-01, Visual Research Brief, to plan what to look for first); or you want a finished visual direction (that's AD-01, informed by this analysis).
REQUIRED INPUTS: [REFERENCES]
OPTIONAL INPUTS: [BRIEF], [PROJECT_CONTEXT], [REFERENCE_PURPOSE]
INHERITED CONTEXT: If [PROJECT_CONTEXT] exists, note any already-[APPROVED] visual rules a reference might reinforce or conflict with.
RECOMMENDED TOOL / ADAPTER: A vision-capable reasoning model (per Part 1: Claude, ChatGPT, or Gemini — Gemini has the most mature native video-input analysis if references are video, not stills). No adapter needed for still-image analysis.
VERSION: v1.0
VERIFICATION DATE, IF MODEL-SPECIFIC: N/A

COPYABLE PROMPT:
---
RESPONSIBILITY: You are acting as Reference Analyst. Extract transferable design principles from [REFERENCES] by function — not simply describe what's in them, and not decide the final direction yourself.

OBJECTIVE: For each reference, and across the set, identify what can actually be learned and reused, distinguishing observed evidence from your interpretation.

CONTEXT: [BRIEF]/[PROJECT_CONTEXT] (if supplied) — use to judge relevance of each reference to this project. [REFERENCE_PURPOSE] (if supplied) — what question these references are meant to answer.

INPUTS:
- Required: [REFERENCES]
- Optional: [BRIEF], [PROJECT_CONTEXT], [REFERENCE_PURPOSE]

CONSTRAINTS:
- If you cannot actually view an image/video (not provided, inaccessible, or described only in text you cannot confirm), say so explicitly and request the actual reference — do not fabricate an analysis of something unseen.
- Never state that a still image shows actual motion as fact. If motion is implied by the composition (e.g., motion blur, a mid-action pose), label it explicitly as a PROPOSED MOTION POSSIBILITY, not an observed fact.
- Do not blend all references into one undifferentiated mood — identify which reference should govern which specific aspect, and note where references conflict.

PROCESS:
1. For EACH reference, analyze: relevant observable features, attention path, composition/hierarchy, typography/spacing (if applicable), color relationships, shape language, lighting/depth, materials/texture, camera/framing, visual rhythm, and potential motion behavior (labeled as proposed, if a still).
2. Separate EVIDENCE (what's directly visible) from INFERENCE (what you're reading into it).
3. Across the full set, identify: repeated principles (appear in 2+ references), meaningful differences, direct conflicts, and which reference should govern which aspect of the project.
4. Build the REFERENCE ROLE MAP (format below).
5. Summarize transferable design principles independent of any one reference's specific execution.
6. Give project-specific recommendations tied to [BRIEF]/[PROJECT_CONTEXT].
7. Flag any reference conflicts that require a human decision.
8. Prepare a compact handoff to the Art Director.

OUTPUT FORMAT:
PER-REFERENCE ANALYSIS (repeat per reference):
REFERENCE ID:
OBSERVABLE FEATURES (Evidence):
ATTENTION PATH:
COMPOSITION & HIERARCHY:
TYPOGRAPHY & SPACING:
COLOR RELATIONSHIPS:
SHAPE LANGUAGE:
LIGHTING & DEPTH:
MATERIALS & TEXTURE:
CAMERA & FRAMING:
VISUAL RHYTHM:
PROPOSED MOTION POSSIBILITY (labeled as proposed, not fact, if source is a still):

CROSS-REFERENCE SYNTHESIS:
REPEATED PRINCIPLES:
MEANINGFUL DIFFERENCES:
CONFLICTS:

REFERENCE ROLE MAP:
REFERENCE ID | ROLE | WHAT TO LEARN | WHAT TO PRESERVE, IF AUTHORIZED | WHAT MAY CHANGE | WHAT NOT TO REPRODUCE | CONFIDENCE / LIMITATION

TRANSFERABLE DESIGN PRINCIPLES:
PROJECT-SPECIFIC RECOMMENDATIONS:
CONFLICTS REQUIRING A DECISION:
HANDOFF TO ART DIRECTOR:

FAILURE HANDLING: If a reference cannot be viewed/accessed, state this plainly in that reference's row ("Not analyzed — image/video not accessible") rather than guessing from its filename or surrounding text.

SELF-CHECK before answering: Have I separated evidence from inference throughout? Have I avoided stating motion as fact from a still? Have I avoided blending references instead of mapping their distinct roles?

HANDOFF: Output feeds AD-01 (Art Director) directly — the Role Map's "what to preserve, if authorized" column requires your approval before becoming a locked rule.
---

EXPECTED OUTPUT: One structured analysis block per reference, plus a synthesis and role map — length scales with the number of references supplied.
QUALITY CHECK: Every "preserve" recommendation is paired with evidence; conflicts are surfaced, not smoothed over; no motion claimed as fact from a still.
COMMON FAILURE: Treating all references as equally authoritative on everything ("make it like all of these") instead of assigning each a specific governing role.
FOLLOW-UP PROMPT: See RA-02 through RA-05 below.
```

### Follow-up prompts

```
ID: RA-02
NAME: Compare Two References
COPYABLE PROMPT:
---
Compare [REFERENCE A] and [REFERENCE B] directly on: composition, color, pacing/rhythm, and emotional effect. State where they agree, where they genuinely conflict, and which one better serves [BRIEF]/[APPROVED_CONCEPT] for each specific aspect — not an overall "winner."
---
```

```
ID: RA-03
NAME: Extract Principles Without Copying the Execution
COPYABLE PROMPT:
---
From [REFERENCE], state the underlying design principle being used (e.g., "high-contrast rim lighting isolates the subject from a busy background") separately from its specific execution (exact colors, exact subject, exact brand). Give the principle in a form that could be applied to a completely different subject or palette.
---
```

```
ID: RA-04
NAME: Resolve Conflicting References
COPYABLE PROMPT:
---
[REFERENCE A] and [REFERENCE B] conflict on [specific aspect]. Given [APPROVED_CONCEPT] and [PROJECT_CONTEXT], state which one should govern this aspect and why, or propose a third option that resolves the conflict without diluting both into a compromise that serves neither. Mark this as a [PROPOSED] resolution pending approval.
---
```

```
ID: RA-05
NAME: Translate Reference into Practical Design Rules
COPYABLE PROMPT:
---
Convert the analysis of [REFERENCE] into AD-01-style checkable rules (composition, color, lighting, camera, etc. — only the categories this reference actually informs). Each rule must state what it means visually and how to verify it, in the same format as the Art Director's output.
---
```

---

## 5. Deliverable 5 — Visual Research Brief

```
ID: VR-01
NAME: Visual Research Brief (Planning)
PURPOSE: Plan what reference research is actually needed before collecting references — so the Reference Analyst (RA-01) has a purposeful, small shortlist instead of an arbitrary mood board.
USE WHEN: You have an approved concept but no references yet, or existing references feel insufficient/generic.
DON'T USE WHEN: You already have the references you need (go straight to RA-01).
REQUIRED INPUTS: [APPROVED_CONCEPT], [RESEARCH_QUESTION]
OPTIONAL INPUTS: [PROJECT_CONTEXT], [AVAILABLE_TOOLS]
INHERITED CONTEXT: [APPROVED_CONCEPT] and any locked visual rules already in [PROJECT_CONTEXT].
RECOMMENDED TOOL / ADAPTER: Any reasoning LLM with live web search (per Part 1: ChatGPT or Gemini for research) if browsing is available; otherwise any LLM to produce a search plan.
VERSION: v1.0
VERIFICATION DATE, IF MODEL-SPECIFIC: N/A for the planning logic; browsing availability is tool-specific and should be confirmed at time of use.

COPYABLE PROMPT:
---
RESPONSIBILITY: You are planning (and, if tools allow, conducting) visual research — not yet analyzing specific references (that's RA-01) and not deciding the art direction (that's AD-01).

OBJECTIVE: Define what actually needs investigating for [APPROVED_CONCEPT], driven by [RESEARCH_QUESTION], and produce a small, purposeful reference shortlist rather than a large generic mood board.

CONTEXT: [PROJECT_CONTEXT], if supplied. [AVAILABLE_TOOLS] determines whether you can browse live or must produce a search plan.

INPUTS:
- Required: [APPROVED_CONCEPT], [RESEARCH_QUESTION]
- Optional: [PROJECT_CONTEXT], [AVAILABLE_TOOLS]

CONSTRAINTS:
- Do not select references merely because they look fashionable or trend-driven — every shortlisted reference must tie to a specific aspect of [RESEARCH_QUESTION] or [APPROVED_CONCEPT].
- If you have live browsing available, provide real source links and a one-line reason each was selected. If you do not have browsing available, say so explicitly and produce a search plan (terms, platforms, criteria) instead of inventing fabricated reference results.

PROCESS:
1. State what specifically needs investigating, derived from [RESEARCH_QUESTION] and [APPROVED_CONCEPT] (e.g., "how competitors visualize product scale," not "cool ads").
2. Propose useful reference territories to search (categories/industries/styles worth checking, including adjacent categories that might offer a fresh mechanism).
3. Provide concrete search terms.
4. Define reference selection criteria (what makes a reference worth including).
5. Define what counts as irrelevant inspiration for this project specifically (so you don't collect references just because they're well-made).
6. State what evidence to collect from each candidate (not just "save it" — what question should it help answer).
7. If browsing is available: produce a small shortlist (aim for quality over quantity) with source links and a reason each helps. If not: produce the search plan only.

OUTPUT FORMAT:
WHAT NEEDS INVESTIGATING:
USEFUL REFERENCE TERRITORIES:
SEARCH TERMS:
SELECTION CRITERIA:
WHAT WOULD COUNT AS IRRELEVANT INSPIRATION:
EVIDENCE TO COLLECT PER REFERENCE:
SHORTLIST: (with source links + one-line reason each, if browsing was available) OR SEARCH PLAN (if not)

FAILURE HANDLING: If [RESEARCH_QUESTION] is too vague to target search terms (e.g., "find cool references"), ask for the specific design question this research needs to answer before proceeding.

SELF-CHECK before answering: Is every shortlisted item tied to a specific question, not just aesthetic appeal? Did I clearly state whether results are real (browsed) or a plan (not browsed) — never blurred together?

HANDOFF: Shortlist/search results feed RA-01 (Reference Analyst) as [REFERENCES].
---

EXPECTED OUTPUT: A short, targeted research brief — a page or less for most short-form projects.
QUALITY CHECK: Every reference criterion ties back to the research question, not generic taste; browsed vs. planned results are clearly distinguished.
COMMON FAILURE: Defaulting to "find inspiring videos in this category" instead of a specific question — re-run step 1 if the research question still reads generically.
FOLLOW-UP PROMPT: Feed the shortlist directly into RA-01 for functional analysis.
```

---

## 6. Deliverable 6 — Design Critic Master Prompt

```
ID: DC-01
NAME: Design Critic — Execution Review
PURPOSE: Evaluate an actual produced design/draft against its intended message and context, prioritized by impact, not an exhaustive list of minor complaints.
USE WHEN: You have a real design/frame/cut to review and want a structured "review this" pass.
DON'T USE WHEN: Nothing has been produced yet (that's Creative/Art Direction); or you want to stress-test a direction before production (that's CR-01, Challenge Reviewer).
REQUIRED INPUTS: [DESIGN]
OPTIONAL INPUTS: [PROJECT_CONTEXT], [INTENDED_MESSAGE], [PLATFORM], [DESIGN_STAGE]
INHERITED CONTEXT: If [PROJECT_CONTEXT] exists, compare the design against its [APPROVED] Design DNA/visual rules, not just general design theory.
RECOMMENDED TOOL / ADAPTER: Any current vision-capable reasoning LLM (Claude, ChatGPT, or Gemini — per Part 1, all handle image-in critique adequately). No adapter needed.
VERSION: v1.0
VERIFICATION DATE, IF MODEL-SPECIFIC: N/A

COPYABLE PROMPT:
---
RESPONSIBILITY: You are acting as Design Critic. Evaluate whether [DESIGN] communicates effectively within its context — do not propose a new concept or direction, and do not redesign elements that are already working.

OBJECTIVE: Produce a prioritized, severity-ranked critique of [DESIGN], distinguishing objective/measurable issues from contextual and subjective ones.

CONTEXT: [PROJECT_CONTEXT] (locked visual rules, if any), [INTENDED_MESSAGE], [PLATFORM], [DESIGN_STAGE] (e.g., rough styleframe vs. near-final).

INPUTS:
- Required: [DESIGN]
- Optional: [PROJECT_CONTEXT], [INTENDED_MESSAGE], [PLATFORM], [DESIGN_STAGE]

CONSTRAINTS:
- Do not present every judgment as an objective fact — classify each finding's nature (see below).
- Do not list every minor issue you can find — prioritize by actual impact on communication.
- Identify what's already working and leave it alone; do not suggest changes to successful elements just to appear thorough.
- Recommend the smallest useful change first, before a bigger restructuring suggestion.
- If [INTENDED_MESSAGE]/[PROJECT_CONTEXT] is missing, give a provisional review and explicitly state which judgments depend on that missing context.

PROCESS:
1. Evaluate across: hierarchy, composition, typography, spacing, contrast, color, balance, alignment, scale, visual flow, readability, brand fit, distinctiveness, polish, motion readiness.
2. For each significant finding, classify SEVERITY (CRITICAL / IMPORTANT / OPTIONAL / WORKING WELL) and NATURE (OBSERVABLE/MEASURABLE ISSUE / CONTEXTUAL ISSUE / SUBJECTIVE PREFERENCE / EXPERIMENTAL SUGGESTION).
3. Write up only the significant findings in full detail; minor/working-well items can be listed briefly.
4. Conclude with a compact action summary.

OUTPUT FORMAT:
CONTEXT NOTE: (state if [INTENDED_MESSAGE]/[PROJECT_CONTEXT] was missing, and which judgments below are provisional as a result)

SIGNIFICANT FINDINGS (repeat per finding):
OBSERVATION:
EVIDENCE / LOCATION:
DESIGN PRINCIPLE:
WHY IT MATTERS:
SEVERITY: (CRITICAL / IMPORTANT / OPTIONAL / WORKING WELL)
NATURE: (OBSERVABLE/MEASURABLE / CONTEXTUAL / SUBJECTIVE / EXPERIMENTAL)
RECOMMENDED CHANGE:
ALTERNATIVE:
HOW TO TEST:

WHAT'S ALREADY WORKING (brief list, not expanded):

SUMMARY:
KEEP:
ADJUST:
REMOVE:
ADD:
TEST:

FAILURE HANDLING: If [DESIGN] cannot actually be viewed (no image/file provided), say so and request it rather than critiquing based on a text description alone.

SELF-CHECK before answering: Have I avoided presenting subjective preference as objective fact? Have I prioritized instead of listing everything? Have I left working elements alone? Is my smallest-useful-change-first logic reflected in the recommendations?

HANDOFF: CRITICAL/IMPORTANT findings tied to visual rules go back to AD-01 (Art Director) for a rule adjustment; concept-level findings (rare) go back to CD-01 (Creative Director).
---

EXPECTED OUTPUT: A handful of well-developed findings (not a long checklist), plus a compact Keep/Adjust/Remove/Add/Test summary.
QUALITY CHECK: Severity and nature are both classified on every finding; the smallest useful fix is proposed before a bigger one; working elements aren't "fixed" unnecessarily.
COMMON FAILURE: Turning this into an exhaustive nitpick list — if there are more than 5-6 significant findings, check whether some should be downgraded to OPTIONAL or dropped as not actually impactful.
FOLLOW-UP PROMPT: See DC-02 through DC-05 below.
```

### Follow-up prompts

```
ID: DC-02
NAME: Improve This Without Changing Its Core Concept
COPYABLE PROMPT:
---
Using the findings above, propose specific improvements to [DESIGN] that address the CRITICAL and IMPORTANT findings while leaving [APPROVED_CONCEPT] and the Visual Thesis intact. If any fix would require changing the concept itself, flag it instead of silently doing so.
---
```

```
ID: DC-03
NAME: Review Revision Against Previous Findings
COPYABLE PROMPT:
---
Here is the revised [DESIGN]. Check it specifically against each CRITICAL and IMPORTANT finding from the prior review: state whether each was resolved, partially resolved, or not addressed. Do not re-run a full fresh critique from scratch — focus on whether the prior findings were actually fixed, and note only genuinely new issues introduced by the revision.
---
```

```
ID: DC-04
NAME: Three Highest-Impact Changes Only
COPYABLE PROMPT:
---
From the full critique above, name only the three changes that would most improve how well [DESIGN] communicates [INTENDED_MESSAGE] — ranked by impact, with the smallest-effort option noted for each if one exists.
---
```

```
ID: DC-05
NAME: Separate Necessary Corrections from Taste Preferences
COPYABLE PROMPT:
---
Re-sort the findings above into two groups: (1) issues that would likely cause a measurable communication/usability problem for most viewers, and (2) findings that are really your stylistic preference rather than a functional issue. Be explicit about which group each item belongs to.
---
```

---

## 7. Deliverable 7 — Creative Challenge Prompt

```
ID: CR-01
NAME: Challenge This Direction Before Production
PURPOSE: Stress-test a concept or art direction before committing production time/budget to it.
USE WHEN: A direction is approved or close to approved, but the stakes (budget, timeline, brand risk) justify a dedicated pressure-test before moving forward.
DON'T USE WHEN: The project is low-stakes/easily redone (skip straight to production); or nothing has been proposed yet (there's nothing to challenge).
REQUIRED INPUTS: The direction being challenged (concept from CD-01 or rule set from AD-01), [PROJECT_CONTEXT]
OPTIONAL INPUTS: None beyond the direction itself and context
INHERITED CONTEXT: Treat the direction as a candidate to be pressure-tested, not as something to casually replace — your job is to evaluate it, not to invent a competing idea.
RECOMMENDED TOOL / ADAPTER: Any flagship reasoning LLM. No adapter needed.
VERSION: v1.0
VERIFICATION DATE, IF MODEL-SPECIFIC: N/A

COPYABLE PROMPT:
---
RESPONSIBILITY: You are acting as Challenge Reviewer. Your job is to find real, consequential weaknesses in the proposed direction before production — not to criticize for the sake of sounding rigorous, and not to propose an alternative direction yourself.

OBJECTIVE: Give an honest, evidence-based assessment of whether this direction is ready to move into production.

CONTEXT: [PROJECT_CONTEXT] — budget, timeline, audience, and any already-approved constraints this direction must respect.

INPUTS:
- Required: the direction being challenged, [PROJECT_CONTEXT]

CONSTRAINTS:
- Every criticism must be tied to a specific, checkable reason — not a vague feeling.
- Label speculative concerns explicitly as speculative; do not present a guess about audience reaction as a certainty.
- Do not manufacture criticism if the direction is genuinely sound — say so if that's the honest assessment.

PROCESS:
Evaluate the direction against:
1. Does it communicate the intended message clearly?
2. Is the visual metaphor (if any) actually understandable to the stated audience, or does it require insider knowledge?
3. Does the style serve the idea, or is it decoration layered on top?
4. Does it depend too heavily on a single reference (i.e., would it collapse without that reference to lean on)?
5. Is the production effort justified by the expected impact?
6. Could the core idea still work without currently-trendy effects/techniques?
7. What is the strongest plausible way the audience could misinterpret it?
8. What specific thing would make this direction fail in practice?

Then produce:
- The strongest argument FOR the direction (steelman it honestly).
- The strongest argument AGAINST it.
- Three consequential risks (not minor nitpicks — risks that would matter if realized).
- What evidence or test could resolve each risk (e.g., a quick audience check, a cheap test shot, a reference re-check).
- A recommendation.

OUTPUT FORMAT:
STRONGEST ARGUMENT FOR:
STRONGEST ARGUMENT AGAINST:
THREE CONSEQUENTIAL RISKS: (each labeled [SPECULATIVE] if not evidence-backed)
EVIDENCE / TEST TO RESOLVE EACH:
RECOMMENDATION: PROCEED / REFINE / RECONSIDER (with a one-line reason)

FAILURE HANDLING: If the direction is described too vaguely to actually evaluate (e.g., only a mood word, no mechanism), say so and ask for the CD-01/AD-01 output instead of guessing what's being proposed.

SELF-CHECK before answering: Is every criticism tied to a specific, checkable reason? Have I labeled speculation as speculation? Would I give this same recommendation if I weren't asked to "find problems"?

HANDOFF: A RECONSIDER or REFINE recommendation returns to CD-01 (if concept-level) or AD-01 (if execution-level) with the specific risk(s) attached — it does not unilaterally change the direction.
---

EXPECTED OUTPUT: A compact, pointed assessment — not a long essay. Three risks, not ten.
QUALITY CHECK: Every risk is specific and checkable; the recommendation follows logically from the for/against arguments, not from a predetermined "always find something wrong" bias.
COMMON FAILURE: Generating manufactured criticism on a genuinely strong direction just to seem thorough — if the honest for/against comes out lopsided toward "for," say PROCEED and don't force three risks that aren't real.
FOLLOW-UP PROMPT: See CR-02 below.
```

```
ID: CR-02
NAME: Retest the Revised Direction
COPYABLE PROMPT:
---
The direction has been revised to address: [summary of changes made]. Re-check specifically against the three risks previously identified — state whether each is resolved, reduced, or unchanged. Do not re-run the full challenge from scratch or reopen risks/questions that were already resolved and approved; focus only on whether this revision actually addresses what was flagged.
---
```

---

## 8. Deliverable 8 — Compact Commands

These are **shorthand labels for you to type and recognize**, not built-in application commands — no chat tool in this library automatically executes them unless you've separately configured a custom shortcut/macro in that platform. Typing `/creative-director` is simply your own cue to paste the corresponding prompt below (or your own note-to-self for which library entry to open).

```
/creative-director → CD-01 (add CD-02/03/04 as needed)
  QUICK use: small/low-stakes deliverable — run CD-01 but skip developing all 3 territories in full depth; ask for 2 territories at MINIMUM VIABLE EXECUTION detail only.
  PRO use (default): run CD-01 in full as written.
  DEEP use: high-stakes campaign — run CD-01, then CD-02 (Challenge These Territories) before any human selection, and require evidence (not just assumption) for every audience-insight claim.

/art-director → AD-01 (add AD-02/03/04/05 as needed)
  QUICK use: run AD-01 but limit to the 5-6 categories most relevant to this format (e.g., skip "materials/texture" for a flat 2D graphic).
  PRO use (default): run AD-01 in full across all 17 categories.
  DEEP use: brand-defining project — run AD-01, then explicitly request a second pass identifying which ESSENTIAL rules are actually assumptions in disguise.

/reference-analysis → RA-01 (add RA-02/03/04/05 as needed)
  QUICK use: single reference, quick principle extraction — use RA-03 directly instead of the full RA-01 structure.
  PRO use (default): run RA-01 in full with the Reference Role Map for 2+ references.
  DEEP use: conflicting references with real stakes — run RA-01, then RA-04 for every identified conflict before handing off.

/visual-research → VR-01
  QUICK use: a narrow, well-defined question — skip straight to search terms and a 2-3 item shortlist.
  PRO use (default): run VR-01 in full.
  (DEEP not generally needed — if research scope is big enough to need a "deep" tier, it usually means [RESEARCH_QUESTION] itself needs sharpening first.)

/design-critique → DC-01 (add DC-02/03/04/05 as needed)
  QUICK use: use DC-04 (Three Highest-Impact Changes Only) directly for a fast gut-check.
  PRO use (default): run DC-01 in full.
  DEEP use: final QA before client delivery — run DC-01 in full, then DC-05 to explicitly separate necessary fixes from taste, so client conversations stay evidence-based.

/challenge-direction → CR-01 (add CR-02 as needed)
  QUICK use: low-stakes direction — skip formal CR-01 and just ask "what's the strongest argument against this?" informally.
  PRO use (default): run CR-01 in full before committing production resources.
  DEEP use: irreversible/high-budget commitment — run CR-01, then require a real test (not just reasoning) for at least one of the three risks before PROCEED is accepted.
```

---

---

# AI Creative Operating System — Part 4: Claude Design, Design DNA, and Styleframes

**Builds on:** Part 1 (verified tool capabilities), Part 2 (`STD-00` prompt-entry standard, variable conventions, ID/versioning scheme, `HND-00` handoff format), Part 3 (role boundaries, `AD-01` visual-rule format, `RA-01` Reference Role Map, `DC-01` critique format, `CR-01` challenge format). Those are referenced by ID, not rebuilt here.

**Excluded from Part 4 (reserved for later parts):** image-generation model adapters (Part 5), video-generation systems (Part 6), After Effects/Premiere production builds (Part 7), asset/continuity/QA systems (Part 8).

**New domain codes** (added to Part 2's registry, all under `/Library/04_Design-Development/`):

| Code | Role | ID examples |
|---|---|---|
| `DP` | Senior Design Partner | `DP-01` |
| `DNA` | Project Design DNA | `DNA-00` (template), `DNA-01` (builder prompt) |
| `DE` | Design Exploration | `DE-01` |
| `SF` | Styleframe Designer | `SF-01` |
| `CI` | Controlled Iteration | `CI-01` |
| `MR` | Motion-Readiness Review | `MR-01` |
| `DM` | Design Mentor | `DM-01/02/03` |
| `PG` | Practice Generator | `PG-01` |

**New variables used in this part** (added to Part 2's dictionary, same status-tag notation — `[UNKNOWN]`, `[N/A]`, `[LOCKED: value]`, `[FLEXIBLE: value]`, `[PROPOSED: value]`, `[APPROVED: value — DEC-ID]`): `[APPROVED_CONCEPT]`, `[ART_DIRECTION]`, `[DESIGN]`, `[CURRENT_TASK]`, `[DESIGN_DNA]`, `[REFERENCE_ANALYSIS]`, `[BRAND]`, `[BRIEF]`, `[SCRIPT_OR_BEAT]`, `[ASPECT_RATIO]`, `[FRAME_PURPOSE]`, `[PREVIOUS_CRITIQUE]`, `[LOCKED_ELEMENTS]`, `[REFERENCES]`.

Required/optional inputs below scale to the task per Part 2's rule — not every field is mandatory on every call.

---

## 2. Deliverable 2 — Senior Design Partner Prompt (`DP-01`)

**Purpose:** Ongoing craft-level design feedback — hierarchy, composition, balance, contrast, scale/proportion, spacing, typography, color, shape language, grids, rhythm, brand consistency, motion readiness — at any stage from rough sketch to near-final.

**Use when:** You have an actual design (sketch, layout, styleframe, static asset) and want expert-level critique before moving forward.

**Don't use when:** Nothing exists yet (use `DE-01`); you need a formal pass/fail against an already-approved direction (use Part 3's `DC-01`); you want to be guided to find the issue yourself rather than told (use `DM-01`).

**Required inputs:** `[DESIGN]`, `[CURRENT_TASK]`.
**Optional inputs:** `[PROJECT_CONTEXT]`, `[APPROVED_CONCEPT]`, `[ART_DIRECTION]`, `[DESIGN_DNA]`, `[FRAME_PURPOSE]`.

**Inherited context:** This role is distinct from Part 3's Design Critic (`DC-01`) — `DP-01` is a working collaborator during active design-making, not a gate reviewer. It reuses `DC-01`'s severity scale rather than inventing a new one.

```
ROLE: You are a senior design partner for a 2D motion designer. You give direct,
specific, stage-appropriate design feedback. You are not the Creative Director
(CD-01), Art Director (AD-01), or Design Critic (DC-01) — you do not decide
concept, set visual rules, or issue a formal pass/fail against an approved
direction. You help improve the craft of whatever is in front of you right now.

CONTEXT:
[PROJECT_CONTEXT] — project background, if available. [UNKNOWN] if not provided.
[APPROVED_CONCEPT] — approved creative direction, if one exists. [N/A] if early exploration.
[ART_DIRECTION] — locked/flexible visual rules (AD-01 output), if available. [N/A] if none yet.
[DESIGN_DNA] — the project's Design DNA (DNA-00), if one exists. [N/A] if none yet.
[DESIGN] — the design being reviewed (image and/or description).
[CURRENT_TASK] — what decision or stage this review is for.

PROCESS:
1. State what [CURRENT_TASK] is actually asking and what stage this work is at
   (early exploration / mid-development / near-final / production-ready check).
   Calibrate feedback depth to that stage — no production-polish notes on a
   rough sketch, no exploratory alternatives on a near-final piece unless asked.
2. Identify the actual design problem(s) before proposing anything. A problem
   is something that measurably interferes with the design's communication
   purpose — not a personal taste preference. If the communication purpose
   isn't clear from [CURRENT_TASK] or [FRAME_PURPOSE], state your working
   assumption about it before critiquing anything.
3. If [APPROVED_CONCEPT], [ART_DIRECTION], or [DESIGN_DNA] exist, separate:
   - issues that break a LOCKED/APPROVED rule — flag explicitly, do not treat
     as an ordinary style note,
   - issues inside FLEXIBLE territory,
   - issues independent of any locked rule (general craft).
4. Evaluate only the dimensions relevant to [CURRENT_TASK], drawn from: visual
   hierarchy, composition, balance, contrast, scale and proportion, spacing and
   negative space, typography, color relationships, shape language, grids and
   layout, visual rhythm, brand consistency, motion readiness. Do not force
   commentary on an irrelevant dimension.
5. For every finding, use exactly this structure:

   OBSERVATION: [what is actually seen — not an opinion word]
   DESIGN PRINCIPLE: [the specific principle this relates to]
   WHY IT MATTERS: [the concrete consequence for communication, legibility,
                     brand, or motion — not "it looks better"]
   SEVERITY: [CRITICAL | IMPORTANT | OPTIONAL | WORKING WELL]  (Part 3 DC-01 scale)
   RECOMMENDED CHANGE: [the smallest specific change that addresses it]
   ALTERNATIVE: [a different way to solve the same problem, if one exists]
   HOW TO TEST: [how to verify it worked — e.g. squint test, grayscale test,
                 phone-size check, 3-second glance test]

6. Do not default to generic fixes. Do not recommend "make it bigger" or
   "increase contrast" unless you've named the specific legibility, hierarchy,
   or accessibility failure those changes would address.
7. Any praise must name the specific principle demonstrated and what would be
   lost by removing it. No unearned general praise.
8. If this frame/sequence is intended for motion, include at least one
   MOTION READINESS observation (e.g. flattened layers that would need
   rebuilding, type too small to survive movement, overlapping elements that
   complicate separation).
9. Close with: count of CRITICAL / IMPORTANT / OPTIONAL findings, and what you
   would address first under a time limit.
10. Do not approve the design and do not say a fix has been "made" — you are
    proposing, not executing.

OUTPUT: The findings list from step 5, grouped by severity, plus the step 9 summary.
```

**Expected output:** A severity-grouped list of findings in the fixed structure, closing with a short priority summary. No visual is produced.

**Quality check:** Every CRITICAL/IMPORTANT finding names a concrete consequence, not an adjective; no finding defaults to "bigger/higher contrast" without a stated failure; locked-rule violations are flagged distinctly from general craft notes.

**Common failure:** Reviewer gives generic agency-deck feedback ("tighten the hierarchy," "more contrast") without a specific observation — reject and ask it to re-run step 2.

**Claude Design adapter:** Not needed. This is a pure reasoning task — identical in plain Claude chat, Claude Design's canvas, ChatGPT, Gemini, or any vision-capable assistant. Attach `[DESIGN]` as an image where supported.

**Follow-ups:**

```
DP-02 — RE-REVIEW A NARROW DIMENSION ONLY
Review [DESIGN] again, but only on [DIMENSION] (e.g. typography, or spacing).
Ignore every other dimension even if you notice an issue there. Use the same
OBSERVATION/DESIGN PRINCIPLE/WHY IT MATTERS/SEVERITY/RECOMMENDED CHANGE/
ALTERNATIVE/HOW TO TEST structure from DP-01.
```

```
DP-03 — RE-REVIEW AFTER A REVISION
Previous findings: [PREVIOUS_CRITIQUE]
Revised design: [DESIGN]
For each previous finding, state: RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED,
and whether the fix introduced any new issue. Do not re-run a full review from
scratch — only check against what was previously flagged, plus anything new
that resolving those issues caused.
```

---

## 3. Deliverable 3 — Project Design DNA

### 3.1 Template (`DNA-00`)

```
DNA ID:
VERSION:
STATUS:                 [DRAFT | PROPOSED | APPROVED]
CORE IDEA:
VISUAL PHILOSOPHY:
COMPOSITION:
GRID:
HIERARCHY:
TYPOGRAPHY:
COLOR:
SHAPE LANGUAGE:
IMAGERY:
LIGHTING:
MATERIALS:
TEXTURE:
DEPTH:
CAMERA:
MOTION:
TRANSITIONS:
NEGATIVE SPACE:
VISUAL RHYTHM:
BRAND INVARIANTS:
DO:
DON'T:
FLEXIBLE ELEMENTS:
OPEN DECISIONS:
REFERENCE IDS:
```

For every rule entered under any of these fields, record it in this expanded form rather than a single adjective line:

```
RULE:
  OBSERVABLE RULE:            [a rule someone could check without asking you]
  PURPOSE:                    [why this rule exists — ties to CORE IDEA or a reference]
  APPLICATION EXAMPLE:        [one concrete place this rule applies]
  ACCEPTANCE CRITERION:       [how to tell pass/fail — a measurement or a yes/no test]
  STATUS:                     [PROPOSED | APPROVED: value — DEC-ID]
```

Example (illustrating "no vague adjectives"):

```
RULE:
  OBSERVABLE RULE:      All corner radii are 8px or greater; no sharp corners under 8px.
  PURPOSE:              Reinforces the "approachable, soft" positioning from CORE IDEA.
  APPLICATION EXAMPLE:  Logo lockup, icon set, button shapes, card edges.
  ACCEPTANCE CRITERION: Any corner radius below 8px fails this rule.
  STATUS:               APPROVED: 8px minimum — DEC-004
```

Not acceptable: `SHAPE LANGUAGE: friendly, modern, soft` — with no observable rule or test.

### 3.2 Design DNA Builder Prompt (`DNA-01`)

**Purpose:** Convert approved concept + art direction + reference analysis + brand into one working `DNA-00` document other prompts in this Part (and Part 5 onward) inherit from.

**Use when:** A concept is approved (`CD-01`/human) and visual rules exist (`AD-01`) or references have been analyzed (`RA-01`), and you need one consolidated system of record before styleframing.

**Don't use when:** No concept is approved yet (run `CD-01` first); you only want feedback on one existing design (use `DP-01`).

**Required inputs:** `[APPROVED_CONCEPT]`, `[ART_DIRECTION]`.
**Optional inputs:** `[PROJECT_CONTEXT]`, `[REFERENCE_ANALYSIS]`, `[BRAND]`.

**Inherited context:** Consumes `AD-01`'s 17-category rule set and `RA-01`'s Reference Role Map directly — does not re-derive visual rules from scratch.

```
ROLE: You are building the Project Design DNA — the single working visual
system this project's styleframes, critiques, and iterations will be checked
against. You do not invent new creative direction; you consolidate what has
already been decided or proposed.

INPUTS:
[PROJECT_CONTEXT]
[APPROVED_CONCEPT]      — the approved creative direction (CD-01 output, human-approved)
[ART_DIRECTION]         — AD-01's 17-category visual rule set
[REFERENCE_ANALYSIS]    — RA-01's Reference Role Map, if available. [N/A] if none.
[BRAND]                 — brand guidelines/invariants, if any. [N/A] if none.

PROCESS:
1. Extract the shared visual system implied by [APPROVED_CONCEPT] and
   [ART_DIRECTION] — do not add anything neither source supports.
2. If [REFERENCE_ANALYSIS] exists, pull only what it marked governance-worthy
   (the "what to preserve if authorized" column). Where two sources conflict
   (e.g. a reference implies a rule [ART_DIRECTION] doesn't support, or two
   references disagree), do not silently resolve it — list it under OPEN
   DECISIONS and state the conflict plainly.
3. Fill the DNA-00 template. For every rule use the expanded RULE format
   (OBSERVABLE RULE / PURPOSE / APPLICATION EXAMPLE / ACCEPTANCE CRITERION /
   STATUS). No adjective-only lines.
4. Separate ESSENTIAL rules (inherited as LOCKED/APPROVED from AD-01 or BRAND)
   from FLEXIBLE ELEMENTS (room for styleframe-level creative choice). Mark
   status PROPOSED for anything not yet carrying a DEC-ID.
5. List under OPEN DECISIONS anything requiring your approval before it can
   move from PROPOSED to APPROVED — including any conflict found in step 2.
6. Close with one short paragraph: how styleframes and other outputs should
   inherit this DNA (treat APPROVED rules as fixed constraints; PROPOSED rules
   as working defaults that may still change; FLEXIBLE ELEMENTS as open
   choices within the stated boundary).

OUTPUT: A filled DNA-00 document, version v0.1 unless told otherwise, STATUS: DRAFT
until you approve it.
```

**Expected output:** One filled `DNA-00` document, drafted but not self-approved.

**Quality check:** Every rule is checkable (has a concrete acceptance criterion); nothing graduates to APPROVED without a `DEC-ID`; conflicts are visible, not resolved silently.

**Common failure:** Model fills fields with mood-board adjectives instead of checkable rules — reject and re-run step 3 only.

**Follow-ups:**

```
DNA-02 — UPDATE THE DNA AFTER AN APPROVED REVISION
Current DNA: [DESIGN_DNA]
Approved change: [describe the change and cite DEC-ID]
Update only the fields this change affects. Bump VERSION (minor for a rule
tweak, major for a philosophy-level change). List every field touched and why.
Leave all other fields and their STATUS untouched.
```

```
DNA-03 — CHECK A NEW FRAME AGAINST THE DNA
DNA: [DESIGN_DNA]
Frame: [DESIGN]
For every rule with an ACCEPTANCE CRITERION, output: PASS / FAIL / AMBIGUOUS
and one line of evidence. Do not restate rules the frame doesn't touch. End
with a count of FAIL and AMBIGUOUS results.
```

```
DNA-04 — IDENTIFY WHICH RULES A PROPOSED CHANGE AFFECTS
DNA: [DESIGN_DNA]
Proposed change: [describe it]
List every DNA rule this would touch, whether the change is COMPATIBLE or
CONFLICTING with each, and whether any affected rule is APPROVED (meaning this
change needs your re-approval, not just a note).
```

---

## 4. Deliverable 4 — Design Exploration Prompt (`DE-01`)

**Purpose:** Explore three structurally different visual executions of an already-approved concept — different visual mechanisms, not palette swaps.

**Use when:** A concept is approved and a Design DNA may or may not exist yet, and you need real visual-direction options before committing to one styleframe path.

**Don't use when:** The concept itself isn't approved (use Part 3 `CD-01`); you already have a direction and want to refine it (use `SF-01`/`CI-01`).

**Required inputs:** `[APPROVED_CONCEPT]`.
**Optional inputs:** `[PROJECT_CONTEXT]`, `[ART_DIRECTION]`, `[DESIGN_DNA]`, `[REFERENCE_ANALYSIS]`, `[BRAND]`.

```
ROLE: You generate structurally different visual executions of one already-
approved concept. You do not propose a new concept — [APPROVED_CONCEPT] is
fixed. You work within [BRAND] and any LOCKED rules in [ART_DIRECTION] or
[DESIGN_DNA].

INPUTS:
[PROJECT_CONTEXT]
[APPROVED_CONCEPT]
[ART_DIRECTION]      — [N/A] if not yet defined
[DESIGN_DNA]         — [N/A] if not yet built
[REFERENCE_ANALYSIS] — [N/A] if none
[BRAND]              — [N/A] if none

PROCESS:
1. Generate exactly three directions. They must differ in visual structure or
   storytelling approach — not only in color, font, or surface decoration. If
   two directions would only differ in palette, merge them or replace one.
2. You may optionally use these territory labels where they genuinely fit —
   do not force a label onto a direction it doesn't describe: Commercial,
   Contemporary, Experimental, Premium/Minimal, Unexpected.
3. For each direction, output:

   CONCEPT INTERPRETATION:
   VISUAL MECHANISM:
   COMPOSITION:
   TYPOGRAPHY:
   COLOR RELATIONSHIPS:
   SHAPE LANGUAGE:
   IMAGERY:
   TEXTURE:
   MOTION POTENTIAL:
   REFERENCE TERRITORY:
   WHY IT WORKS:
   PRODUCTION COST / COMPLEXITY:
   RISKS:

4. Respect every LOCKED/APPROVED rule in [ART_DIRECTION]/[DESIGN_DNA]/[BRAND].
   If a direction only works by changing one of those rules, say so explicitly
   under RISKS and name the exact rule — do not quietly redefine it.
5. Produce a short comparison table (direction vs. strongest/weakest
   attribute) and stop. Do not pick a winner.

OUTPUT: Three directions in the format above, a comparison table, and an
explicit line: "Awaiting your selection before styleframe development begins."
```

**Expected output:** Three structurally distinct directions plus a comparison table — no selection made.

**Quality check:** Each direction's VISUAL MECHANISM is genuinely different (test: could you tell them apart with color removed?); any proposed rule break is named, not hidden.

**Common failure:** Three directions that are the same layout in three palettes — reject and re-run step 1.

**Follow-ups:**

```
DE-02 — PUSH ONE DIRECTION FURTHER
Selected direction: [paste the chosen direction block]
Develop two variations that stay within the same VISUAL MECHANISM but push it
further in boldness/restraint. Do not reintroduce the other two directions.
```

```
DE-03 — COMBINE ELEMENTS OF TWO DIRECTIONS
Direction A: [paste] / Direction B: [paste]
Propose one hybrid that states exactly which elements come from which
direction, and flag whether the combination creates any internal
contradiction (e.g. two incompatible shape languages).
```

---

## 5. Deliverable 5 — Styleframe Designer Prompt (`SF-01`)

**Purpose:** Turn an approved direction + Design DNA into a single production-usable styleframe specification — a precise written brief for building the frame, not the frame itself.

**Use when:** A direction is selected (`DE-01` + human choice) and a Design DNA exists, and you need a specific frame built out for a beat/script moment.

**Don't use when:** No direction has been selected yet.

**Required inputs:** `[SCRIPT_OR_BEAT]`, `[DESIGN_DNA]`, `[ASPECT_RATIO]`, `[FRAME_PURPOSE]`.
**Optional inputs:** `[BRIEF]`, `[PROJECT_CONTEXT]`, `[REFERENCES]`, `[BRAND]`.

```
ROLE: You write a precise, buildable specification for one styleframe. You do
not invent copy, logos, or props that are not present in [SCRIPT_OR_BEAT] or
[BRIEF]. You do not produce an image — you produce the brief a human would use
to build one in Photoshop, Illustrator, After Effects, or Blender.

INPUTS:
[BRIEF]              — [N/A] if not separately provided
[SCRIPT_OR_BEAT]      — the specific moment this frame represents
[PROJECT_CONTEXT]
[DESIGN_DNA]
[REFERENCES]          — [N/A] if none
[BRAND]               — [N/A] if none
[ASPECT_RATIO]
[FRAME_PURPOSE]       — what this exact frame needs to communicate

PROCESS:
1. Confirm [FRAME_PURPOSE] in one line before specifying anything.
2. If [SCRIPT_OR_BEAT]/[BRIEF] do not specify exact on-screen copy, a logo, or
   a prop, do not invent one — write "[NOT SPECIFIED — confirm before build]."
3. Use approximate normalized positions/proportions (e.g. "subject occupies
   the lower 40% of frame, centered") rather than pixel coordinates, unless a
   pixel-exact grid is part of [DESIGN_DNA].
4. Output exactly this structure:

   FRAME ID:
   COMMUNICATION PURPOSE:
   FOCAL POINT:
   ATTENTION PATH:
   COMPOSITION:
   SUBJECT PLACEMENT:
   FOREGROUND:
   MIDGROUND:
   BACKGROUND:
   NEGATIVE SPACE:
   TYPOGRAPHY:
   EXACT ON-SCREEN COPY:
   GRAPHIC ELEMENTS:
   PALETTE:
   LIGHTING:
   MATERIALS / TEXTURE:
   DEPTH:
   MOTION POTENTIAL:
   LAYER / ASSET NEEDS:
   LOCKED ELEMENTS:
   FLEXIBLE ELEMENTS:
   ACCEPTANCE CRITERIA:

5. State which tool is best suited to build this frame and why, from:
   Photoshop (photographic/textured compositing), Illustrator (flat vector
   shapes/icon-driven), After Effects (if this is effectively frame 1 of a
   composition you'll animate directly), Blender (if camera depth/3D is core
   to [FRAME_PURPOSE]). Note any step that still needs manual judgment (exact
   typesetting, color-managed export, asset sourcing).
6. Cross-check every LOCKED element in [DESIGN_DNA] — flag, don't silently
   resolve, any conflict between [FRAME_PURPOSE] and a locked rule.

OUTPUT: The specification above, the tool recommendation, and any flagged conflicts.
```

**Expected output:** A complete specification document — an editable artifact in text form, not a rendered image.

**Quality check:** No invented copy/logo/prop; every placement uses proportion language, not fabricated pixel precision; ACCEPTANCE CRITERIA are checkable.

**Common failure:** Model fills EXACT ON-SCREEN COPY with placeholder marketing text instead of flagging it unspecified — reject and re-run step 2.

**Claude Design adapter:** Claude Design's canvas can render a rough HTML/CSS approximation of the proportions/composition described above for faster visualization. Treat that render strictly as a **Rendered visual** — never as the Editable artifact or Production handoff for this pipeline. The real styleframe must still be built in Photoshop/Illustrator/After Effects/Blender (or via Part 5's image-generation workflow).

**Follow-ups:**

```
SF-02 — ALTERNATE COMPOSITION
Same frame spec: [paste SF-01 output]
Propose one alternate COMPOSITION/SUBJECT PLACEMENT/ATTENTION PATH that still
satisfies the same COMMUNICATION PURPOSE and respects all LOCKED ELEMENTS.
State the tradeoff versus the original composition.
```

```
SF-03 — ADAPT TO ANOTHER ASPECT RATIO
Frame spec: [paste] / New ratio: [ASPECT_RATIO]
Re-specify COMPOSITION, SUBJECT PLACEMENT, and NEGATIVE SPACE for the new
ratio. State what must be cropped, re-composed, or newly generated (e.g.
extended background) rather than simply resized.
```

```
SF-04 — IMPROVE READABILITY AT PHONE SIZE
Frame spec: [paste]
Re-check TYPOGRAPHY, FOCAL POINT, and CONTRAST for legibility at a ~6-inch
phone screen viewed at arm's length. Flag anything that fails a 3-second
glance test and propose the smallest fix.
```

```
SF-05 — SIMPLIFY FOR ANIMATION
Frame spec: [paste]
Identify any element whose current construction would be difficult to animate
(flattened layers, merged shapes, text baked into an image) and propose how it
should instead be built/separated for motion, without changing the frame's look.
```

---

## 6. Deliverable 6 — Controlled Design Iteration (`CI-01`)

**Purpose:** "Improve this design without changing its core concept" — targeted, smallest-change-first revision.

**Use when:** A design exists, has already been critiqued or has a known problem, and the concept itself is not in question.

**Don't use when:** The concept or direction itself needs to change (go back to `DE-01`/`CD-01`).

**Required inputs:** `[DESIGN]`.
**Optional inputs:** `[PROJECT_CONTEXT]`, `[DESIGN_DNA]`, `[PREVIOUS_CRITIQUE]`, `[LOCKED_ELEMENTS]`.

```
ROLE: You make the smallest set of changes with the largest likely benefit.
You do not redesign the concept. You do not rewrite the whole direction
because of one local failure.

INPUTS:
[DESIGN]
[PROJECT_CONTEXT]
[DESIGN_DNA]           — [N/A] if none
[PREVIOUS_CRITIQUE]    — e.g. DP-01 or DC-01 output. [N/A] if none
[LOCKED_ELEMENTS]      — [N/A] if none specified separately from DESIGN_DNA

PROCESS:
1. First classify the design into four lists:
   LOCKED ELEMENTS — must not change (from DESIGN_DNA/LOCKED_ELEMENTS)
   FLEXIBLE ELEMENTS — open to change
   PROBLEM ELEMENTS — specifically what PREVIOUS_CRITIQUE (or your own
     observation, clearly labeled as such) identified as not working
   WORKING ELEMENTS — demonstrably effective; do not touch without reason
2. Then produce, reusing Part 3 DC-01's summary format:
   KEEP:
   ADJUST:
   REMOVE:
   ADD:
   TEST:
3. Order ADJUST/REMOVE/ADD by smallest-change-to-largest-likely-benefit, not
   by severity alone. For each item state:
   - Problem addressed
   - Exact adjustment
   - Expected effect
   - Possible tradeoff
   - Verification method
4. Do not propose changing more than is needed to resolve the identified
   problems. If the whole piece seems weak, say so explicitly and recommend
   going back to DE-01/CD-01 rather than patching symptom by symptom.

OUTPUT: The four-list classification, then KEEP/ADJUST/REMOVE/ADD/TEST with
the five-point breakdown per change.
```

**Expected output:** A classification plus a minimal, prioritized change list — not a new design.

**Quality check:** Nothing in KEEP/WORKING is touched; every ADJUST/REMOVE/ADD traces to a named problem, not a preference.

**Common failure:** Model treats one flagged problem as license to redesign everything — reject and re-run step 4.

**Follow-up:**

```
CI-02 — REVISION REVIEW
Original issues: [list from CI-01 or PREVIOUS_CRITIQUE]
Revised design: [DESIGN]
For each original issue: RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED, with
evidence. Then: any NEW issue introduced by the revision? State a net
assessment — is the revision better overall, even if imperfect?
```

---

## 7. Deliverable 7 — Motion-Readiness Review (`MR-01`)

**Purpose:** Translate a static styleframe into motion logic before it reaches After Effects — what moves, in what order, and what needs to be rebuilt to survive motion.

**Use when:** A styleframe (from `SF-01` or an actual file) is close to final and the next step is animation planning.

**Don't use when:** The frame itself is still unresolved (use `DP-01`/`CI-01` first).

**Required inputs:** `[DESIGN]` (the frame).
**Optional inputs:** `[DESIGN_DNA]`, `[ART_DIRECTION]`, `[REFERENCE_ANALYSIS]`, `[FRAME_PURPOSE]`.

```
ROLE: You propose motion logic for a static frame. Every motion idea here is a
PROPOSAL pending human approval and an actual After Effects build — never
state that something has been animated. If [REFERENCE_ANALYSIS] describes
motion seen in a reference, label it "observed in reference," separate from
your own "proposed" motion for this frame.

INPUTS:
[DESIGN]
[DESIGN_DNA]           — [N/A] if none
[ART_DIRECTION]        — [N/A] if none
[REFERENCE_ANALYSIS]   — [N/A] if none
[FRAME_PURPOSE]

PROCESS:
Evaluate the frame against:
- What should enter and exit?
- What can reveal or transform?
- What can become a transition?
- What should stay anchored?
- What establishes hierarchy?
- What moves first and last?
- Where can anticipation help?
- Where can secondary motion help?
- How does visual rhythm suggest timing?
- What must be separated, extended, or rebuilt to animate at all?

OUTPUT TABLE (one row per element/layer that matters to motion):
ELEMENT / LAYER | COMMUNICATION ROLE | PROPOSED MOTION | TRIGGER / ORDER |
ANCHOR OR PIVOT | DEPENDENCIES | ASSET PREPARATION | RISK

Then separately identify:
- Occluded areas that would need reconstruction if revealed
- Insufficient background coverage for any proposed move
- Raster-vs-vector limitations (e.g. a flattened raster that needs vector
  rebuild to scale/rotate cleanly)
- Text that should remain live/editable rather than baked into a layer
- Cropping or rotation risk for any proposed move
- Any proposed motion that would weaken readability (reject it here, don't
  list it in the table as if approved)

HANDOFF FOR PART 7 (AFTER EFFECTS BUILD PLANNING):
FRAME ID:
KEY PROPOSED MOTIONS:
ASSET PREP NEEDED BEFORE BUILD:
OPEN RISKS:
Do not generate expressions, scripts, or keyframe values here — that belongs
to Part 7 unless explicitly requested.
```

**Expected output:** The motion-logic table, the risk/limitation list, and a short Part 7 handoff block.

**Quality check:** Every proposed motion names a dependency or asset-prep need if one exists; nothing is stated as already animated; reference-observed motion is clearly separated from this frame's own proposal.

**Common failure:** Reviewer proposes a sweeping camera move on a flat single-layer raster without flagging the rebuild needed — reject and re-run the raster/vector check.

**Follow-up:**

```
MR-02 — RE-CHECK AFTER ASSET PREPARATION
Original review: [paste MR-01 output]
Updated frame/assets: [DESIGN]
State which flagged ASSET PREPARATION items are now resolved, which remain,
and whether any proposed motion should change given the new asset structure.
```

---

## 8. Deliverable 8 — Design Mentor Prompt (`DM`)

**Purpose:** Build the ability to diagnose and fix design problems independently, not just receive fixes.

**Shared process (all three modes):**
1. Identify one consequential issue (not an exhaustive list).
2. Ask for the user's interpretation when useful.
3. Explain the relevant principle.
4. Give one small experiment.
5. Let the user attempt the revision.
6. Review the result against the principle — not a fresh full critique.

**Required inputs:** `[DESIGN]`.
**Optional inputs:** `[CURRENT_TASK]`, a stated skill level/comfort rating.

### `DM-01` Guided Review Mode (default)

```
ROLE: You are a design mentor, not an autograder. Walk through one design
issue step by step with me. Do not reveal a full redesign unless I ask for a
demonstration.

INPUT: [DESIGN]  CONTEXT: [CURRENT_TASK] ([UNKNOWN] if not given)

PROCESS:
1. Pick the single most consequential issue in [DESIGN] — not a list.
2. Ask: "What do you think is happening here, and why?" Wait for my answer
   before explaining anything, unless I say "just tell me."
3. Explain the relevant design principle in plain terms, tied to what I said.
4. Give me one small, concrete experiment to try (not the full fix).
5. Stop and wait for me to attempt it.
6. When I return with an attempt, review it specifically against the
   principle from step 3 — confirm what's correctly applied, name what isn't,
   and stop there unless I ask to go further.

If I'm clearly unfamiliar with the principle, explain more plainly; if I show
fluency, skip ahead — don't lecture on fundamentals I've already demonstrated.
```

### `DM-02` Independent Attempt Mode

```
ROLE: Same mentor role as DM-01, but after step 4 you do not continue the
conversation — you state the issue, the principle, and the one experiment,
then stop completely and wait. Do not check in, do not hint further, until I
return with my attempt.

INPUT: [DESIGN]  CONTEXT: [CURRENT_TASK]

OUTPUT (then stop):
ISSUE:
PRINCIPLE:
EXPERIMENT TO TRY:
"Attempt this on your own, then come back with the result."
```

### `DM-03` Revision Feedback Mode

```
ROLE: Review my attempted revision against the specific principle you taught
me — not a fresh, full critique of the whole piece.

INPUT:
Original issue + principle taught: [paste from DM-01/DM-02]
My revision: [DESIGN]

OUTPUT:
PRINCIPLE APPLIED CORRECTLY?  [yes / partially / no — with evidence]
WHAT STILL NEEDS WORK, if anything, specific to this principle only.
ONE refinement, if needed — not a new list of unrelated issues.
"Do you want to try refining this further, or should I show a full demonstration?"
```

**Expected output:** A short, interactive exchange — never a complete redesign delivered up front.

**Quality check:** You can restate the principle in your own words and name one other design where it applies, without being shown the answer first.

**Common failure:** Mentor jumps straight to showing the fixed version — reject and restart at step 2/4.

---

## 9. Deliverable 9 — Practice Generator (`PG-01`)

**Purpose:** Progressively harder, self-contained exercises across composition, hierarchy, typography, color, spacing, visual storytelling, styleframes, motion-ready layouts, and art direction.

**Required inputs:** a skill area from the list above.
**Optional inputs:** a stated difficulty level or time budget.

```
ROLE: You generate one practice exercise at a time, feasible for a single
motion designer working alone, with no team or client involved. Increase
decision complexity across exercises, not sheer workload (bigger decisions to
make, not just more elements to place).

INPUT: Skill area: [composition | hierarchy | typography | color | spacing |
visual storytelling | styleframes | motion-ready layouts | art direction]
Optional: stated level or time budget.

OUTPUT, every exercise:
BRIEF:
CONSTRAINT:
TIME LIMIT:
DELIVERABLE:
DESIGN PRINCIPLE:
SUCCESS CRITERIA:
SELF-CRITIQUE QUESTIONS:
REVIEW METHOD:            [e.g. "run it through DP-01," "compare to a named reference"]
```

**Sample exercises:**

```
SAMPLE 1 — BEGINNER DIAGNOSTIC
BRIEF: Take any single static image (a photo, a screenshot, a found design)
and identify its focal point without changing anything.
CONSTRAINT: No editing tools — observation only.
TIME LIMIT: 10 minutes.
DELIVERABLE: A one-paragraph written explanation of what draws the eye first,
second, and third, and why.
DESIGN PRINCIPLE: Visual hierarchy through contrast, scale, and placement.
SUCCESS CRITERIA: You can name the specific contrast/scale/placement cue that
creates each ranking — not just "it stands out."
SELF-CRITIQUE QUESTIONS: Would a stranger agree with your ranking in 3 seconds?
What single element, if removed, would most change the order?
REVIEW METHOD: Run your explanation through DP-01 focused only on hierarchy
(DP-02) and compare.
```

```
SAMPLE 2 — INTERMEDIATE STYLEFRAME
BRIEF: Design one styleframe for a 3-second "key benefit" beat of a fictional
product explainer, using a Design DNA you define for yourself first (3–4 rules
only).
CONSTRAINT: Exactly one focal subject, no more than 2 type sizes, no more than
3 colors.
TIME LIMIT: 90 minutes.
DELIVERABLE: An `SF-01`-format specification plus a built frame in Illustrator
or Photoshop.
DESIGN PRINCIPLE: Hierarchy and restraint — communicating one idea clearly
under tight constraints.
SUCCESS CRITERIA: A viewer can state the key benefit from the frame alone
within 3 seconds, with no caption.
SELF-CRITIQUE QUESTIONS: Does every element earn its place against the 3-color/
2-size constraint? What would you remove if forced to cut one more thing?
REVIEW METHOD: Self-review with DP-01, then MR-01 to check it survives motion.
```

```
SAMPLE 3 — ADVANCED VISUAL-SYSTEM
BRIEF: Define a full Design DNA (DNA-00) for a fictional 3-frame mini-sequence
(not just one frame) that must hold together as a system while each frame
serves a different communication purpose.
CONSTRAINT: At least one rule must be tested by deliberately building a frame
that nearly breaks it, then adjusting until it passes.
TIME LIMIT: 3–4 hours across multiple sessions.
DELIVERABLE: DNA-00 document + 3 SF-01 specifications + 3 built frames +
one MR-01 motion-readiness pass across all three.
DESIGN PRINCIPLE: Systemic consistency under varying content demands.
SUCCESS CRITERIA: All three frames are identifiably the same system without
being visually identical; each DNA rule has at least one frame that tests it
near its boundary.
SELF-CRITIQUE QUESTIONS: Which rule was hardest to keep consistent, and why?
Did any rule turn out to be too vague to actually enforce?
REVIEW METHOD: DNA-03 (check each frame against the DNA) for all three, then
DP-01 for cross-frame rhythm/consistency.
```

---

## 10. Deliverable 10 — Compact Commands

### 10.1 Compact commands

These are library shorthand for pasting the matching prompt from this document — not built-in application commands, unless you've configured them as custom commands/snippets in a specific tool.

| Command | Maps to | QUICK | PRO | DEEP |
|---|---|---|---|---|
| `/claude-design` | Section 1 capability notes + fallback decision | Confirm fallback-vs-canvas choice for this task | Full capability table review before a client-facing deliverable | Re-verify against current docs if months have passed |
| `/design-dna` | `DNA-01` | Draft DNA from CD-01+AD-01 only | Add RA-01 Reference Role Map as input | Full conflict-resolution pass across multiple references |
| `/design-explore` | `DE-01` | Generate 3 directions from a stable concept | Add territory labels + reference grounding | Full comparison table + risk analysis per direction |
| `/styleframe` | `SF-01` | One frame, fast spec, approximate proportions | Add tool-build guidance + locked-rule cross-check | Add alternate composition (SF-02) side by side |
| `/improve-design` | `CI-01` | Quick KEEP/ADJUST/REMOVE pass | Full 4-list classification + 5-point breakdown | Add CI-02 revision review after the fix is built |
| `/motion-ready` | `MR-01` | Table only, top 5 elements | Full table + limitations list | Add Part 7 handoff block, pre-build asset audit |
| `/design-mentor` | `DM-01/02/03` | One issue, one experiment | Full 6-step guided cycle | Independent-attempt mode across a full project phase |
| `/design-exercise` | `PG-01` | One sample exercise at your stated level | Progressive set of 3 exercises | Full skill-area curriculum across all 9 areas |
| `/visual-consistency` | `DNA-03` | Spot-check one frame | Check a full sequence against the DNA | Check sequence + flag DNA rules that proved too vague |

---

# AI Creative Operating System — Part 5: Image-Generation Prompts and Reference Control

**Builds on:** Part 1 (routing method), Part 2 (`STD-00` standard, variables, IDs), Part 3 (`AD-01` rules, `RA-01` Reference Role Map), Part 4 (`DNA-00` Design DNA, `SF-01` styleframe specs). This part translates those into model-specific image-generation workflows. **This builds the library, not images** — no generation is executed unless explicitly requested.

**New domain codes** (under `/Library/05_Image-Generation/`): `IMG` (shared spec), `ADP-[MODEL]` (adapters), `IP` (core prompt library, 12 entries), `REF` (reference controller), `CC`/`PC` (character/product consistency), `EDIT` (controlled editing), `IGC` (image generation critic).

**Research method note:** every capability claim below was checked against the cited official source during this session (verification date **2026-10-06**, matching today's date). Everything else is explicitly marked as a secondary/aggregator claim. Model version numbers move quickly — re-verify before relying on an exact parameter name, count, or resolution figure in production.

---

## 2. Deliverable 2 — Shared Image Specification (`IMG-00`)

```
IMAGE ID:                 [required]
PURPOSE:                  [required]
SUBJECT:                  [required]
ACTION / POSE:            [required if a figure/character is present, else N/A]
ENVIRONMENT:              [required unless isolated-asset/transparent background]
COMPOSITION:              [required]
FRAMING / VIEWPOINT:      [required]
LIGHTING:                 [optional — inherited from DESIGN_DNA if one exists]
COLOR:                    [optional — inherited from DESIGN_DNA if one exists]
MATERIALS / TEXTURE:      [optional — inherited from DESIGN_DNA/ART_DIRECTION]
STYLE:                    [optional — inherited from DESIGN_DNA/ART_DIRECTION]
EXACT TEXT, IF ANY:       [optional — N/A unless script/brief specifies it; never invented]
REFERENCE ROLES:          [optional — inherited from REF-01's Reference Role Map]
MUST PRESERVE:            [required if any reference/locked rule applies, else N/A]
MAY CHANGE:               [optional]
FORBIDDEN CHANGES:        [required if any locked rule applies, else N/A]
ASPECT RATIO:             [required]
OUTPUT NEEDS:             [required — file type, resolution, background transparency, etc.]
ACCEPTANCE CRITERIA:      [required]
```

**Camera/lens language — when it helps vs. when it's unsupported precision:**
- Helps for photoreal lifestyle, product hero, fashion editorial, storyboard-as-live-action: terms like "eye-level," "shallow depth of field," "wide-angle" describe a *visible result* these models were trained on real photography to reproduce.
- Adds false precision for flat 2D illustration, vector icons, motion-design styleframes, textures: there's no literal camera or lens, so "50mm f/1.8" is meaningless there. Use composition/shape/hierarchy language instead — "centered, foreground/midground/background layering, flat two-dimensional perspective, generous negative space."

---

## 3. Deliverable 3 — Model-Specific Adapters

Each labeled **MODEL-SPECIFIC — VERIFY PERIODICALLY**. Each translates `IMG-00` into that model's actual supported format; none invents a parameter not confirmed in Section 1's sources.

### `ADP-OAI-01` — GPT Image 2.5 (OpenAI)

- **Use when:** multi-reference compositing, transparent-background assets, instruction-driven edits, programmatic/batch production.
- **Required inputs:** `IMG-00`; reference image(s) if compositing; a mask file if a precise edit region is needed.
- **Recommended prompt structure:** one natural-language paragraph combining `SUBJECT/ACTION/ENVIRONMENT/COMPOSITION/LIGHTING/COLOR/STYLE` — no flag syntax.
- **Reference strategy:** attach each reference as a separate `input_image`; assign roles in the prompt text itself (e.g. "using the exact product shape from the first image, in the setting shown in the second image").
- **Interface settings (not prompt text):** model (`gpt-image-2.5-sunburst` for precision edits, `-flare` for speed), `size`, `background: transparent` (PNG/WebP only), `quality` (xhigh/max), mask file for `/edits`.
- **Editing approach:** `/v1/images/edits` with base image (+ optional mask). No mask = model infers the edit region from your instruction — less reliable than a mask for a hard boundary.
- **Unsupported/unreliable:** no confirmed seed-lock parameter; no confirmed reference-strength slider; no vector/SVG output.
- **Common failure:** requesting a transparent background with `jpeg` output — unsupported; use PNG/WebP.
- **Follow-up:** re-run through `/edits` with a drawn mask covering only the region to change, keeping everything else pixel-identical.
- **Sources:** [1](https://developers.openai.com/api/docs/guides/image-generation), [2](https://platform.openai.com/docs/guides/tools-image-generation) — 2026-10-06.

```
TEMPLATE — ADP-OAI-01
Prompt: [one-paragraph natural-language prompt built from IMG-00]
Reference images attached: [list, with role of each stated in the prompt text]
Model: gpt-image-2.5-sunburst (precision) | gpt-image-2.5-flare (speed)
Settings: size=[ASPECT RATIO], background=[transparent|opaque], quality=[standard|xhigh|max]
Mask: [attached file, region description] or [none — model infers edit region]
```

### `ADP-GGL-01` — Nano Banana Pro / Nano Banana 2 (Google)

- **Use when:** conversational no-mask editing, multi-image style fusion, maintaining character/style consistency turn-to-turn.
- **Required inputs:** `IMG-00`; reference image(s) if fusing/editing.
- **Recommended prompt structure:** short conversational instructions; can iterate turn-by-turn rather than one long paragraph.
- **Reference strategy:** attach images in the same turn; state each one's role in plain words — no confirmed dedicated role-tagging UI in the consumer app.
- **Interface settings:** aspect ratio and resolution (1K/2K/4K) are clearer in AI Studio/API than in the consumer Gemini app — verify what's exposed before assuming 4K export is available to you.
- **Editing approach:** describe the change in words; no manual mask tool in the consumer app (this is the key difference from GPT Image/FLUX Fill).
- **Unsupported/unreliable:** exact max reference-image count (an aggregator cites 14) is not confirmed on Google's own docs in this check — don't rely on a specific number without re-verifying; every output carries a non-removable SynthID watermark — disclose this to clients if relevant.
- **Common failure:** assuming the consumer app exposes the same resolution/aspect controls as the API — check the specific surface you're using.
- **Follow-up:** "Keep everything the same, only change [X]" — relies on the model's own interpretation, not an enforced boundary; verify the result, don't assume compliance.
- **Sources:** [3](https://cloud.google.com/blog/products/ai-machine-learning/gemini-2-5-flash-image-on-vertex-ai) (official), [4](https://replicate.com/google/nano-banana-2) (aggregator — flagged) — 2026-10-06.

```
TEMPLATE — ADP-GGL-01
Turn 1 — "Generate [SUBJECT] in [ENVIRONMENT], [COMPOSITION], [STYLE/COLOR/LIGHTING from DESIGN_DNA]. [ASPECT RATIO]."
Attached references: [list + stated role in the instruction text]
Turn 2+ (iterative edit) — "Now [EDIT_REQUEST], keep everything else the same."
Surface: Gemini app | AI Studio | API/Vertex (note which — settings differ)
```

### `ADP-MJ-01` — Midjourney V8.2 + Edit Model

- **Use when:** strongest default aesthetic, fast exploration, up to 4-image reference composition.
- **Required inputs:** `IMG-00`; up to 4 reference images for the Edit Model.
- **Recommended prompt structure:** classic descriptive prompt + trailing `--` parameters for generation; short imperative instructions for the Edit Model ("make this a real character," "show this from behind").
- **Reference strategy:** attach up to 4 images directly to the Edit Model — **do not use `--oref`/`--cref` on V8.2**, those are V7-only and unsupported on V8.X per the official compatibility chart.
- **Interface settings (not prompt text):** version (`--v 8.2` or UI dropdown), `--ar`, `--stylize`, `--raw` (reduce default styling), `--hd` (higher-res, 1.3× GPU cost), Personalization profile toggle.
- **Editing approach:** web **Editor** for brush inpainting/outpainting (now on the Edit Model backbone); Discord: `--edit` + image URL(s).
- **Unsupported/unreliable:** Edit Model output is **not compatible with Remix**; `--tile` not currently compatible with the Edit Model; no confirmed official API — treat any third-party "Midjourney API" as unofficial.
- **Common failure:** pasting old `--oref`/`--cw` syntax into a V8.2 prompt expecting it to still work.
- **Follow-up:** re-open the result in the Editor, mask only the region to change, re-run through the Edit Model.
- **Sources:** [5](https://docs.midjourney.com/hc/en-us/articles/48495453462797-Edit-Model), [6](https://docs.midjourney.com/hc/en-us/articles/32199405667853-Version) (official) — 2026-10-06.

```
TEMPLATE — ADP-MJ-01
Prompt: [descriptive prompt from IMG-00] --ar [ratio] --stylize [0-1000] --raw (optional) --hd (optional)
Edit Model reference images (up to 4): [list + role of each]
Edit Model instruction (if editing): "[imperative instruction, e.g. 'change the background to X, keep the subject exactly as shown']"
Version: V8.2 (default) — confirm before use if a V7-only feature (Omni Reference) is genuinely required
```

### `ADP-BFL-01` — FLUX.2 / FLUX.1 Kontext (Black Forest Labs)

- **Use when:** structural conditioning (Canny/Depth) for geometry lock, masked in/outpainting (Fill), composition-preserving variation (Redux), strong photorealism, or open-weight self-hosting is required.
- **Required inputs:** `IMG-00`; a structural control image (edge/depth map) if geometry lock is the goal — a plain photo reference is **not** equivalent to this.
- **Recommended prompt structure:** descriptive prompt; Kontext/FLUX.2 also accept "change X, keep Y" instruction phrasing.
- **Reference strategy:** FLUX.2 — up to 10 reference images in one call; Kontext — context-aware multi-reference editing; Canny/Depth/Redux are distinct specialized variants, not settings on the base model.
- **Interface settings:** model (pro/max/dev/schnell/Fill/Canny/Depth/Redux), steps, guidance scale, aspect ratio, seed (confirmed supported for Kontext-dev).
- **Editing approach:** Kontext/FLUX.2 for general instruction edits; FLUX.1 Fill [dev] for masked in/outpainting; Canny/Depth [dev] for structure-locked regeneration.
- **Unsupported/unreliable:** [dev] open-weight models are non-commercial licensed — commercial use needs separate licensing from BFL.
- **Common failure:** using a plain style reference when a Canny/Depth control map was actually needed for geometry — results drift because a photo only nudges style, not structure.
- **Follow-up:** re-run with the previous output's edge/depth map as the new structural control to lock geometry across a revision.
- **Sources:** [7](https://docs.bfl.ai/kontext/kontext_overview), [8](https://github.com/black-forest-labs/flux) (official) — 2026-10-06.

```
TEMPLATE — ADP-BFL-01
Model: FLUX.2 | FLUX.1 Kontext [pro/max/dev] | FLUX.1 Fill [dev] | FLUX.1 Canny/Depth [dev]
Prompt: [descriptive or instruction prompt from IMG-00]
Reference image(s): [up to 10 for FLUX.2 / multi-ref for Kontext] — role of each stated
Structural control image (Canny/Depth, if used): [attached, describe what it locks]
Settings: steps=[n], guidance=[n], aspect ratio=[ratio], seed=[n or none]
```

### `ADP-IDG-01` — Ideogram 3.0

- **Use when:** on-screen text accuracy is the priority, or Style References/Character Consistency/Magic Fill/Extend/Reframe/Replace Background are needed.
- **Required inputs:** `IMG-00` with `EXACT TEXT` filled in precisely (quoted) if text is required.
- **Recommended prompt structure:** literal, explicit descriptions; quote exact text strings; describe font style descriptively rather than naming a brand font.
- **Reference strategy:** Style References (up to 3 images — palette/composition/feel) and Character Consistency (1 image — identity) are separate features; use the one that matches your actual goal.
- **Interface settings:** Style type (REALISTIC/GENERAL/DESIGN/AUTO), Magic Prompt (AUTO/ON/OFF — turn OFF for literal control), Batch Generation (up to 4/request via API).
- **Editing approach:** Magic Fill (inpaint), Extend (outpaint), Reframe (aspect-ratio conversion via generative fill), Replace Background.
- **Unsupported/unreliable:** named commercial fonts are unreliable; non-English/complex-script text is noticeably weaker than English.
- **Common failure:** expecting perfect spelling in one pass on a longer phrase — budget for 2–4 regenerations and verify spelling before production use, every time.
- **Follow-up:** Reframe to a new aspect ratio while keeping Style Reference and exact text locked.
- **Sources:** [9](https://ideogram.ai/models/3.0/) (official) — 2026-10-06.

```
TEMPLATE — ADP-IDG-01
Prompt: [literal descriptive prompt], text reading "[EXACT TEXT]" in [descriptive font style], [positioning cue]
Style Reference(s) (up to 3): [attached, role: palette/composition/feel]
Character Reference (if used, 1 image): [attached, role: identity lock]
Settings: Style type=[REALISTIC/GENERAL/DESIGN/AUTO], Magic Prompt=[AUTO/ON/OFF]
```

### `ADP-RCF-01` — Recraft V4.1

- **Use when:** the deliverable itself must be an editable vector (icon, logo concept, flat illustration), or brand-consistent batch output is needed.
- **Required inputs:** `IMG-00`; a Brand Kit if consistency across many assets is the goal.
- **Recommended prompt structure:** descriptive prompt + explicit style-system keyword ("flat vector," "line illustration," "isometric") — this changes output structure more than adjectives do.
- **Reference strategy:** Brand Kit (session-level palette/style/identity) + style training on reference images — not a single per-image reference call.
- **Interface settings:** model variant (raster vs. vector, standard vs. Pro resolution), output format (SVG/PNG/JPG).
- **Editing approach:** image-to-image/inpainting/background-removal/vectorization are separate operations from base generation.
- **Unsupported/unreliable:** vector variant is weak on photoreal/organic/complex imagery — don't default to it for a painterly or photoreal brief.
- **Common failure:** treating a generated SVG logo as finished — it needs human refinement in Illustrator before production use.
- **Follow-up:** regenerate the same brief using the Brand Kit explicitly attached, to check consistency against earlier assets.
- **Sources:** [10](https://www.recraft.ai/) (official) — 2026-10-06.

```
TEMPLATE — ADP-RCF-01
Prompt: [descriptive prompt from IMG-00], style: [flat vector | line illustration | isometric | photographic]
Brand Kit: [attached/active — palette, style, identity] or [none]
Output: SVG (vector) | PNG/JPG (raster), resolution tier: [standard | Pro]
```

### `ADP-ADB-01` — Adobe Firefly (Image Model 5 + in-app tools)

- **Use when:** extending/filling inside an already-real Photoshop composition, matching a reference's color grade via Generative Match, or commercially-safe generation specifically matters.
- **Required inputs:** `IMG-00`; the base Photoshop file for Fill/Expand; one reference image for Generative Match.
- **Recommended prompt structure:** plain descriptive prompt for Text-to-Image; short instruction for what to add/extend for Fill/Expand.
- **Reference strategy:** Generative Match = 1 reference image, style/color/technique only — it does **not** lock subject identity or geometry.
- **Interface settings:** Style Strength slider (Match), aesthetic filters/presets (Text to Image), model picker (Adobe's own vs. a partner model hosted inside Firefly).
- **Editing approach:** Generative Fill (selection-based, native in Photoshop, lands as a new layer) and Generative Expand (canvas extension).
- **Unsupported/unreliable:** "commercially-safe training" applies to Adobe's own Firefly models only — verify separately for any partner model selected inside Firefly.
- **Common failure:** using a partner model inside Firefly and assuming Adobe's safety/licensing guarantee automatically carries over.
- **Follow-up:** re-run Generative Fill on a smaller, more precisely drawn selection if the first pass altered more of the image than intended.
- **Sources:** [11](https://blog.adobe.com/en/publish/2026/03/19/adobe-firefly-expands-video-image-creation-with-new-ai-capabilities-custom-models), [12](https://www.adobe.com/products/firefly/features/generative-match.html) (official) — 2026-10-06.

```
TEMPLATE — ADP-ADB-01
Mode: Text-to-Image | Generative Fill (selection) | Generative Expand (canvas) | Generative Match (style)
Prompt/instruction: [from IMG-00 or EDIT_REQUEST]
Reference image (Generative Match only): [attached — style/color/technique only, not identity]
Model: Firefly Image Model 5 (own) | [named partner model] — note license/safety status if partner model
```

---

## 4. Deliverable 4 — Core Image Prompt Library (`IP-01`–`IP-12`)

**Shared mechanics (apply to all 12, not restated per entry):**

```
ROLE: You compile a ready-to-use image-generation prompt from approved project
inputs. You do not invent subjects, props, people, or on-screen text not present
in the inputs. You inherit [DESIGN_DNA] and reference roles from the Reference
Role Map (REF-01) rather than re-deciding style from scratch.

SHARED INPUTS: [PROJECT_CONTEXT], [DESIGN_DNA] — optional unless the entry below
marks them required. Each entry adds its own specific required inputs.

SHARED PROCESS: Fill IMG-00 for this image. Then output (a) the filled IMG-00,
and (b) one natural-language prompt paragraph ready to adapt into a chosen
model's format using Section 3's adapters, and (c) a one-line routing
suggestion citing Section 1's table (which model fits this task best and why).

SHARED OUTPUT: filled IMG-00 + ready-to-adapt prompt paragraph + routing suggestion.
SHARED QUALITY CHECK: no invented subject/prop/text; every MUST PRESERVE item
traces to DESIGN_DNA or a locked reference role; STYLE/COLOR match DESIGN_DNA
where one exists.
SHARED COMMON FAILURE: filling EXACT TEXT or props with plausible invented
content instead of marking [NOT SPECIFIED — confirm before generation].
```

### `IP-01` Motion-design styleframe
**Purpose:** Compile a prompt for a single frame meant to become an animated asset. **Use when:** an `SF-01` specification exists. **Don't use when:** no styleframe spec exists yet (build `SF-01` first). **Required inputs:** `SF-01` output. **Delta from shared process:** explicitly state in the output whether the expected result is a **flattened visual**, a **cutout on transparent background**, or (Recraft only) a **vector** — never claim layer separation no model here produces; if true layers are needed, say so and route to manual rebuild or `IP-10` per-element generation instead. **Acceptance check:** output type is honestly labeled against what was actually requested. **Common failure:** assuming the generated frame arrives pre-separated into animatable layers. **Follow-up:** "Regenerate [ELEMENT] alone, isolated on a plain/transparent background, for manual compositing."

### `IP-02` Flat 2D illustration
**Purpose:** A standalone flat illustration (not a specific production frame). **Use when:** exploring illustration style or producing a single asset (blog/social/explainer still). **Required inputs:** `SUBJECT`, `PURPOSE`. **Delta:** favor composition/shape/hierarchy language over camera terms (see Section 2); route by default to Recraft (vector-capable) or Ideogram/GPT Image (raster) depending on whether an editable vector is actually needed. **Acceptance check:** style matches `DESIGN_DNA`'s shape-language rules if one exists. **Common failure:** camera/lens terms leaking into a flat-illustration prompt, producing unwanted depth-of-field artifacts. **Follow-up:** "Simplify to no more than [N] colors and [N] shape types."

### `IP-03` Character design / neutral pose
**Purpose:** Establish a character's base appearance in a neutral reference pose, for later use as an identity reference. **Use when:** no approved master character asset exists yet. **Required inputs:** character description (features, proportions, wardrobe, palette) — from `BRIEF`/`PROJECT_CONTEXT`, not invented. **Delta:** explicitly request a plain, neutral background, front-facing or 3/4 view, even lighting (minimizes shadow-driven misreading when this becomes a reference later); output feeds directly into `CC-01`. **Acceptance check:** pose is genuinely neutral (no acting/expression bias that would wrongly anchor future variations). **Common failure:** the "neutral pose" output already carries a specific expression/gesture the model defaulted to, which then unintentionally becomes the locked identity. **Follow-up:** "Generate the same character from the side and from behind, same lighting and background."

### `IP-04` Character pose or view variation
**Purpose:** Generate a new pose/view of an **already-approved** character. **Use when:** a master identity reference (from `IP-03`, human-approved) exists. **Required inputs:** the master reference image; the new pose/view description. **Delta:** this is a `REF-01`-governed task — identity reference role = Identity (preserve), everything else = flexible; route through `CC-01` step 3–5 (generate, compare to master, classify) rather than treating it as a one-off. **Acceptance check:** run `CC-01`'s drift check before accepting. **Common failure:** treating a successful single pose change as proof the character is "locked" — one success doesn't confirm consistency across a full shot list. **Follow-up:** "Diagnose which feature drifted" (see `REF-01` follow-ups).

### `IP-05` Product hero image
**Purpose:** A clean, presentation-ready image of the real product. **Use when:** exact product geometry/branding matters (most product work). **Required inputs:** real product reference photo(s) — product geometry must come from a real reference, never invented from a text description alone. **Delta:** `REF-01` role = Product geometry (preserve exactly) + Identity of labels/logos (preserve exactly); route to GPT Image/FLUX.2 (strong multi-reference compositing) or Firefly Generative Match (style/background only, not geometry). **Acceptance check:** run `PC-01` before approving. **Common failure:** label text or logo subtly re-rendered/misspelled — always verify at full resolution. **Follow-up:** "Replace only the environment, keep the product pixels as close to the reference as the model allows" (links to `EDIT-01`).

### `IP-06` Photoreal lifestyle image
**Purpose:** A photoreal scene with a person/product in a real-world context. **Use when:** the deliverable needs to read as photography. **Required inputs:** `ENVIRONMENT`, `SUBJECT`. **Delta:** camera/lens language is appropriate here (Section 2); if a real person's likeness or a real product is involved, treat `REF-01` Identity/Product geometry roles as preserve-exactly and flag any likeness/rights concern for human review before use. **Acceptance check:** lighting/shadow direction is physically consistent across all elements. **Common failure:** composited-feeling mismatched lighting between subject and environment. **Follow-up:** "Regenerate only the lighting direction to match [reference]."

### `IP-07` Fashion editorial image
**Purpose:** A styled, editorial-feeling image (wardrobe/mood-led, not product-catalog). **Use when:** tone and styling matter more than literal product accuracy. **Required inputs:** `STYLE`/mood references. **Delta:** this is the one category where `STYLE`/`COLOR`/`LIGHTING` references may legitimately outrank the written brief in priority — say so explicitly in `REF-01`'s PRIORITY column. **Acceptance check:** confirm wardrobe/garment details weren't fabricated beyond what references/brief specify. **Common failure:** garment details (patterns, logos) invented beyond what was actually specified. **Follow-up:** "Keep the styling, change only the model's pose."

### `IP-08` Storyboard frame
**Purpose:** A single story-beat frame for a storyboard, prioritizing clarity of action over polish. **Use when:** planning a sequence, not finalizing a styleframe. **Required inputs:** `SCRIPT_OR_BEAT`. **Delta:** explicitly request lower rendering fidelity / sketch-level clarity over photoreal polish — storyboard frames should be fast and legible, not production-finished; route to whichever model is fastest/cheapest for the house style (often Midjourney Draft-adjacent speed or GPT Image Flare). **Acceptance check:** the action/beat is legible in under 2 seconds of viewing. **Common failure:** over-investing in a highly polished storyboard frame that then anchors expectations the final asset can't match on schedule. **Follow-up:** "Generate the next beat in the same sketch style, same character scale."

### `IP-09` Background / environment
**Purpose:** An environment plate, often meant to hold a separately generated/composited subject. **Use when:** subject and background will be composited separately (common for motion work needing a clean separation). **Required inputs:** `ENVIRONMENT`, `ASPECT_RATIO`. **Delta:** explicitly request "no subject/figure present, environment only" and enough coverage/negative space for later compositing and motion (camera moves need more plate than the final crop). **Acceptance check:** confirm no accidental figure/object appeared that would need removing before compositing. **Common failure:** insufficient plate coverage for a planned camera move — flagged forward to `MR-01` (Part 4) at the compositing stage. **Follow-up:** "Extend this plate [direction] for a push-in/pan move" (via Extend/Generative Expand).

### `IP-10` Texture or isolated asset
**Purpose:** A single element (texture, icon, isolated object) on a plain or transparent background, for manual compositing. **Use when:** you need a reusable piece, not a composed scene. **Required inputs:** the specific element description. **Delta:** always specify background treatment explicitly (plain color / transparent PNG / white) since this determines whether the asset is actually usable for compositing; this is the standard route for recovering "layer separation" a single generated scene can't provide. **Acceptance check:** edges are clean enough for compositing at the needed scale — check at 100% zoom, not thumbnail. **Common failure:** accepting a texture/asset with visible generation artifacts at the edge that only show up at full production resolution. **Follow-up:** "Generate 3 more variations of this same element, same style, for variety in repeated use."

### `IP-11` Thumbnail / social advertising visual
**Purpose:** A high-impact, fast-read visual for a thumbnail or ad placement. **Use when:** the deliverable must work at small size and in a feed, competing for attention. **Required inputs:** `FRAME_PURPOSE` (the one message it must deliver), `ASPECT_RATIO` for the target platform. **Delta:** explicitly test-criterion is legibility/impact at small size (see `SF-04`-style phone check from Part 4); if exact on-screen text/numbers matter, route to Ideogram first. **Acceptance check:** the core message reads within 1–2 seconds at thumbnail scale. **Common failure:** a visually impressive image that fails to communicate anything at actual feed size. **Follow-up:** "Increase contrast between subject and background specifically for small-size legibility" (justified instance of a contrast change, unlike `DP-01`'s default caution against it).

### `IP-12` Existing-image edit
**Purpose:** The entry point into controlled editing of a real file. **Use when:** you have a real base image and a specific, bounded change to make. **Required inputs:** base image, edit request. **Delta:** this entry hands off directly to `EDIT-01` (Deliverable 7) rather than duplicating its process here — use `EDIT-01`'s full prompt for anything beyond a first-pass description of the change.

---

## 5. Deliverable 5 — Reference Engineering (`REF-01`)

**Purpose:** Assign every reference image an explicit, singular role before generation, and resolve conflicts between references up front rather than letting the model guess.

**Required inputs:** at least one reference image + its intended role.
**Optional inputs:** `[PROJECT_CONTEXT]`, `[DESIGN_DNA]`.

```
ROLE: You assign explicit roles to reference images and resolve conflicts
between them before generation. You do not invent attachment syntax not
confirmed in Section 3's adapters for the target model — if unconfirmed,
describe the role in plain language instead of inventing a tag.

INPUTS: reference image(s), each with your stated intended role from:
  Identity | Product geometry | Pose | Composition | Style | Lighting |
  Palette | Environment | Material

PROCESS:
1. For each reference, output:
   REFERENCE ID:
   ASSIGNED ROLE:
   FEATURES TO PRESERVE:
   FEATURES TO IGNORE:
   PRIORITY:              [1 = highest, if multiple references could conflict]
   CONFLICTS:             [name any other reference it disagrees with, and how]
   SUPPORTED INPUT METHOD: [cite the Section 3 adapter for the target model —
                            e.g. "GPT Image: separate input_image items" —
                            never invent a tag/parameter not in that adapter]
2. If two references conflict (e.g. one implies a lighting rule the other
   contradicts), resolve it explicitly before generation — do not let the
   model blend them silently. State either a priority order or a split of
   governance (e.g. "Reference A governs pose, Reference B governs lighting").
3. State plainly: for the features that most need to be right (identity,
   product geometry), a strong reference image is more reliable than more
   prompt text — adjectives describe, references show. Reserve prompt text for
   things no reference can show (mood words, intangible brief requirements).

OUTPUT: One row per reference in the format above, plus a one-line conflict-
resolution statement if any conflicts were found.
```

**Expected output:** A reference role table + resolved conflicts, ready to feed into any `IP-01`–`IP-12` prompt.

**Quality check:** No reference is left with an undefined role; every conflict is resolved, not silently blended.

**Common failure:** Two references both informally treated as "style," with no priority — leads to an unpredictable blend. Reject and force an explicit priority or role split.

**Follow-ups:**

```
REF-02 — PRESERVE IDENTITY WHILE CHANGING POSE
Identity reference: [image] / New pose: [description]
Assign Identity = highest priority, preserve-exactly. Pose = fully flexible.
State which features (face/body proportions/wardrobe) must not shift.
```

```
REF-03 — PRESERVE COMPOSITION WHILE CHANGING STYLE
Composition reference: [image] / New style reference: [image]
Assign Composition = preserve layout/placement only. Style = governs color/
texture/rendering only. State explicitly that Style must not alter subject
placement, and Composition must not alter rendering style.
```

```
REF-04 — PRESERVE THE PRODUCT WHILE REPLACING THE ENVIRONMENT
Product reference: [image] / New environment: [description or reference]
Assign Product geometry + Identity = preserve exactly, highest priority.
Environment = fully replaceable. Flag if the target model (see Section 3)
only loosely preserves product geometry during environment swaps — Firefly
Generative Match and Nano Banana's no-mask editing are weaker guarantees here
than GPT Image/FLUX with an explicit product reference.
```

```
REF-05 — DIAGNOSE WHICH REFERENCE IS CAUSING UNWANTED INFLUENCE
References used: [list] / Unwanted effect observed: [description]
For each reference, state whether its assigned role could plausibly explain
the unwanted effect, and suggest a single test (e.g. regenerate with only
that reference removed) to isolate the cause before changing anything else.
```

---

## 6. Deliverable 6 — Character and Product Consistency

Both workflows share one 6-step shape and end in a **KEEP / FIX / REGENERATE** classification. Neither promises perfect consistency — when generation can't meet the required precision, the workflow explicitly recommends compositing, real photography, vector reconstruction, or 3D rendering (Blender) instead. Registry fields here are intentionally lightweight; the full asset-management system is Part 8's job.

### `CC-01` — Character Consistency

```
1. ESTABLISH MASTER: Use IP-03's human-approved neutral-pose output as the
   single master identity reference. Record: MASTER ID, distinctive features,
   proportions, wardrobe, palette.
2. RECORD IDENTITY RULES: List what must not change across any variation
   (face structure, body proportions, wardrobe pieces, palette) vs. what may
   change (pose, expression, camera angle, background).
3. GENERATE ONE CONTROLLED VARIATION: via IP-04, using the master as the
   Identity reference (REF-01, highest priority).
4. COMPARE AGAINST MASTER: side-by-side check of every "must not change" item.
5. CLASSIFY:
   KEEP — matches master within acceptable tolerance.
   FIX — a small, correctable drift (e.g. slightly wrong palette) — attempt a
         targeted edit (EDIT-01) before regenerating from scratch.
   REGENERATE — identity has drifted enough that editing won't reliably fix it.
6. UPDATE RECORD: note MASTER ID, variation ID, classification, and the date —
   lightweight log only; full registry is Part 8.

Do not claim "locked consistency" after one successful variation — consistency
is confirmed only across the actual set of shots needed, not a single sample.
If repeated REGENERATE outcomes occur on the same feature (e.g. hands, a
specific wardrobe detail), recommend switching that specific asset to
compositing, photographed reference, or a 3D-modeled asset (Blender) rather
than continuing to regenerate.
```

### `PC-01` — Product Consistency

```
1. ESTABLISH MASTER: a real product reference photo (or set) — never a
   generated image — as MASTER ID. Record silhouette/proportions, cap/closure,
   labels/logos (exact text), materials, colors, orientation conventions, scale.
2. RECORD IDENTITY RULES: must-not-change = silhouette, cap/closure geometry,
   label/logo text and placement, brand colors. May-change = environment,
   lighting mood, camera angle (within realistic limits).
3. GENERATE ONE CONTROLLED VARIATION: via IP-05, using the master as Product
   geometry + Identity reference (REF-01, highest priority).
4. COMPARE AGAINST MASTER: check geometry, label legibility/accuracy, color
   accuracy, proportion, orientation — at full resolution, not thumbnail.
5. CLASSIFY: KEEP / FIX / REGENERATE, as in CC-01.
6. UPDATE RECORD: MASTER ID, variation ID, classification, date.

Label/logo text is the most common failure point — treat any text drift as an
automatic FIX-or-REGENERATE, never a KEEP. If geometry repeatedly fails to
hold (e.g. a distinctive cap shape keeps drifting), recommend real product
photography, vector reconstruction of the label, or a 3D render (Blender) of
the product for that specific asset instead of continued regeneration.
```

---

## 7. Deliverable 7 — Controlled Image Editing (`EDIT-01`)

**Purpose:** "Change only the requested element and preserve the approved image."

**Required inputs:** `[BASE_IMAGE]`, `[EDIT_REQUEST]`, `[TARGET_MODEL]`.
**Optional inputs:** `[REFERENCE_IMAGES]`, `[LOCKED_ELEMENTS]`.

```
ROLE: You scope and route a single controlled edit. You identify what must be
protected before describing what should change.

INPUTS: [BASE_IMAGE] [EDIT_REQUEST] [REFERENCE_IMAGES] [LOCKED_ELEMENTS] [TARGET_MODEL]

PROCESS:
1. Identify:
   EDIT REGION:            [where the change happens]
   REQUESTED CHANGE:       [exactly what changes]
   PROTECTED REGIONS:      [everything outside the edit region]
   PROTECTED IDENTITY/GEOMETRY: [any character/product identity or geometry
                                  that must not shift, from LOCKED_ELEMENTS]
   LIKELY SIDE EFFECTS:    [what commonly drifts during this kind of edit —
                            e.g. lighting mismatch, unintended recomposition]
2. Produce, routed through Section 3's adapter for [TARGET_MODEL]:
   MODEL-SPECIFIC EDIT PROMPT: [using that adapter's format]
   MASK/SELECTION GUIDANCE:    [if the model supports masking — GPT Image,
                                FLUX Fill; otherwise state "no mask available,
                                relying on instruction wording" — Nano Banana,
                                Midjourney Edit Model, Ideogram Magic Fill]
   INTERFACE SETTINGS:         [if relevant, from the adapter]
3. Produce a BEFORE/AFTER ACCEPTANCE CHECKLIST specific to this edit — what to
   visually confirm changed, and what to confirm did NOT change.

OUTPUT: The four-part identification, the routed edit prompt, and the checklist.
```

**Expected output:** A scoped, model-routed edit prompt plus a before/after checklist — not an executed edit.

**Quality check:** PROTECTED REGIONS and PROTECTED IDENTITY/GEOMETRY are stated before the edit prompt, not after.

**Common failure:** Writing the edit prompt before identifying what must stay the same — leads to an edit prompt with no protective framing at all.

**Examples (scoped requests, not executed):**

```
EXAMPLE A — REPLACE FOOTWEAR
EDIT REGION: feet/shoes only. PROTECTED: pose, legs, lighting, background.
LIKELY SIDE EFFECT: shadow under new shoes may not match existing light
direction — check this specifically in the acceptance checklist.
```
```
EXAMPLE B — CHANGE A BACKGROUND
EDIT REGION: background only. PROTECTED: subject silhouette, edge detail,
existing rim lighting. LIKELY SIDE EFFECT: edge halo/fringing where subject
meets new background — a common no-mask-model artifact.
```
```
EXAMPLE C — ADJUST CLOTHING
EDIT REGION: garment only. PROTECTED: body proportions, pose, face/identity.
LIKELY SIDE EFFECT: unintended re-rendering of hands/accessories overlapping
the garment.
```
```
EXAMPLE D — EXPAND TO ANOTHER ASPECT RATIO
EDIT REGION: new canvas area only (Extend/Generative Expand/Reframe).
PROTECTED: original frame content, unchanged. LIKELY SIDE EFFECT: generated
extension doesn't match original lighting/perspective at the seam — check the
seam specifically.
```
```
EXAMPLE E — REMOVE AN OBJECT
EDIT REGION: object + the area it occupied. PROTECTED: everything else.
LIKELY SIDE EFFECT: implausible fill where the object was removed (e.g. a
shadow with nothing casting it) — check for orphaned shadows/reflections.
```
```
EXAMPLE F — PREPARE AN ISOLATED MOTION ASSET
EDIT REGION: full image, but output = subject only on a plain/transparent
background (not a "change," a re-generation via IP-10). PROTECTED: subject's
appearance from the approved image. LIKELY SIDE EFFECT: edge cleanliness at
the cutout boundary — check at 100% zoom before compositing.
```

**Asking for preservation vs. a tool enforcing it:** A mask-based edit (GPT Image `/edits`, FLUX Fill) genuinely restricts changes to the masked region — the rest of the pixels are structurally untouched. A no-mask conversational edit (Nano Banana, Midjourney Edit Model, Ideogram Magic Fill without a precise mask) only *asks* the model to leave the rest alone via wording — it's a strong suggestion the model usually follows, not a structural guarantee. For anything where "preserve everything else" is a hard requirement (e.g. an approved, client-signed-off image), prefer a masked edit and verify the result against the before/after checklist regardless.

---

## 8. Deliverable 8 — Generation Review and Prompt Debugging (`IGC-01`)

**Purpose:** Diagnose why a generated image didn't match the spec, without rewriting the whole prompt reflexively.

**Required inputs:** `[IMAGE_SPEC]`, `[ORIGINAL_PROMPT]`, `[GENERATED_IMAGE]`, `[TARGET_MODEL]`.
**Optional inputs:** `[REFERENCES]`.

```
ROLE: You are an image generation critic. You separate what you can actually
see from what you suspect caused it. If [GENERATED_IMAGE] cannot be inspected
(not provided, or not viewable), state "visual evaluation is pending" and stop
— do not evaluate an image you have not actually seen.

INPUTS: [IMAGE_SPEC] [ORIGINAL_PROMPT] [GENERATED_IMAGE] [REFERENCES] [TARGET_MODEL]

CHECK: prompt adherence, composition, identity, pose/anatomy, product
geometry, materials, lighting, color, exact text, branding, Design DNA
conformance, production readiness.

For each significant issue:
ISSUE:
VISIBLE EVIDENCE:            [what is actually seen — not an inference]
SEVERITY:                    [CRITICAL | IMPORTANT | OPTIONAL | WORKING WELL]
LIKELY CAUSE:                [your best guess — clearly separated from VISIBLE EVIDENCE]
CONFIDENCE:                  [HIGH | MEDIUM | LOW]
SMALLEST USEFUL CORRECTION:
BEST ROUTE:                  [EDIT | REGENERATE | COMPOSITE | REBUILD]

Do not rewrite the entire original prompt as your default correction — propose
the smallest change that plausibly addresses the issue instead.

OUTPUT: The issue list above, ordered by severity, plus a one-line overall
verdict (production-ready / needs one more pass / needs a different route).
```

**Expected output:** A severity-ordered issue list with cause clearly separated from evidence, ending in a route recommendation per issue.

**Quality check:** Every issue's VISIBLE EVIDENCE is something literally visible, not a restatement of the LIKELY CAUSE.

**Common failure:** Conflating "I think the prompt was too vague" (a cause) with "the product logo is missing" (the evidence) — reject and re-separate.

**Follow-up — one variable at a time:**

```
IGC-02 — SINGLE-VARIABLE PROMPT DEBUG
Track across attempts:
PROMPT VERSION:         [v1, v2, ...]
CHANGE MADE:             [exactly one variable changed from the previous version]
EXPECTED IMPROVEMENT:
ACTUAL RESULT:           [state "visual evaluation pending" if the new image hasn't been inspected yet]
REMAINING ISSUE:
Do not change more than one meaningful variable between versions — if the
result doesn't improve, you won't know which change mattered.
```

---

## 10. Deliverable 10 — Commands and Handoff

### 10.1 Compact commands

Library shorthand only — not built-in application commands unless you've configured them as such.

| Command | Maps to |
|---|---|
| `/image-spec` | `IMG-00` fill-in |
| `/image-prompt` | `IP-01`–`IP-12` (specify which) |
| `/reference-control` | `REF-01` + follow-ups |
| `/character-consistency` | `CC-01` |
| `/product-consistency` | `PC-01` |
| `/image-edit` | `EDIT-01` |
| `/image-review` | `IGC-01` |
| `/image-debug` | `IGC-02` |

---

# AI Creative Operating System — Part 6: Video Generation, Camera Control and Continuity

**Builds on:** Part 1 (routing method), Part 2 (`STD-00` standard), Part 3 (art direction), Part 4 (`DNA-00`, `MR-01` motion-readiness), Part 5 (`IMG-00`, `REF-01` Reference Role Map, `CC-01`/`PC-01` identity rules). This part builds prompts and workflows only — **no video is generated unless explicitly requested.**

**New domain codes** (under `/Library/06_Video-Generation/`): `VID` (shared shot spec), `ADPV-[MODEL]` (video adapters), `VP` (core video prompt library, 16 entries), `MCE` (motion constraint engine), `CAM` (camera language modules), `ASQ` (action sequencer), `VCC` (video continuity critic), `VPD` (video prompt debugger).

**Verification date for every claim below: 2026-10-06.** This space moves fast (Kling 4.0 was still rolling out as of this check) — re-verify before production use, especially any exact duration/resolution/reference-count figure.

---

## 2. Deliverable 2 — Shared Video Shot Specification (`VID-00`)

```
SHOT ID:                [required]
PURPOSE:                [required]
DURATION:               [required — intent; actual selectable values are an
                         INTERFACE SETTING, see the chosen model's Section 3 adapter]
ASPECT RATIO:           [required — INTERFACE SETTING, model-dependent options]
STARTING STATE:         [required — what exists the instant the clip begins]
SUBJECTS / ASSET IDS:   [required if using an approved Part 5 asset (CC-01/PC-01
                         ID), else N/A]
ENVIRONMENT:            [required]
COMPOSITION:            [required]
ACTION:                 [required]
ACTION ORDER:           [required if more than one action occurs]
SUBJECT MOTION:         [required]
CAMERA BEHAVIOR:        [required — use Section 6's camera modules]
TIMING / BEATS:         [optional — INTENT ONLY unless the chosen model's
                         adapter confirms an enforceable timing control, e.g.
                         Veo's timestamp-segment technique]
LIGHTING:               [optional — inherited from DESIGN_DNA/ART_DIRECTION]
IDENTITY RULES:         [inherited from Part 5's CC-01/PC-01 locked features]
MUST MOVE:              [required — built via MCE-01]
MAY MOVE:               [required — built via MCE-01]
MUST REMAIN LOCKED:     [required — built via MCE-01]
FORBIDDEN CHANGES:      [required — built via MCE-01]
END STATE:              [required]
AUDIO:                  [optional — only meaningful if the target model's
                         adapter confirms native audio support]
REFERENCE ROLES:        [inherited from Part 5's REF-01 format, re-applied to
                         video references]
OUTPUT NEEDS:           [required]
ACCEPTANCE CRITERIA:    [required]
```

This spec must answer: *What exists? What happens first? What moves? What stays still? How does movement unfold? What does the camera do? What must remain consistent? How does the shot end?* If any of those eight questions has no answer in the fields above, the spec isn't finished.

**Contradiction check (mandatory before finalizing):** cross-check `CAMERA BEHAVIOR` against `MUST REMAIN LOCKED`. If "locked tripod" appears anywhere in `MUST REMAIN LOCKED`/`FORBIDDEN CHANGES` while `CAMERA BEHAVIOR` describes a push-in/pull-out/pan/orbit, **flag this explicitly as a contradiction** requiring resolution — never silently pick one and discard the other.

---

## 3. Deliverable 3 — Model-Specific Adapters

Each labeled **MODEL-SPECIFIC — VERIFY PERIODICALLY**.

**Shared note on image-to-video redundancy:** Don't restate what's already obvious from the starting frame (overall composition, dominant colors, static lighting direction) — that's redundant and wastes prompt attention. Do reinforce: anything easy to drift from (a locked identity feature, exact material behavior), anything ambiguous in a single still (something partially occluded, an implied motion not visible in a static frame), or an intended camera starting distance if the frame is tightly cropped.

### `ADPV-GGL-01` — Veo 3.1 (Google)

- **Best use:** cinematic shots needing native dialogue/audio, highest resolution in this set.
- **Required inputs:** `VID-00`; reference images if using Ingredients to Video.
- **Supported input mode:** text-to-video, image-to-video, first-and-last-frame, reference-driven.
- **Prompt structure:** one descriptive paragraph covering subject, action, environment, camera, lighting, audio cues; optionally segmented by timestamp (`[00:00–00:03]`, `[00:03–00:06]`) for multiple camera moves in one clip.
- **Reference attachment:** attach reference images through the chosen surface (Gemini app/AI Studio/API); state each image's role in the prompt text.
- **Interface settings (not prompt text):** duration (4/6/8s — 1080p/4K and references/audio require 8s), resolution (720p/1080p/4K), aspect ratio (16:9/9:16).
- **Camera/motion guidance:** describe camera moves in plain language (see Section 6); no structured camera parameter confirmed.
- **Audio instructions:** describe dialogue/SFX/ambient directly in the prompt — audio is generated in the same pass, not added after.
- **Limitations:** 8s hard cap per generation; higher-value features gated behind the 8s duration.
- **Common failure:** requesting 4K or references at a 4s/6s duration — unsupported combination.
- **Follow-up:** re-run with the clip broken into timestamped segments if a single camera move description is producing inconsistent pacing.
- **Sources:** [1](https://deepmind.google/models/veo/) — 2026-10-06.

```
TEMPLATE — ADPV-GGL-01
Prompt: [subject/action/environment/camera/lighting from VID-00], [dialogue/SFX/ambient description]
Segments (optional): [00:00–00:0X] ... [00:0X–00:0Y] ...
Reference images (Ingredients to Video, if used): [list + role of each]
Settings: duration=[4s|6s|8s], resolution=[720p|1080p|4K — 1080p/4K require 8s], aspect ratio=[16:9|9:16]
```

### `ADPV-RUN-01` — Runway Gen-4.5

- **Best use:** text-to-video from scratch with complex sequenced instructions; image-to-video when strong prompt adherence to motion matters.
- **Required inputs:** `VID-00`; for reference-guided work, a pre-built reference-guided image (via Runway's separate Gen-4 Image References tool, up to 3 images) rather than a video-side reference.
- **Supported input mode:** text-to-video, image-to-video only (video-to-video/keyframes "coming soon" per Runway).
- **Prompt structure:** for text-to-video, cover subject appearance + environment + lighting + composition + style, plus action + environmental motion + camera movement (Runway's own recommended structure: "`[camera move] shot of [subject] [action] in [environment]. [supporting detail]`"). For image-to-video, describe motion only — the image already sets composition/style.
- **Reference attachment:** not available on Gen-4.5 video generation directly; build the reference-guided still first, then animate it.
- **Interface settings:** duration (2–10s), FPS (24 or 25), aspect ratio (defaults to input image, can crop).
- **Camera/motion guidance:** prompt-based only (Section 6 language) — name the position and the move explicitly; there is no GUI Camera Control panel on Gen-4.5.
- **Audio instructions:** not confirmed supported — don't rely on native audio from this model.
- **Limitations:** Runway's own documented failure modes — causal reasoning can run backwards, object permanence can fail, actions succeed more than realistic physics would allow.
- **Common failure:** expecting the old Gen-3 Camera Control GUI parameters to exist on Gen-4.5 — they were retired, not carried forward.
- **Follow-up:** if motion drifts from the intended path, re-describe the camera move using the exact recommended prompt structure rather than adding more adjectives.
- **Sources:** [2](https://help.runwayml.com/hc/en-us/articles/46974685288467-Creating-with-Gen-4-5), [3](https://help.runwayml.com/hc/en-us/articles/39789879462419-Gen-4-Video-Prompting-Guide) — 2026-10-06.

```
TEMPLATE — ADPV-RUN-01
Text-to-video: "[camera move] shot of [subject] [action] in [environment]. [supporting detail]"
Image-to-video: base image = [reference-guided still]; prompt = motion/action only, no re-description of what's already visible
Settings: duration=[2-10s], fps=[24|25], aspect ratio=[matches input or cropped]
```

### `ADPV-KLG-01` — Kling 4.0 / 4.0 Flash (Kuaishou)

- **Best use:** longest native single-generation duration here (up to 30s), multi-keyframe narrative control, richest combined reference input.
- **Required inputs:** `VID-00`; up to 15 combined Omni Reference items if used (full model).
- **Supported input mode:** text-to-video, image-to-video (first frame, or first+last frame), Multi-Keyframe (full model, up to 10), Omni Reference.
- **Prompt structure:** detailed, timestamped action beats work well (per Kuaishou's own example prompts) — describe starting camera position, the move, and what resolves the shot.
- **Reference attachment:** Omni Reference — up to 10 images, up to 5 videos (30s combined), up to 7 elements (up to 3 video-based), 1 voice reference; state each item's role explicitly, since this is a newly launched, still-stabilizing feature set.
- **Interface settings:** duration (3–30s full / 3–20s Flash), resolution (720p/1080p/4K full / 720p Flash), dynamic range (10-bit HDR at 1080p/4K — **"coming soon," not yet live**), aspect ratio (21:9 to 9:16).
- **Camera/motion guidance:** prompt-described camera moves (Section 6 language); treat as strong prompt adherence, not a confirmed discrete structured control.
- **Audio instructions:** native stereo with lip-sync; specify dialogue/language directly if needed (9 languages, full model).
- **Limitations:** several headline features explicitly marked "coming soon" by Kling itself as of this verification date — don't assume HDR or the 2-minute extension are live without re-checking.
- **Common failure:** assuming Kling 4.0 Flash supports first/last-frame or multi-keyframe — not listed in its spec table; that's full-model-only.
- **Follow-up:** if a long single-generation shot loses coherence past ~15s, split into two Multi-Keyframe-pinned segments instead of one unconstrained long prompt.
- **Sources:** [5](https://kling.ai/feature/kling-4-ai-video-generation), [6](https://kling.ai/) — 2026-10-06.

```
TEMPLATE — ADPV-KLG-01
Prompt: [detailed scene + camera + timing description from VID-00]
Omni Reference: [up to 10 images / 5 videos / 7 elements / 1 voice — role of each stated]
Keyframes (full model, up to 10): [frame N at time T: description]
Settings: model=[Kling 4.0 | Kling 4.0 Flash], duration=[3-30s|3-20s], resolution=[720p|1080p|4K], aspect ratio=[21:9..9:16]
```

### `ADPV-SDC-01` — Seedance 2.0 (ByteDance)

- **Best use:** matching an existing brand/character/camera style using combined image+video+audio references in one request.
- **Required inputs:** `VID-00`; reference images/videos/audio as needed, labeled per the chosen platform's syntax.
- **Supported input mode:** text-to-video, image-to-video, video-to-video, first-and-last-frame transition.
- **Prompt structure:** address each reference directly in the prompt text using the platform's confirmed tag format (e.g. "`[Image 1]` for the character's face, `[Video 1]`'s camera motion, `[Audio 1]` as the music bed").
- **Reference attachment:** up to 9 images + 3 videos + 3 audio clips (12 combined) — **verify the exact tag syntax on the specific platform you're using** (differs between aggregators).
- **Interface settings:** duration (4–15s, default 5s), resolution (up to 1080p confirmed, "2K on some tiers" unverified), aspect ratio (16:9/9:16/1:1/4:3/3:4/21:9).
- **Camera/motion guidance:** describe desired camera behavior directly, or supply a reference video specifically to transfer its camera motion.
- **Audio instructions:** native dual-channel audio generated jointly — describe dialogue/music/ambient directly.
- **Limitations:** ByteDance's own global consumer access is limited; most international use runs through third-party platforms with their own UI layered on the same API.
- **Common failure:** using one platform's reference-tag syntax (e.g. `@image1`) on a different platform that expects `[Image 1]` — these are not interchangeable.
- **Follow-up:** if a combined reference set produces conflicting results, drop to one reference at a time to isolate which one is driving the unwanted output (same diagnostic logic as Part 5's `REF-05`).
- **Sources:** [7](https://seed.bytedance.com/en/blog/official-launch-of-seedance-2-0) — 2026-10-06.

```
TEMPLATE — ADPV-SDC-01
Prompt: "[Image 1] for [role], [Video 1]'s camera motion, [Audio 1] as [role]. [action description]"
References: up to 9 images / 3 videos / 3 audio — tag syntax confirmed for [platform name]
Settings: duration=[4-15s], resolution=[480p|720p|1080p], aspect ratio=[16:9|9:16|1:1|4:3|3:4|21:9]
```

### `ADPV-LUM-01` — Luma Ray3.2

- **Best use:** transforming real captured footage (Modify Video) while preserving performance; precise multi-keyframe narrative direction; studio HDR/EXR pipeline needs.
- **Required inputs:** `VID-00`; for Modify Video, the real source footage; for Multi-Keyframe, up to 16 keyframe descriptions/images.
- **Supported input mode:** text-to-video, image-to-video, Multi-Keyframe, Modify Video V2 (video-to-video), Reframe.
- **Prompt structure:** for Multi-Keyframe, describe what happens at each pinned moment (position/action/camera), not just the overall shot.
- **Reference attachment:** Character Reference = single image, identity lock; Modify Video's Start/End Frame = guides transitions within real footage.
- **Interface settings:** duration (up to 20s at 1080p), HDR/EXR export toggle, Draft Mode (fast/cheap iteration before a full-credit generation).
- **Camera/motion guidance:** Multi-Keyframe is the genuinely structured option here — pin camera position at specific moments rather than only describing a move in prose.
- **Audio instructions:** not a confirmed native strength — don't rely on it.
- **Limitations:** exact current resolution ceiling varies by source; Draft Mode's exact speed/cost multiplier is secondary-sourced.
- **Common failure:** using Modify Video on footage where the target of the modification isn't actually visible in the Start or End Frame — the instruction won't land correctly if its target is off-screen.
- **Follow-up:** use Draft Mode to iterate on keyframe placement cheaply before committing to a full-quality generation.
- **Sources:** [8](https://lumalabs.ai/ray), [9](https://lumalabs.ai/news/ray3-modify) — 2026-10-06.

```
TEMPLATE — ADPV-LUM-01
Mode: Text-to-video | Image-to-video | Multi-Keyframe | Modify Video V2
Keyframes (if used): Frame 1 @ 0.0s: [...] / Frame 2 @ Xs: [...] (up to 16)
Character Reference (if used): [image] — identity lock only
Modify Video inputs (if used): source footage + Start/End Frame + Modify Strength [adhere..reimagine]
Settings: duration=[up to 20s], resolution=[confirm], HDR/EXR=[on/off], Draft Mode=[on/off]
```

### `ADPV-ADB-01` — Adobe Firefly Video (own model + partner models)

- **Best use:** editing/extending/reframing existing footage inside Creative Cloud; one-stop access to several other models without leaving Firefly/Premiere.
- **Required inputs:** `VID-00`; base footage if editing; first/last-frame images if directing camera movement that way.
- **Supported input mode:** text-to-video, image-to-video, prompt-based editing of existing footage, first/last-frame-guided camera movement.
- **Prompt structure:** plain descriptive prompt for generation; short instruction for editing ("wider shot," "bird's-eye view," "closeup").
- **Reference attachment:** upload a start-point image and an end-point image to direct how the "camera" moves between them (officially confirmed); Structure/Style Reference claims are not independently confirmed here.
- **Interface settings:** model picker (Adobe's own Firefly Video Model vs. a named partner model — Veo 3.1/Runway Gen-4.5/Kling 3.0/Kling 3.0 Omni/Nano Banana 2), resolution/upscale (Boards can push 1080p to 4K).
- **Camera/motion guidance:** plain-language instruction, plus the first/last-frame-guided movement feature.
- **Audio instructions:** use the Firefly Video Editor's sound/color tools for post-generation polish; native-generation audio specifics for Adobe's own model are not fully confirmed here.
- **Limitations:** Adobe's commercial-safety guarantee applies to Adobe's own model only, not partner models selected inside Firefly.
- **Common failure:** assuming a partner model's full native feature set (e.g. Kling's Omni Reference) carries over exactly as documented in that model's own adapter — verify inside Firefly's actual UI, since aggregator surfaces can expose a subset.
- **Follow-up:** if an edit changes more of the frame than intended, scope it as a `EDIT-01`-style request (Part 5) — describe the protected region explicitly before the requested change.
- **Sources:** [10](https://blog.adobe.com/en/publish/2026/04/15/adobe-extends-leadership-video-unleashing-new-ai-powered-creation-firefly-reinventing-color-editors-in-premiere), [11](https://news.adobe.com/news/2026/04/adobe-new-creative-agent) — 2026-10-06.

```
TEMPLATE — ADPV-ADB-01
Model: Firefly Video Model (own) | [named partner model — note its own safety/license status separately]
Mode: Text-to-video | Image-to-video | Edit existing footage | First/last-frame camera-move
Prompt/instruction: [from VID-00 or EDIT_REQUEST]
First/last-frame images (if used): [attached — describe what should happen between them]
```

---

## 4. Deliverable 4 — Core Video Prompt Library (`VP-01`–`VP-16`)

**Shared mechanics (apply to all 16, not restated per entry):**

```
ROLE: You compile a ready-to-use video-generation prompt from approved project
inputs. You fill VID-00, then output (a) the filled VID-00, (b) a natural-
language prompt paragraph adapted for one named Section 3 model, and (c) an
explicit statement of which of these three cases applies:
  - ONE PROMPT, ONE CLIP — a single generation is expected to satisfy this shot.
  - SHOT PACKAGE — this requires multiple separate generations stitched
    together in editing; list each clip's shot spec separately.
  - NATIVE MULTI-SHOT FEATURE — only if the target model's Section 3 adapter
    confirms a native multi-shot/keyframe feature capable of this (e.g. Kling
    4.0's Multi-Keyframe, Seedance's multi-shot). Never assume a single prompt
    reliably produces a precisely-timed edited sequence otherwise.

SHARED INPUTS: [PROJECT_CONTEXT], [DESIGN_DNA], approved Part 5 asset IDs — as required per entry below.
SHARED OUTPUT: filled VID-00 + adapted prompt + clip-structure statement.
SHARED QUALITY CHECK: no invented action/prop/dialogue beyond the brief;
MUST REMAIN LOCKED items trace to CC-01/PC-01/DNA-00; the clip-structure
statement matches what the target model's adapter actually confirms.
SHARED COMMON FAILURE: treating a SHOT PACKAGE as if it were a NATIVE
MULTI-SHOT FEATURE — assuming a model will cut between shots on its own
when no adapter confirms that capability.
```

### `VP-01` Text-to-video
**Purpose:** Generate a shot with no starting image. **Use when:** no approved styleframe exists yet or the shot doesn't need one. **Required inputs:** `VID-00` filled from brief/`DESIGN_DNA` alone. **Delta:** describe subject, environment, action, and camera fully — nothing is implied by a starting frame. **Acceptance check:** result matches `STARTING STATE`/`COMPOSITION` as described, not just the general vibe. **Common failure:** vague subject description producing an unrecognizable or generic result. **Follow-up:** "Re-describe only the subject's appearance in more concrete terms, keep the rest of the prompt unchanged."

### `VP-02` Image-to-video
**Purpose:** Animate an approved styleframe/image. **Use when:** a Part 5 `SF-01`/`IP` output or real image exists. **Required inputs:** the base image. **Delta:** per the shared image-to-video redundancy note — describe motion only, not what's already visible. **Acceptance check:** the starting frame of the output visually matches the source image. **Common failure:** over-describing static composition, diluting the model's attention on the actual requested motion. **Follow-up:** "Reduce the described motion to a single, simpler action if the result overshoots."

### `VP-03` First-frame animation
**Purpose:** Same mechanism as `VP-02`, using a model's specific "first frame" terminology/mode. **Use when:** the target adapter (Section 3) names this mode explicitly (Veo, Kling, Seedance). **Delta from VP-02:** none functionally — route through the named adapter's specific first-frame syntax.

### `VP-04` First-and-last-frame transition, where supported
**Purpose:** Generate the motion between two defined states. **Use when:** both a start and end image exist and the target model's adapter confirms support (Veo "Frames to Video," Kling start/end frame, Seedance transition, Luma first/last frame — **not Runway Gen-4.5**, unconfirmed there). **Required inputs:** start image, end image. **Delta:** state explicitly in `END STATE` what must be true in the last frame; let the model propose the path between unless `CAMERA BEHAVIOR`/`ACTION ORDER` constrain it further. **Acceptance check:** last frame of the output matches the supplied end image closely enough for its intended use (exact pixel match is not guaranteed by any model here). **Common failure:** assuming this mode exists on a model whose adapter doesn't confirm it. **Follow-up:** "Regenerate with an added mid-point keyframe description if the transition path is implausible" (Kling/Luma Multi-Keyframe only).

### `VP-05` Reference-guided video
**Purpose:** Generate using one or more reference assets with explicit roles. **Use when:** identity/style/camera-motion must come from a specific reference. **Required inputs:** `REF-01`-style role map, adapted for video (role options: Identity, Product geometry, Pose, Composition, Style, Lighting, Palette, Environment, Material, **Camera motion** [video-specific addition]). **Delta:** route through whichever adapter actually supports multi-reference input (Veo Ingredients-to-Video, Kling Omni Reference, Seedance multimodal, Luma Character Reference); for Runway, build the reference-guided image first (per `ADPV-RUN-01`). **Acceptance check:** run `VCC-01` (Deliverable 8) specifically on identity/style fidelity. **Common failure:** assigning two references the same role with no priority — same failure mode as Part 5's `REF-01`, resolve before generating. **Follow-up:** Part 5's `REF-05` diagnostic, applied to video.

### `VP-06` Character action
**Purpose:** An approved character performs one clear action. **Use when:** a `CC-01` master identity exists. **Required inputs:** master identity reference, the action description. **Delta:** `IDENTITY RULES` field is mandatory and detailed (face/proportions/wardrobe/palette); keep the action singular and clear rather than multi-step (see `ASQ-01` if multiple beats are needed). **Acceptance check:** run `VCC-01` on identity drift specifically. **Common failure:** describing a multi-step performance that exceeds what a single clip's duration can plausibly contain — run `ASQ-01` first. **Follow-up:** "Regenerate the same action from a different camera angle, same identity rules."

### `VP-07` Product commercial
**Purpose:** A commercial-style shot of an approved product. **Use when:** a `PC-01` master product exists. **Required inputs:** master product reference, `MUST REMAIN LOCKED` = silhouette/labels/logos/colors. **Delta:** this is the category most likely to need `VP-14`'s reveal pattern; route to whichever model's adapter best preserves product geometry during motion (verify, don't assume — none of these models guarantee perfect geometry preservation under motion, more so than for a static image). **Acceptance check:** run `VCC-01` on product geometry/label legibility across the whole clip, not just the first frame. **Common failure:** label/logo text warping or becoming illegible partway through a camera move. **Follow-up:** "Regenerate with a slower/smaller camera move specifically to protect label legibility."

### `VP-08` UGC-style clip
**Purpose:** An intentionally informal, handheld/phone-style clip. **Use when:** the brief calls for an authentic, non-polished look. **Delta:** use the Phone Video/Handheld camera modules (Section 6) deliberately — resist the urge to "upgrade" the camera work, since polish undermines the UGC effect. **Acceptance check:** confirm the result doesn't read as over-produced relative to the brief. **Common failure:** the model defaults to a stabilized, cinematic camera despite UGC-style prompting — explicitly reinforce "visible handheld shake, imperfect framing" if needed. **Follow-up:** "Increase visible camera imperfection — framing, micro-shake — while keeping the same action."

### `VP-09` Cinematic shot
**Purpose:** A polished, intentional-camera-language shot. **Use when:** the opposite of `VP-08` — production value matters. **Delta:** use Dolly/Crane/Tracking/Orbit modules (Section 6) deliberately, paired with lighting language from `DESIGN_DNA`. **Acceptance check:** camera move reads as deliberate, not generic "dynamic" motion with no narrative purpose. **Common failure:** adding camera movement with no reason tied to `PURPOSE` — reject per Deliverable 6's rule against motion-for-its-own-sake. **Follow-up:** "Simplify to a locked or single-axis camera move if the current result feels unmotivated."

### `VP-10` Motion-design animation
**Purpose:** Animate a flat/vector motion-design frame. **Use when:** the source is Part 4/5's flat illustration or vector styleframe. **Required inputs:** Part 4's `MR-01` output as the direct source of `MUST MOVE`/`MAY MOVE`. **Delta — important honesty flag:** none of the six models in this set are a strong general tool for precise kinetic typography or flat-vector motion graphics; they're trained predominantly on photoreal/semi-realistic motion. For true flat motion-design work, After Effects remains the primary tool — use video generation here only for texture/background/atmospheric elements behind a hand-built AE composition, not as the main animation engine. **Acceptance check:** confirm the output wasn't asked to do a job it isn't suited for. **Common failure:** expecting clean, sharp-edged vector-style motion from a model trained mostly on photoreal footage — the output usually drifts toward photoreal rendering unless style is reinforced strongly, and even then isn't reliable for exact flat motion graphics. **Follow-up:** "Route this specific element to manual After Effects animation instead" (handoff to Part 7).

### `VP-11` Single continuous take
**Purpose:** One uninterrupted shot, no cuts. **Use when:** the brief specifically wants a one-take feel. **Delta:** run `ASQ-01` first — continuous takes are the most likely to attempt too many actions for the available duration. **Acceptance check:** no implied cut/discontinuity in the result. **Common failure:** the model internally "cuts" via an unrealistic jump despite a continuous-take request. **Follow-up:** "Simplify to fewer action beats within the same duration" (via `ASQ-01`'s simplification options).

### `VP-12` Multi-shot sequence
**Purpose:** Several shots that together tell a sequence. **Use when:** the brief needs more than one shot. **Delta — mandatory distinction:** check Section 3 for a confirmed **native multi-shot feature** (Kling 4.0 Multi-Keyframe/video editing up to 5 clips, Seedance multi-shot). If the target model has none, this is a **SHOT PACKAGE** — generate each shot as its own clip with its own `VID-00`, and build the sequence in Premiere/After Effects (Part 7). Never assume a single prompt on a non-multi-shot model will produce a reliably-timed edited sequence. **Acceptance check:** each shot's `END STATE` matches the next shot's `STARTING STATE`. **Common failure:** treating a non-multi-shot model's long single generation as if it contained real cuts. **Follow-up:** `ASQ-01`'s dependency-tracking across the shot list.

### `VP-13` Seamless loop
**Purpose:** A clip that can repeat invisibly. **Use when:** background loops, app previews, ambient motion-design loops. **Delta:** where a model's adapter confirms first-and-last-frame support (`VP-04`), set the last frame identical to the first; otherwise, plan the loop point manually in editing rather than relying on the model to self-loop. **Acceptance check:** play the clip back-to-back twice and check for a visible seam. **Common failure:** assuming any clip loops cleanly by default — none of these models guarantee that without an explicit matching first/last frame or manual edit-point work. **Follow-up:** "Regenerate the final second only, matching it to the first frame" (if the model supports a short re-generation/extend feature).

### `VP-14` Product reveal
**Purpose:** The product itself stays fixed; a reveal happens only after something (commonly a hand) exits frame. **Use when:** product-commercial reveal beats. **Required inputs:** `PC-01` master product, explicit `ACTION ORDER` (reveal happens strictly after the occluding element's exit). **Delta:** this is the canonical case for `ASQ-01`'s "premature reveal" check — run it before generating. **Acceptance check:** the product is not visible/complete until after the stated exit point. **Common failure:** the model reveals the product early or blends the exit and reveal into one ambiguous motion. **Follow-up:** "Separate this into two generations — the covering action, then the reveal — if one pass keeps revealing early" (a `SHOT PACKAGE` fallback).

### `VP-15` Transformation / transition shot
**Purpose:** One state visibly becomes another (e.g. a flat surface becoming a brew bar — see Part 3/4's Nomad "hard-cut transformation" motif). **Use when:** the concept specifically calls for a visible transformation, not just a cut. **Required inputs:** `STARTING STATE` and `END STATE` both fully specified. **Delta:** state explicitly whether the transformation should be a **hard cut** (two states, no visible morph — safer and more reliable across these models) or a **continuous morph** (harder to control, higher failure risk — flag this as a genuine capability limitation, not just a creative choice). **Acceptance check:** the transformation reads as intentional, not as an artifact. **Common failure:** requesting a smooth, continuous morph and getting an uncanny, melting-looking result instead — fall back to a hard cut if this happens. **Follow-up:** "Convert this to a hard-cut transformation using two separate generations" if the morph fails.

### `VP-16` FPV movement
**Purpose:** A continuous first-person camera journey through an environment. **Use when:** the brief wants an immersive, continuous camera path. **Required inputs:** a clear `STARTING STATE`/`END STATE` for the path, environment description along the entire route. **Delta:** use the FPV camera module (Section 6); confirm with `ASQ-01` that the described path is plausible within the model's maximum duration — FPV paths are especially prone to "too much distance for the available seconds." **Acceptance check:** the path is continuous with no implied teleportation/cut. **Common failure:** describing a path longer than the environment description actually supports, producing generic/repeating scenery. **Follow-up:** "Shorten the path and increase environment detail density" if the result feels generic partway through.

---

## 5. Deliverable 5 — Motion Constraint Engine (`MCE-01`)

**Purpose:** Turn a rough motion request into an explicit, checkable constraint set.

```
ROLE: You convert a rough motion request into explicit constraints, separated
by category, with positive behavior stated wherever possible instead of a
list of prohibitions.

INPUT: a rough description of what should happen in the shot.

PROCESS:
1. Separate the request into five categories — do not merge them:
   SUBJECT MOTION | CAMERA MOTION | ENVIRONMENTAL MOTION | LIGHTING CHANGES | EDITORIAL CHANGES
2. For each element that needs a rule, output:
   MUST MOVE / MAY MOVE / MUST REMAIN LOCKED / FORBIDDEN — pick exactly one.
   ALLOWED BEHAVIOR:        [what it may actually do]
   RANGE / EXTENT:          [how far, how much — not just "a little" or "a lot"]
   TIMING RELATIONSHIP:     [before/during/after which other event]
   PROTECTED APPEARANCE:    [what about its look must not change, if relevant]
   HOW TO INSPECT:          [what to look at in the output to verify compliance]
3. Translate negative instructions into positive behavior wherever useful —
   e.g. instead of only "the logo must not rotate," also state "the logo stays
   flat-facing the camera throughout."
4. Keep the list focused — do not bury the one or two things that actually
   matter under a long list of minor prohibitions. If more than ~8 elements
   need rules, group the minor/background ones into one shared rule rather
   than listing each individually.
5. If the requested control exceeds what any Section 3 adapter plausibly
   supports, say so explicitly and recommend one of:
   - a simpler action (fewer moving parts)
   - separate generation passes (one element at a time, composited together)
   - masking/compositing in post rather than trying to control it at generation time
   - traditional animation for that specific element
   - a different input mode (e.g. image-to-video instead of text-to-video for
     tighter starting-state control)
   - a different tool entirely (cite the Section 1 table)

OUTPUT: The four-category breakdown (MUST MOVE/MAY MOVE/MUST REMAIN LOCKED/
FORBIDDEN) with the five sub-fields for each listed element, plus any
capability-exceeded recommendation.
```

**Expected output:** A compact constraint table ready to drop into `VID-00`.

**Quality check:** No element has more than one classification; positive behavior is stated wherever a prohibition was the only thing specified.

**Common failure:** A long, undifferentiated list of "don'ts" that obscures the one or two constraints that actually matter for this shot.

---

## 6. Deliverable 6 — Camera Language Modules (`CAM`)

Each module describes **visible behavior**, not a guaranteed mechanical control — cross-check Section 1/3: only **Luma's Multi-Keyframe** is a confirmed structured camera control in this set; every other model relies on prompt language as influence, not a guarantee. **Camera movement should always serve `PURPOSE` — never add movement solely to make a shot feel "dynamic."**

| Module | Starting viewpoint | Movement path | Speed | Framing change | Subject relationship | Stability | Ending viewpoint |
|---|---|---|---|---|---|---|---|
| **Locked tripod** | Fixed position | None (zero translation/rotation) | N/A | None | Constant | Perfectly stable | Same as start |
| **Subtle push-in** | Wider framing | Straight line toward subject (translation, Z-axis) | Slow | Frame tightens gradually | Grows closer | Stable | Tighter framing |
| **Pull-out** | Tight framing | Straight line away from subject | Slow–moderate | Frame widens, reveals context | Grows more distant | Stable | Wider, reveals environment |
| **Tracking** | Alongside subject | Parallel to subject's path (translation) | Matches subject speed | Framing roughly constant | Constant relative distance | Stable | Alongside subject, new location |
| **Dolly** | Any | Linear translation along a track (in/out/lateral) | Variable, deliberate | Changes smoothly with distance | Changes predictably | Stable, mechanical-feeling | Defined end point on the track |
| **Orbit** | Fixed radius from subject | Arcs around the subject (rotation around a point) | Slow–moderate | Framing holds subject centered, background changes | Constant distance, changing angle | Stable | Opposite or partial-arc position |
| **Crane** | Low or eye-level | Vertical + forward arc (translation on Y and Z) | Slow, sweeping | Framing shifts from intimate to expansive (or reverse) | Distance and angle both change | Stable, large-scale | Elevated/expansive or grounded, depending on direction |
| **Handheld** | Any | Small, irregular drift (translation + rotation, low-amplitude) | Natural human pace | Minor constant micro-changes | Roughly constant | **Deliberately imperfect** — visible micro-shake | Near the start position, slightly drifted |
| **Phone video** | Eye-level, informal | Minimal, slightly uneven | Natural | Casual recompositions, slight over/under-framing | Informal, close | Noticeably imperfect, authentic | Wherever the "person" naturally stops |
| **Dashcam** | Fixed mount, forward-facing | None relative to vehicle (vehicle moves, camera is static relative to it) | Matches vehicle speed | Fixed | Entire scene moves past | Rigid, vibration-level only | Same relative framing throughout |
| **Drone** | Elevated, often wide | Smooth sweeping translation, can combine with slow rotation | Slow–moderate, smooth | Wide establishing to tighter | Distant, overview-oriented | Very stable (stabilized-gimbal feel) | New elevated vantage point |
| **FPV** | At subject/traveler eye level or lower, often tilted | Fast, continuous, can weave through obstacles | Fast | Constantly shifting | Immersed, first-person | **Deliberately dynamic, not stabilized** | Wherever the path ends, continuous with no cut |
| **POV** | Exactly at a character's eyes | Follows that character's head/body movement | Matches character's natural pace | Changes as the character looks around | Everything reacts as if seen by that character | Natural human stability (not perfectly smooth) | Wherever the character ends up looking |
| **Macro** | Extremely close to a small detail | Minimal or slow creep | Slow | Extremely shallow depth of field, large-scale detail | Subject fills frame | Very stable (macro shake is highly visible) | Same subject, possibly slightly reframed |
| **Telephoto framing** | Distant from subject, compressed perspective | Minimal movement (movement reads exaggerated at telephoto) | Slow if any | Background strongly compressed/blurred | Subject isolated from background | Stable (telephoto amplifies shake) | Similar distant position |
| **Wide-angle framing** | Close to subject, expansive view | Can include more movement without disorientation | Variable | Strong perspective distortion at edges, expansive context | Subject and environment both visible | Stable to moderate | Expansive view maintained |
| **Product-commercial camera** | Eye-level or slightly above product | Slow orbit or subtle push-in | Slow, deliberate | Tight, centered on product | Product is the sole focus | Perfectly stable | Centered, often tighter than start |
| **Documentary/UGC camera** | Informal, at subject height | Reactive, slightly delayed following | Natural, uneven | Imperfect, sometimes catches up late | Follows the real action, not posed | Visibly imperfect, authentic | Wherever the real moment ends |
| **Fashion editorial camera** | Eye-level or slightly low (flattering angle) | Slow, deliberate, often a subtle circle or push | Slow, controlled | Tight on garment/pose details, then wider | Subject is styled, camera is reverent | Very stable, controlled | Held on a final, deliberate pose |

**Translation vs. rotation vs. zoom:** translation = the camera's physical position changes (dolly, tracking, crane, drone, pull-out, push-in); rotation = the camera pivots in place or arcs around a point (orbit, pan, tilt); zoom = the framing tightens/widens **without** the camera's position changing (a lens effect, distinct from a dolly's push-in — conflating "zoom in" and "push in" produces different, describable-but-different visible results; state which one you actually mean).

---

## 7. Deliverable 7 — Temporal Action Planning (`ASQ-01`)

**Purpose:** Check whether a shot's planned actions actually fit its duration and order, before generating.

**Required inputs:** `[SHOT_SPECIFICATION]`, `[TARGET_MODEL]`, `[CRITICAL_EVENT_ORDER]`.
**Optional inputs:** `[START_FRAME]`, `[END_FRAME]`.

```
ROLE: You check whether a shot's planned actions realistically fit its
duration and required order, before generation.

INPUTS: [SHOT_SPECIFICATION] [START_FRAME] [END_FRAME, optional] [TARGET_MODEL] [CRITICAL_EVENT_ORDER]

PROCESS:
1. State STARTING STATE (from the spec or START_FRAME).
2. List ORDERED ACTION BEATS — each a single discrete event.
3. For each beat, state DEPENDENCIES (what must happen before it can),
   APPROXIMATE TIMING (within the target model's confirmed duration range,
   per Section 3), and whether it's part of CRITICAL_EVENT_ORDER (must not
   be reordered) or flexible.
4. State ENDING STATE (from the spec or END_FRAME).
5. Identify, explicitly:
   - TOO MANY ACTIONS FOR THE DURATION (more beats than the model's duration
     and typical pacing can plausibly contain)
   - CONFLICTING MOTIONS (two beats that can't physically happen together)
   - IMPOSSIBLE STATE CHANGES (an end state the described actions can't produce)
   - PREMATURE REVEALS (something becoming visible before its stated trigger)
   - MISSING EXITS (an element that needs to leave frame but has no described exit)
   - AMBIGUOUS ACTOR/OBJECT RELATIONSHIPS (unclear who/what is doing what to what)
6. List SIMPLIFICATION OPTIONS if any issue was found — ranked by how much
   they preserve of the original intent.
7. If CRITICAL_EVENT_ORDER cannot be reliably achieved in one generation on
   TARGET_MODEL, propose a practical split into separate clips or compositing
   passes, and state plainly what is lost by splitting (e.g. a harder edit
   point instead of one continuous take).

OUTPUT: Starting state, ordered beats with dependencies/timing, ending state,
the six-item issue check, and simplification/split options.
```

**Expected output:** A beat-by-beat feasibility check, not a generated video.

**Quality check:** Every beat in `CRITICAL_EVENT_ORDER` is explicitly preserved or explicitly flagged as unreliable on this model/duration — never silently dropped.

**Common failure:** Approving a shot plan with 6+ discrete actions inside a model's 5-8 second typical duration without flagging it.

---

## 8. Deliverable 8 — Continuity Review (`VCC-01`)

**Purpose:** Check a generated clip (or available frames of it) against its spec and approved assets.

**Required inputs:** `[GENERATED_VIDEO]`, `[SHOT_SPECIFICATION]`, `[APPROVED_ASSETS]`, `[DESIGN_DNA]`.
**Optional inputs:** `[ADJACENT_SHOTS]`.

```
ROLE: You are a video continuity critic. If only selected frames were
supplied (not the full video), say so explicitly and do not claim to have
inspected the full temporal duration. Never invent a timestamp you didn't
actually observe.

CHECK: character identity, wardrobe, product geometry, labels/logos, prop
presence, orientation, relative scale, environment, lighting, color, camera
behavior, action order, entry/exit behavior, start/end-state compatibility,
text stability.

For each significant issue:
ISSUE:
TIMESTAMP / FRAME, IF OBSERVABLE:   [state "not observable from supplied frames" if unknown]
VISIBLE EVIDENCE:
SEVERITY:                            [CRITICAL | IMPORTANT | OPTIONAL | WORKING WELL]
LIKELY CAUSE:
CONFIDENCE:                          [HIGH | MEDIUM | LOW]
RECOMMENDED FIX:
ACCEPTANCE TEST:

Conclude with exactly one of: KEEP / FIX / REGENERATE / REBUILD-COMPOSITE.
Prioritize consequential errors (identity drift, product geometry, text
legibility, broken action order) over minor artifacts (slight texture noise,
very brief single-frame glitches) in both ordering and emphasis.

OUTPUT: The issue list, ordered by severity, then the one-word conclusion.
```

**Expected output:** A severity-ordered issue list ending in a single clear verdict.

**Quality check:** No timestamp or "full video" claim appears unless the full video was actually reviewed.

**Common failure:** Treating a single-frame cosmetic artifact as equally important as an identity drift — reject and re-prioritize.

---

## 9. Deliverable 9 — Video Prompt Debugger (`VPD-01`)

**Purpose:** Diagnose a failed generation without rewriting the whole prompt reflexively.

**Required inputs:** `[TARGET_MODEL_AND_INTERFACE]`, `[ORIGINAL_PROMPT]`, `[EXPECTED_RESULT]`, `[ACTUAL_RESULT]`.
**Optional inputs:** `[REFERENCES]`, `[FAILED_CLIP_OR_FRAMES]`.

```
ROLE: You diagnose one video generation failure, separating what you observed
from what you suspect caused it. You do not promise that stronger wording
guarantees compliance — these models are influenced by prompts, not
deterministically controlled by them (except where a Section 3 adapter
confirms an actual structured control, e.g. Luma Multi-Keyframe).

INPUTS: [TARGET_MODEL_AND_INTERFACE] [ORIGINAL_PROMPT] [REFERENCES] [EXPECTED_RESULT] [ACTUAL_RESULT] [FAILED_CLIP_OR_FRAMES]

DIAGNOSE AGAINST: prompt ambiguity, contradiction, reference conflict,
identity drift, temporal failure, camera failure, physics failure, excessive
action complexity, unsupported feature (requested something this model/
interface doesn't actually offer, per Section 1/3), model limitation
(a known, documented weakness of this specific model).

OUTPUT, IN THIS ORDER:
1. PRIMARY FAILURE
2. SUPPORTING EVIDENCE            [what in ACTUAL_RESULT shows this]
3. LIKELY CAUSES                  [ranked, clearly separated from the evidence]
4. ONE CONTROLLED REVISION        [a single change — not a full rewrite]
5. REVISED PROMPT OR SETTINGS
6. WHAT REMAINS UNCHANGED         [explicitly — to isolate the effect of #4]
7. ACCEPTANCE TEST                [what would confirm the fix worked]
8. FALLBACK IF THE REVISION FAILS [e.g. switch input mode, split into a shot
   package, use masking/compositing, or route to a different model per
   Section 1]

Do not rewrite the entire prompt after every failure — change one
consequential variable, test, then proceed.
```

**Expected output:** A single, ranked diagnosis with one controlled revision — not a prompt rewrite.

**Quality check:** Step 6 explicitly lists what was *not* changed, so the next test is a clean comparison.

**Common failure:** Jumping straight to "add more descriptive words" as the fix for every failure type, regardless of diagnosis — reject and re-diagnose against the actual category list.

---

## 11. Deliverable 11 — Commands and Handoff

### 11.1 Compact commands

Library shorthand only — not built-in application commands unless configured as such.

| Command | Maps to |
|---|---|
| `/video-spec` | `VID-00` fill-in |
| `/video-prompt` | `VP-01`–`VP-16` (specify which) |
| `/motion-constraints` | `MCE-01` |
| `/camera-module` | Section 6 `CAM` table (specify which module) |
| `/action-sequence` | `ASQ-01` |
| `/video-continuity` | `VCC-01` |
| `/video-debug` | `VPD-01` |
| `/loop-plan` | `VP-13` |

---

# AI Creative Operating System — Part 7: Storyboards, Motion Design, Editing, After Effects and Sound

**Builds on:** Parts 1–6 (routing, `STD-00` prompt standard, art direction, `DNA-00`/`MR-01`, `IMG-00`/`REF-01`/`CC-01`/`PC-01`, `VID-00`/video adapters). This part builds **prompts and planning documents only** — it does not edit timelines, create project files, run code, or inspect footage unless explicitly requested and actually performed.

**New domain codes** (under `/Library/07_Production/`): `RB` (role boundaries), `SB` (storyboard), `MD` (motion director), `ED` (short-form editor), `AEB` (AE build planner), `AEX` (AE expression engineer), `AES` (AE script dev/debug), `SUP` (supporting production prompts), `SND` (sound/voice), `PR` (production review).

**Mandatory labeling key — used throughout this part:**

| Label | Meaning |
|---|---|
| **[ADVICE]** | A recommendation or plan — not performed, not verified against real material |
| **[CODE]** | Executable code (expression/script) — functionally reasoned through, **not run** unless stated otherwise |
| **[OPERATION]** | A description of an application action a human (or future automation) would need to perform — not actually executed by this assistant |
| **[VERIFIED]** | Something actually checked against real footage, a real file, or a real test run — only used if that check genuinely happened |

Nothing in this document carries the **[VERIFIED]** label unless stated — all storyboard, motion, edit, build, and sound content here is **[ADVICE]**, all code is **[CODE]/untested**, and all application steps are **[OPERATION]**, described but not performed.

## 2. Deliverable 2 — Storyboard Artist Master Prompt (`SB-00`)

**Purpose:** Convert an approved script/VO into a shot-by-shot staging plan.
**Use when:** a script exists (even in draft) and a visual plan is needed before motion/AE work begins.
**Don't use when:** footage already exists and needs organizing instead of staging — use `ED-00` (Deliverable 4) for that case.
**Required inputs:** `[SCRIPT]`, `[DURATION]`, `[PLATFORM]`, `[ASPECT_RATIO]`.
**Optional inputs:** `[PROJECT_CONTEXT]`, `[DESIGN_DNA]`, `[APPROVED_ASSETS]`, `[CONSTRAINTS]`.
**Inherited context:** `DESIGN_DNA` (Part 4), approved asset IDs (Part 5 `CC-01`/`PC-01`), any video-model routing decisions already made (Part 6), if relevant.

```
ROLE: You are a storyboard artist. You convert an approved script/VO into a
shot-by-shot staging plan — what happens and how it's staged, not how it
animates (that's a separate step) and not how footage is edited together
(also separate).

INPUTS: [SCRIPT] [DURATION] [PLATFORM] [ASPECT_RATIO] [PROJECT_CONTEXT]
[DESIGN_DNA] [APPROVED_ASSETS] [CONSTRAINTS]

BEFORE STORYBOARDING: Check whether SCRIPT can realistically fit DURATION at
a natural speaking/reading pace. If it cannot, say so explicitly — do not
silently speed up speech or cut content to force a fit. Propose either a
duration change or an explicit, flagged content cut for approval.

FOR EACH SHOT OR SCENE, OUTPUT:
SHOT ID:
TIMESTAMP:                    [label as an ESTIMATE; state the frame-rate
                               assumption if frame precision matters]
DURATION:
COMMUNICATION PURPOSE:        [what this shot must accomplish]
SHOT SIZE:                    [only for camera/live-action shots — mark N/A
                               for pure graphic scenes]
COMPOSITION:
SUBJECT:
ACTION:
CAMERA:                       [N/A if this is a graphic/motion-design scene,
                               not a camera shot]
GRAPHIC / CHARACTER MOTION:
TRANSITION:
DIALOGUE / VO:                [preserve SCRIPT's exact wording unless a
                               rewrite was explicitly requested]
EXACT ON-SCREEN TEXT:         [verbatim — no paraphrasing]
SOUND:
CONTINUITY:                   [what must match the previous/next shot]
ASSETS REQUIRED:
PRODUCTION METHOD:            [e.g. AE motion graphics / live-action /
                               generated video / static-to-motion — state
                               which, since this determines the next
                               handoff]
OPEN QUESTIONS:

CLOSE WITH: a running duration total checked against DURATION, and an
explicit PASS/OVER/UNDER verdict with the gap stated in seconds.

Distinguish camera shots (live-action framing/lens/movement apply) from
graphic scenes (no camera exists — motion is graphic, not cinematographic).
```

**Expected output:** A complete shot list with a duration reconciliation at the end.

**Quality check:** Every line of dialogue/VO from `SCRIPT` appears verbatim somewhere in the storyboard; the running total is explicitly reconciled against `DURATION`.

**Common failure:** Quietly compressing shot durations to make an overlong script "fit" instead of flagging the mismatch.

**Follow-up prompts:**
```
Simplify the storyboard — reduce shot count while preserving every required message beat.
```
```
Improve the opening — strengthen shots 1-3 specifically for a stronger hook, without changing anything after shot 3.
```
```
Revise shots [LIST] only — leave all other shots exactly as currently approved.
```
```
Convert this storyboard into an animatic plan — add pacing/hold-time notes per shot suitable for a rough timed preview, without inventing new visual content.
```
```
Create a production shot list from this storyboard — one line per shot with ASSETS REQUIRED and PRODUCTION METHOD only, grouped by production method, for scheduling.
```

---

## 3. Deliverable 3 — Motion Director Master Prompt (`MD-00` + specialized modules)

**Purpose:** Translate static styleframes/storyboard shots into specific, checkable motion behavior.
**Use when:** a styleframe or storyboard shot is approved and ready for animation planning.
**Don't use when:** the shot is live-action footage with no animated elements — route to `ED-00` instead.
**Required inputs:** `[STYLEFRAME]`, `[DESIGN_DNA]`, `[DURATION]`, `[FRAME_RATE]`.
**Optional inputs:** `[STORYBOARD]`, `[CONSTRAINTS]`.

```
ROLE: You are a motion director. You translate static elements into specific,
checkable motion behavior — not mood words. Describe easing through behavior
first ("eases in fast, settles slowly, with a slight overshoot before
resting") and only add numerical curve values when they provide real
practical value (e.g. a specific ease percentage a known AE preset maps to).
Never write instructions like "make it dynamic" or "add smooth animation" —
if you catch yourself about to write one, replace it with the actual
described behavior instead.

INPUTS: [STYLEFRAME] [DESIGN_DNA] [STORYBOARD] [DURATION] [FRAME_RATE] [CONSTRAINTS]

FOR EACH IMPORTANT ELEMENT, OUTPUT:
ELEMENT ID:
COMMUNICATION ROLE:           [why this element needs to move at all]
START STATE:
END STATE:
ACTION:
START / END TIME:             [frame-rate-aware, e.g. "12f-30f @ 24fps"]
ANTICIPATION:                 [if used — what happens just before the main action]
EASING CHARACTER:              [described behavior first; numeric curve only if useful]
OVERSHOOT / SETTLE, IF USEFUL:
SECONDARY MOTION:
PIVOT / ANCHOR:
DEPENDENCIES:                 [what this element's motion depends on/triggers]
SOUND RELATIONSHIP:           [if any cue should land on this motion]
READABILITY REQUIREMENT:      [minimum legible/hold time if text or a key
                               image is involved]

EXPLICITLY STATE: which elements remain still, and why (e.g. "background
stays static to keep focus on the product entering frame").

CLOSE WITH a dependency check: does any element's start depend on another
element's motion finishing within the available DURATION? Flag conflicts.
```

**Expected output:** A per-element motion specification, plus an explicit still/why list and a dependency check.

**Quality check:** No instance of vague motion language ("dynamic," "smooth," "punchy" used without a described behavior behind it); every element's timing fits inside `DURATION` at `FRAME_RATE`.

**Common failure:** Describing *what* should look good ("make the logo pop") instead of *how* it behaves (scale/ease/timing).

### 3.1 Specialized modules (shared core — add only the delta below)

Each module uses the same `MD-00` core and field list; only the emphasis/additional guidance differs.

- **`MD-KT` Kinetic typography:** add per-word/per-line timing against a VO or music beat; specify whether words build cumulatively or replace each other; flag minimum on-screen hold time per Deliverable 10's readability pattern.
- **`MD-GEO` Geometric motion:** specify whether shapes move independently or as a system (shared timing offset); state rotation pivot explicitly for every rotating shape — this is the most common geometric-motion ambiguity.
- **`MD-EXP` 2D explainer scenes:** tie each element's entrance to the specific VO phrase it illustrates; flag any element appearing before its matching VO line as a sequencing error.
- **`MD-CHAR` Character animation planning:** add POSE-TO-POSE KEY BEATS (not full animation) and an explicit WEIGHT/BALANCE note per major pose; identity rules inherit from Part 5's `CC-01`.
- **`MD-MIX` Mixed-media / collage:** state the treatment of seams between asset types (photo vs. illustration vs. texture) explicitly — this is the main place mixed-media motion fails (inconsistent motion "physics" between layers of different origin).
- **`MD-PROD` Product motion graphics:** `MUST REMAIN LOCKED` always includes product silhouette/label — inherit from Part 5's `PC-01`; state explicitly which motion the product is allowed to undergo (rotate in place vs. translate) since these read very differently.
- **`MD-TITLE` Titles and broadcast graphics:** add a SAFE-AREA NOTE and a minimum/maximum on-screen duration per legal/lower-third convention being followed, if any is specified by `CONSTRAINTS`.
- **`MD-ABS` Abstract motion:** since there's no literal subject to validate against, add a RHYTHM REFERENCE field (what external rhythm — music, voice pacing, brand pulse — the abstract motion should track) so the motion has a checkable anchor instead of being purely subjective.

**Follow-up prompts:**
```
Improve the timing on [ELEMENT ID] without adding effects — adjust only START/END TIME, EASING CHARACTER, and ANTICIPATION.
```
```
Reduce unnecessary motion in this plan — identify every element that moves without a clear COMMUNICATION ROLE and either justify or remove its motion.
```
```
Strengthen anticipation and payoff on [ELEMENT ID / ACTION] — describe a more deliberate lead-in and a more satisfying settle, without changing what the action itself is.
```
```
Design a transition from [SHOT A] to [SHOT B] using only elements already present in both shots' DESIGN_DNA — no new assets.
```
```
Make this motion plan feasible within [X hours/days] — identify which elements can be simplified, reused, or cut, ranked by effort saved vs. communication value lost.
```

---

## 4. Deliverable 4 — Short-Form Editor Master Prompt (`ED-00`)

**Purpose:** Organize available material into an effective timeline.
**Use when:** footage or a transcript already exists and needs to be assembled/edited.
**Don't use when:** nothing has been shot/generated yet — that's `SB-00` territory.
**Required inputs:** `[FOOTAGE_OR_TRANSCRIPT]`, `[OBJECTIVE]`, `[PLATFORM]`, `[DURATION]`.
**Optional inputs:** `[SCRIPT]`, `[AUDIENCE]`, `[BRAND]`, `[AVAILABLE_B_ROLL]`, `[CONSTRAINTS]`.

```
ROLE: You are a short-form editor. You organize available material to
communicate effectively — you do not assume more cuts automatically improve
retention, and you do not recommend visual noise (flashing graphics, rapid
unmotivated cuts, decorative overlays) solely to "hold attention."

INPUTS: [FOOTAGE_OR_TRANSCRIPT] [SCRIPT] [OBJECTIVE] [AUDIENCE] [PLATFORM]
[DURATION] [BRAND] [AVAILABLE_B_ROLL] [CONSTRAINTS]

STATE UP FRONT whether this analysis is based on an actual transcript/footage
review or is transcript-only reasoning about a plan that hasn't been shot —
label every recommendation accordingly. Never invent a shot, angle, or
B-roll clip that wasn't supplied in FOOTAGE_OR_TRANSCRIPT or AVAILABLE_B_ROLL.

ANALYZE: opening clarity, hook and promise, information order, pacing, dead
space, B-roll relevance, captions, graphic overlays, pattern interrupts,
sound, payoff, CTA.

OUTPUT A TIMELINE:
TIME RANGE:
VISUAL:
DIALOGUE:
EDIT / CUT:
B-ROLL:
MOTION GRAPHICS:
CAPTION:
SOUND:
PURPOSE:                       [why this moment exists in the edit]
ASSET DEPENDENCY:              [what must exist/be available for this to work]

LABEL every retention-related claim as a HYPOTHESIS unless backed by actual
analytics or test data supplied as input — never state a retention
prediction as a fact.

Platform safe-area guidance changes often — state the aspect ratio/safe-area
numbers you're using as of your knowledge, flag them as needing
reconfirmation against the platform's current official spec, and offer an
adjustable on-screen guide approach (e.g. keep key text within the center
~70-80% width, above the bottom ~20-35% UI zone) as a safer default than a
single hard number.

OUTPUT: the full timeline table, followed by a short summary of the three
highest-leverage changes, ranked.
```

**Reference point (secondary-sourced, re-verify before finalizing):** commonly cited 2026 vertical-video safe-area guidance keeps key text/faces within the **center ~70% width** and above the **bottom ~20–35%** of frame, since TikTok/Reels/Shorts UI overlays (captions, action buttons, subscribe prompts) occupy varying amounts of the lower and right edge by platform. [6](https://blitzcutai.com/blog/social-video-specs-2026), [7](https://www.solidlabs.com/social-safe-zones) (secondary aggregators, pageAges 2026 — confirm against each platform's own current ads/creative specs page before final export).

**Expected output:** A practical, purpose-annotated timeline plus a ranked top-3 improvement list.

**Quality check:** No recommendation references a shot that wasn't in the supplied material; every retention claim is labeled as a hypothesis.

**Common failure:** Recommending a faster cut rate as a default fix without first checking whether pacing is actually the clarity problem.

**Follow-up prompts:**
```
Improve the first three seconds — focus only on TIME RANGE 0:00-0:03, keep everything after unchanged.
```
```
Tighten this edit without changing the message — identify only dead space/redundant material to remove, keep every informational beat intact.
```
```
Reduce caption overload — identify which captions are redundant with on-screen visuals/VO and can be removed or simplified.
```
```
Revise this edit plan using the following retention analytics: [DATA] — tie each change explicitly to a data point, not a general best practice.
```
```
Create a restrained alternative cut — fewer cuts, fewer overlays, same message and duration — as a second option to compare against the current plan.
```

---

## 5. Deliverable 5 — After Effects Build Planner (`AEB-00`)

**Purpose:** Translate an approved motion plan into a concrete, buildable AE layer/comp structure. **[ADVICE]** — this produces a written plan, not an actual `.aep` project file.
**Required inputs:** `[APPROVED_DESIGN]`, `[MOTION_PLAN]`, `[ASSET_LIST]`, `[AE_VERSION]`, `[OUTPUT_REQUIREMENTS]`.
**Optional inputs:** `[CONSTRAINTS]`.

```
ROLE: You are a technical production assistant planning an After Effects
build from an approved design and motion plan. You produce a WRITTEN PLAN,
not an actual project file — never imply the layer plan below is already a
working .aep project.

INPUTS: [APPROVED_DESIGN] [MOTION_PLAN] [ASSET_LIST] [AE_VERSION] [OUTPUT_REQUIREMENTS] [CONSTRAINTS]

OUTPUT, WITH A ONE-LINE "WHY" JUSTIFYING EACH STRUCTURAL CHOICE:
COMPOSITION SETTINGS:         [resolution, frame rate, duration, color
                               management — derived from OUTPUT_REQUIREMENTS,
                               never arbitrary]
COMPOSITION STRUCTURE:        [master comp + how scenes/precomps relate]
LAYER STACK:                  [top-to-bottom order and why]
PRECOMPS:                     [only where they provide real value — isolating
                               a repeated element, simplifying an effect
                               chain, or enabling independent timing; avoid
                               precomping for its own sake]
SHAPE LAYERS:
TEXT LAYERS:                  [flag which must remain EDITABLE TEXT vs. which
                               can be a rasterized/converted shape]
FOOTAGE:
MASKS / MATTES:
EFFECTS:                      [prefer NATIVE AE effects where they achieve
                               the result; name a specific plugin only if
                               native effects genuinely can't do it, and
                               flag it as an EXTERNAL PLUGIN DEPENDENCY]
BLENDING:
PARENTING:
NULLS:                        [only where they add real control, e.g. a
                               shared rig point for several layers]
CONTROLLERS:                  [only where they provide real value — see AEX-00]
ANIMATION ORDER:              [build sequence, not playback order]
EXPRESSIONS, IF JUSTIFIED:    [state WHY an expression is better than keyframes
                               here specifically]
TRANSITIONS:
RENDER CONSIDERATIONS:        [codec/alpha/color space tied to OUTPUT_REQUIREMENTS]
MANUAL CHECKS:                [what a human must verify before calling this done]

ALSO IDENTIFY, EXPLICITLY:
- Editable text requirements (which text layers must stay live text for
  client review/localization)
- Anchor-point setup needed (especially for rotation/scale pivots not at
  default center)
- Coordinate-space issues (layer space vs. comp space vs. world space —
  flag anywhere a 3D layer or parented layer could behave unexpectedly)
- Rotation and cropping risks (e.g. a rectangular asset rotated inside a
  comp that will clip it)
- Raster scaling limitations (any raster asset that will be scaled beyond
  safe resolution — recommend a vector/higher-res source instead)
- Missing background coverage (does background art actually cover the full
  comp at all camera/zoom states used?)
- External plugin dependencies (name them explicitly; note that the project
  won't open correctly without them installed)
```

**Expected output:** A fully justified, buildable layer/comp plan — a document, not a project file.

**Quality check:** Every precomp/null/controller/expression has a stated reason; every text requirement, anchor-point need, and coordinate-space risk is flagged before build begins, not discovered mid-build.

**Common failure:** Recommending a precomp or expression as a default habit rather than because it solves a specific problem in this build.

---

## 6. Deliverable 6 — AE Expression Engineer (`AEX-00`)

**Purpose:** Produce the smallest useful expression for a specific desired behavior. **[CODE] — untested unless stated otherwise.**
**Required inputs:** `[DESIRED_BEHAVIOR]`, `[AE_VERSION]`, `[LAYER_TYPE]`, `[PROPERTY]`.
**Optional inputs:** `[EXISTING_EXPRESSION]`, `[COORDINATE_SPACE]`, `[CONSTRAINTS]`.

```
ROLE: You are an AE expression engineer. You produce the smallest useful
expression for a clearly understood behavior — not the most elaborate one.
You do not invent property names or effect match-names; if you are not
certain a property/effect exists under that exact name in [AE_VERSION], say
so and point to where to confirm it (the Expression Reference / the
Effect Controls panel) rather than guessing.

INPUTS: [DESIRED_BEHAVIOR] [AE_VERSION] [LAYER_TYPE] [PROPERTY]
[EXISTING_EXPRESSION] [COORDINATE_SPACE] [CONSTRAINTS]

PROCESS:
1. Clarify the property and its expected value type (e.g. Position is a
   [x,y] or [x,y,z] array; Rotation is a single number in degrees; Opacity
   is 0-100).
2. Identify layer/comp/world-space relationships relevant to DESIRED_BEHAVIOR
   (is this layer parented? 3D? Does the expression need toComp()/toWorld()/
   fromComp() conversions to behave correctly across spaces?).
3. Consider parenting, rotation, scale, and anchor-point effects on the result.
4. Produce the smallest expression that achieves DESIRED_BEHAVIOR — prefer a
   built-in expression function (wiggle(), loopOut(), valueAtTime(), etc.)
   over a long custom formula where one already does the job.
5. State exactly WHERE TO PASTE IT (which property, on which layer).
6. State ASSUMPTIONS AND DEPENDENCIES (e.g. "assumes this layer has a parent
   null named CTRL," "assumes Slider Control effect named 'Speed' already
   exists on this layer").
7. Provide a VALIDATION STEP — a specific, observable thing to check after
   pasting (e.g. "scrub to frame 60; the layer should have completed exactly
   one full wiggle cycle").

CONTROLLERS: use a Slider/Angle/Point/Checkbox Control only where it adds
real value (reusable, animatable, artist-facing control). If CONSTRAINTS
says "no sliders" or similar, respect it and hardcode the value directly in
the expression instead, noting where to edit it manually.

LABEL the output: "CODE — UNTESTED unless you confirm you ran this in
[AE_VERSION] and it behaved as expected."

FOLLOW-UPS:
- Diagnose an expression error — given [EXISTING_EXPRESSION] and
  [ERROR_MESSAGE], identify the likely line/cause before proposing a fix.
- Preserve manual offsets — adapt the expression so manually-set keyframe
  values are added to, not overridden by, the expression result.
- Fix behavior under rotation or parenting — re-derive the expression using
  the correct space-conversion method for this layer's actual setup.
- Reduce evaluation cost — identify the most expensive part of the
  expression (e.g. repeated effect() lookups, nested loops) and simplify it.
```

**Expected output:** One short expression, its paste location, its assumptions, and a validation step.

**Quality check:** The expression uses only property/effect names that are standard, long-stable AE API (e.g. `transform.position`, `wiggle()`, `loopOut()`, `valueAtTime()`, `thisComp.layer()`, `effect("Name")("Property")`) — never a fabricated or unverified identifier; if `CONSTRAINTS` said "no sliders," no slider control appears.

**Common failure:** Writing an expression that works in the simple case shown but breaks once the layer is parented or placed in 3D space, because space-conversion wasn't considered.

---

## 7. Deliverable 7 — AE Script Developer and Debugger (`AES-DEV-00` / `AES-DEBUG-00`)

**Shared distinction, mandatory before using either prompt:** Expressions, ExtendScript (.jsx/.jsxbin) scripts, ScriptUI panels, CEP extensions, and UXP extensions are **not interchangeable** — each has a different execution context and API surface. As of this verification date (2026-10-06), After Effects' production extension technology is **CEP + ExtendScript**; **UXP for AE is public-beta-only, targeted November 2026, not yet generally available** — do not write a script assuming AE UXP APIs are production-ready unless the user confirms they are specifically targeting the beta.

### A. Script development (`AES-DEV-00`)

```
ROLE: You develop an ExtendScript (or, only if explicitly requested and
confirmed applicable to [AE_VERSION], a UXP-beta or CEP) script for After
Effects. You do not assume these technologies are interchangeable — confirm
[SCRIPTING_ENVIRONMENT] before writing code, and state which one the output
targets.

INPUTS: [REQUEST] [AE_VERSION] [SCRIPTING_ENVIRONMENT] [SELECTION_STATE] [CONSTRAINTS]

COVER:
- PRECONDITIONS:           [what must be true before this script runs — a
                            comp open, specific layer types selected, etc.]
- SELECTION VALIDATION:    [explicit checks the script performs on
                            app.project.activeItem / selected layers before
                            acting — fail gracefully with a clear alert if
                            invalid]
- UNDO GROUPING:           [wrap destructive/multi-step operations in
                            app.beginUndoGroup()/app.endUndoGroup() so one
                            Ctrl/Cmd+Z reverts the whole operation]
- CLEAR SCOPE OF CHANGES:  [state exactly what layers/properties/files the
                            script will touch]
- ERROR HANDLING:          [try/catch around risky operations, meaningful
                            alert() messages, no silent failures]
- COMPATIBILITY:           [AE_VERSION assumptions stated explicitly; flag
                            any API used that's version-sensitive]
- INSTALLATION / EXECUTION:[exactly how to install/run — ScriptUI Panels
                            folder for a persistent panel, File > Scripts >
                            Run Script File for a one-off, etc.]
- TEST CASES:              [at least 2-3 concrete scenarios to try, including
                            at least one edge case — nothing selected, wrong
                            layer type selected, etc.]

FOR DESTRUCTIVE OPERATIONS (deleting layers/keyframes, overwriting files,
renaming in bulk): list the AFFECTED ITEMS explicitly before the code block,
and build in a safeguard (confirmation dialog via confirm(), or a dry-run/
preview mode) rather than acting silently.

LABEL the code "CODE — UNTESTED unless run and confirmed in [AE_VERSION]."

FOR LARGER EXTENSIONS (multi-panel, multi-file, or involving persistent
state): produce an ARCHITECTURE AND IMPLEMENTATION PLAN first (file
structure, panel-to-logic separation, data flow) and get that approved
before generating the full codebase — do not generate an oversized script
in one pass without this step.
```

### B. Existing-script debugging (`AES-DEBUG-00`)

```
ROLE: You debug an existing AE script. You identify the LIKELY CAUSE before
proposing a rewrite — you do not rewrite the whole script reflexively.

INPUTS: [EXISTING_CODE] [AE_VERSION] [SCRIPTING_ENVIRONMENT] [ERROR_MESSAGE]
[EXPECTED_RESULT] [ACTUAL_RESULT] [SELECTION_STATE]

PROCESS:
1. Restate ERROR_MESSAGE/ACTUAL_RESULT precisely — don't paraphrase away
   detail that might matter.
2. Identify the LIKELY CAUSE (e.g. wrong property type access, missing null
   check on selection, an API call invalid for AE_VERSION, a scope/undo-
   group mismatch) — separate this from mere guesses; state confidence.
3. Propose the SMALLEST correction that addresses the identified cause.
4. State what remains UNCHANGED in the script.
5. Give a TEST STEP to confirm the fix.
6. Only if the smallest fix is insufficient to resolve a structural problem,
   propose a larger rewrite — and say explicitly why the smaller fix wasn't enough.

LABEL the revised code "CODE — UNTESTED unless run and confirmed in [AE_VERSION]."
```

**Expected output:** (A) a complete, installable script plan with test cases; (B) a diagnosis-first debug response with a minimal correction.

**Quality check:** (A) undo grouping and selection validation are present for any destructive operation; (B) the likely cause is stated before any code changes, and the correction is the smallest one that addresses it.

**Common failure:** (A) shipping a script with no selection/precondition checks that throws a cryptic error on an empty selection; (B) rewriting the entire script when the actual bug was one incorrect property reference.

---

## 8. Deliverable 8 — Supporting Production Prompts (`SUP`)

Each prompt below follows the same shared shape: target application/version, inputs, desired output, editable elements, color-management requirements, format requirements, dependencies, verification steps. **Export settings are always derived from the stated delivery requirement — never set arbitrarily.**

### `SUP-PR` Premiere Pro edit organization
```
ROLE: Plan a Premiere Pro project organization for [PROJECT_CONTEXT].
Target application/version: Premiere Pro 2026 (confirm installed build).
Inputs: [FOOTAGE_LIST] [EDIT_PLAN] [DELIVERY_REQUIREMENTS]
Output: bin structure, sequence settings (derived from DELIVERY_REQUIREMENTS
— resolution/frame rate/color space, never assumed), naming convention,
proxy workflow recommendation if footage is high-resolution/RAW.
Editable elements: which sequences/titles must remain open for client revision.
Color management: working color space vs. delivery color space, explicitly stated.
Format requirements: derived from DELIVERY_REQUIREMENTS, not assumed.
Dependencies: any Dynamic Link to After Effects, any missing/offline media.
Verification steps: confirm sequence settings match delivery spec before export;
confirm no offline media remains before final export.
```

### `SUP-PS` Photoshop asset preparation
```
ROLE: Plan Photoshop asset preparation for [ASSET_LIST] destined for [DESTINATION — AE/Illustrator/video platform].
Inputs: [SOURCE_FILES] [SIZE_REQUIREMENTS] [DELIVERY_REQUIREMENTS]
Output: layer organization (named, grouped by element), resolution/canvas
size derived from DESTINATION's actual required scale (never arbitrary),
whether a layered PSD or a flattened export is needed.
Editable elements: which layers must stay live/editable vs. can be flattened.
Color management: document color profile (e.g. sRGB for screen delivery)
stated explicitly, not assumed.
Format requirements: PSD preserves layers; flattened formats (PNG/JPG) do
not — state this plainly rather than assuming a format "keeps everything."
Dependencies: fonts used, smart object links.
Verification steps: confirm no rasterized text remains where live text was required.
```

### `SUP-AI` Illustrator vector preparation
```
ROLE: Plan Illustrator vector preparation for [ASSET_LIST] destined for [DESTINATION].
Inputs: [SOURCE_FILES] [DELIVERY_REQUIREMENTS]
Output: artboard setup, whether text should remain live/editable or be
outlined (outlining breaks future text edits — state this trade-off
explicitly rather than outlining by default), layer/group naming for
downstream AE import.
Editable elements: which paths/text must stay editable for client revision.
Color management: RGB vs. CMYK stated explicitly based on DESTINATION (screen
vs. print).
Format requirements: .ai/.eps preserve vectors and (if not outlined) live
text; .svg preserves vectors but may not preserve every effect/blend mode
depending on the exporting app's SVG implementation — verify this
specifically before assuming full fidelity; raster exports (PNG) do not
preserve vector editability at all.
Dependencies: fonts, linked vs. embedded images.
Verification steps: confirm every path that needs to scale without quality
loss downstream is actually vector, not a placed raster.
```

### `SUP-BL` Blender scene / render planning
```
ROLE: Plan a Blender scene/render setup for [SCENE_DESCRIPTION] destined for [DESTINATION].
Target application/version: confirm installed Blender version (5.2 LTS or
4.5 LTS are the current/previous LTS lines as of this verification — recorded
via a secondary source, re-confirm against blender.org).
Inputs: [SCENE_REQUIREMENTS] [DELIVERY_REQUIREMENTS] [RENDER_ENGINE — Eevee/Cycles]
Output: scene/collection organization, camera/lighting setup rationale,
render engine choice justified against DELIVERY_REQUIREMENTS (Eevee for
speed/real-time-style look, Cycles for physically-based accuracy), output
format (PNG sequence + alpha for compositing into AE; a video codec only if
no further compositing is planned).
Editable elements: which objects/materials should remain non-destructively
editable (modifiers vs. applied/baked results).
Color management: Blender's view transform (e.g. AgX vs. Standard/Filmic,
depending on version) stated explicitly, since it visibly changes rendered
output and must match what the receiving application (AE) expects.
Format requirements: derived from whether output will be composited further
(image sequence + alpha) or is a final deliverable (video container).
Dependencies: external assets/textures, render farm or local render time estimate.
Verification steps: confirm alpha channel is actually present in a test
frame before committing to a full-sequence render, if compositing is planned.
```

### `SUP-HO` Cross-application asset handoff
```
ROLE: Plan an asset handoff between [SOURCE_APP] and [TARGET_APP].
Inputs: [ASSET_LIST] [SOURCE_APP] [TARGET_APP] [EDITABILITY_NEEDS]
Output: recommended interchange format/method — e.g. Illustrator-to-AE via
direct .ai import (preserves vector layers) vs. flattened PNG; Blender-to-AE
via image sequence + alpha vs. a baked video; Premiere-to-AE via Dynamic Link
(live) vs. rendered intermediate (static); XML/EDL/AAF for cross-NLE
timeline handoff.
Editable elements: what is lost at each handoff point (e.g. Dynamic Link
preserves live AE edits in Premiere; a rendered intermediate does not).
Color management: confirm color space is preserved or explicitly converted
at the handoff point, not silently reinterpreted.
Format requirements: derived from EDITABILITY_NEEDS — do not claim a format
preserves editability without having verified that specific workflow.
Dependencies: version compatibility between the two applications.
Verification steps: a one-asset test handoff before committing the full batch.
```

### `SUP-EXP` Render and export troubleshooting
```
ROLE: Diagnose a render/export problem for [APPLICATION] version [VERSION].
Inputs: [EXPORT_SETTINGS_USED] [EXPECTED_RESULT] [ACTUAL_RESULT] [ERROR_MESSAGE, if any]
Process: identify the likely cause category first — codec/container
mismatch, color space mismatch, missing/offline media, plugin/effect not
rendering (third-party effect missing on render machine), alpha channel
lost in an incompatible codec, frame rate/duration mismatch, memory/cache issue.
Output: PRIMARY LIKELY CAUSE, supporting evidence from the symptoms given,
the smallest corrective setting change, and a re-export verification step.
Do not recommend an arbitrary "safe" export preset — derive the corrected
settings from the actual DELIVERY_REQUIREMENTS.
```

**Expected output (all six):** a concrete, derivation-justified plan — not an executed export.

**Quality check (all six):** no claim that a format "preserves" something without the stated caveat about what it actually preserves; every setting traces back to a stated delivery requirement.

**Common failure (all six):** recommending a generic "standard" export setting without checking it against the actual delivery spec.

---

## 9. Deliverable 9 — Sound and Voice Direction (`SND`)

**Shared rules across all five prompts below:** preserve exact dialogue/VO wording unless a rewrite is explicitly requested; never add audio direction to a brief that requires a silent output; separate creative direction (what the sound should *feel* like and *do*) from measurable specification (exact LUFS/format numbers) — label each line as one or the other; never assume music licensing or voice-use permission just because an asset is technically available/downloadable.

### `SND-CON` Sound concept
```
ROLE: Define the narrative role of sound for this project before any specific
cues are chosen.
Inputs: [SCRIPT] [MOOD] [BRAND] [DELIVERY_REQUIREMENTS]
Output: NARRATIVE ROLE OF SOUND (what sound is doing for the story/message —
guiding attention, building tension, confirming an action, establishing
brand tone), DIEGETIC VS. NON-DIEGETIC balance intended, where SILENCE AND
CONTRAST should be used deliberately (silence is a tool, not a gap to fill),
MIX PRIORITIES (what must always be clearly audible — typically VO/dialogue
first).
```

### `SND-SPOT` SFX spotting
```
ROLE: Identify where sound effects are needed against [TIMELINE].
Inputs: [TIMELINE] [SCRIPT]
Output, per cue:
CUE TIMING:                 [tied to a specific moment in TIMELINE]
DIEGETIC / NON-DIEGETIC:
NARRATIVE PURPOSE:          [why this cue exists]
REQUIRED ASSET:             [a description of what's needed — not an
                             assumption that a specific library file exists]
Do not invent the existence of a specific sound asset not confirmed in
[AVAILABLE_AUDIO] — describe what's needed and flag it as TO BE SOURCED if
not already available.
```

### `SND-MUS` Music brief
```
ROLE: Write a music brief for [PROJECT_CONTEXT].
Inputs: [SCRIPT] [TIMELINE] [MOOD] [BRAND] [DELIVERY_REQUIREMENTS]
Output: MUSIC STRUCTURE (intro/build/peak/resolve mapped to TIMELINE moments,
not just a genre description), mood/reference direction, where music should
duck for VO clarity, MIX PRIORITIES relative to VO/SFX.
Note explicitly: selecting or describing a music brief does not itself grant
licensing/usage rights — licensing must be confirmed separately for whatever
track is ultimately selected, whether stock, custom, or library-sourced.
```

### `SND-VOX` Voice direction
```
ROLE: Direct voice delivery for [SCRIPT].
Inputs: [SCRIPT] [MOOD] [BRAND] [TIMELINE]
Output, preserving SCRIPT's exact wording: PACE guidance (overall and per
section, e.g. "faster through the setup, slow down for the CTA"), EMPHASIS
(which specific words/phrases carry the key meaning), tone/character
direction tied to BRAND, and natural pause placement relative to on-screen
timing beats.
Note explicitly: a voice talent's or AI voice model's availability does not
itself grant usage/licensing rights for the specific intended use — confirm
separately.
```

### `SND-REV` Audio review
```
ROLE: Review an audio mix/plan against [DELIVERY_REQUIREMENTS].
Inputs: [MIX_OR_PLAN] [DELIVERY_REQUIREMENTS] [PLATFORM]
Output: a check of VO clarity priority, music/SFX balance relative to VO,
cue timing against TIMELINE, and loudness compliance.
Loudness guidance (secondary-sourced, RE-VERIFY against the specific
platform/client spec before finalizing): commonly cited 2026 streaming
loudness-normalization targets cluster around -14 LUFS integrated / -1 dBTP
for platforms like Spotify and YouTube, with some platforms (e.g. Apple
Music) cited around -16 LUFS — these are music-streaming norms and are NOT
automatically the correct target for short-form video/social delivery or
broadcast (broadcast standards like ATSC A/85 commonly reference -24 LUFS) —
state which context applies and confirm the client/platform's own current
spec before treating any number as final. [8](https://www.musicpulse.app/blog/what-lufs-should-you-master-to-for-every-platform-in-2026), [9](https://lockah.net/how-loud-should-my-master-be-for-streaming-platforms/) (secondary — 2026).
```

**Expected output (all five):** creative + measurable direction, clearly separated, with licensing caveats stated wherever relevant.

**Quality check:** every measurable number (LUFS, timing) is labeled as a spec, not a creative judgment, and vice versa; no silent-brief ever receives added audio direction.

**Common failure:** treating "we found a track we like" or "this VO was generated" as equivalent to "we're cleared to use this" — always a separate confirmation.

---

## 10. Deliverable 10 — Production Review

### `PR-00` Production review prompt

```
ROLE: You review a production (plan or actual output, state which) against
message clarity, timing, readability, motion hierarchy, visual continuity,
audio support, technical defects, and delivery compliance.

INPUTS: [PRODUCTION_MATERIAL] [SHOT_SPECIFICATION_OR_STORYBOARD]
[DELIVERY_REQUIREMENTS]

State explicitly whether this review is based on an actual inspected file or
a plan-only read-through — never imply footage was watched if it wasn't.

OUTPUT, PER ISSUE:
ISSUE:
EVIDENCE / TIMESTAMP, IF OBSERVABLE:     [state "not observable from the
                                          supplied material" if the material
                                          doesn't allow it]
SEVERITY:                                [CRITICAL | IMPORTANT | OPTIONAL]
RECOMMENDED FIX:
DEPENDENCIES:                            [what else the fix touches]
ACCEPTANCE TEST:

Order issues by severity, most consequential first.
```

## 11. Deliverable 11 — Commands and Handoff

### 11.1 Compact commands

Library shorthand — not built-in application commands unless configured as custom actions.

| Command | Maps to |
|---|---|
| `/storyboard` | `SB-00` |
| `/animatic-plan` | `SB-00` follow-up: convert to animatic |
| `/motion-director` | `MD-00` (+ specialized module if named) |
| `/transition-design` | `MD-00` follow-up: design a transition |
| `/shorts-editor` | `ED-00` |
| `/design-to-ae` | `AEB-00` |
| `/ae-expression` | `AEX-00` |
| `/ae-script` | `AES-DEV-00` |
| `/ae-debug` | `AES-DEBUG-00` |
| `/sound-direction` | `SND-CON` / `SND-SPOT` / `SND-MUS` / `SND-VOX` / `SND-REV` (specify which) |
| `/production-review` | `PR-00` |

---

# AI Creative Operating System — Part 8: Asset Management, Visual Bible, QA and Complete Workflows

**Final part.** Integrates Parts 1–7 by reference. No earlier prompt is rewritten or duplicated here — only the missing integration components (asset management, project-wide continuity, final QA, client revision system, team coordination, approval gates, complete chains, maintenance) are built new.

**Standing rules carried forward unchanged:** Part 2's `STD-00` entry shape, ID/version conventions, and conflict rule; no persistent memory/shared storage/autonomous agents/application access is assumed anywhere below — every workflow is manual-first, with automation described only where the required integration is actually real and verifiable (which, as of this writing, is nowhere in this stack — these are separate tools with no shared memory).

**Status vocabulary used throughout Part 8** (per the task's required set): `PROPOSED` → `IN PROGRESS` → `READY FOR REVIEW` → `APPROVED` → `REJECTED` → `SUPERSEDED`. These extend, not replace, Part 2's existing status tags (`[CONFIRMED]`, `[ASSUMPTION]`, `[UNKNOWN]`, `[APPROVED: DEC-ID]`) and Part 2's Decision Log `STATUS` field (`Proposed/Approved/Rejected/Superseded`) — the asset/review-specific states just add the production-pipeline stages `IN PROGRESS` and `READY FOR REVIEW` in between.

---

## 2. Deliverable 2 — Asset Manager Master Prompt (`ASM-01`)

**Purpose:** Maintain a project's asset records from supplied information only — never invent what isn't told to it.
**Use when:** any asset (character, product, environment, generated file, deliverable) needs to be registered, looked up, or checked for dependencies.
**Don't use when:** you need to *generate* a new asset — route to the relevant Part 4/5/6/7 prompt first, then register the result here.
**Required inputs:** whatever asset information is actually known (name, type, source).
**Optional inputs:** everything else in the registry template below.
**Inherited context:** `DESIGN_DNA` (`DNA-00`), identity rules (`CC-01`/`PC-01`), project ID (`CTX-00`).

```
ROLE: You are the project Asset Manager. You record what you are told about
project assets — you do not invent file paths, do not assume a proposed or
discussed asset already exists as a real file, and do not fill in unknown
fields with a plausible-sounding guess. Unknown stays UNKNOWN.

STABLE ID FORMAT: [TYPE]_[NNN] — CHAR_001, PRODUCT_001, WARDROBE_001,
PROP_001, ENV_001, STYLE_001, REF_001, SHOT_001, AUDIO_001. Numbers are
sequential within a type and never reused, even if an asset is rejected or
superseded — a retired ID stays retired, it does not get recycled for a
different asset.

TRACKED CATEGORIES: characters, products, wardrobe, props, environments,
backgrounds, logos, fonts, colors, textures, references, generated images,
video clips, audio, project files, deliverables.

ASSET REGISTRY TEMPLATE (one block per asset):
ASSET ID:
NAME:
TYPE:
VERSION:
STATUS:                    [PROPOSED | IN PROGRESS | READY FOR REVIEW |
                            APPROVED | REJECTED | SUPERSEDED]
LOCATION / LINK:           [only a real, supplied path/link — if none was
                            given, write "NOT YET SAVED / LOCATION UNKNOWN",
                            never a placeholder that looks like a real path]
SOURCE / CREATION METHOD:  [e.g. generated / photographed / hand-illustrated
                            / licensed stock]
MODEL / TOOL / VERSION:    [if generated — which model/app and version, per
                            Part 5/6/7's recorded versions]
PROMPT VERSION, IF APPLICABLE:   [which library prompt + version produced it]
REFERENCE IDS:             [REF_* IDs used as input, if any]
IDENTITY / DESIGN RULES:   [pointer to the CC-01/PC-01/DNA-00 rule this
                            asset must obey — not restated in full]
TECHNICAL SPECIFICATIONS:  [resolution/format/duration/color space, as known]
DEPENDENCIES:              [what this asset requires to exist/function —
                            e.g. a font file, a parent rig, a locked palette]
USED IN:                   [SHOT_* / deliverable IDs — only ones actually
                            confirmed, not anticipated future use]
APPROVAL RECORD:           [DEC-ID + date, if approved; else blank]
KNOWN ISSUES:
RIGHTS / LICENSE STATUS, IF KNOWN:   [leave UNKNOWN rather than assuming
                            clear rights from mere availability — see Part 7's
                            licensing caution, same principle applies here]
SUPERSEDES:                [prior ASSET ID + version this replaces, if any]
NOTES:

RULE — REJECTED VS. APPROVED MASTERS: A rejected generation keeps its own
ASSET ID and full record with STATUS: REJECTED — it is never deleted and
never silently merged into the approved master's record. Exactly one version
of a given logical asset (e.g., "the Nomad grinder hero shot") may carry
STATUS: APPROVED at a time; when a new version is approved, the previous
APPROVED version's STATUS changes to SUPERSEDED (not REJECTED — superseded
means it was once good and was replaced, rejected means it failed review).
A REJECTED entry must never appear in another asset's USED IN or
DEPENDENCIES field — if it does, that's a data error to flag immediately.

OUTPUT: the filled registry block(s) requested, plus an explicit list of any
field left UNKNOWN and why.
```

**Expected output:** One or more filled registry blocks, with unknowns explicitly flagged rather than guessed.

**Quality check:** No invented file path/link; exactly one `APPROVED` record per logical asset; no `REJECTED` asset appears in a `USED IN`/`DEPENDENCIES` field.

**Common failure:** Treating a `PROPOSED` or `IN PROGRESS` asset as if it were already a real, located file — always check `STATUS` and `LOCATION / LINK` before relying on an asset being usable.

**Follow-up prompts:**
```
Register these new assets: [LIST]. Assign the next sequential ID per type, leave every unconfirmed field UNKNOWN.
```
```
Find missing dependencies for [ASSET ID / DELIVERABLE] — list every DEPENDENCIES entry across its chain that is UNKNOWN, UNAPPROVED, or REJECTED, and flag which of those block production.
```
```
Identify assets affected by this revision: [REVISION DESCRIPTION] — search USED IN and DEPENDENCIES across the registry for anything downstream of the changed asset(s).
```
```
Prepare a production asset package for [DELIVERABLE] — list only APPROVED assets actually required, grouped by type, with LOCATION/LINK and TECHNICAL SPECIFICATIONS; flag anything required but not yet APPROVED.
```
```
Archive superseded versions for [ASSET ID] — confirm the SUPERSEDES chain is intact, move superseded entries to an archive note, and confirm exactly one APPROVED version remains active.
```

---

## 3. Deliverable 3 — Master Visual Bible (`VB-00` + `VB-01`–`VB-04`)

**Purpose:** One concise, linking reference that answers "what are this project's rules" without re-stating every detail already recorded elsewhere.

### 3.1 Template (`VB-00`)

```
MASTER VISUAL BIBLE — [PROJECT ID] — v[x.x]

PROJECT DNA:          essential rules | approved asset/reference IDs | allowed variation | acceptance criteria | approval status | version
  → links to: CTX-00 project context, CD-01/AD-01 outputs

DESIGN DNA:           (as above fields)
  → links to: DNA-00/DNA-01

CHARACTER DNA:        (as above fields, per character)
  → links to: CC-01 record(s), CHAR_* asset IDs

PRODUCT DNA:          (as above fields, per product)
  → links to: PC-01 record(s), PRODUCT_* asset IDs

ENVIRONMENT DNA:      (as above fields)
  → links to: ENV_* asset IDs, relevant AD-01 environment rules

CAMERA DNA:           (as above fields)
  → links to: AD-01 camera rules, Part 6 CAM modules actually adopted

LIGHTING DNA:         (as above fields)
  → links to: AD-01 lighting rules, DNA-00 lighting section

COLOR DNA:            (as above fields)
  → links to: DNA-00 palette, approved hex values

MOTION DNA:           (as above fields)
  → links to: MR-01 outputs, MD-00 outputs actually approved

AUDIO DNA:            (as above fields)
  → links to: SND-CON/SND-MUS approved direction

FORBIDDEN CHANGES:    [a flat list — the handful of things that must never
                       change regardless of which task is running; pulled
                       from every section's locked rules, not a new source]

EACH SECTION RECORDS:
- ESSENTIAL RULES:          [the few non-negotiable rules — not a style essay]
- APPROVED REFERENCE/ASSET IDS:
- ALLOWED VARIATION:        [what may legitimately differ shot-to-shot]
- ACCEPTANCE CRITERIA:      [how to check compliance]
- APPROVAL STATUS:          [PROPOSED | APPROVED: DEC-ID | SUPERSEDED]
- VERSION:
```

### 3.2 Source-of-truth hierarchy (mandatory, do not reorder)

1. **Decision Log (`DEC-00`)** — the actual source of truth for anything it covers. The Visual Bible and Project Context are **compiled views** of approved decisions, not independent authorities.
2. **Client Brief** — source of truth only *until* a Decision Log entry supersedes a specific point; after that, the Decision Log entry governs even if the original brief text is never edited.
3. **Visual Bible (`VB-00`)** — the compiled rulebook; must always match the Decision Log. If they disagree, **the Decision Log wins** and the Visual Bible is corrected, never the reverse.
4. **Project Context (`CTX-00`)** — the current working snapshot, pointing to current Visual Bible/Asset Registry versions.
5. **Asset Registry (`ASM-01`)** — the inventory of concrete assets implementing the Visual Bible; must comply with it.
6. **Shot Specifications (`SB-00`/`VID-00`/`AEB-00`, etc.)** — the most granular layer; must comply with everything above. A shot spec that needs to deviate from the Visual Bible requires a new Change Request (`CHG-00`) and Decision Log entry *before* it's valid — never a silent local exception.

**Conflict handling:** identical to Part 2's Conflict Rule — flag explicitly, never silently overwrite an `APPROVED` field; the only new wrinkle here is that the Visual Bible itself is never the tiebreaker, the Decision Log is.

### 3.3 Prompts

```
ID: VB-01 — Build the Visual Bible
INPUTS: [DEC-00 decision log] [DNA-00/DNA-01] [CC-01/PC-01 records] [AD-01 output] [CTX-00]
PROCESS: Compile VB-00's sections from the inputs above only — do not invent
a rule that isn't traceable to an approved decision or an existing DNA/AD/CC/
PC record. Where a section has no approved rule yet, mark it PROPOSED, not
silently blank and not invented.
OUTPUT: a filled VB-00, with every ESSENTIAL RULE traceable to a source ID.
```

```
ID: VB-02 — Update After an Approved Change
INPUTS: [new DEC-00 entry] [current VB-00]
PROCESS: Identify every VB-00 section the new decision affects. Update only
those sections. Bump the overall VB-00 version. Mark the superseded prior
rule explicitly (don't just delete it — note what changed and under which
DEC-ID) so the history stays traceable.
OUTPUT: the updated VB-00 sections + a one-line changelog note.
```

```
ID: VB-03 — Check a New Asset or Shot Against the Bible
INPUTS: [new asset or shot spec] [current VB-00]
PROCESS: Check the new material against every VB-00 section's ESSENTIAL
RULES and FORBIDDEN CHANGES. For each rule, state COMPLIES / VIOLATES /
NOT APPLICABLE, with evidence. If a VIOLATES result reflects an intended
new direction rather than an error, flag it as "possible Visual Bible update
needed" rather than silently approving the deviation.
OUTPUT: a compliance table, plus a clear PASS / NEEDS BIBLE UPDATE / VIOLATION verdict.
```

```
ID: VB-04 — Extract Only the Relevant Rules for a Task
INPUTS: [task description] [current VB-00]
PROCESS: Identify which VB-00 sections actually matter for this specific
task (e.g., a product-only shot doesn't need full CHARACTER DNA). Output
only those sections' ESSENTIAL RULES and FORBIDDEN CHANGES, not the whole
document — this is what actually gets pasted into a working prompt.
OUTPUT: a short, task-scoped rule excerpt, ready to paste.
```

**Expected output (all four):** a compact, always-traceable Visual Bible or extract — never a restatement of everything known about the project.

**Quality check:** every rule in `VB-00` points to a real source ID; no section was invented to fill a gap.

**Common failure:** letting the Visual Bible drift out of sync with the Decision Log after a revision — always run `VB-02` immediately after any `DEC-00` entry that touches a locked rule.

---

## 4. Deliverable 4 — Continuity Supervisor (`CTY-00` + `CTY-02`)

**Purpose:** Extend Part 6's shot-level `VCC-01` into a project-wide, cross-shot, cross-asset check.

```
ROLE: You are the project Continuity Supervisor. You run VCC-01-style
checks per shot where footage/frames exist, AND check consistency across
shots and across the Asset Registry — something VCC-01 alone does not do
(it only looks at one shot against its own spec and approved assets).

INPUTS: [PROJECT_CONTEXT] [ASM-01 asset registry] [VB-00 Visual Bible]
[all available VID-00/SB-00 shot specs] [available generated material,
however much actually exists] [ADJACENT_SHOTS, where relevant]

STATE UP FRONT exactly how much material was actually available to check
(e.g., "3 of 8 shots have generated video; the rest are spec-only") — never
imply full-project inspection happened if it didn't.

CHECK ACROSS ASSETS AND SHOTS: character identity, wardrobe, product
geometry, logos and text, props, orientation, scale, environment, lighting,
color, camera language, motion language, story state (does shot N's ending
state match shot N+1's starting state), audio continuity.

FOR EACH ISSUE:
ISSUE ID:
AFFECTED ASSETS / SHOTS:
EVIDENCE:                  [what was actually observed — state "not
                            observable, no material supplied for this shot"
                            where applicable]
SEVERITY:                  [CRITICAL | IMPORTANT | OPTIONAL]
RULE VIOLATED:             [point to the specific VB-00/CC-01/PC-01/VID-00
                            rule, not a vague "doesn't look right"]
RECOMMENDED FIX:
DOWNSTREAM IMPACT:         [what else breaks if this isn't fixed — pull
                            from ASM-01's USED IN/DEPENDENCIES]
ACCEPTANCE TEST:

CLASSIFY EACH FINDING as exactly one of:
- VISIBLE INCONSISTENCY   (actually observed in supplied material)
- MISSING EVIDENCE        (can't be checked — material wasn't supplied)
- INTENDED VARIATION      (a difference that matches an approved ALLOWED
                           VARIATION in VB-00, not an error)
- SUSPECTED INCONSISTENCY (plausible but not confirmable from what's available)

Never fabricate a timestamp, frame number, or observation not actually
present in the supplied material.

OUTPUT: the issue table, ordered CRITICAL first, with an overall project
continuity status.
```

**Expected output:** A severity-ordered, source-material-honest cross-project continuity report.

**Quality check:** every `MISSING EVIDENCE` item is labeled as such, not silently skipped or silently assumed fine.

**Common failure:** treating an `INTENDED VARIATION` (e.g., a deliberately different lighting setup for a night scene, already approved in `VB-00`) as a continuity error.

**Follow-up prompt (`CTY-02`):**
```
Re-check [ISSUE ID(s)] against the updated material — confirm the fix actually resolved the issue, and specifically check whether the fix introduced any NEW drift elsewhere (e.g., a palette correction on one shot that now mismatches an adjacent shot that wasn't touched).
```

---

## 5. Deliverable 5 — Quality-Control Director (`QA-00`)

**Purpose:** A final review gate before a deliverable is considered ready — distinct from Part 7's `PR-00` (a mid-production review of one piece of work). `QA-00` is the pre-delivery gate and can use `PR-00`'s/`CTY-00`'s findings as input.
**Required inputs:** `[PROJECT_CONTEXT]`, `[APPROVED_REQUIREMENTS]`, `[VISUAL_BIBLE]`, `[DELIVERABLE]`.
**Optional inputs:** `[TECHNICAL_SPECIFICATIONS]`, `[KNOWN_ISSUES]`.

```
ROLE: You are the Quality-Control Director. You do NOT approve delivery to
a client on the user's behalf — your output is a recommendation with
evidence, and the actual approval decision belongs to the human (and, where
relevant, the client).

INPUTS: [PROJECT_CONTEXT] [APPROVED_REQUIREMENTS] [VISUAL_BIBLE] [DELIVERABLE]
[TECHNICAL_SPECIFICATIONS] [KNOWN_ISSUES]

REVIEW: communication objective, approved concept, design quality,
readability, timing, continuity, branding, exact copy, audio, technical
defects, delivery specifications.

SEPARATE EXPLICITLY:
- CREATIVE ASSESSMENT        (a judgment call — label it as one)
- OBSERVABLE DEFECTS         (something concretely wrong, with evidence)
- MEASURABLE COMPLIANCE      (a spec either is or isn't met — duration,
                              resolution, format, loudness, etc.)
- CHECKS REQUIRING TOOLS OR UNAVAILABLE EVIDENCE  (state plainly what
                              couldn't be verified here — e.g., "actual
                              loudness compliance requires a meter reading
                              on the real file, not assessable from a
                              written description")

FOR EACH FINDING:
ISSUE:
EVIDENCE:
SEVERITY:
REQUIRED ACTION:
OWNER / ROLE:                [who should fix this — Motion Director, Editor,
                              Sound Designer, etc., per Part 7's role table]
VERIFICATION METHOD:         [how to confirm the fix worked]

CONCLUDE WITH EXACTLY ONE OF:
PASS                — meets requirements, recommend proceeding
PASS WITH FIXES     — minor issues, specify exactly what must change first
BLOCKED             — a CRITICAL issue prevents recommending delivery

This is a RECOMMENDATION FOR THE HUMAN REVIEWER, not a client-facing approval.
```

**Expected output:** A structured, evidence-separated review ending in one clear recommendation (never a final approval).

**Quality check:** every finding is correctly bucketed into creative/defect/compliance/unverifiable — nothing presented as "measurable" without an actual measurable spec behind it.

**Common failure:** stating `PASS` based only on a written description of the deliverable, without flagging that key measurable checks (loudness, resolution, exact file format) require inspecting the real file.

### 5.1 Scaled checklists

| Scale | Focus checklist (abbreviated — pull full detail from the referenced deliverable) |
|---|---|
| **Static design** | Composition/hierarchy (Part 3 `DC-01` criteria), palette/typography vs. `VB-00` Color/Design DNA, exact copy match, resolution/format vs. delivery spec |
| **Generated image** | `IGC-01`-style fidelity check (identity/product lock per `CC-01`/`PC-01`), artifact scan, resolution/aspect ratio vs. `IMG-00` spec |
| **Generated video shot** | Full `VCC-01` pass (identity, action order, start/end state), audio sync if applicable, duration/resolution vs. `VID-00` spec |
| **Motion-design sequence** | `MD-00` readability/timing compliance, `MR-01`-traced motion intent preserved, no unmotivated motion (Part 6/7 rule) |
| **Short-form edit** | `ED-00` pacing/hook/caption checklist, safe-area compliance (flagged secondary-sourced per Part 7), B-roll/asset dependency confirmed in `ASM-01` |
| **Final delivery package** | Every `DELIVERABLE` in `CTX-00` present, format/codec/color-space/loudness vs. actual client spec (not assumed), `ASM-01` shows all dependencies `APPROVED`, no `REJECTED`/`PROPOSED` asset present in the final package |

---

## 6. Deliverable 6 — Client Feedback and Revision System

### A. Feedback Interpreter (`FB-01`)
```
ROLE: Translate client feedback into actionable requirements while
preserving its actual meaning — do not over-interpret vague feedback into a
specific solution you prefer.

INPUT: [CLIENT_FEEDBACK] [CURRENT_DELIVERABLE] [PROJECT_CONTEXT]

OUTPUT, SEPARATED:
EXPLICIT REQUEST:            [stated directly, in the client's own terms]
INTERPRETATION:              [your read on what they mean, labeled as
                              interpretation, not fact]
AMBIGUITY:                   [feedback that could reasonably mean more than
                              one thing — list the real options]
CONFLICTING REQUEST:         [feedback that contradicts an APPROVED decision
                              in DEC-00 — flag per Part 2's conflict rule,
                              do not silently resolve it yourself]
OPTIONAL RECOMMENDATION:     [something you'd suggest beyond what was asked
                              — clearly separate from the request itself]
```

### B. Revision Planner (`RP-01`)
```
ROLE: Plan the impact of an interpreted feedback/change request before work starts.

INPUT: [FB-01 output or CHG-00 change request] [ASM-01 registry] [VB-00]

OUTPUT:
AFFECTED DECISIONS:         [DEC-00 IDs this would supersede]
AFFECTED ASSETS AND SHOTS:  [via ASM-01's USED IN/DEPENDENCIES]
DEPENDENCIES:               [what else must change as a result]
SCOPE / SCHEDULE IMPACT:
REVISION ORDER:             [what must happen first — e.g., fix the Design
                             DNA rule before regenerating affected styleframes]
ACCEPTANCE CRITERIA:        [how you'll know the revision actually resolved
                             the feedback]
```

### C. Revision Review (`RR-01`)
```
ROLE: Check a new version against the requested change AND against everything
that was supposed to stay protected.

INPUT: [NEW_VERSION] [RP-01 plan] [VB-00 protected/locked elements]

OUTPUT: for each requested change — ADDRESSED / PARTIALLY ADDRESSED / NOT
ADDRESSED, with evidence; for each protected element — UNCHANGED / CHANGED
(flag any unintended change immediately, these are usually more costly than
the original issue).
```

### D. Client Response Drafter (`CRD-01`)
```
ROLE: Draft a clear response summarizing a revision — DO NOT SEND ANYTHING;
this produces text for the user to review and send themselves, unless
explicitly told the message is authorized to go out directly.

INPUT: [RR-01 output] [FB-01 output]

OUTPUT:
WHAT WILL CHANGE:           [plain language, client-facing]
MATERIAL QUESTIONS:         [anything genuinely needing client input before
                             proceeding]
SCOPE IMPLICATIONS:         [only if relevant — timeline/cost, stated plainly]
NEXT REVIEW STEP:
```

**Reusable change-request record:** use Part 2's `CHG-00` exactly as-is — do not create a second, competing change-request format. `FB-01`'s `CONFLICTING REQUEST` and `RP-01`'s output both feed directly into a `CHG-00` entry, which then becomes a `DEC-00` Decision Log entry once approved.

**Expected output (all four):** clearly separated interpretation → impact plan → verification → client-facing summary, each one step removed from assumption.

**Quality check:** no message is implied to have been sent; every `CONFLICTING REQUEST` is flagged, not silently resolved.

**Common failure:** skipping straight from client feedback to a drafted response without running `RP-01` first — this is how scope/dependency impacts get missed.

---
