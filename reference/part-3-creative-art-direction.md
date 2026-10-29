# AI Creative Operating System — Part 3: Creative Direction, Art Direction & Reference Analysis

**Version:** 1.0
**Inputs used:** Part 1 handoff (Research & Model Routing) and Part 2 handoff (Library Structure & Project Foundation), both generated earlier in this session — used directly, nothing re-invented. No external `[PROJECT_CONTEXT]` was pasted for this part; the worked example (Deliverable 9) continues the fictional "Nomad" project established in Part 2, clearly labeled.

**New domain codes registered in the Library (extending Part 2's list):** `CD` (Creative Director), `AD` (Art Director), `RA` (Reference Analyst), `VR` (Visual Research Brief — planning, distinct from RA's analysis), `DC` (Design Critic), `CR` (Challenge Reviewer). These live in `/Library/03_Creative-Art-Direction/` per Part 2's architecture.

**Cross-cutting rule applied to every prompt below (per your instruction):** every output must distinguish **Evidence** (directly observed/stated), **Interpretation** (a reasonable reading of evidence), **Assumption** (a gap filled by reasonable guess), **Recommendation** (a proposal awaiting your decision), and **Approved decision** (already locked in the Decision Log). No role prompt below assumes persistent memory, browsing, file access, or tool execution — each is a standalone text-in/text-out prompt you run manually, per Part 2's handoff rules.

---

## 1. Deliverable 1 — Role Boundaries

| Role | Primary Question | Responsibility | Required Input | Output | Decisions It May Propose | Decisions Requiring Human Approval | Handoff Recipient |
|---|---|---|---|---|---|---|---|
| **Creative Director** | What should we make, and why? | Turn the brief into a communication problem and 2–3 structurally distinct creative territories; recommend one. Does **not** define visual style in detail. | `[BRIEF]`, `[PROJECT_CONTEXT]`, `[REFERENCES]` (optional), `[CONSTRAINTS]` | Communication problem, creative territories, recommendation | Which territory best fits the brief; which assumptions need challenging | Final territory selection; any scope/budget trade-off; brand-risk calls | Art Director (after you select a territory) |
| **Art Director** | How should the approved idea look and feel? | Translate the **already-approved** concept into concrete, checkable visual rules. Does **not** invent a new concept or re-litigate the selection. | `[APPROVED_CONCEPT]`, `[PROJECT_CONTEXT]`, `[BRAND]`, `[REFERENCES]`, `[CONSTRAINTS]` | Visual thesis + rule set (composition, color, typography, motion potential, etc.) | Specific visual rule choices; which references govern which rule | Locking the Design DNA; resolving a concept flaw the Art Director flags (never silently replaced) | Part 4 (Design DNA / styleframe workflow) |
| **Reference Analyst** | What transferable principles can we learn from the references? | Analyze supplied references **by function**, separate evidence from inference, map which reference governs which aspect. Does **not** decide the final direction. | `[REFERENCES]`, `[BRIEF]`, `[PROJECT_CONTEXT]`, `[REFERENCE_PURPOSE]` | Reference Role Map, transferable principles, conflicts | Which principle to adopt; which reference should govern a given rule | Adopting a principle as a locked rule; resolving a reference conflict | Art Director (or Creative Director, if used pre-concept) |
| **Design Critic** | Does this execution communicate effectively within its context? | Evaluate an **actual produced** design/draft against the brief and intended message. Does **not** propose a new concept or direction. | `[DESIGN]`, `[PROJECT_CONTEXT]`, `[INTENDED_MESSAGE]`, `[PLATFORM]`, `[DESIGN_STAGE]` | Prioritized, severity-ranked findings; Keep/Adjust/Remove/Add/Test | Specific recommended changes | Which changes actually get made | Art Director (visual-rule-level issues) or Creative Director (concept-level issues, rare) |
| **Challenge Reviewer** | Which important creative assumptions may be weak? | Stress-test a direction (concept or art direction) **before** production commitment. Does **not** generate alternative directions itself. | The direction/decision being challenged, `[PROJECT_CONTEXT]` | Strongest argument for/against, 3 consequential risks, PROCEED/REFINE/RECONSIDER | Whether a risk is worth mitigating before proceeding | Whether to actually change the direction based on the challenge | Creative Director (concept-level risk) or Art Director (execution-level risk) |

**Boundary note:** No role above re-derives the brief or re-opens an already-approved decision from scratch — each inherits the prior role's output and project context rather than restarting. If a role finds something seriously wrong with an upstream decision, it **flags it explicitly for your review** (see each prompt's constraints) rather than quietly working around it or replacing it.

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

## 9. Deliverable 9 — Worked Example

*Continuing the fictional **[FICTIONAL]** "Nomad" portable coffee grinder project from Part 2. All names, feedback, and approvals below are invented for demonstration.*

**BRIEF (recap):** 15-second vertical video for Instagram/TikTok, energetic/premium tone, no VO, music + on-screen text, 3-week deadline. *(Established in Part 2.)*

### → CREATIVE TERRITORIES (CD-01 output, condensed)

```
TERRITORY 1 — "Pocket Ritual"
CORE IDEA: The satisfying ritual of grinding coffee, shrunk to fit in your pocket.
MECHANISM: Extreme close-up grind textures + a transformation beat from folded/compact to in-use.
EMOTIONAL EFFECT: Intimate, sensory satisfaction.
WHY IT FITS: Strong "compact" proof point; music-driven texture/ASMR-adjacent cutting suits no-VO format.
RISK: May read as too quiet/slow for "energetic" brief tone.

TERRITORY 2 — "Anywhere Bar"
CORE IDEA: Wherever you are becomes a premium coffee bar the instant you pull this out.
MECHANISM: A mundane location (desk, trail, car) transforms via lighting/cut into an elevated "bar" moment.
EMOTIONAL EFFECT: Aspirational surprise.
WHY IT FITS: Directly dramatizes "portable + premium" as one beat; strong fit for energetic cutting.
RISK: Needs confident environment/lighting execution or it reads gimmicky.

TERRITORY 3 — "Tiny Machine, Big Craft"
CORE IDEA: The product's small size is contrasted against serious mechanical precision — it's a real tool, not a toy.
MECHANISM: Exploded-view/mechanical beauty shots of the grind mechanism.
EMOTIONAL EFFECT: Trust, respect for engineering.
RISK: Weakest "energetic" fit; strongest for a credibility-focused audience instead.

RECOMMENDATION: Territory 2, "Anywhere Bar" — best match to the stated "energetic + premium" tone and dramatizes portability and quality in a single mechanism.
```

### → HUMAN SELECTION *(simulated approval — [FICTIONAL])*

> **[FICTIONAL CLIENT DECISION]** "Agreed — go with 'Anywhere Bar.' It's the one that feels right for social." Logged as `DEC-003` in the project's Decision Log, approved by: Client + You.

### → ART DIRECTION (AD-01 output, condensed)

```
VISUAL THESIS: Ordinary environments are transformed into premium coffee-bar moments through a single confident lighting/motion shift.
COMPOSITION: [ESSENTIAL] Product enters frame off-center on a diagonal, environment reframes around it on the transformation beat.
LIGHTING: [ESSENTIAL] Flat/ambient environment light cuts to a single warm key light on the "transformation" beat — defines "premium" as a visible, checkable lighting change, not a mood word.
CAMERA LANGUAGE: [ESSENTIAL] Fast push-in on the transformation beat; otherwise static/locked-off shots — "energetic" = cut pace and one decisive camera move, not constant motion.
COLOR RELATIONSHIPS: [FLEXIBLE] Desaturated "before" environment vs. warm-saturated "after" — exact palette open.
MOTION POTENTIAL: [ESSENTIAL] One hard transformation cut is the only required movement; everything else can be static for budget/time.
OPEN DECISIONS: Real environment footage vs. AI-generated/3D environments — unresolved pending DEC-002 from Part 2 (product photography availability).
```

### → REFERENCE ANALYSIS (RA-01 output, condensed, 2 fictional references)

```
REFERENCE A — [FICTIONAL] travel-gear ad, fast environment transitions
ROLE: Governs pacing/transition mechanism.
WHAT TO LEARN: Hard-cut transformation on a single beat, not a gradual dissolve.
CONFIDENCE: High — directly observable cut structure.

REFERENCE B — [FICTIONAL] specialty-coffee brand video, warm practical lighting
ROLE: Governs lighting/color warmth.
WHAT TO LEARN: Single warm key light reads as "premium" without needing a dressed set.
CONFIDENCE: High — directly observable lighting setup.

CONFLICT: Reference A's overall pace is faster-cut throughout than Reference B's slower, lingering style.
RESOLUTION: Reference A governs the transformation-beat pacing only; Reference B governs lighting/color only — not blended wholesale. (Logged as a recommendation, pending your approval.)
```

### → CRITIQUE OF A PROPOSED EXECUTION

*No actual frames/footage exist yet — only a written execution proposal. Per DC-01's failure handling, this is a critique of the **written description only**; visual assessment (composition, contrast, polish, etc.) remains pending until real frames are produced.*

> **[FICTIONAL PROPOSED EXECUTION, as written]** "Open on a cluttered desk, dim light. Hand reaches for Nomad. Quick cut: desk is now warmly lit, steam rising, text appears: 'Premium, Anywhere.' End on product hero shot."

```
CONTEXT NOTE: Visual critique (contrast, composition, polish) cannot be given — no actual image/footage supplied. The following evaluates only what the written description tells us.

FINDING 1
OBSERVATION: The description's single transformation beat matches the approved Visual Thesis and the AD-01 "hard-cut, single key light" rule.
SEVERITY: WORKING WELL
NATURE: OBSERVABLE (matches a written, checkable rule)

FINDING 2
OBSERVATION: "Steam rising" is not mentioned in the Design DNA or references — unclear if this is a new assumption.
EVIDENCE / LOCATION: Written proposal, second sentence.
WHY IT MATTERS: Could be a nice atmospheric beat or could be an uncontrolled scope addition (needs confirmation it's feasible for the chosen production method, per the still-open AD-01 decision on real vs. generated environments).
SEVERITY: IMPORTANT
NATURE: CONTEXTUAL ISSUE
RECOMMENDED CHANGE: Confirm whether "steam" is intentional and production-feasible before locking it as part of the beat.
HOW TO TEST: Resolve once DEC-002 (real vs. generated environment) is settled.

SUMMARY:
KEEP: Single hard-cut transformation structure.
ADJUST: Confirm "steam" detail against production method.
REMOVE: (none identified from text alone)
ADD: (pending visual review once frames exist)
TEST: Full visual critique once an actual styleframe/draft exists.
```

### → HANDOFF TO PART 4

```
PROJECT ID: BREWCO-NOMAD-2026-10
CONTEXT VERSION: v1.1 (updated: Territory 2 approved as DEC-003; Art Direction rule set added)
SENDING ROLE: Art Director
RECEIVING ROLE: Design DNA / Styleframe workflow (Part 4)
TASK: Develop a Design DNA document and first styleframe set from the approved visual rules
TASK OBJECTIVE: Translate AD-01's rule set into a working Design DNA reference and 2-3 candidate styleframes for the "transformation beat"
RELEVANT PROJECT CONTEXT: AD-01 output above; REFERENCE ROLE MAP above
APPROVED DECISIONS: DEC-003 (Territory 2 selected)
LOCKED ELEMENTS: Single hard-cut transformation structure; warm single-key-light "after" state; fast push-in on the beat only
FLEXIBLE ELEMENTS: Exact color palette; specific environment choice; "steam" detail (pending confirmation)
CONSTRAINTS: 15s, 9:16, no VO, 3-week deadline (now ~2.5 weeks remaining)
DEPENDENCIES: DEC-002 (real vs. AI-generated/3D environment) still open — blocks final tool selection for Part 5/6
OPEN QUESTIONS: Is "steam" in scope? Is real product photography available?
EXPECTED OUTPUT: Design DNA doc + styleframe candidates for the transformation beat
ACCEPTANCE CRITERIA: Matches AD-01's ESSENTIAL rules exactly; FLEXIBLE rules may vary across candidates for selection
CURRENT STATUS: Concept and visual direction approved; execution-level open questions remain
NEXT ACTION: Resolve DEC-002 before generating final styleframes; Part 4 may begin DNA documentation in parallel
```

---

## 10. Deliverable 10 — Handoff for Part 4

```
ROLE PROMPT IDS:
CD-01 (+CD-02/03/04), AD-01 (+AD-02/03/04/05), RA-01 (+RA-02/03/04/05), VR-01,
DC-01 (+DC-02/03/04/05), CR-01 (+CR-02). All registered under /Library/03_Creative-Art-Direction/
per Part 2's architecture; domain codes CD, AD, RA, VR, DC, CR now reserved.

ROLE BOUNDARIES:
Creative Director = WHAT/WHY (concept only, no visuals). Art Director = HOW IT LOOKS (rules only,
no new concepts). Reference Analyst = TRANSFERABLE PRINCIPLES (analysis only, no final direction).
Design Critic = DOES THIS EXECUTION WORK (evaluates produced work only, no new concepts). Challenge
Reviewer = STRESS-TEST (evaluates a proposed direction only, no alternative concepts). No role
re-derives the brief or silently overrides an upstream approved decision — flaws are flagged for
human review, not quietly patched.

CREATIVE DIRECTOR OUTPUT CONTRACT:
Communication problem + audience/desired response (labeled Evidence/Assumption) + message-vs-
execution split + central tension + challenged assumptions + exactly 3 structurally distinct
territories (each: Name/Core Idea/Audience Insight/Message/Mechanism/Emotional Effect/Why It
Fits/What Makes It Distinct/Production Approach/Risks/Minimum Viable Execution) + evaluation +
recommendation + what needs human selection. No styleframes/shots/generation prompts included.

ART DIRECTOR OUTPUT CONTRACT:
Visual Thesis + 17 rule categories (Composition through Negative Space/Motion Potential) each
marked [ESSENTIAL]/[FLEXIBLE]/[OPTIONAL], each defined in checkable (non-vague) terms with a
concept-link and a verification method + Consistency Rules + Do/Don't + Open Decisions (including
any flagged problem with the approved concept itself, never silently patched).

REFERENCE ANALYSIS FORMAT:
Per-reference breakdown (11 categories) separating Evidence from Inference, with still-image
motion always labeled "Proposed Motion Possibility," never fact + Cross-Reference Synthesis
(repeated principles / differences / conflicts) + Reference Role Map (ID/Role/What To Learn/What
To Preserve If Authorized/What May Change/What Not To Reproduce/Confidence) + transferable
principles + project-specific recommendations + conflicts requiring a decision.

CRITIQUE FORMAT:
Per-finding: Observation/Evidence-Location/Design Principle/Why It Matters/Severity (CRITICAL/
IMPORTANT/OPTIONAL/WORKING WELL)/Nature (OBSERVABLE/CONTEXTUAL/SUBJECTIVE/EXPERIMENTAL)/
Recommended Change/Alternative/How To Test. Concludes with Keep/Adjust/Remove/Add/Test. Smallest
useful change proposed first; working elements left alone; provisional-review flag used whenever
brief/intended-message context is missing.

APPROVAL RULES:
Territory selection, Design DNA locking, and any resolution of a flagged concept/rule problem
require explicit human approval (per Part 2's Decision Log/Approval Gate). AI-proposed changes
(Art Director rule tweaks, Reference-conflict resolutions, Challenge Reviewer recommendations)
are always labeled [PROPOSED] and never treated as approved until logged.

LOCKED / FLEXIBLE DECISION RULES:
Carried from Part 2: [LOCKED]/[APPROVED] fields are never silently changed; conflicts are flagged
explicitly and require reconfirmation or a logged Change Request. [FLEXIBLE]/[PROPOSED] fields may
be iterated on freely until approved. Essential vs. flexible vs. optional visual rules (Art
Director) follow the same logic at the rule level.

MODEL-SPECIFIC ADAPTERS, IF VERIFIED:
None required for Part 3 — all five role prompts are plain-language reasoning tasks usable
identically across current flagship reasoning LLMs (per Part 1 routing: Claude/ChatGPT/Gemini).
Vision input (Reference Analyst, Design Critic) requires a vision-capable model but needs no
syntax adapter. Revisit if a future tool requires special formatting to accept image critique
requests.

UNRESOLVED ITEMS:
Carried from Parts 1-2 (ElevenLabs/Topaz pricing, Freepik/Magnific rebrand status, Veo 3.1 exact
reference-image count, Kling 4.0's real feature set, Gemini 4 "Argon" unconfirmed) plus, from this
part's worked example: DEC-002 (real vs. AI-generated/3D environment for Nomad) remains open and
blocks Part 5/6 tool selection for that fictional project.

NEXT TASK:
Part 4 builds Claude Design workflows, Project Design DNA documentation, styleframe development,
motion-readiness review, and design mentorship — using AD-01's rule set as the direct input to
Design DNA, and RA-01's Reference Role Map as supporting evidence for styleframe decisions.
```

---

*End of Part 3. No real creative direction was approved and no project was executed on the user's behalf — all approvals in the worked example are explicitly simulated and labeled [FICTIONAL].*
