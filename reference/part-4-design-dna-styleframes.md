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

## 1. Deliverable 1 — Claude Design Capability Check

Part 1 flagged Claude Design as low-relevance and not fully specified. It has changed materially since then (it launched April 17, 2026 and was restructured in September 2026), so it was re-verified against current official sources rather than reused as-is.

### 1.1 Verified facts (official sources cited)

| Attribute | Verified finding | Source |
|---|---|---|
| Product identity | Launched Apr 17, 2026 as an "Anthropic Labs" research-preview product called **Claude Design**, powered by Claude's vision-capable model (Opus 4.7 at launch). On Sept 16, 2026, Anthropic folded it into the main Claude app as a "Design" **Artifact type** — usable in regular chat, the Artifacts tab, and Claude Code. The original standalone surface (`claude.ai/design`) still works as of Sept 23, 2026. | [1](https://www.anthropic.com/news/claude-design-anthropic-labs), [2](https://support.claude.com/en/articles/14604416-get-started-with-claude-design) |
| Access method | Included in Claude Pro/Max/Team/Enterprise (beta, not a separate purchase). On by default for Pro/Max/Team; off by default for Enterprise until an org admin enables it. Shares the same usage/token pool as normal chat, Claude Code, and Claude Cowork — no separate allowance. Available on web, desktop, and Claude Code (`/design`, `/design-sync`); on iOS/Android you can request a design and view it, but editing requires web or desktop. | [2](https://support.claude.com/en/articles/14604416-get-started-with-claude-design) |
| Supported inputs | Natural-language prompt; uploaded image/screenshot; documents (DOCX/PPTX/XLSX per the launch post); a built-in web-capture tool; a GitHub repo or local codebase; an existing design system (files or repo). | [1](https://www.anthropic.com/news/claude-design-anthropic-labs), [2](https://support.claude.com/en/articles/14604416-get-started-with-claude-design) |
| What it actually generates | Claude writes and renders **code** — HTML/CSS/JS, React, or SVG — live in a canvas next to the conversation. It is a code-generation-and-render surface, not a bitmap or vector drawing engine. | [2](https://support.claude.com/en/articles/14604416-get-started-with-claude-design) |
| Brand/design-system support | Can import one or more design systems from a GitHub repo, design files, raw uploads, or a local codebase (via `/design-sync` in Claude Code). Generated output is checked against the imported system and auto-corrected where it drifts. Enterprise admins can lock a single org-wide system. | [3](https://pureai.com/articles/2026/06/17/anthropic-overhauls-claude-design.aspx), [2](https://support.claude.com/en/articles/14604416-get-started-with-claude-design) |
| Editability | Iteration via chat follow-ups, inline canvas comments, and direct on-canvas drag/resize/align (added later in 2026 to cut token cost). This is genuine editing of the **live code artifact**, inside Claude's own canvas — not editing of a native Photoshop/Illustrator/After Effects/Blender file. | [3](https://pureai.com/articles/2026/06/17/anthropic-overhauls-claude-design.aspx) |
| Export formats (officially confirmed) | PDF, PPTX, standalone HTML; send-to-Canva; send to other connected apps; a handoff bundle to Claude Code (components, tokens, copy, interaction notes). **No official confirmation of PSD, AI/EPS, a native After Effects project, or a native Blender file.** | [2](https://support.claude.com/en/articles/14604416-get-started-with-claude-design), [1](https://www.anthropic.com/news/claude-design-anthropic-labs) |
| Demo-only capabilities | The launch post lists "voice, video, shaders, 3D, and built-in AI" as things you can prototype with Claude Design. This was shown as a demo capability, not a documented, generally-reliable feature — treat as **unverified for production use**. | [1](https://www.anthropic.com/news/claude-design-anthropic-labs) |
| Known limitations | Heavy token/usage consumption reported on Pro-tier accounts for even small iteration cycles; multi-person simultaneous editing is "basic and may not work reliably"; design-system import quality depends entirely on the source material; mobile app is view-only. | [3](https://pureai.com/articles/2026/06/17/anthropic-overhauls-claude-design.aspx), [2](https://support.claude.com/en/articles/14604416-get-started-with-claude-design) |

### 1.2 Claude Design vs. general Claude

- **General Claude** (plain chat / vision input, no canvas) is what already powers every Part 3 role prompt (`CD-01`, `AD-01`, `RA-01`, `DC-01`, `CR-01`) and every Part 4 reasoning prompt below. Nothing about Claude Design changes how those work.
- **Claude Design** is an additional surface on the same model, specialized for generating rendered HTML/code artifacts (web pages, slide decks, prototypes, one-pagers). It is a UI/presentation/prototyping tool, not an illustration, raster, or motion tool.

### 1.3 Relevance to this pipeline, and output classification

For a 2D Motion Designer working in After Effects/Premiere/Photoshop/Illustrator/Blender, Claude Design's realistic role is narrow: it can produce a quick rendered mockup of a layout idea or a client-facing one-pager/deck, and it can enforce a design system across many such mockups. It **cannot** output a usable PSD, AI, AE project, or Blender file. Treat it as an optional visualization aid, not a required dependency.

| Workflow in this Part | Output type |
|---|---|
| `DP-01` Senior Design Partner | Written design direction (text feedback only) |
| `DNA-01` Design DNA Builder | Written design direction (a structured document) |
| `DE-01` Design Exploration | Written design direction; if rendered via Claude Design, a **Rendered visual** only |
| `SF-01` Styleframe Designer | Written design direction / specification; a Claude Design render is a **Rendered visual**, never an **Editable artifact** in this stack |
| `CI-01` Controlled Iteration | Written design direction, applied by you to the real file |
| `MR-01` Motion-Readiness Review | Written design direction (motion logic text), not an animatic |
| `DM`/`PG` | Written design direction / learning exercises |

An **Editable artifact** or **Production handoff** in this stack only exists once a human (or a Part 5 image-generation workflow) actually builds the file in Photoshop, Illustrator, After Effects, or Blender. No prompt in this Part claims to have created a file.

### 1.4 Fallback workflow

Because Claude Design cannot produce production files for this stack regardless of access, the **default path is the fallback**, not a failure state:

> Run the Part 3 and Part 4 reasoning prompts in plain Claude chat (or any vision-capable multimodal assistant that accepts an image). Build the actual asset by hand in Photoshop, Illustrator, After Effects, or Blender. Optionally use Claude Design's canvas purely to visualize a layout idea faster before building it for real — never as the source of the final file.

No model-specific adapter is required for any Part 4 prompt below; each one is a plain-language reasoning task. Where Claude Design's canvas adds a genuine (if limited) option, it is noted inline.

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

## 10. Deliverable 10 — Commands and Worked Example

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

### 10.2 Worked example — fictional, continuing the Part 2/3 "Brew & Co. Nomad" project `[FICTIONAL]`

This continues the same fictional project (`BREWCO-NOMAD-2026-10`) used in Parts 2–3, now for a companion 2D explainer frame ("how it works"), not the 15s commercial. No real image exists; this demonstrates specifications and reasoning only.

**APPROVED CONCEPT** `[FICTIONAL — carried from Part 3 DEC-003]`: "Anywhere Bar" territory — the Nomad grinder turns any flat surface into a pour-over bar; hard-cut transformation, single warm key light, fast push-in.

**→ DESIGN DNA** `[FICTIONAL DNA-01 OUTPUT, v0.1, STATUS: DRAFT]` (abbreviated):
```
CORE IDEA: A flat surface becomes a ritual the instant the Nomad opens.
SHAPE LANGUAGE:
  OBSERVABLE RULE: Grinder body uses only rounded-rectangle forms, min 6px radius.
  PURPOSE: Matches "approachable precision" from APPROVED_CONCEPT.
  APPLICATION EXAMPLE: Grinder silhouette, icon set for explainer callouts.
  ACCEPTANCE CRITERION: No sharp corner under 6px in any frame.
  STATUS: PROPOSED
LIGHTING:
  OBSERVABLE RULE: Single warm key light, 30–45° from camera left, no fill.
  PURPOSE: Carries AD-01's locked lighting rule from the commercial for system consistency.
  APPLICATION EXAMPLE: All explainer frames showing the physical product.
  ACCEPTANCE CRITERION: Exactly one identifiable light source per frame.
  STATUS: APPROVED: single warm key — DEC-003 (inherited)
OPEN DECISIONS: Whether explainer frames reuse the commercial's hard-cut
  transformation or need a softer reveal for instructional clarity — flagged,
  not resolved here.
```

**→ STYLEFRAME SPECIFICATION** `[FICTIONAL SF-01 OUTPUT]` (abbreviated, frame 2 of 3: "grind adjustment"):
```
FRAME ID: NOMAD-EXPL-02
COMMUNICATION PURPOSE: Show the dial controls grind coarseness.
FOCAL POINT: The grind-adjustment dial, upper-right third.
SUBJECT PLACEMENT: Grinder occupies center-left 55% of frame, dial enlarged
  as a callout in the upper-right.
EXACT ON-SCREEN COPY: [NOT SPECIFIED — confirm before build]
LOCKED ELEMENTS: single warm key light (DEC-003); rounded-rectangle shape language.
FLEXIBLE ELEMENTS: callout style for the dial detail.
ACCEPTANCE CRITERIA: A viewer unfamiliar with the product can identify "this
  dial changes something" within 2 seconds.
```

**→ CRITIQUE** `[FICTIONAL DP-01 OUTPUT]` (abbreviated):
```
OBSERVATION: The dial callout and the main grinder body currently compete for
  first-read attention — both are high-contrast against the background.
DESIGN PRINCIPLE: Visual hierarchy through contrast allocation.
WHY IT MATTERS: If both compete, the "what is this frame about" read slows down.
SEVERITY: IMPORTANT
RECOMMENDED CHANGE: Reduce background contrast behind the grinder body so the
  callout reads first, grinder second.
ALTERNATIVE: Keep both high-contrast but sequence their reveal in motion
  instead of fixing it in the static frame (flagged for MR-01).
HOW TO TEST: Flash the frame for 1 second — ask someone what they saw first.
```

**→ SMALL REVISION** `[FICTIONAL CI-01 OUTPUT]` (abbreviated): `ADJUST` — reduce background value contrast by one step behind the grinder body; `KEEP` — dial callout treatment as-is; `TEST` — repeat the 1-second flash check after the change.

**→ MOTION-READINESS REVIEW** `[FICTIONAL MR-01 OUTPUT]` (abbreviated):
```
ELEMENT: Dial callout | COMMUNICATION ROLE: Draws attention to the control |
PROPOSED MOTION: Scale-in with slight overshoot, arriving after the grinder
settles | TRIGGER/ORDER: Second, after grinder enters | ANCHOR: Pinned to
dial's physical position | DEPENDENCIES: Grinder body motion must finish
first | ASSET PREP: Dial needs to exist as a separate layer, not baked into
body | RISK: If background-contrast fix (CI-01) isn't applied first, the
callout's entrance competes with the body's settle motion.
```

No real frame was produced at any step; every block above is a specification or written critique, explicitly labeled fictional.

---

## 11. Deliverable 11 — Handoff for Part 5

```
VERIFIED CLAUDE DESIGN CAPABILITIES: Beta feature inside Claude (Pro/Max/Team/
  Enterprise), generates rendered HTML/CSS/JS/React/SVG code artifacts via
  conversation + canvas; imports design systems and checks output against
  them; exports PDF/PPTX/HTML/Canva/Claude Code handoff. No confirmed PSD/AI/
  native AE or Blender export. Voice/video/3D/shaders shown only as launch
  demos — unverified for reliable production use. [Sources cited in Sec. 1]

FALLBACK WORKFLOW: Default path for this pipeline — run all Part 3/4 reasoning
  prompts in plain Claude chat (or any vision-capable assistant); build actual
  files in Photoshop/Illustrator/After Effects/Blender. Claude Design canvas
  is an optional, non-required quick-visualization aid only.

PROMPT IDS: DP-01(-02,-03); DNA-00 (template), DNA-01(-02,-03,-04); DE-01(-02,-03);
  SF-01(-02,-03,-04,-05); CI-01(-02); MR-01(-02); DM-01/02/03; PG-01.

DESIGN DNA FORMAT: DNA-00 template (24 fields) + expanded RULE block
  (OBSERVABLE RULE / PURPOSE / APPLICATION EXAMPLE / ACCEPTANCE CRITERION /
  STATUS) for every entered rule. No adjective-only entries permitted.

STYLEFRAME SPECIFICATION: SF-01's 20-field format — written specification only,
  classified as Written design direction / Editable artifact (as text), never
  as a produced image. Unspecified copy/logo/props must be flagged, not invented.

REFERENCE ROLE RULES: Inherited unchanged from Part 3 — RA-01 Reference Role
  Map governs what may be preserved/changed/must-not-reproduce per reference;
  "preserve" entries require explicit human approval before becoming locked DNA rules.

LOCKED / FLEXIBLE ELEMENT RULES: LOCKED/APPROVED rules (from AD-01, DNA-00, or
  BRAND) are never silently changed by any Part 4 prompt — conflicts are
  flagged for human resolution. FLEXIBLE ELEMENTS remain open until a decision
  is logged.

ITERATION METHOD: CI-01's four-list classification (LOCKED/FLEXIBLE/PROBLEM/
  WORKING) plus Part 3 DC-01's KEEP/ADJUST/REMOVE/ADD/TEST summary; smallest-
  change-first; CI-02 confirms resolution before further iteration.

MOTION-PREPARATION REQUIREMENTS: MR-01's element-by-element table (motion,
  trigger/order, anchor, dependencies, asset prep, risk) plus explicit flags
  for occlusion, raster/vector limits, editable-text needs, and crop/rotation
  risk. All motion proposals here are proposals, not builds — Part 7 owns the
  actual After Effects construction.

APPROVAL STATUS: No design in this Part has been approved on your behalf. The
  Nomad explainer example is entirely fictional/simulated, matching Part 3's
  labeling convention.

UNRESOLVED ITEMS: Carried from Parts 1–3 (model version churn; Nomad's DEC-002
  real-vs-AI-generated-environment question still open); new in Part 4 —
  whether the fictional Nomad explainer reuses the commercial's hard-cut
  transformation or needs a softer instructional reveal (flagged, not decided).

NEXT TASK: Part 5 — translate approved Design DNA (DNA-00) and styleframe
  specifications (SF-01) into model-specific image-generation workflows.
```

**Stop — Part 4 complete.**
