# AI Creative Operating System — Part 2: Library Structure & Project Foundation

**Version:** 1.0
**Input used:** Part 1 handoff (generated earlier this session — Research & Model Routing, Oct 5, 2026). No external paste was provided; Part 1's verified tool names, routing decisions, and limitations are carried forward directly since they were produced in this same working session.
**Scope:** Foundation only. No Part 3–8 specialist prompts are created here.

---

## 1. Deliverable 1 — Library Architecture

### Design principle
Two roots. **Library** = reusable, versioned, project-agnostic. **Projects** = one folder per real project, holding filled instances of Library templates plus that project's own records. A prompt is never copy-pasted and modified per-model inside the Library — a **core prompt** holds all model-independent reasoning, and a thin **adapter** is added only when a specific tool needs different syntax to receive the same instruction.

### Folder structure

```
/Library/
├── 00_Core/                                  ← used across all 8 parts, model-independent
│   ├── CTX-00_Project-Context-Template.md
│   ├── VAR-00_Variable-Dictionary.md
│   ├── STD-00_Prompt-Entry-Standard.md
│   ├── MST-00_Start-Any-Project-Master-Prompt.md
│   ├── HND-00_Universal-Handoff-Template.md
│   ├── DEC-00_Decision-Log-Template.md
│   ├── APR-00_Approval-Gate-Template.md
│   ├── CHG-00_Change-Request-Template.md
│   └── BA-01_Brief-Analysis.md
│
├── 01_Research-Routing/                      ← Part 1 output (reference material, not run-able prompts)
│   ├── RD-Tool-Landscape.md
│   ├── RD-Task-Routing-Matrix.md
│   ├── RD-Starting-Stack.md
│   └── RD-Control-Limitations.md
│
├── 03_Creative-Art-Direction/                 ← Part 3 (built later)
│   ├── CD-xx_... (Creative Director)
│   ├── AD-xx_... (Art Director)
│   ├── DC-xx_... (Design Critic)
│   └── RA-xx_... (Reference Analyst)
│
├── 04_Design-Styleframes/                     ← Part 4
│   ├── DD-xx_... (Design DNA)
│   ├── SF-xx_... (Styleframes)
│   └── MEN-xx_... (Mentorship / self-review)
│
├── 05_Image-Generation/                       ← Part 5
│   └── IMG-xx_...
│
├── 06_Video-Generation/                       ← Part 6
│   └── VID-xx_...
│
├── 07_Storyboard-Motion-Edit-AE-Sound/         ← Part 7
│   ├── SB-xx_... (Storyboard)
│   ├── MO-xx_... (Motion/animation planning)
│   ├── ED-xx_... (Editing)
│   ├── AEX-xx_... (After Effects expressions/scripts)
│   └── SND-xx_... (Sound)
│
├── 08_Asset-QA-Workflows/                      ← Part 8
│   ├── ASM-xx_... (Asset management)
│   ├── CTY-xx_... (Continuity)
│   ├── QA-xx_... (Quality assurance)
│   └── WF-xx_... (Complete workflows)
│
├── _Adapters/                                  ← model-specific thin layers only, named by core ID + model
│   ├── SF-02-midjourney.md
│   ├── SF-02-nanobanana.md
│   ├── VID-04-runway.md
│   └── VID-04-kling.md
│
└── _Deprecated/                                ← retired content, never deleted
    └── CD-01_v1.0_DEPRECATED.md                (header: "Superseded by CD-01 v2.0 — reason")

/Projects/
└── [PROJECT_ID]/                               ← one folder per real project
    ├── project_context.md                      (a filled copy of CTX-00)
    ├── decision_log.md
    ├── approval_gates.md
    ├── change_requests.md
    ├── asset_register.md                       (IDs + links, not binary files)
    └── handoffs/
        ├── 001_BriefAnalyst-to-CreativeDirector.md
        ├── 002_CreativeDirector-to-ArtDirector.md
        └── ...
```

### Stable Prompt IDs
Format: **`[DOMAIN]-[NN]`** — e.g. `CD-01`, `RA-02`, `SF-05`, `BA-01`. The domain code is fixed and semantic (tied to function, not to which Part shipped it or which folder it currently sits in), so an ID never needs to change if the library gets reorganized later. Numbers are assigned sequentially within a domain and **never reused**, even after deprecation.

Domain codes defined so far: `CTX` (context/foundation), `VAR`, `STD`, `MST`, `HND`, `DEC`, `APR`, `CHG`, `BA` (brief analysis), `RD` (research/routing reference). Parts 3–8 will register: `CD`, `AD`, `DC`, `RA`, `DD`, `SF`, `MEN`, `IMG`, `VID`, `SB`, `MO`, `ED`, `AEX`, `SND`, `ASM`, `CTY`, `QA`, `WF`.

### Naming convention
File name = `[ID]_[Short-Descriptive-Name].md` — **no version number in the filename**, so links/references never break when a prompt is updated. Example: `CD-01_Concept-Brief-Translator.md`.

### Version convention
Recorded **inside** the file, in its header fields (see Prompt-Entry Standard, Deliverable 4) — format `v[MAJOR].[MINOR]`:
- **MINOR** bump (`v1.0 → v1.1`): wording/clarity edits only. Required inputs and output format are unchanged — safe for anything already relying on it.
- **MAJOR** bump (`v1.1 → v2.0`): required inputs, output format, or decision logic changed — anything downstream that expected the old behavior should be re-checked.
- Model-specific **adapters** additionally carry a `VERIFICATION DATE:` field, since tool capabilities drift (per Part 1's "model-specific — verify periodically" guidance).

### How shared templates are referenced (not duplicated)
Any prompt needing the project context, a variable list, or another prompt's output references it **by ID and location**, e.g.:
`[PROJECT_CONTEXT → see /Projects/[PROJECT_ID]/project_context.md]`
...rather than re-pasting all fields inline. This keeps one source of truth per project.

### Deprecation handling
Never delete. When a prompt is superseded:
1. Add a header to the old file: `STATUS: DEPRECATED — superseded by [NEW-ID or new version] on [date]. Reason: [...]`.
2. Move it to `/Library/_Deprecated/`.
3. Remove it from the active index (a simple one-page list of current IDs you keep at the top of `/Library/`) so you don't accidentally reuse stale logic — but it stays searchable for traceability (e.g., to understand why an older project used a different approach).

### Avoiding duplicate prompts per model
A **core prompt** (e.g., `SF-02` — a styleframe prompt-builder) contains everything model-independent: responsibility, objective, process, decision criteria, and a plain-language output description (composition, lighting, character, mood, palette). An **adapter** is created in `_Adapters/` *only when a tool has verified, materially different syntax* — e.g., Midjourney's `--oref/--ow/--sref` flags, or a JSON/hex-code block for FLUX.2. If two tools both accept the same plain-language prompt with no special syntax, **no adapter is created** — they just both use the core prompt directly.

**Example of the core+adapter relationship:**
```
SF-02_Styleframe-Prompt-Builder.md         ← core: all creative/compositional reasoning, model-agnostic
_Adapters/SF-02-midjourney.md              ← adds: --oref, --ow, --sref, --ar syntax only
_Adapters/SF-02-nanobanana.md              ← adds: reference-image upload step, consistency-phrase wording
_Adapters/SF-02-flux2.md                   ← adds: hex-code/JSON block syntax
```

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

## 3. Deliverable 3 — Variable System

### Variable dictionary

| Variable | Meaning | Expected format | Required when | Inheritable? | If missing |
|---|---|---|---|---|---|
| `[PROJECT_CONTEXT]` | Pointer to the project's full context record | File path or ID | Any task beyond a one-off, context-free question | N/A (it's the source) | Proceed context-free; flag that recommendations are generic |
| `[BRIEF]` | The raw client/self-assigned brief, as given | Free text or pasted document | Project-starting tasks (brief analysis, creative direction) | No — always re-supplied once, then captured into `[PROJECT_CONTEXT]` | Ask for it; do not proceed on assumptions alone |
| `[OBJECTIVE]` | What the deliverable needs to achieve | 1–2 sentences | Creative/strategy tasks | Yes, from `[PROJECT_CONTEXT]` | Mark `[UNKNOWN]`; ask only if it changes the approach |
| `[AUDIENCE]` | Who the work is for | Short description | Creative/strategy/tone tasks | Yes | Mark `[ASSUMPTION]` with reasoning; proceed |
| `[PLATFORM]` | Where it will run (Reels, YouTube, broadcast, etc.) | Named platform(s) | Any format/duration/aspect-ratio decision | Yes | Ask — this is usually critical |
| `[DELIVERABLE]` | What exact output is expected | Named format (e.g., "15s vertical video") | All production tasks | Yes | Ask — critical |
| `[DURATION]` | Target length | Time value | Video/animation/edit tasks | Yes | Mark `[UNKNOWN]`; ask if generation-model limits are relevant (see Part 1 duration caps) |
| `[ASPECT_RATIO]` | Target frame shape | e.g. 9:16, 16:9, 1:1 | Any visual generation or edit task | Yes | Ask — critical for framing decisions |
| `[BRAND]` | Brand name/guidelines reference | ID/link to brand doc | Any client-facing work | Yes | Mark `[UNKNOWN]`; flag risk if brand-sensitive (logo/color) work proceeds without it |
| `[STYLE]` | Visual/tonal style direction | Short description or Design DNA ID | Art direction, styleframes, image/video generation | Yes | Mark `[ASSUMPTION]`; propose options rather than inventing one silently |
| `[REFERENCES]` | Reference images/videos/links | ID list or links | Reference analysis, styleframe, image/video generation | Yes | Ask if none exist; note generation quality risk per Part 1 (drift increases without references) |
| `[SCRIPT]` | Current script/VO text | Pasted text or ID | Storyboard, editing, sound tasks | Yes | Mark `[SCRIPT STATUS: UNKNOWN/DRAFT/LOCKED]` |
| `[PRODUCT]` | Product being featured | Reference ID/link | Product-consistent asset generation | Yes | Ask — needed before generation |
| `[CHARACTER]` | Character reference(s) | Reference ID/link | Character-consistent asset generation | Yes | Ask — needed before generation |
| `[LOCATION]` | Setting/environment | Short description or reference | Styleframe/storyboard/video generation | Yes | Mark `[ASSUMPTION]` or `[FLEXIBLE]` |
| `[CAMERA]` | Camera behavior/language | Short description (e.g., "static, slight push-in") | Styleframe, video generation, shot planning | Yes | Mark `[FLEXIBLE]` unless locked by Art Director |
| `[LIGHTING]` | Lighting mood/setup | Short description | Styleframe, video generation | Yes | Mark `[FLEXIBLE]` |
| `[SHOT]` | Specific shot being worked on | Shot ID/number + description | Any single-shot task once storyboard exists | No — specific to the task | Ask which shot if ambiguous |
| `[COLOR_PALETTE]` | Locked or proposed palette | Hex codes or named palette/ID | Brand/product/styleframe work | Yes | Mark `[PROPOSED]` until approved |
| `[DESIGN_DNA]` | The project's visual rulebook (Part 4) | ID/link | Any downstream visual generation task | Yes | Flag — generation without it risks inconsistency (Part 1, Deliverable 4) |
| `[CONSTRAINTS]` | Hard limits (budget, legal, technical) | Bullet list | All tasks | Yes | Ask if plausible constraints are unknown (e.g., platform duration caps) |
| `[DEADLINE]` | When it's due | Date | Workflow/scheduling tasks | Yes | Ask — affects workflow scale |
| `[TARGET_MODEL]` | Which AI tool this prompt is destined for | Exact tool/model name | Any generation-adapter task | No — set per task | Default to the core (model-independent) prompt if unspecified |
| `[CLIENT_FEEDBACK]` | Feedback received | Pasted text | Revision/QA tasks | No — always fresh input | Ask for it; don't infer feedback that wasn't given |
| `[PREVIOUS_VERSION]` | The prior draft/output being revised | ID/link or pasted content | Any revision task | No — specific to the task | Ask which version if ambiguous |
| `[EXPECTED_RESULT]` | What a correct output looks like | Short description | QA/continuity/generation-review tasks | Yes, from the task brief | Ask — without this, QA has no standard to check against |
| `[ACTUAL_RESULT]` | What was actually produced | File/output reference | QA/continuity tasks | No — specific to the task | Required input; cannot proceed without it |
| `[APPROVED_DECISIONS]` | Locked-in decisions relevant to this task | Decision Log ID list | Any task that must respect prior approvals | Yes, from `[PROJECT_CONTEXT]` | Treat as empty/none yet; do not invent approvals |

### Required fields depend on the task
Do not fill every variable for every prompt. Each prompt in the library states its own **REQUIRED INPUTS** vs **OPTIONAL INPUTS** (see Deliverable 4) — pull only what that task needs from the dictionary above.

### Status-value conventions (used inside any variable's value)

| State | Notation | Meaning |
|---|---|---|
| Unknown | `[UNKNOWN]` | Not established yet; may need to be asked if it becomes critical |
| Not applicable | `[N/A]` | Doesn't apply to this project/task — explicitly ruled out, not just empty |
| Locked | `[LOCKED: value]` | Cannot change without a logged Change Request |
| Flexible | `[FLEXIBLE: value]` | Current best guess, open to iteration without formal approval |
| Proposed | `[PROPOSED: value]` | Suggested but not yet decided — awaiting approval |
| Approved | `[APPROVED: value — DEC-ID]` | Formally decided; treat as locked until explicitly superseded |

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

## 8. Deliverable 8 — Practical Demonstration

*All client/brand/product details below are **[FICTIONAL]**, invented solely to demonstrate the templates.*

### Brief intake (fictional)
> **[FICTIONAL BRIEF]** "We're Brew & Co., launching 'Nomad,' a portable manual coffee grinder. We need a 15-second vertical video for Instagram/TikTok showing how compact and premium it feels. Keep it energetic, no voiceover — just music and on-screen text. Need it in three weeks."

### Initialized Project Context (compact, per CTX-00)

```
PROJECT ID: BREWCO-NOMAD-2026-10
PROJECT NAME: Nomad Launch — 15s Vertical
CLIENT: Brew & Co. [FICTIONAL]
PROJECT TYPE: Short-form product commercial
OBJECTIVE: Communicate "compact, premium, portable" in 15 seconds [CONFIRMED]
AUDIENCE: [ASSUMPTION — brief implies mobile-first coffee/travel enthusiasts; not explicitly stated] [UNKNOWN: exact age/demo]
CORE MESSAGE: "Premium coffee, anywhere." [ASSUMPTION — inferred from brief tone, not stated verbatim]
DESIRED RESPONSE: [UNKNOWN — not stated; assume "want to buy/learn more," flagged as non-critical assumption]
PLATFORM: Instagram, TikTok (vertical) [CONFIRMED]
DELIVERABLES: One 15s vertical video [CONFIRMED]
DURATION: 15 seconds [CONFIRMED]
ASPECT RATIO: 9:16 [CONFIRMED]
DEADLINE: 3 weeks from brief date [CONFIRMED]
BUDGET / PRODUCTION CAPACITY: [UNKNOWN] — not stated; critical question raised below
BRAND REQUIREMENTS: [UNKNOWN] — no brand guide referenced; flagged as critical (logo/color risk per Part 1)
AVAILABLE MATERIALS: [UNKNOWN] — unclear if real product photography exists
SCRIPT STATUS: No voiceover; on-screen text + music only [CONFIRMED]
CREATIVE CONCEPT: Not yet developed — next task
ART DIRECTION: Not yet developed
DESIGN DNA: [UNKNOWN] — none provided
CHARACTERS: [N/A] — product-only piece, no characters indicated
PRODUCTS: Nomad portable grinder [CONFIRMED]; no reference photos confirmed yet [UNKNOWN]
CAMERA LANGUAGE: [FLEXIBLE] — "energetic" implies dynamic movement; to be defined by Art Director
MOTION LANGUAGE: [FLEXIBLE] — to be defined
AUDIO LANGUAGE: Music-driven, no VO [CONFIRMED]
CONSTRAINTS: 15s hard cap; vertical only; no VO [CONFIRMED]
APPROVED DECISIONS: None yet
REJECTED DIRECTIONS: None yet
CURRENT STATUS: Brief analyzed; awaiting answers to critical questions before Creative Director stage
NEXT TASK: Creative Director concept development (Part 3), pending the two critical questions below
```

**Critical questions raised at this stage [per BA-01/MST-00 logic]:**
1. Do real product photos/footage of Nomad exist, or does this need to be built from AI-generated/3D assets? *(Changes tools and workflow entirely.)*
2. Is there an existing brand guide (logo usage, color palette, type)? *(Affects brand-risk and Design DNA — see Part 1, Deliverable 4: logo/product deformation.)*

### Small Decision Log

```
DECISION ID: DEC-001
DECISION: Proceed assuming no existing brand guide; a lightweight Design DNA will be created from the brief's tone words ("energetic," "premium") pending client confirmation.
REASON: Client has not yet responded to the brand-guide question; three-week deadline requires starting concept work in parallel.
STATUS: Approved
APPROVED BY: You (creative) — provisional, pending client confirmation
DATE: [FICTIONAL] 2026-10-06
AFFECTED ASSETS / SHOTS: All visual assets
SUPERSEDED DECISION, IF APPLICABLE: None

DECISION ID: DEC-002
DECISION: Treat product visuals as AI-generated/3D-assisted (not live-action) pending confirmation of real product photography availability.
REASON: No footage/photos confirmed available as of brief intake; this choice determines which Part 5/6 image/video tools apply.
STATUS: Proposed
APPROVED BY: Pending — needs your confirmation once client answers Critical Question 1
DATE: [FICTIONAL] 2026-10-06
AFFECTED ASSETS / SHOTS: All product shots
SUPERSEDED DECISION, IF APPLICABLE: None
```

### Approval Gate example

```
STAGE: Concept & Direction Approval
REVIEW MATERIAL: Creative concept summary + proposed Design DNA direction (from DEC-001)
DECISION REQUIRED: Approve direction to proceed to styleframes, or request a different concept angle
ACCEPTANCE CRITERIA: Matches "compact, premium, energetic" brief tone; fits 15s/vertical/no-VO constraints; no brand-guide conflict
OUTCOME: Pending — gate not yet reached in this fictional example
REQUIRED REVISIONS: N/A yet
APPROVED BY: Client (final), You (creative pre-check first)
NEXT AUTHORIZED STAGE: Styleframe development (Part 4) — only after this gate passes
```

### Handoff: Brief Analysis → Creative Director

```
PROJECT ID: BREWCO-NOMAD-2026-10
CONTEXT VERSION: v1.0
SENDING ROLE: Brief Analyst
RECEIVING ROLE: Creative Director
TASK: Develop initial creative concept direction(s) for the Nomad 15s launch video
TASK OBJECTIVE: Produce 2–3 distinct concept angles that communicate "compact, premium, portable" within a 15s, vertical, no-VO, music-driven format
RELEVANT PROJECT CONTEXT: See project_context.md v1.0 — key fields: OBJECTIVE, AUDIENCE (assumption), PLATFORM, DURATION, ASPECT RATIO, AUDIO LANGUAGE, CONSTRAINTS
INPUTS / ASSET IDS: None yet confirmed — product photography status unresolved (see Open Questions)
APPROVED DECISIONS: DEC-001 (provisional lightweight Design DNA)
LOCKED ELEMENTS: 15s duration, 9:16 aspect ratio, no voiceover
FLEXIBLE ELEMENTS: Camera language, motion language, exact tone of on-screen text
CONSTRAINTS: 3-week deadline; budget unconfirmed
DEPENDENCIES: Client answer on (1) product photography availability, (2) brand guide existence
OPEN QUESTIONS: Same two critical questions from brief analysis — still unresolved
EXPECTED OUTPUT: 2–3 named concept directions, each with a one-line rationale tied to the brief
ACCEPTANCE CRITERIA: Each direction must be achievable within locked constraints and must not assume resources not yet confirmed (e.g., don't assume real footage exists)
CURRENT STATUS: Brief analyzed and logged; two critical questions outstanding; DEC-001 approved provisionally to allow parallel progress
NEXT ACTION: Creative Director proposes concept directions, explicitly flagging which ones depend on the still-open questions
```

---

## 9. Deliverable 9 — Handoff for Part 3

```
LIBRARY STRUCTURE:
Two roots: /Library (reusable, versioned, model-independent core + per-part domains + _Adapters +
_Deprecated) and /Projects/[PROJECT_ID] (project_context.md, decision_log.md, approval_gates.md,
change_requests.md, asset_register.md, handoffs/). Core templates live in /Library/00_Core/.
Parts 3-8 each get their own domain folder and ID prefixes (CD, AD, DC, RA / DD, SF, MEN / IMG /
VID / SB, MO, ED, AEX, SND / ASM, CTY, QA, WF).

PROMPT-ID AND VERSION RULES:
ID format [DOMAIN]-[NN], semantic and permanent (not tied to folder location). Filenames carry no
version number; version lives inside the file as v[MAJOR].[MINOR]. MAJOR = required inputs/output
format/logic changed; MINOR = wording only. Model-specific adapters add a VERIFICATION DATE field.
Deprecated prompts move to /Library/_Deprecated/ with a "superseded by" header, never deleted,
never reused for a new ID.

PROJECT CONTEXT TEMPLATE:
CTX-00 (Deliverable 2 of this document) — full field list with status tags [CONFIRMED]/
[ASSUMPTION-reason]/[UNKNOWN]/[APPROVED: DEC-ID, date]. Conflict rule: never silently overwrite
CONFIRMED/APPROVED fields; flag conflicts explicitly and require reconfirmation or a logged Change
Request.

VARIABLE CONVENTIONS:
27 standard variables defined in Deliverable 3 (PROJECT_CONTEXT, BRIEF, OBJECTIVE, AUDIENCE,
PLATFORM, DELIVERABLE, DURATION, ASPECT_RATIO, BRAND, STYLE, REFERENCES, SCRIPT, PRODUCT,
CHARACTER, LOCATION, CAMERA, LIGHTING, SHOT, COLOR_PALETTE, DESIGN_DNA, CONSTRAINTS, DEADLINE,
TARGET_MODEL, CLIENT_FEEDBACK, PREVIOUS_VERSION, EXPECTED_RESULT, ACTUAL_RESULT,
APPROVED_DECISIONS), each with meaning/format/required-when/inheritable/if-missing. Status-value
notation: [UNKNOWN], [N/A], [LOCKED: value], [FLEXIBLE: value], [PROPOSED: value],
[APPROVED: value - DEC-ID].

PROMPT-ENTRY STANDARD:
STD-00 (Deliverable 4) — ID/NAME/PURPOSE/USE WHEN/DON'T USE WHEN/REQUIRED & OPTIONAL
INPUTS/INHERITED CONTEXT/RECOMMENDED TOOL-ADAPTER/COPYABLE PROMPT/EXPECTED OUTPUT/QUALITY
CHECK/COMMON FAILURE/FOLLOW-UP PROMPT/VERSION/VERIFICATION DATE. QUICK/PRO/DEEP variants are
built only when task stakes/ambiguity genuinely differ — PRO is the default; don't pad the
library with unnecessary tiers. Demonstrated via BA-01 (Brief Analysis).

CONFLICT-HANDLING RULES:
Never silently overwrite CONFIRMED or APPROVED context. Flag conflicts explicitly, require
explicit reconfirmation, and log any resulting change as a new Decision Log entry that
supersedes the old one. AI-proposed changes are always labeled [PROPOSED] and routed through
a Change Request (CHG-00) — never auto-applied.

APPROVAL RULES:
Decision Log (DEC-00), Approval Gate (APR-00), and Change Request (CHG-00) templates defined
in Deliverable 7. Creative approval (you) and client approval are always tracked as separate
fields. Gate count scales with project complexity: 1 gate for a simple asset, up to 4+ for a
multi-shot commercial (concept -> styleframe/art direction -> edit/animation -> final QA).

TOOL-ROUTING REFERENCE:
Carried forward from Part 1 (Oct 5, 2026 research): reasoning (ChatGPT/Claude/Gemini per task),
styleframes/character-consistent assets (Midjourney Omni Reference, Nano Banana Pro),
vector/brand assets (Recraft), text-heavy graphics (Ideogram), video (Veo 3.1, Runway
Gen-4/4.5, Kling 3.0, Seedance 2.0/2.5, Luma Ray3 — OpenAI Sora confirmed fully discontinued),
voice/sound (ElevenLabs), upscaling/cleanup (Topaz Labs). Full routing matrix and limitations
table live in /Library/01_Research-Routing/. All model-specific facts require periodic
re-verification per Part 1 Deliverable 5's checklist.

UNRESOLVED ITEMS:
Same unresolved items carried from Part 1 (ElevenLabs/Topaz exact pricing, Freepik/Magnific
rebrand status, Veo 3.1 exact reference-image count and max extension length, Kling 4.0's
real feature set once out of beta, Gemini 4 "Argon" unconfirmed). No new unresolved items
introduced in Part 2 beyond these.

NEXT TASK:
Part 3 builds the Creative Director, Art Director, Design Critic, and Reference Analyst
prompt systems using this foundation (CTX-00, VAR-00, STD-00, MST-00, HND-00, DEC-00/APR-00/
CHG-00) as their shared base — those roles should reference BA-01's output and MST-00's
initialized project context rather than re-deriving brief interpretation from scratch.
```

---

*End of Part 2. This foundation (library structure, project context, variable system, prompt-entry standard, master starter prompt, universal handoff, and decision/approval records) is now ready for Part 3 (Creative Director, Art Director, Design Critic, Reference Analyst).*
