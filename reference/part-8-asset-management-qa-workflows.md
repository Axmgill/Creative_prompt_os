# AI Creative Operating System — Part 8: Asset Management, Visual Bible, QA and Complete Workflows

**Final part.** Integrates Parts 1–7 by reference. No earlier prompt is rewritten or duplicated here — only the missing integration components (asset management, project-wide continuity, final QA, client revision system, team coordination, approval gates, complete chains, maintenance) are built new.

**Standing rules carried forward unchanged:** Part 2's `STD-00` entry shape, ID/version conventions, and conflict rule; no persistent memory/shared storage/autonomous agents/application access is assumed anywhere below — every workflow is manual-first, with automation described only where the required integration is actually real and verifiable (which, as of this writing, is nowhere in this stack — these are separate tools with no shared memory).

**Status vocabulary used throughout Part 8** (per the task's required set): `PROPOSED` → `IN PROGRESS` → `READY FOR REVIEW` → `APPROVED` → `REJECTED` → `SUPERSEDED`. These extend, not replace, Part 2's existing status tags (`[CONFIRMED]`, `[ASSUMPTION]`, `[UNKNOWN]`, `[APPROVED: DEC-ID]`) and Part 2's Decision Log `STATUS` field (`Proposed/Approved/Rejected/Superseded`) — the asset/review-specific states just add the production-pipeline stages `IN PROGRESS` and `READY FOR REVIEW` in between.

---

## 1. Deliverable 1 — Library Integration Audit

This audits only what was actually produced in Parts 1–7 of this session (no external `[LIBRARY_INDEX]` or prior asset records were supplied — if you have real ones, paste them and this table gets re-run against them).

| System | Existing prompt/template ID | Dependencies | Status | Gap or duplication | Recommended action |
|---|---|---|---|---|---|
| Research & routing | `RD-Tool-Landscape`, `RD-Task-Routing-Matrix`, `RD-Starting-Stack`, `RD-Control-Limitations` (Part 1) | None (foundational) | EXISTING | None — correctly kept as reference material, not run-able prompts | Re-verify periodically per Part 1's own update checklist; no Part 8 action needed |
| Project foundation | `CTX-00`, `VAR-00`, `STD-00`, `MST-00`, `HND-00`, `DEC-00`, `APR-00`, `CHG-00`, `BA-01` (Part 2) | None (foundational) | EXISTING | None | Reused by reference throughout Part 8 — not recreated |
| Creative direction | `CD-01`–`CD-04` (Part 3) | `CTX-00`, `BA-01` | EXISTING | None | None |
| Art direction | `AD-01` (+ follow-ups) (Part 3) | `CD-01` output | EXISTING | None | None |
| Claude Design | Capability check + `DP-01` Senior Design Partner (Part 4) | — | EXISTING (capability check concluded Claude Design itself has limited direct relevance; `DP-01` is the actual working critique partner) | None | None |
| Design DNA | `DNA-00` template, `DNA-01` builder, `DNA-03` consistency check (Part 4) | `AD-01`, `CD-01` | EXISTING | None, but see Deliverable 3 below — the new Visual Bible **links to** `DNA-00`/`DNA-01`, it does not restate them | Cross-reference only, no rebuild |
| References | `RA-01` Reference Analyst (Part 3), `REF-01` Reference Role Map (Part 5) | `AD-01` | EXISTING — two complementary tools, not duplicates: `RA-01` interprets a reference's meaning/territory fit, `REF-01` assigns a reference's role as generation input | Minor naming overlap only | Add a one-line cross-note in each file: "see also `RA-01`/`REF-01` for the other reference-handling stage" |
| Styleframes | `SF-01` specification (Part 4), `IP-01` generation-ready counterpart (Part 5) | `DNA-00`, `CC-01`/`PC-01` | EXISTING | None | None |
| Image generation | `IMG-00`, `ADP-OAI-01/GGL-01/MJ-01/BFL-01/IDG-01/RCF-01/ADB-01`, `IP-01`–`IP-12`, `REF-01`, `CC-01`, `PC-01`, `EDIT-01`, `IGC-01`/`IGC-02` (Part 5) | `DNA-00`, `REF-01` | EXISTING | None | Adapters already labeled MODEL-SPECIFIC — VERIFY PERIODICALLY; no new action |
| Video generation | `VID-00`, `ADPV-GGL-01/RUN-01/KLG-01/SDC-01/LUM-01/ADB-01`, `VP-01`–`VP-16`, `MCE-01`, `CAM` modules, `ASQ-01`, `VCC-01`, `VPD-01` (Part 6) | `IMG-00`, `CC-01`/`PC-01` for image-to-video | EXISTING | None | Kling 4.0 adapter specifically flagged as still rolling out — re-verify before next use |
| Storyboards | `SB-00` (Part 7) | `CTX-00`, approved script, `DNA-00` | EXISTING | None | None |
| Motion direction | `MD-00` + 8 specialized modules (Part 7) | `SB-00`, `DNA-00`, `MR-01` | EXISTING — `MR-01` (Part 4, checks whether a *static* design is motion-ready) and `MD-00` (Part 7, *is* the motion plan) are sequential, not duplicates | None, but the relationship wasn't stated explicitly before | Add one cross-reference line between `MR-01` and `MD-00` |
| Editing | `ED-00` (Part 7) | Footage/transcript | EXISTING | None | None |
| Technical production | `AEB-00`, `AEX-00`, `AES-DEV-00`, `AES-DEBUG-00`, `SUP-PR/PS/AI/BL/HO/EXP` (Part 7) | `MD-00`, `SB-00` | EXISTING | None | None |
| Sound | `SND-CON/SPOT/MUS/VOX/REV` (Part 7) | `SB-00`, `ED-00` | EXISTING | None | None |
| **Asset management** | — | `DNA-00`, `CC-01`, `PC-01`, every generated output | **MISSING until now** — Part 5's own Part-6 handoff explicitly deferred "the full registry" to Part 8, so this is a planned, acknowledged gap, not an oversight | — | **BUILD** — Deliverable 2 (`ASM-01`) |
| **Continuity** | `VCC-01` (Part 6 — single shot/clip only) | `GENERATED_VIDEO`, `VID-00` | **PARTIAL** | Gap: no project-wide, cross-shot, cross-asset continuity check existed before this part | **EXTEND** — Deliverable 4 (`CTY-00`) calls `VCC-01` per-shot and adds cross-shot/cross-asset checks; does not replace it |
| **QA** | `PR-00` (Part 7 — mid-production review of one deliverable) | Storyboard/motion/AE/edit/sound plans | **PARTIAL** | Gap: no final, delivery-compliance-focused sign-off gate existed; risk of conflating `PR-00` with a final gate | **BUILD** — Deliverable 5 (`QA-00`) is explicitly a later, different gate that can reference `PR-00`'s findings as one input, not a replacement for it |
| **Client revisions** | `CHG-00` (Part 2 — records a change only) | `DEC-00` | **PARTIAL** | Gap: nothing interpreted feedback, planned revision impact, or drafted a client response; `CHG-00` only records that a change happened | **BUILD** — Deliverable 6 (`FB-01`/`RP-01`/`RR-01`/`CRD-01`), explicitly linked to `CHG-00` and `DEC-00`, not replacing them |

**Note on domain-code drift:** Part 2 originally anticipated the Part 7 domain codes would be `MO`/`AEX`/`SND` only; in practice Part 7 used `SB`/`MD`/`ED`/`AEB`/`AEX`/`AES`/`SUP`/`SND`/`PR` as the work turned out to need finer distinctions. This is normal, permitted drift under Part 2's own extensibility rule ("Parts 3–8 will register" new codes as needed) — flagged here for traceability, not as an error.

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

## 7. Deliverable 7 — Creative-Team Coordination (`TEAM-00`)

| Role | Input contract | Output contract | Inherited context | Authority limits | Handoff recipient | Returns work when |
|---|---|---|---|---|---|---|
| Researcher | A specific question/task | Verified findings + citations + confidence | `PROJECT_CONTEXT` | Cannot approve tool choices, only recommend | Creative Strategist / Project owner | Question is unanswerable with available access — flags it, doesn't guess |
| Creative Strategist / Creative Director | `BRIEF` + `PROJECT_CONTEXT` | Communication problem + territories + recommendation | `CTX-00`, `DEC-00` | Cannot select the final territory — that's a human call | Art Director | Brief lacks enough to define a problem |
| Art Director / Claude Design | Approved territory | Visual direction + locked rules | `CD-01` output | Cannot approve its own direction | Storyboard Artist / Design DNA builder | Territory itself is incomplete |
| Storyboard Artist | Script + approved direction | Shot-by-shot staging plan | `AD-01`, `DNA-00` | Cannot rewrite approved script without flagging it | Motion Director / Asset Manager | Script doesn't fit runtime |
| Asset Manager | Any asset info | Registry records | `DNA-00`, `CC-01`/`PC-01` | Cannot approve an asset — only records status | Generator / Continuity Supervisor | Asset info is unconfirmed/missing |
| Prompt Engineer | Approved spec (image/video/motion) | Model-routed, adapter-correct prompt | `IMG-00`/`VID-00`, relevant adapter | Cannot invent unverified model syntax | Generator (human operating the tool) | Spec is ambiguous/contradictory |
| Generator (human + tool) | Finished prompt | Generated asset (actual file) | Adapter settings | N/A — executes, doesn't plan | Asset Manager (to register) → Continuity Supervisor | Output fails acceptance criteria |
| Motion Director / Editor | Approved styleframe/footage | Motion plan / edit timeline | `MD-00`/`ED-00` | Cannot approve final cut | Technical Production Assistant | Timing/communication doesn't work |
| Continuity Supervisor | Generated material + specs + registry | Issue report | `VCC-01`/`CTY-00` | Cannot fix issues itself — flags only | Whichever role owns the broken element | N/A — always reports, never blocks silently |
| Quality Control | Finished deliverable | PASS/PASS WITH FIXES/BLOCKED recommendation | `QA-00` | **Cannot grant final approval** — recommends only | Human (then Client) | N/A |

**Which tasks run independently:** Researcher, Asset Manager record-keeping, Prompt Engineer drafting, and Continuity/QA *reviews* of already-existing material can all run without waiting on another role mid-task.

**Which require approved upstream decisions:** Art Direction needs an approved territory; Storyboard needs approved direction + script; Generation needs an approved spec/asset reference; Final QA needs the deliverable to actually exist.

**How conflicting recommendations are resolved:** never by the AI roles themselves picking a winner — escalate to the human via Part 2's conflict rule; if two AI-role outputs disagree (e.g., Art Director's camera rule vs. a Motion Director's proposed camera move), both are presented with their reasoning and the human decides, logged as a `DEC-00` entry.

**How missing inputs are handled:** every role states explicitly what's missing and asks — never invents a plausible substitute (consistent with every earlier Part's shared rule).

**How to prevent repeated research and project restarts:** every task opens by loading `CTX-00` + `DEC-00` (+ `VB-00` once it exists) before doing anything new — this is the single habit that prevents re-litigating settled decisions in a fresh chat with no memory.

### 7.1 Manual workflow (the actual, reliable version)

```
1. Open CTX-00 + DEC-00 (+ VB-00) for the project — paste into the new chat/tool.
2. Identify which role's task this is (use TEAM-00 above).
3. Paste that role's master prompt + the specific HND-00 handoff for this task.
4. Receive output. Check it against the role's output contract.
5. If it proposes a change to a LOCKED/APPROVED item, route it through CHG-00
   before accepting it.
6. Copy the output into your own files (update ASM-01/CTY-00/QA-00 records
   as relevant) — no tool remembers this for you.
7. Build the next role's HND-00 handoff from this output, and repeat.
```

### 7.2 Multi-agent automation — prerequisites, not an assumption

If you later wire these roles into an automated/agentic pipeline, it requires (none of which is assumed available here): a shared file store every agent can actually read/write (this workspace is not that — it resets per conversation unless you export it), a trigger/orchestration layer that passes `HND-00` blocks between agents in the correct order, and the same conflict-escalation rule enforced programmatically (an agent must not auto-approve a change to a `LOCKED` field). Until you have verified all three exist and work together, **use the manual workflow above** — it's slower per step but has zero hidden failure modes.

---

## 8. Deliverable 8 — Human Approval Gates

Reuses Part 2's `APR-00` template exactly, scaled to 10 named stages.

| Gate | Review material | Decision required | Acceptance criteria | What becomes locked | May proceed to |
|---|---|---|---|---|---|
| Strategy | `CD-01` territories | Select one territory | Passes Relevance/Distinctiveness/Feasibility | The chosen communication problem + territory | Art direction |
| Concept | Developed territory (`CD-03`) | Confirm sharpened concept | Central idea survives scrutiny | Core idea, central tension | Art direction build-out |
| Art direction | `AD-01` output | Approve visual direction | Matches concept, feasible | Camera/lighting/color/material rules | Design DNA |
| Design DNA | `DNA-00`/`DNA-01` | Approve the rulebook | Every rule has a stated purpose + acceptance test | `VB-00`'s essential rules | Styleframes, storyboard |
| Storyboard | `SB-00` output | Approve staging plan | Durations reconcile, message intact | Shot list, staging, on-screen copy | Motion/AE planning, generation |
| Styleframe | `SF-01`/generated image | Approve visual look | Matches Design DNA, passes `IGC-01` | Specific visual treatment per shot type | Full-scale generation, animation |
| Hero assets | `CC-01`/`PC-01` masters | Approve master identity | Matches brief/brand, human-approved source | Character/product identity | All downstream generation referencing it |
| Animatic | Timed storyboard/rough motion | Approve pacing | Communicates in the right order within duration | Timing intent, shot order | Full animation/AE build |
| Rough cut | Assembled edit (no final polish) | Approve structure | Message/pacing work before polish investment | Edit structure, shot selection | Final sound/color/polish |
| Final delivery | `QA-00` output + actual file | Approve for release | Passes `QA-00`, meets `DELIVERABLE` spec | Nothing further — this is the end state | Client delivery |

**Internal creative approval vs. client approval:** kept as two explicit, separately recorded decisions at any gate where both apply (per Part 2's `APR-00` note) — your own creative bar can pass while a client sign-off is still pending, or vice versa; never conflate the two in one `OUTCOME` field.

**Scaling for simple projects:** a single static graphic needs only **Final Delivery**; a short-form edit or single styleframe set needs **Concept + Final Delivery**; a multi-shot commercial needs most or all ten. Don't run a gate that has nothing new to decide — e.g., skip a separate "Hero Assets" gate if the project has no character/product master to lock.

**Where human judgment matters most:** territory/concept selection (this is genuinely a taste-and-strategy call no routing table replaces), locking identity/brand rules (expensive to redo once production starts), and final client-facing sign-off (reputational and contractual, never an AI call). Where it matters least: re-approving something that only fixed a previously-flagged technical defect with no creative change — that can be a lighter-touch confirmation, not a full gate re-run.

---

## 9. Deliverable 9 — Complete Prompt Chains

Each chain references prompts by ID only — full text lives in the part noted.

### 9.1 Product commercial (`WF-01`)
| Step | Prompt/Role | Required input | Expected output | Approval | Next handoff |
|---|---|---|---|---|---|
| 1 | `BA-01` (Part 2) | Brief | Structured brief analysis | — | `CD-01` |
| 2 | `CD-01`–`CD-04` (Part 3) | Brief analysis | Territory + recommendation | **Gate: Strategy** | `AD-01` |
| 3 | `AD-01` (Part 3) | Approved territory | Visual direction | **Gate: Art direction** | `DNA-01` |
| 4 | `DNA-01` (Part 4) | Art direction | Design DNA | **Gate: Design DNA** | `PC-01`, `SB-00` |
| 5 | `PC-01` (Part 5) | Real product photo | Product master | **Gate: Hero assets** | `SF-01`/`IP-05` |
| 6 | `SB-00` (Part 7) | Script/VO, DNA | Storyboard | **Gate: Storyboard** | `VID-00`/`MD-00` |
| 7 | `VID-00` + `ADPV-*` (Part 6) or `MD-00`+`AEB-00` (Part 7) | Storyboard shots | Video/motion-design shots | **Gate: Styleframe/Animatic** | `CTY-00` |
| 8 | `CTY-00` (Part 8) | All shots | Continuity report | — | Fix loop, then `QA-00` |
| 9 | `QA-00` (Part 8) | Finished edit | PASS/FIX/BLOCKED | **Gate: Final delivery** | Client |

**Minimum viable:** skip step 1 if the brief is already clear; combine steps 2–3 for a low-stakes project (`CD-01` QUICK tier feeding directly into `AD-01`). **Fallback if generation fails** (steps 5/7): route to traditional photography/compositing or manual AE build per Part 5/6's "when traditional production wins" sections — never force a failing generation through more prompt iterations indefinitely.

### 9.2 Short-form social video (`WF-02`)
`BA-01` → `ED-00` (if footage exists) or `SB-00`→`MD-00` (if building from scratch) → `SND-VOX`/`SND-MUS` → `CTY-00` → `QA-00` → Client. **Minimum viable:** `ED-00` alone for a quick-turn edit of existing footage with no new generation. **Fallback:** if B-roll/generated inserts fail, fall back to available real footage only, flagged in `ASM-01`.

### 9.3 2D motion-design explainer (`WF-03`)
`BA-01` → `CD-01` → `AD-01` → `DNA-01` → `SF-01`/`IP-01`/`IP-02` → `MR-01` → `MD-00` (`MD-EXP` module) → `AEB-00` → `AEX-00`/`AES-DEV-00` as needed → `SND-VOX`/`SND-MUS` → `QA-00`. **Minimum viable:** skip `AEX-00`/`AES-DEV-00` entirely if no custom expression/script is actually needed — most explainers don't. **Fallback:** if a generated styleframe can't hit the required flat-vector precision (per Part 6's `VP-10` honesty flag), build it by hand in Illustrator/AE instead.

### 9.4 UGC-style advertisement (`WF-04`)
`BA-01` → `CD-01` (lighter-weight, often QUICK tier) → `SB-00` → `VID-00`+`ADPV-*` using `VP-08` (UGC-style clip) and the Phone Video/Handheld `CAM` modules → `SND-VOX` → `QA-00`. **Minimum viable:** skip formal Design DNA — UGC intentionally avoids a polished, locked visual system. **Fallback:** if generated UGC reads as too polished (common failure per `VP-08`), reinforce visible imperfection explicitly or shoot real UGC-style footage instead.

### 9.5 AI-generated cinematic sequence (`WF-05`)
`BA-01` → `CD-01` → `AD-01` → `DNA-01` → `SF-01` styleframes per shot → `VID-00` per shot using `VP-09` (cinematic shot) + relevant `CAM` modules → `ASQ-01` (feasibility check per shot) → `CTY-00` (project-wide) → `QA-00`. **Minimum viable:** not recommended to skip `ASQ-01` here — cinematic multi-beat shots are exactly where action-complexity failures happen most. **Fallback:** split an overambitious single-generation shot into a `SHOT PACKAGE` (Part 6's distinction) and assemble in Premiere.

### 9.6 Character-consistent image-to-video project (`WF-06`)
`BA-01` → `CD-01` → `AD-01` → `DNA-01` → `CC-01` (approve master identity) → `SF-01`/`IP-03` (neutral pose styleframe) → `VID-00`+`ADPV-*` using `VP-06` (character action) → `VCC-01` per shot + `CTY-00` project-wide → `QA-00`. **Minimum viable:** for a single short clip, `CTY-00` can be skipped in favor of `VCC-01` alone. **Fallback:** if identity drifts across shots (common failure per `VP-06`), regenerate using a higher-weighted identity reference per the relevant `ADPV-*` adapter, or composite a locked character layer over generated backgrounds instead.

### 9.7 Client revision cycle (`WF-07`)
`CLIENT_FEEDBACK` → `FB-01` → (if conflicting) `CHG-00`→`DEC-00` → `RP-01` → execute the actual fix (whichever role/prompt owns the affected element) → `RR-01` → `CRD-01` → Client. **Minimum viable:** for a trivial, non-conflicting request, `FB-01`+direct fix+`CRD-01` is enough — `RP-01`'s full impact analysis is for anything touching more than one asset/shot. **Fallback:** if the requested change isn't achievable within budget/timeline, `RP-01`'s SCOPE/SCHEDULE IMPACT output is the basis for `CRD-01`'s client-facing explanation of why, with alternatives.

### 9.8 Worked demonstration `[FICTIONAL — no real project ran end-to-end]`

Continuing `BREWCO-NOMAD-2026-10` across all eight parts, compact handoff chain:

```
BA-01 → "15s vertical launch video, premium-but-approachable, no VO" [Part 2]
CD-01 → "Anywhere Bar" territory selected [simulated human approval, Part 3]
AD-01 → single warm key light, rounded forms, hard-cut transformation [Part 3]
DNA-01 → DNA-00 v0.1 drafted, DEC-003 locks the lighting rule [Part 4]
PC-01 → Nomad grinder master from a [FICTIONAL] real product photo [Part 5]
SB-00 → 4-shot storyboard, 15s, reconciled [Part 7, re-applied retroactively here]
VID-00 + ADPV-GGL-01 (Veo 3.1) → product-reveal shot per VP-14 [Part 6]
MD-00 → logo motion plan [Part 7]
CTY-00 → checked grinder geometry/light across all 4 shots — 0 CRITICAL issues [SIMULATED, Part 8]
QA-00 → PASS WITH FIXES — label legibility flagged on shot 2 [SIMULATED, Part 8]
CRD-01 → draft client note: "one small label-legibility fix before final delivery" [SIMULATED, not sent]
```
No video, image, or audio file was actually produced at any step above — every output is a specification or simulated review, consistent with every earlier part's labeling rule.

---

## 10. Deliverable 10 — 25 Highest-Value Prompts

Ranked for a solo 2D Motion Designer / Animator / Short-Form Video Editor. All IDs below are real, built in Parts 2–8 of this session (no index was supplied beyond this session's own output, so nothing outside it is referenced).

### Learn first (the daily backbone)
1. **`MST-00`** Start Any Project — *why:* prevents every project from starting with a blank, context-free chat. *When:* literally first, every time. *Min inputs:* a one-line project idea. *Invocation:* `/start-project [idea]`.
2. **`CTX-00`** Project Context Template — *why:* the one file every other prompt depends on. *When:* right after `MST-00`. *Min inputs:* answers to its own fields. *Invocation:* fill once, paste everywhere.
3. **`BA-01`** Brief Analysis — *why:* turns a messy real brief into usable structure before creative work starts. *When:* any time a client/self-brief exists. *Min inputs:* the brief text. *Invocation:* `/brief [paste]`.
4. **`CD-01`** Creative Director Territories — *why:* forces genuinely distinct concept options instead of one assumed direction. *When:* before any visual work. *Min inputs:* `BRIEF`, `PROJECT_CONTEXT`. *Invocation:* `/creative-director`.
5. **`AD-01`** Art Director Direction — *why:* converts a chosen concept into concrete, lockable visual rules. *When:* after territory selection. *Min inputs:* approved territory. *Invocation:* `/art-director`.
6. **`DNA-01`** Design DNA Builder — *why:* this is what actually prevents visual drift across every later asset. *When:* once art direction is approved. *Min inputs:* `AD-01` output. *Invocation:* `/design-dna`.
7. **`SF-01`** Styleframe Designer — *why:* the direct bridge from DNA to a generation-ready visual spec. *When:* before any image generation. *Min inputs:* `DNA-00`. *Invocation:* `/styleframe`.
8. **`REF-01`** Reference Role Map — *why:* the single most common real-world generation failure (conflicting references) is solved by this one table. *When:* any time more than one reference image is used. *Min inputs:* the reference images + their intended roles. *Invocation:* `/reference-control`.
9. **`SB-00`** Storyboard Artist — *why:* the actual staging plan that everything downstream builds from. *When:* once a script/concept is approved. *Min inputs:* script, duration, platform. *Invocation:* `/storyboard`.
10. **`MD-00`** Motion Director — *why:* converts static approval into checkable motion behavior, your actual day-to-day craft. *When:* once a styleframe/storyboard shot is approved. *Min inputs:* styleframe, duration, frame rate. *Invocation:* `/motion-director`.

### Add next (production scaling)
11. **`ED-00`** Short-Form Editor — *why:* the practical tool for every retention/pacing decision on real footage. *When:* footage/transcript exists. *Invocation:* `/shorts-editor`.
12. **`AEB-00`** AE Build Planner — *why:* turns an approved motion plan into an actual buildable layer structure, saving real build time. *When:* before opening After Effects. *Invocation:* `/design-to-ae`.
13. **`CC-01`/`PC-01`** Character/Product Consistency — *why:* the master-asset discipline that prevents re-litigating identity every single generation. *When:* any recurring character/product. *Invocation:* reference the master ID in every generation prompt.
14. **`IP-01`–`IP-12`** Core Image Prompt Library — *why:* covers the 12 most common image needs without reinventing a prompt structure each time. *When:* any still-image generation task. *Invocation:* `/image-prompt [which]`.
15. **`EDIT-01`** Controlled Image Editing — *why:* scopes exactly what should and shouldn't change in an edit — the #1 way to stop an edit from altering more than intended. *When:* editing an existing approved image. *Invocation:* `/image-edit`.
16. **`IGC-01`/`IGC-02`** Generation Review/Debug — *why:* smallest-correction-first debugging beats endless prompt rewriting. *When:* a generation doesn't match expectations. *Invocation:* `/image-review` / `/image-debug`.
17. **`VID-00`** Shared Video Shot Specification — *why:* the model-independent shot spec that makes switching video models painless. *When:* before any video generation. *Invocation:* `/video-spec`.
18. **`MCE-01`** Motion Constraint Engine — *why:* turns a vague motion idea into checkable MUST/MAY/LOCKED/FORBIDDEN rules. *When:* any generated motion with identity or product stakes. *Invocation:* `/motion-constraints`.
19. **`CAM`** Camera Language Modules — *why:* a concise, reusable vocabulary that actually distinguishes real control from prompt influence. *When:* any camera-described shot. *Invocation:* `/camera-module [which]`.
20. **`VCC-01`** Video Continuity Critic — *why:* catches identity/continuity failures before they reach a client. *When:* after any generated clip. *Invocation:* `/video-continuity`.

### Use for advanced production (this part's additions)
21. **`ASM-01`** Asset Manager — *why:* the registry that makes a multi-asset project actually trackable instead of remembered. *When:* any project with more than a couple of recurring assets. *Invocation:* `/asset-register` *(new, see Section 11.1)*.
22. **`VB-00`/`VB-01`** Master Visual Bible — *why:* the compact, linking source of truth that prevents 10 scattered documents from quietly disagreeing. *When:* any project big enough to have a Design DNA, character, and product all at once. *Invocation:* `/visual-bible-build` *(new)*.
23. **`CTY-00`** Project-Wide Continuity Supervisor — *why:* catches cross-shot drift that single-shot review (`VCC-01`) structurally can't see. *When:* multi-shot projects. *Invocation:* `/project-continuity` *(new)*.
24. **`QA-00`** Quality-Control Director — *why:* the final, evidence-separated gate before anything ships. *When:* every deliverable, before delivery. *Invocation:* `/qa-review` *(new)*.
25. **`FB-01`/`RP-01`** Client Feedback Interpreter + Revision Planner — *why:* turns client notes into scoped, non-reactive revisions instead of ad hoc edits. *When:* any client revision round. *Invocation:* `/feedback-interpret` *(new)*.

---

## 11. Deliverable 11 — 10 Underused Workflows

### 1. Reference analysis into Design DNA
**Trigger:** a strong visual reference exists but no DNA yet. **Inputs:** reference image(s), `RA-01`. **Steps:** `RA-01` → identify underlying principles (not surface copying) → feed into `DNA-01`. **Benefit:** grounds DNA in something concrete instead of abstract adjectives. **Human decision point:** which extracted principle is actually relevant to *this* brand, vs. just true of the reference. **Failure to watch for:** copying the reference's literal style instead of its underlying principle.

### 2. Local prompt debugging before re-generation
**Trigger:** a generation fails. **Inputs:** `IGC-02`/`VPD-01`. **Steps:** diagnose cause → one controlled revision → test. **Benefit:** avoids the expensive habit of rewriting a whole prompt (and burning credits) on every failure. **Human decision point:** whether the smallest fix is actually sufficient or a structural rethink is needed. **Failure to watch for:** skipping the diagnosis step and jumping straight to "add more descriptive words."

### 3. Controlled image editing instead of re-generation
**Trigger:** 90% of an approved image is right, 10% needs to change. **Inputs:** `EDIT-01`. **Steps:** scope protected region → scope edit region → check for side effects → edit. **Benefit:** preserves the approved 90% instead of re-rolling the whole image and losing it. **Human decision point:** whether the asset is even a good candidate for editing vs. needing a fresh generation. **Failure to watch for:** not specifying the protected region, letting the edit drift into untouched areas.

### 4. Static design into motion logic
**Trigger:** a styleframe is approved and animation is next. **Inputs:** `MR-01` then `MD-00`. **Steps:** run `MR-01` first (is this asset even built in a way that *can* animate — separate layers, clear anchor points) before `MD-00`. **Benefit:** catches a design that will be painful to animate before motion planning wastes time on it. **Human decision point:** whether to send the design back for restructuring or animate it as-is with a workaround. **Failure to watch for:** skipping `MR-01` and discovering mid-AE-build that an asset wasn't separated into usable layers.

### 5. Asset dependency tracking before a revision
**Trigger:** any approved asset is about to change. **Inputs:** `ASM-01`. **Steps:** run the "find missing dependencies"/"identify assets affected" follow-ups before touching anything. **Benefit:** prevents a locked palette change from silently breaking six already-approved shots. **Human decision point:** whether the downstream impact is acceptable or the change needs to be scoped differently. **Failure to watch for:** changing a master asset and only discovering the breakage after the fact.

### 6. Cross-shot continuity checks before final assembly
**Trigger:** multiple shots exist, about to be cut together. **Inputs:** `CTY-00`. **Steps:** run before, not after, final edit assembly. **Benefit:** fixing a continuity break is far cheaper before it's buried in a locked edit. **Human decision point:** which flagged issues are genuinely consequential vs. a minor artifact (per the severity-prioritization rule). **Failure to watch for:** treating every finding as equally urgent.

### 7. Design mentorship mode for deliberate skill-building
**Trigger:** you want to improve a specific skill, not just finish a task. **Inputs:** `DM-01`/`DM-02`/`DM-03` (Part 4). **Steps:** pick guided vs. independent-attempt mode, work a real or practice piece through it. **Benefit:** compounds your own judgment over time instead of only producing one-off outputs. **Human decision point:** honestly choosing independent-attempt mode when you're tempted to just ask for the answer. **Failure to watch for:** defaulting to guided mode indefinitely and never testing your own judgment.

### 8. Preproduction feasibility testing before committing a direction
**Trigger:** a concept is exciting but technically uncertain. **Inputs:** `CR-01` (Creative Challenge, Part 3) + `ASQ-01` (Action Sequencer, Part 6) for any motion-heavy beat. **Steps:** stress-test the concept's risks, then check whether its hardest shot is actually achievable within a realistic duration/model combination. **Benefit:** catches an unworkable concept before client presentation, not after a failed production attempt. **Human decision point:** whether a flagged risk is acceptable or disqualifying. **Failure to watch for:** presenting a concept to a client before checking its hardest shot is even plausible.

### 9. Revision impact analysis before promising a turnaround
**Trigger:** a client asks "can you just quickly change X?" **Inputs:** `RP-01`. **Steps:** run the impact analysis *before* answering, not after agreeing to a timeline. **Benefit:** prevents committing to a deadline that a hidden dependency chain makes impossible. **Human decision point:** whether to accept the revision as scoped or negotiate. **Failure to watch for:** answering "sure, easy" before checking `ASM-01`'s dependency chain.

### 10. Reusable project handoffs across separate chats/tools
**Trigger:** switching from one AI tool/chat to another mid-project (the normal case in this stack). **Inputs:** `HND-00`. **Steps:** always fill and paste a handoff block rather than re-explaining the project from memory. **Benefit:** the single biggest time-saver in a no-persistent-memory, multi-tool workflow — this is the practice the entire eight-part system assumes you'll actually do. **Human decision point:** deciding how much context a specific task genuinely needs (don't paste everything by default). **Failure to watch for:** starting a fresh chat with no handoff and re-deciding things that were already approved.

---

## 12. Deliverable 12 — One-Page Cheat Sheet (`CHEAT-00`)

```
┌─────────────────────────────────────────────────────────────────────┐
│ AI CREATIVE OS — CHEAT SHEET                                         │
├─────────────────────────────────────────────────────────────────────┤
│ START A PROJECT: /start-project → fill CTX-00 → open decision_log.md │
│                                                                       │
│ WHICH ROLE NEXT? (follow in order, skip what isn't needed)           │
│  Brief → BA-01 → CD-01(concept) → AD-01(direction) → DNA-01(rules)   │
│  → CC-01/PC-01(masters) → SB-00(storyboard) → SF-01/IP-*(stills)     │
│  → VID-00/ADPV-*(video) or MD-00→AEB-00(motion/AE) → ED-00(edit)     │
│  → SND-*(sound) → CTY-00(continuity) → QA-00(final check)            │
│                                                                       │
│ ESSENTIAL CONTEXT TO PASTE INTO EVERY NEW CHAT:                      │
│  CTX-00 (current version) + relevant DEC-00 entries + VB-00 extract  │
│  (use VB-04 to pull only what this task needs) + a filled HND-00     │
│                                                                       │
│ CORE COMMANDS: /storyboard /motion-director /shorts-editor           │
│  /design-to-ae /ae-expression /ae-debug /video-spec /video-prompt    │
│  /video-continuity /video-debug /asset-register /visual-bible-build  │
│  /project-continuity /qa-review /feedback-interpret                  │
│                                                                       │
│ APPROVAL REMINDERS:                                                  │
│  - Nothing LOCKED/APPROVED changes without a CHG-00 → DEC-00 entry.  │
│  - AI never grants final client approval — QA-00 recommends only.    │
│  - Your creative approval and client approval are separate checks.   │
│                                                                       │
│ GENERATION-DEBUGGING RULE:                                           │
│  Diagnose first (IGC-02/VPD-01) → ONE smallest correction → test.    │
│  Never rewrite the whole prompt after every single failure.          │
│                                                                       │
│ CONTINUITY CHECKS: VCC-01 per shot → CTY-00 across the whole project │
│  before final assembly. Never skip straight to the edit.             │
│                                                                       │
│ DELIVERY CHECKS: every DELIVERABLE in CTX-00 present? Every asset    │
│  in ASM-01 status = APPROVED (none PROPOSED/REJECTED in the final    │
│  package)? Spec (format/duration/loudness) checked against the REAL  │
│  requirement, not assumed? → then run QA-00.                         │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 13. Deliverable 13 — Maintenance and Versioning

**Stable principles (do not re-verify per model — these are structural, not model-specific):** the ID/versioning scheme, the `STD-00` entry shape, the conflict rule, the status vocabulary, the source-of-truth hierarchy, the role-boundary definitions, the camera-translation/rotation/zoom distinctions, the "actual control vs. prompt-based influence" distinction. **Model-specific adapters (verify periodically, individually):** every `ADP-*`/`ADPV-*` file, and any hard number (duration, resolution, reference count, pricing) quoted anywhere in Parts 1, 5, or 6.

### 13.1 Update procedure
```
1. VERIFY official information (the vendor's own docs/blog/release notes —
   not an aggregator, unless no official source exists, in which case label
   it secondary explicitly).
2. IDENTIFY affected prompts — search for every adapter/reference ID that
   cites the changed fact.
3. TEST relevant behavior where possible (if you have access) — note
   explicitly if this wasn't done.
4. RECORD evidence and limitations — what was confirmed, what wasn't, date.
5. UPDATE the adapter — never the core/model-independent prompt it's
   attached to, unless the core logic itself is actually wrong.
6. PRESERVE the previous version — move to /Library/_Deprecated/, never delete.
7. ADD a changelog entry (template below).
```

### 13.2 Library version record
```
LIBRARY VERSION RECORD
OVERALL LIBRARY VERSION:        [vX.X — bump only on structural changes]
LAST FULL REVIEW DATE:
PARTS COMPLETE:                 1–8 (this session)
PARTS NOT YET BUILT:            [none, if all 8 delivered]
KNOWN-STALE ADAPTERS:           [list, with the date they were last verified]
```

### 13.3 Model-verification record (one per adapter)
```
MODEL / TOOL:
ADAPTER ID:
LAST VERIFIED DATE:
VERIFIED BY:                    [tool used to verify — e.g. "official docs
                                 fetch" / "web search, secondary sources only"]
VERIFIED FACTS:                 [list — only what was actually re-checked]
UNVERIFIED / CARRIED FORWARD:   [anything NOT re-checked this pass — be
                                 explicit, don't imply the whole adapter was re-verified]
CHANGES SINCE LAST VERSION:
```
**Never state "the library is research-verified" as a blanket claim** — only specific entries, on specific dates, by specific methods, are verified. Record it per entry.

### 13.4 Changelog template
```
CHANGELOG ENTRY
DATE:
PROMPT/ADAPTER ID(S) AFFECTED:
TRIGGER:                        [new model release / renamed product /
                                 changed availability / new capability /
                                 deprecated feature / repeated production failure]
WHAT CHANGED:
EVIDENCE:
PREVIOUS VERSION LOCATION:      [/_Deprecated/ path]
```

### 13.5 Deprecation notice template
```
STATUS: DEPRECATED — superseded by [NEW ID/VERSION] on [date].
REASON:
STILL SAFE TO REFERENCE FOR:    [e.g. historical project records only]
DO NOT USE FOR:                 [new work]
```

---

## 14. Deliverable 14 — Final Operating Guide

**HOW TO USE THE LIBRARY:** Treat it as reference material you paste from, not a memory the AI retains. Pull only the role/prompt that matches the task at hand (use `TEAM-00` and the cheat sheet to find it), fill its required inputs, and run it in whichever tool is appropriate (a reasoning LLM for planning prompts, the named model for generation).

**HOW TO START A PROJECT:** `MST-00` → fill `CTX-00` → open a `decision_log.md` (`DEC-00` format) for that project. Don't skip straight to generation before these exist.

**HOW TO PASS WORK BETWEEN TOOLS:** Always a filled `HND-00` — project ID, context version, sending/receiving role, task, locked vs. flexible elements, expected output. Never rely on a tool "remembering" the previous step.

**HOW TO PRESERVE APPROVED DECISIONS:** Every approval goes in `DEC-00`. Every proposed change to a locked item goes through `CHG-00` before it's accepted. The Visual Bible (`VB-00`) is kept in sync via `VB-02` immediately after any decision that touches a locked rule — never let it drift out of date.

**HOW TO ITERATE WITHOUT RESTARTING:** Load `CTX-00`+`DEC-00` (+`VB-00`) at the start of every new chat/task. Use the smallest relevant follow-up prompt (every master prompt in this library has them) instead of re-running the full master prompt from scratch.

**HOW TO REVIEW GENERATIONS:** Per-asset: `IGC-01`(image)/`VCC-01`(video). Per-shot-set: `CTY-00`. Per-deliverable, before it ships: `QA-00`. Never skip straight from generation to delivery.

**HOW TO MANAGE REVISIONS:** `FB-01` → (if it conflicts with something approved) `CHG-00`→`DEC-00` → `RP-01` → fix → `RR-01` → `CRD-01` (draft only, you send it).

**HOW TO UPDATE THE SYSTEM:** Follow Section 13's seven-step procedure. Keep stable principles and model-specific adapters in clearly separate buckets so a model update never requires touching the structural rules.

**REMAINING GAPS (explicit, not hidden):**
- No real project has actually run through this system yet — every example across all 8 parts is `[FICTIONAL]`/`[SIMULATED]`. The system is **proposed and internally consistent**, not **field-tested**.
- Several model-specific facts (Kling 4.0's "coming soon" features, exact Veo reference-image count, Blender's exact current build, Photoshop's exact current build) are flagged as needing re-verification before relying on them.
- No automation/multi-agent layer has been built or verified — Section 7.2 describes prerequisites only.
- This library was built entirely in one working session by one assistant; it has not been reviewed by a second person or tested against a real client's actual feedback patterns.

**RECOMMENDED FIRST PRACTICE PROJECT:** Pick something small and real (not another fictional exercise) — a single 15–30 second short-form piece using 1 character or product, 3–4 shots maximum. Run it through the full chain in Section 9.1 or 9.2 end-to-end, including actually filling `CTX-00`, logging at least one real `DEC-00` entry, and running one real `QA-00` pass. This is small enough to complete in a day or two and will surface which parts of this system you actually use naturally versus which feel like overhead — trim accordingly. The objective was always better creative judgment and stronger production, not maximum process.

**What is complete:** all 14 deliverables above, built from and consistent with Parts 1–7's actual output. **What is proposed:** every workflow, chain, and checklist — reasoned through, not run. **What requires additional evidence:** anything flagged above in Remaining Gaps, plus periodic re-verification of every model-specific adapter per Section 13.

**Stop — Part 8 complete. This finishes the eight-part AI Creative Operating System.**
