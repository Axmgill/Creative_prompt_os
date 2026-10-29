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

**Application versions on record (verified 2026-10-06):**
- **After Effects:** 26.5 (September 2026 release). Scripting: ExtendScript + ScriptUI panels remain the production path; CEP panels fully supported; **UXP panels for After Effects are in public beta targeted for November 2026 — not GA as of this verification date.** CEP retirement is formal but gradual: CEP-disabled-by-default for AE is planned for December 2028, full removal not before end of 2029; ExtendScript itself is explicitly unaffected by the CEP→UXP transition. [1](https://helpx.adobe.com/after-effects/release-note/release-notes-after-effects.html), [2](https://blog.developer.adobe.com/en/publish/2026/09/investing-in-the-future-of-creative-cloud-extensibility-uxp-comes-to-our-flagship-applications) (official).
- **Premiere Pro:** 2026, build 26.5.x. UXP is now a **standard (GA) release** in Premiere — ahead of After Effects in this transition. [2](https://blog.developer.adobe.com/en/publish/2026/09/investing-in-the-future-of-creative-cloud-extensibility-uxp-comes-to-our-flagship-applications), [3](https://community.adobe.com/announcements-727/welcome-to-adobe-premiere-26-0-1552341) (official).
- **Illustrator:** 2026 (internal version 30.0), released October 28, 2025; UXP is rolling out to Illustrator on the same multi-year track as After Effects (grouped together for the December 2028 CEP-disabled-by-default milestone), not yet GA. [2](https://blog.developer.adobe.com/en/publish/2026/09/investing-in-the-future-of-creative-cloud-extensibility-uxp-comes-to-our-flagship-applications), [4](https://community.adobe.com/questions-652/illustrator-2026-v30-0-font-browser-color-snapping-artboards-enhancements-turntable-and-more-817849) (official).
- **Photoshop:** 2026-cycle release (UXP already the production plugin platform in Photoshop — Photoshop led this transition years ago). Exact current build not independently re-verified in this pass — confirm your installed version before relying on any version-specific Photoshop detail below.
- **Blender:** current stable reported as 5.2 (LTS, supported to July 2028), with 4.5 LTS (supported to July 2027) as the conservative/production-stable alternative — reported via a third-party version-tracking source, **not independently cross-checked against blender.org directly in this pass**; confirm your installed version before relying on version-specific Blender detail. [5](https://www.versio.io/en/product-release-end-of-life-eol-blender-blender.html) (secondary, flagged).

---

## 1. Deliverable 1 — Production Role Boundaries

| Role | Inputs | Outputs | Hands off to |
|---|---|---|---|
| **Storyboard Artist** | Script/VO, platform, duration, `DESIGN_DNA`, approved assets | A shot/scene-by-shot plan of **what happens and how it is staged** — composition, subjects, action, on-screen text, continuity | Motion Director (for animated shots) and/or Editor (if built from live footage) |
| **Motion Director** | Approved storyboard, styleframes, `DESIGN_DNA`, duration, frame rate | Element-by-element **behavior over time** — start/end states, timing, easing character, what moves vs. stays still | Technical Production Assistant (AE build) |
| **Short-Form Editor** | Available footage/transcript, script, objective, audience, platform | An **organization of existing material** into a timeline that communicates effectively — cuts, pacing, captions, B-roll placement | Technical Production Assistant (final assembly) and/or Sound Designer |
| **Technical Production Assistant** | Approved design + motion plan (or edit plan), asset list, application versions | **How to build the approved result** — AE layer/comp structure, expressions/scripts, cross-app handoff, render/export settings | Production (final build) and Production Review |
| **Sound Designer** | Script/timeline, mood, brand, available audio, delivery requirements | Direction supporting **meaning, rhythm and attention** — cue timing, music structure, voice pace, mix priorities | Technical Production Assistant (mix integration) and Production Review |

**Keep these distinct:** storyboard = *what happens and how it's staged*; motion direction = *how elements behave over time*; editing = *organizing available material to communicate*; technical planning = *how to build the approved result*; sound direction = *supporting meaning, rhythm, and attention* — none of these substitute for another. A storyboard is not a motion plan; an edit plan is not a build plan.

---

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

## 10. Deliverable 10 — Production Review and Worked Example

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

### Worked example `[FICTIONAL — no production actually occurred]`: 15-second Nomad grinder ad

**Script `[FICTIONAL]`:**
> VO: "Some mornings don't wait." (0-3s, over a quiet kitchen) / "The Nomad grinder keeps up." (3-8s, product reveal) / "Anywhere you brew." (8-13s, logo + tagline) / [silence, logo hold] (13-15s)

**→ Storyboard (`SB-00` output, abbreviated) `[SIMULATED]`:**
```
SHOT 1  0:00-0:03  Graphic scene, static kitchen counter, no camera (N/A).
        PURPOSE: establish ordinary morning tension. VO line 1 plays verbatim.
SHOT 2  0:03-0:08  Graphic scene — hand lifts cloth, grinder revealed (per
        Part 6's VP-14 product-reveal pattern, action order strictly:
        hand exits BEFORE grinder is fully visible). VO line 2 plays verbatim.
SHOT 3  0:08-0:13  Graphic scene — logo and tagline animate in. VO line 3
        plays verbatim.
SHOT 4  0:13-0:15  Logo hold, no VO (silence intentional per SCRIPT).
TOTAL: 15s — PASS, matches target DURATION exactly.
```

**→ Motion plan (`MD-00` output, abbreviated) `[SIMULATED]`:**
```
ELEMENT: Cloth (Shot 2). ACTION: lifts and exits frame left.
START/END TIME: 3.0s-5.0s @ 24fps. EASING: quick lift, no overshoot (a cloth
doesn't bounce). SOUND RELATIONSHIP: soft fabric SFX synced to lift start.
ELEMENT: Grinder (Shot 2). MUST REMAIN LOCKED position/silhouette/label
(inherits PC-01-style rule). Becomes visible only once cloth fully exits
(dependency: Cloth exit, 5.0s) — matches Part 6's forbidden-premature-reveal rule.
ELEMENT: Logo (Shot 3). ACTION: fades + scales in, slight overshoot then
settle, to feel confident rather than timid. START/END: 8.0s-9.5s.
STILL: background counter texture — stays static throughout shots 1-3 to
keep all attention on the foreground action.
```

**→ AE build plan (`AEB-00` output, abbreviated) `[SIMULATED]`:**
```
COMPOSITION SETTINGS: 1080x1920, 24fps, 15s, Rec.709 — derived from a
vertical-social DELIVERY_REQUIREMENT.
STRUCTURE: one master comp, 3 precomps (one per shot) — justified because
each shot has independent internal timing and benefits from isolated review.
TEXT LAYERS: tagline kept as live text (editable) for localization.
ANCHOR POINTS: logo's anchor point set to its visual center before the
scale/overshoot animation, to avoid an off-center scale artifact.
EFFECTS: native Scale/Opacity + a native Easy Ease-based curve for the
overshoot — no third-party plugin required.
MANUAL CHECK: confirm label text on the grinder graphic stays legible at
final 1080x1920 export resolution.
```

**→ Edit/sound plan (`SND` outputs, abbreviated) `[SIMULATED]`:**
```
SND-CON: sound's narrative role = confirm the reveal moment and support the
calm-but-capable brand tone; deliberate silence in shot 4 to let the final
logo hold land without competing for attention.
SND-SPOT: cue at 5.0s (grinder reveal) = a short, soft mechanical/ceramic
clink, TO BE SOURCED (not yet confirmed available).
SND-VOX: VO pace — unhurried through line 1, a touch more confident on line
2 at the reveal, settle into calm on line 3 — wording preserved exactly as scripted.
SND-REV note: target loudness to be confirmed against the actual delivery
platform's current spec before final mix (see SND-REV guidance above) — not
fixed here.
```

**→ Review checklist (`PR-00` applied) `[SIMULATED]`:**
```
ISSUE: none identified — this is a plan-only walkthrough, not an inspected
file; EVIDENCE: not observable, no actual render exists.
VERDICT: plan is internally consistent (durations reconcile, action order
respects the no-premature-reveal rule, identity/product-lock rules carried
through from motion plan to AE plan) — but this is a SIMULATED example.
No real approval was given, no real asset was produced, and no video or
audio file actually exists for this example.
```

**Expected output:** A full plan-to-review chain demonstrating how the deliverables connect — explicitly fictional throughout.

**Quality check:** No claim anywhere in the worked example states that footage, audio, or a real file was actually created, approved, or reviewed.

**Common failure:** Letting a worked example's confident tone imply real production occurred — always re-state the `[SIMULATED]`/`[FICTIONAL]` label at each stage.

---

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

### 11.2 Handoff for Part 8

```
PRODUCTION PROMPT IDS: SB-00, MD-00 (+ MD-KT/MD-GEO/MD-EXP/MD-CHAR/MD-MIX/
  MD-PROD/MD-TITLE/MD-ABS), ED-00, AEB-00, AEX-00, AES-DEV-00, AES-DEBUG-00,
  SUP-PR/SUP-PS/SUP-AI/SUP-BL/SUP-HO/SUP-EXP, SND-CON/SND-SPOT/SND-MUS/
  SND-VOX/SND-REV, PR-00.

APPROVED SCRIPT / STORYBOARD VERSION: none from a real project in this
  session — the 15s Nomad grinder example is explicitly [SIMULATED]/
  [FICTIONAL], not an approved real deliverable.

MOTION PLAN: MD-00 format — element-by-element start/end state, timing,
  behavior-first easing description, explicit still/why list, dependency
  check against DURATION.

EDIT PLAN: ED-00 format — purpose-annotated timeline, retention claims
  always labeled hypotheses, platform safe-area guidance flagged as
  secondary-sourced/needing reconfirmation.

BUILD STRUCTURE: AEB-00 format — justified comp/layer plan; precomps,
  controllers, and expressions used only where a stated reason exists;
  editable-text, anchor-point, coordinate-space, rotation/cropping,
  raster-scaling, missing-background-coverage, and plugin-dependency risks
  flagged before build.

ASSET DEPENDENCIES: traced from Part 5 CC-01/PC-01 identity/product locks
  through MD-00's MUST REMAIN LOCKED fields into AEB-00's layer plan — no
  new dependency format introduced in Part 7.

CODE STATUS / TESTING: All AEX-00/AES-DEV-00/AES-DEBUG-00 outputs in this
  part are CODE — UNTESTED. No script or expression was actually run in a
  live After Effects session during this work.

AUDIO PLAN: SND-CON/SND-SPOT/SND-MUS/SND-VOX/SND-REV formats — creative
  direction and measurable specs kept separate; no licensing/usage rights
  assumed from asset availability; loudness targets flagged as
  context-dependent and platform/client-spec-dependent, not fixed.

APPLICATION VERSIONS: After Effects 26.5 (Sept 2026) — CEP+ExtendScript
  production, UXP public beta targeted Nov 2026, not yet GA; Premiere Pro
  2026 (26.5.x) — UXP now GA, ahead of AE; Illustrator 2026 (v30.0, Oct 2025)
  — UXP rolling out, not yet GA; Photoshop 2026-cycle — UXP already
  production there, exact build not independently re-verified this pass;
  Blender 5.2 LTS / 4.5 LTS — reported via secondary source, not
  independently cross-checked against blender.org this pass. All recorded
  2026-10-06 — re-verify before relying on version-specific behavior.

DELIVERY REQUIREMENTS: None fixed from a real project this session — export/
  color-management/format settings in SUP-* must always be derived from
  whatever real delivery spec is supplied, never assumed.

REVIEW FINDINGS: None from a real inspected file — PR-00's worked-example
  application found the plan internally consistent but is explicitly
  [SIMULATED], not a real QA pass.

APPROVAL STATUS: Nothing in Part 7 has been approved by a real stakeholder;
  no timeline was edited, no project file was created, no code was executed,
  no footage was inspected.

UNRESOLVED ITEMS: Carried from Parts 1–6 (model/version churn generally;
  Nomad's real-vs-AI-generated-environment decision (DEC-002) still open;
  Nano Banana 2's exact reference-image count still unconfirmed; Kling 4.0's
  "coming soon" features still unconfirmed live). New in Part 7 — exact
  current Photoshop build and exact current Blender version both flagged as
  not independently re-verified this pass; platform safe-area and loudness
  numbers are secondary-sourced and should be reconfirmed against each
  platform/client's own current spec before final delivery.

NEXT TASK: Part 8 will integrate the full library through asset management,
  the Master Visual Bible, QA, client revisions, complete end-to-end
  workflows, and a practical cheat sheet.
```

**Stop — Part 7 complete.**
