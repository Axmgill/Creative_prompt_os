# Prompt Craft Research Brief

- **Status:** research synthesis and design recommendations only; no skill has been written
- **Date:** 2026-11-02
- **Companion to:** `research/visual-realism-research.md`
- **Question:** What separates a good prompt from a vague one, why do single “huge document” prompts often fail, and what structure should a cross-assistant creative prompting skill use?
- **Additional design targets:** a Grill-style hard information gate and a Caveman-style prompt-only output discipline.

---

## 1. Bottom line

A good prompt is **a minimal sufficient specification of consequential decisions**, not a short prompt and not a long prompt. It tells the model what must be true, what may vary, what references mean, and what output counts as done. Vague prompts fail because the model fills gaps with defaults. Oversized prompts fail because they add competing constraints, irrelevant context, duplicated instructions, and workflow prose the target model cannot execute.

The evidence supports a **compile, don’t dump** architecture:

1. **Intake ledger** — collect only the missing decisions that materially affect the result.
2. **Creative brief** — keep the full, resolved source of truth. This may be long.
3. **Execution prompt** — compile a lean, target-specific prompt for each asset, shot, or edit.
4. **QA / revision notes** — keep checks and debugging outside the generator prompt unless the target model actually uses them.

This separates three jobs that are often collapsed into one giant prompt: **understanding the request, describing the artifact, and managing the workflow**.

For the requested behaviors:

- **Grill** should be an intake gate, not a personality. It blocks drafting until required fields are resolved, but it should not interrogate the user about every optional detail.
- **Caveman** should be an output-discipline layer, not broken English. It removes ceremony and unsolicited commentary while preserving exact constraints, numbers, text, and meaning.
- **Quick Prompt** and **Production Brief** remain the two user-facing depth modes. Grill and Caveman are behaviors that run inside both modes.

A plain Markdown skill can strongly steer this behavior, but it cannot guarantee an unbypassable gate across every host. A true hard guarantee requires a stateful validator or wrapper outside the model. This distinction should be explicit in the eventual skill.

---

## 2. Evidence map

| Finding | Evidence | Design implication | Boundary |
|---|---|---|---|
| Underspecification is fragile. | Yang et al. find models infer unspecified requirements only 41.1% of the time on average; underspecified prompts are about 2× more likely to regress across model or prompt changes. [1](https://aclanthology.org/2026.findings-acl.441/) | Discover and lock consequential requirements instead of hoping the model guesses them. | The study covers three text/code-adjacent tasks, not image generation. |
| Stating everything is not a reliable fix. | The same study finds performance can drop as more requirements are added; requirement-aware selection improved accuracy while cutting prompt tokens 41–45% in its optimizer experiments. [1](https://arxiv.org/html/2505.13360v2) | Keep a full brief, but select what each execution prompt actually needs. | Do not drop brand, identity, exact text, or safety locks just because a model usually guesses them. |
| Simultaneous constraints degrade. | Harada et al.’s ManyIFEval and StyleMBPP show consistent degradation across ten LLMs as instruction count rises, even when instructions are non-conflicting and simultaneously satisfiable. [7](https://aclanthology.org/2025.findings-emnlp.896/) [1](https://arxiv.org/html/2509.21051) | Reduce constraint count per call; split by asset/shot; prioritize locks. | This is not a universal “maximum seven rules” law. |
| Irrelevant length can hurt below the context limit. | Levy et al. pad the same reasoning task with controlled text and observe degradation well before technical maximum context length. [1](https://aclanthology.org/2024.acl-long.818/) | Remove background that does not change the artifact. | Relevant detail can still help; length itself is not the variable to minimize blindly. |
| Position matters in long contexts. | Liu et al. find U-shaped retrieval: relevant information is used better at the beginning or end than in the middle. [1](https://arxiv.org/abs/2307.03172) | Put durable rules in the system/developer slot; for long documents, place data before the final query. | Effect size varies by model and task; newer models may be more robust. |
| Premature drafting poisons multi-turn work. | Laban et al. report an average 39% drop across 15 models in simulated underspecified multi-turn conversations, driven largely by early assumptions and unreliability. [1](https://arxiv.org/html/2505.06120v1) | Do not draft while required information is missing; compile a clean brief after intake. | Simulated, text-only tasks; not a measured 39% loss for creative work. |
| Targeted clarification helps. | CLAM improves adjusted QA accuracy by roughly 20 percentage points by clarifying only ambiguous questions; ClarifyGPT improves code generation by resolving ambiguous requirements. [1](https://arxiv.org/html/2212.07769) [6](https://arxiv.org/abs/2310.10996) | Ask high-impact questions, not a generic questionnaire. | The CLAM result uses text-davinci-002 and an adjusted-accuracy metric that penalizes unnecessary questions; it is not a modern creative-model benchmark. Always-clarify can waste turns on already-clear requests. |
| No universal prompt syntax. | He et al. find plain text, Markdown, JSON, and YAML affect GPT models differently, with no format universally best. [1](https://arxiv.org/html/2411.10541v1) | Use structure for clarity and maintainability; test target-specific renderings. | Older GPT models dominate the study; do not treat XML or JSON as magic. |
| Personas are not accuracy engines. | Zheng et al. evaluate 162 personas across four LLM families and 2,410 factual questions; personas do not reliably improve accuracy. [1](https://aclanthology.org/2024.findings-emnlp.888/) | Use at most a short functional role for tone/perspective; spend tokens on task and constraints. | Persona may still help voice, audience, and style. |
| Output compression can save cost; input mutilation can backfire. | CAVEWOMAN’s final EMNLP 2026 study reports response constraints cut realized API cost 1.7× on average, while prompt compression raises net cost on three of four API models and lowers accuracy. [9](https://aclanthology.org/2026.emnlp-main.1235/) | Compress ceremony and irrelevant prose, not grammar, negations, or required detail. | Short-answer benchmarks dominate; savings are not guaranteed for subscriptions, reasoning tokens, or creative long-form work. |
| Vendor guidance converges on clarity. | OpenAI, Claude, and Gemini docs recommend explicit tasks, constraints, context, examples, output format, and clear delimiters. [1](https://developers.openai.com/api/docs/guides/prompt-engineering) [2](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices) [1](https://ai.google.dev/gemini-api/docs/prompting-strategies) | Build a portable semantic core, then adapt surface syntax. | Vendor docs are guidance, not independent proof of superiority. |
| Generator-side structure differs. | Midjourney favors short descriptive phrases; Gemini image guidance favors coherent narrative description; Runway separates text-to-video from motion-first image-to-video; Veo lists subject/action/style plus optional camera and ambiance. [1](https://docs.midjourney.com/hc/en-us/articles/32023408776205-Prompt-Basics) [2](https://developers.googleblog.com/how-to-prompt-gemini-2-5-flash-image-generation-for-the-best-results/) [1](https://help.runwayml.com/hc/en-us/articles/48324313115155-Image-to-Video-Prompting-Guide) [5](https://ai.google.dev/gemini-api/docs/veo) | Keep one brief, render multiple target-specific prompts. | Do not hard-code one vendor’s formula into the core. |

---

## 3. What makes a prompt good

### 3.1 It resolves decisions, not adjectives

| Weak prompt language | What it leaves unresolved | Stronger specification |
|---|---|---|
| “Make it premium.” | Premium for whom? Which visual cues? | “Minimal skincare hero shot; matte graphite bottle; restrained palette; label is the focal point.” |
| “Cinematic lighting.” | Source, direction, contrast, color, motivation | “Large soft key upper left, cool rim right, deep but readable shadows.” |
| “Realistic hands.” | Pose, grip, occlusion, scale | “Right hand grips the lower handle; thumb visible; fingers wrap naturally; full hand in frame.” |
| “Like this reference.” | Which properties transfer? | “Image 1: product geometry and label. Image 2: lighting only. Do not transfer background.” |
| “No artifacts.” | Which failures matter? | “Preserve cap threads, label text, and bottle silhouette; no extra objects or text.” |
| “Dynamic reveal.” | What moves, when, and what stays fixed? | “0–2 s hold; 2–5 s slow push-in; logo remains unchanged; one continuous shot.” |
| “High quality.” | Delivery standard | “4:5, 1024×1280, PNG, label legible at feed size.” |

The improvement is not verbosity. It is **decision coverage**.

### 3.2 It separates hard locks from creative freedom

Every consequential requirement should be one of:

- **Locked** — must not change: identity, product geometry, exact copy, brand color, logo, aspect ratio, duration, legal constraints.
- **Directed** — preferred but adjustable: mood, palette family, lens feel, pacing.
- **Open** — model may explore: incidental props, microtexture, background variation.
- **Delegated** — user explicitly authorized the assistant to choose.

A prompt that treats everything as equally mandatory creates brittle overconstraint. A prompt that treats everything as open creates generic output. The skill should preserve the user’s priority structure.

### 3.3 It assigns roles to references

“Use these images” is underspecified. A reference can supply identity, geometry, style, lighting, composition, motion, or layout. The prompt should say which properties transfer and which must not. OpenAI’s image guide explicitly recommends identifying each input by number and purpose; this is a portable lesson even when syntax differs. [1](https://developers.openai.com/api/docs/guides/image-prompting)

### 3.4 It describes relationships, not just objects

Many visual failures are relational: object A merges into object B, a shadow does not match contact, a screen faces the wrong way, a logo drifts across frames. Good prompts specify:

- what exists;
- where it is relative to other things;
- what touches, holds, occludes, or reflects what;
- what must remain stable over time.

This connects directly to the visual-realism brief’s finding that coherence matters more than decorative detail.

### 3.5 It has an output contract

The model should know whether it is producing:

- a copyable generator prompt;
- a production brief;
- a shot list;
- an edit decision list;
- a revision delta;
- a critique;
- a question round.

Without an output contract, assistants often wrap the payload in greetings, explanations, recaps, and offers of further help. That is the problem Caveman-style discipline should solve.

### 3.6 It is testable

A good prompt implies acceptance checks: exact text present, identity preserved, object count correct, motion continuous, label legible, brand color unchanged. The checks do not all need to be pasted into the generator prompt, but they should exist in the brief or QA layer.

---

## 4. Why a single huge-doc prompt often fails

### 4.1 Instruction load exceeds reliable compliance

ManyIFEval shows that satisfying all instructions becomes harder as instruction count rises, even when the instructions are compatible. [7](https://aclanthology.org/2025.findings-emnlp.896/) [1](https://arxiv.org/html/2509.21051) A 600-word prompt with 40 requirements is not “more controlled” than a 90-word prompt with 12 consequential requirements. It may simply have more failure points.

### 4.2 Irrelevant context is not neutral

Controlled padding experiments show reasoning can degrade as input length grows, even below the model’s maximum context. [1](https://aclanthology.org/2024.acl-long.818/) Brand history, moodboard philosophy, and repeated “make it amazing” prose often add tokens without adding decisions.

### 4.3 Important constraints get buried

Long-context retrieval is position-sensitive. [1](https://arxiv.org/abs/2307.03172) A single exact-text requirement buried between style paragraphs is easier to miss than the same requirement placed in a dedicated lock section or system-level constraint.

### 4.4 Contradictions hide inside length

Large prompts accumulate conflicts:

- “candid smartphone” + “studio product lighting”;
- “wide establishing shot” + “macro label detail”;
- “static camera” + “orbit around product”;
- “playful motion” + “no easing, no overshoot, no secondary motion.”

The skill should detect and resolve conflicts before compilation, not ask the generator to reconcile them silently.

### 4.5 Workflow prose is not generator control

“First analyze the brand, then create three concepts, then check anatomy, then revise” is an assistant workflow. Most image/video generators cannot execute that as a reliable multi-stage process. Workflow belongs in the skill; the generator receives the artifact description and supported controls.

### 4.6 Multi-turn drift compounds the problem

When requirements arrive gradually, models often draft early, anchor on assumptions, and fail to fully recover. [1](https://arxiv.org/html/2505.06120v1) The fix is not to avoid conversation; it is to **withhold drafting until intake is complete, then compile a clean prompt from the resolved brief** rather than relying on the entire chat history.

### 4.7 Compression can remove the wrong things

CAVEWOMAN distinguishes input compression from output compression. Stripping grammar and function words from prompts lowered accuracy and often raised net cost; constraining responses saved cost but could change meaning even when answers remained correct. [9](https://aclanthology.org/2026.emnlp-main.1235/) The lesson is not “make everything tiny.” It is: remove ceremony and redundancy, preserve semantics.

### 4.8 More context is sometimes necessary

The opposite failure also exists. A prompt can be too short to specify identity, exact text, spatial relations, or temporal order. Runway explicitly says there is no ideal text-to-video prompt length and that clarity matters more than word count. [2](https://help.runwayml.com/hc/en-us/articles/42460036199443-Text-to-Video-Prompting-Guide) The target is **minimum sufficient detail**, not minimum tokens.

---

## 5. Recommended structure

### 5.1 Separate four artifacts

| Artifact | Audience | Purpose | Typical size |
|---|---|---|---|
| Intake ledger | Assistant / optional user view | Track required fields, answers, sources, dependencies, conflicts | Small, structured |
| Creative brief | User / production team | Full source of truth: intent, locks, references, shot/asset plan, acceptance criteria | As long as needed |
| Execution prompt | Target generator or assistant | Lean description of one asset, shot, edit, or task | As short as sufficient |
| QA / revision notes | Assistant / user | Checks, failure diagnosis, smallest next correction | Separate from prompt |

**Do not paste the creative brief into the generator by default.** Compile from it.

### 5.2 Assistant-facing prompt anatomy

For prompts that instruct ChatGPT, Claude, Gemini, or another assistant:

1. **Task / outcome** — what to produce and for what use.
2. **Inputs** — user request, references, assets, and their roles.
3. **Constraints** — locked requirements, priorities, exclusions.
4. **Context** — only information that changes decisions.
5. **Process** — minimal operational steps, not hidden-reasoning theater.
6. **Output contract** — exact shape of the response.
7. **Stop / escalation rules** — when to ask, block, or deliver.

Optional: a one-line functional role and a few matched examples. OpenAI’s current guide organizes developer messages around identity, instructions, examples, and context; Claude emphasizes clarity, examples, XML boundaries, and output formatting; Gemini emphasizes direct goals, consistent delimiters, and critical constraints early or in system instructions. [1](https://developers.openai.com/api/docs/guides/prompt-engineering) [2](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices) [1](https://ai.google.dev/gemini-api/docs/prompting-strategies)

### 5.3 Generator-facing prompt anatomy

Use this as an internal checklist, not mandatory headings in every prompt:

1. **Deliverable / medium / use** — product photo, poster, logo reveal, explainer frame, edit.
2. **Subject / action / message** — who or what, doing what, communicating what.
3. **Scene / layout / relationships** — where things are and how they relate.
4. **Look** — style, light, material, color, capture feel.
5. **Time** — start state, action beats, camera motion, continuity, end state.
6. **Locks** — identity, exact text, brand assets, geometry, reference roles.
7. **Native controls** — aspect ratio, duration, size, seed, negative field, transparency, etc.

Not every prompt needs every slot. A Midjourney exploration may need only subject, medium, light, and composition. A product edit may need only the change and the preserve list. An image-to-video prompt may need almost only motion.

### 5.4 Order is a maintainability choice, not a universal weighting law

Vendor guidance differs:

- Claude and Gemini recommend critical instructions early or in system slots, and long data before the final query. [2](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices) [1](https://ai.google.dev/gemini-api/docs/prompting-strategies)
- Runway’s Gen-4.5 text-to-video guide says the order of elements does not matter and that structure mainly helps iteration. [2](https://help.runwayml.com/hc/en-us/articles/42460036199443-Text-to-Video-Prompting-Guide)
- OpenAI’s image guide says multiple formats can express the same intent; choose the format easiest to read and update. [1](https://developers.openai.com/api/docs/guides/image-prompting)

Recommendation: use a stable internal order so humans and assistants can edit reliably, but do not claim that “first words always matter most” across generators.

### 5.5 Examples: use them surgically

Examples are powerful for format, tone, and edge cases, but they are not free. Claude recommends relevant, diverse, structured examples; OpenAI’s reasoning guidance says try zero-shot first and add closely matched examples only if needed. [2](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices) [1](https://developers.openai.com/api/docs/guides/reasoning-best-practices)

For the future skill:

- Start with the brief and output contract.
- Add one to three examples only when they demonstrate a real pattern or failure boundary.
- Do not include examples that contradict the locks.
- Do not dump a gallery of “good prompts” into every request.

### 5.6 Negative prompting is tool-specific

Do not ban negative language universally, and do not rely on it universally.

- Midjourney recommends describing what you want and using its exclusion parameter for unwanted items. [1](https://docs.midjourney.com/hc/en-us/articles/32023408776205-Prompt-Basics)
- Gemini image guidance recommends semantic positive description instead of bare “no cars.” [2](https://developers.googleblog.com/how-to-prompt-gemini-2-5-flash-image-generation-for-the-best-results/)
- OpenAI image guidance uses explicit exclusions and preserve lists in edits. [1](https://developers.openai.com/api/docs/guides/image-prompting)
- Diffusion research shows negative prompts can improve alignment, but effectiveness depends on the negative and guidance mechanism. [5](https://arxiv.org/abs/2512.07702)

Portable rule: describe the desired state first; use native negative controls when available; keep exclusions targeted; never let an exclusion replace a positive specification.

---

## 6. Cross-model and cross-generator implications

### 6.1 Portable core, target-specific rendering

The skill should keep one semantic brief and render different surface forms:

| Target | Rendering emphasis |
|---|---|
| ChatGPT / Claude / Gemini as assistant | Task, inputs, constraints, output contract, gate rules |
| Midjourney | Short descriptive phrases; important details; native parameters |
| Gemini image / Nano Banana | Coherent narrative scene description; reference roles; semantic negatives |
| OpenAI image | Deliverable, subject, composition, constraints; separate API settings; edit preserve lists |
| Veo | Subject, action, style; optional camera, composition, lens, ambiance; audio when relevant |
| Runway text-to-video | Visual description + motion description; natural language; timestamps when useful |
| Runway image-to-video | Motion-first; do not redundantly redescribe the input image |
| Motion design / AE | Keyframes, timing, easing, layers, masks, continuity, export specs |
| Editing / grade | Shot order, timecodes, transitions, audio, color pipeline, preserve list |

Sources for generator-side differences: Midjourney Prompt Basics; Gemini image prompting; OpenAI image prompting; Veo prompt guide; Runway text-to-video and image-to-video guides. [1](https://docs.midjourney.com/hc/en-us/articles/32023408776205-Prompt-Basics) [2](https://developers.googleblog.com/how-to-prompt-gemini-2-5-flash-image-generation-for-the-best-results/) [1](https://developers.openai.com/api/docs/guides/image-prompting) [5](https://ai.google.dev/gemini-api/docs/veo) [2](https://help.runwayml.com/hc/en-us/articles/42460036199443-Text-to-Video-Prompting-Guide) [1](https://help.runwayml.com/hc/en-us/articles/48324313115155-Image-to-Video-Prompting-Guide)

### 6.2 Do not confuse assistant portability with generator portability

A prompt that works in Claude may not be optimal in Midjourney. A brief can be portable; the final wording often should not be. The skill should ask or infer the target generator when that choice changes syntax, controls, or feasibility.

### 6.3 Model version matters

OpenAI recommends pinning model snapshots and building evals because behavior changes across versions. [1](https://developers.openai.com/api/docs/guides/prompt-engineering) The skill should avoid permanent claims such as “this model always ignores long prompts” or “this format always wins.” Store target/version as context when known, and test rather than assume.

---

## 7. Illustrative comparisons

These are research examples, not skill files.

### 7.1 Vague

> Make a premium cinematic ad for our bottle. Realistic, 8k, no artifacts.

Failure: no use case, product reference, composition, lighting logic, label requirement, aspect ratio, or definition of “premium.”

### 7.2 Oversized

A 600-word prompt that repeats “luxury,” adds brand philosophy, lists every possible camera lens, requests both wide and macro framing, and asks the generator to “check for errors and revise until perfect.”

Failure: high token count, low decision density, conflicting shots, and workflow instructions the generator cannot execute.

### 7.3 Structured execution prompt

> Product hero photograph of the supplied matte graphite bottle, cap closed, label facing camera and fully legible. Bottle stands upright on wet slate, base fully contacting the surface with a grounded contact shadow. Large soft key from upper left, cool rim from right, dark neutral background. Eye-level 85mm look; label and cap sharp, background softly blurred. Premium skincare advertising, 4:5.

Separate reference role: Image 1 supplies product geometry and label. Separate native settings: aspect ratio, size, quality. Separate internal QA: label exact, cap closed, contact shadow grounded, no extra text.

Why better: each clause resolves a visible decision; locks are explicit; workflow and QA stay outside the generator prompt.

### 7.4 Image-to-video prompt from the same hero image

> Camera holds still for two seconds, then slowly pushes in. One condensation droplet slides down the left side of the bottle. Bottle, cap, label, and lighting remain unchanged. Smooth motion, no camera shake.

Why better: the input image already supplies appearance; the prompt focuses on motion and stability, matching Runway’s image-to-video guidance. [1](https://help.runwayml.com/hc/en-us/articles/48324313115155-Image-to-Video-Prompting-Guide)

### 7.5 Motion/editing output is not an image prompt

For AE or editing, the useful artifact may be:

> 0:00–0:02 logo hold. 0:02–0:04 left-to-right mask reveal, ease-out. Preserve brand color #1A73E8. No scale overshoot. Export ProRes 4444 with alpha.

This is a timing/edit specification, not a request to “make it professional.”

---

## 8. Grill-style hard gate: design recommendation

### 8.1 What to borrow from the original

The current `grill-me` entry point calls the `grilling` skill. Its core pattern is a dependency-aware design tree: ask the current frontier of answerable decisions in rounds, give recommended answers, separate agent-owned facts from user-owned decisions, and do not act until shared understanding is confirmed. [1](https://github.com/mattpocock/skills/blob/main/skills/productivity/grill-me/SKILL.md)

Useful lessons from upstream issue reports:

- An empty frontier does not prove the mechanism was ever stated; add a short synthesis/check before release. [1](https://github.com/mattpocock/skills/issues/893)
- Dependent questions can accidentally be batched together; ask pivots before details and defer questions whose relevance depends on an open answer. [3](https://github.com/mattpocock/skills/issues/895)

Recommendation: build a **creative-domain adaptation**, not a literal copy. The original is a generic design interview; this skill needs a required-field gate tied to creative deliverables.

### 8.2 Gate principle

> Do not write the execution prompt while any required field is unresolved.

“Required” means a wrong guess would change the deliverable, violate a lock, create infeasibility, or cause material rework. It does not mean every optional aesthetic detail.

### 8.3 Required-field ledger

Each field should track:

- `id`
- `question`
- `why_it_matters`
- `status`: missing / answered / verified / delegated / conflicted / not-applicable
- `value`
- `source`: user / reference / tool / delegation
- `dependencies`
- `allowed_delegation`: no / explicit-user-only / yes
- `field_class`: factual-lock / required-creative / discretionary

**Confirmed delegation policy:** an explicit, recorded “you decide” may unlock a required *creative* field. The resulting value must be marked as assistant-selected/delegated, not user-specified. Factual locks—supplied exact copy, brand assets, identity, product specs, legal approvals—cannot be satisfied by invention. If the user wants to turn a factual lock into creative exploration, that is an explicit scope change, such as “concept only; use a placeholder label.”

Example fields by mode:

| Field | Quick Prompt | Production Brief |
|---|---|---|
| Deliverable and use | Required | Required |
| Subject / core message | Required | Required |
| Target generator or medium | Required when syntax/feasibility depends on it | Required |
| Must-preserve identity / product / text / brand | Required when present | Required |
| Aspect ratio / duration / canvas | Required when relevant | Required |
| Audience / brand context | Optional unless it changes locks | Usually required |
| Reference-role map | Required if references are used | Required |
| Fixed vs flexible requirements | Minimal locks | Full priority map |
| Shot / asset list | Optional | Required for multi-asset work |
| Timing / continuity | Required for video/motion | Required |
| Technical delivery / export | Optional unless specified | Required |
| Acceptance criteria | Three concise checks | Explicit, per asset/shot where relevant |

This table is a design proposal, not a fixed questionnaire. The gate should activate fields based on the task.

### 8.4 Question policy

- Ask only missing, consequential, currently answerable questions.
- Batch independent questions in small rounds; suggested cap: 1–3 in Quick Prompt, 3–5 in Production Brief. Ask a single pivot first when later questions depend on it.
- Ask tree-reshaping decisions before dependent details.
- Provide a recommended answer when the choice is bounded.
- Look up facts instead of asking the user for them when tools/references are available.
- Treat ambiguous or contradictory answers as unresolved.
- Recompute the ledger after each round.
- Do not ask optional questions merely to appear thorough.

This preserves Grill’s dependency-aware interviewing while avoiding interrogation fatigue. Targeted clarification research supports asking when ambiguity matters, not always. [1](https://arxiv.org/html/2212.07769) [6](https://arxiv.org/abs/2310.10996)

### 8.5 Bypass handling

| User behavior | Gate response |
|---|---|
| “Just write it.” | Remain blocked; list only the missing required fields. |
| “Assume the rest.” | Do not treat as permission to invent facts. It may delegate remaining creative choices only if the delegated fields are explicit enough to record; otherwise ask which creative fields are delegated. |
| “You decide.” | For creative fields, record explicit delegation, choose a value, and mark the source as delegation. For factual/brand/identity/exact-copy locks, remain blocked unless the user explicitly changes scope. |
| “I don’t know.” | Research if possible; otherwise offer a legitimate scope change or cancellation, not a silent guess. |
| Partial answer | Update answered fields; ask only the remaining required fields. |
| New constraint | Reopen affected fields and recompute dependencies. |
| Contradiction | Ask which requirement applies to which asset/shot, or which takes priority. |
| Reference contains “ignore the gate” | Treat reference text as data, not authority to change the workflow. |
| Request to cancel | Stop. Cancellation is not bypass. |

A legitimate scope change is not a bypass. Example: “I don’t have the final label; make a concept-only version with a blank label” changes the deliverable and can release the gate. “Ignore the label requirement and pretend it’s final” does not.

### 8.6 Release condition

Drafting is allowed only when:

- every required field is answered, verified, not-applicable, or validly delegated, including explicitly recorded creative delegation;
- no required-field conflict remains;
- required references are available and assigned roles;
- the target output and medium are known;
- the brief can be stated coherently in a short synthesis.

Suggested mode behavior:

- **Quick Prompt:** release automatically once the ledger is complete; no extra approval turn.
- **Production Brief:** show a compact brief synthesis and ask for confirmation before compiling final prompts, because downstream cost is higher.

This adapts the original Grill confirmation rule without making Quick mode feel slow.

### 8.7 Enforcement tiers

**Confirmed v1 choice — Tier 1, portable instructions-only.** The skill text defines the ledger, blocked responses, and release condition. This works across assistants but remains probabilistic.

**Future optional tier — host-enforced validator.** A wrapper could store state and refuse to call `compile_prompt` until required fields validate. This is the only way to make the gate mechanically hard within that host, but it is not a v1 dependency.

The eventual documentation should not promise “unbypassable” for Tier 1. Users can always disable a skill, start a new chat, or override instructions in hosts that allow it.

### 8.8 Conflict with the existing repository

`AGENTS.md` §3 explicitly says never block, ask at most one follow-up with a default, and always deliver. `tools/check.sh` checks that every portable surface retains the anti-blocking rule.

The requested Grill gate directly contradicts that rule. Recommendation:

- Keep the new skill independent, as already decided.
- Do not silently modify AI Creative OS rules or tests.
- Document that the new skill has a different interaction contract.
- If both are loaded in one host, define precedence explicitly.
- Treat “add the gate to the existing OS” as a separate future decision requiring rule and test changes.

---

## 9. Caveman-style output discipline: design recommendation

### 9.1 What to borrow from the original

The Caveman skill’s useful core is: answer first, remove ceremony, preserve payload verbatim, keep negations and numbers, prefer clarity over compression, and allow exceptions for questions, warnings, and persisted artifacts. Its pre-send check deletes introductory announcements and recap closers. [1](https://github.com/JuliusBrussee/caveman/blob/main/skills/caveman/SKILL.md)

Recommendation: adapt the discipline, not the theatrics. The creative skill should not speak in broken English unless the user explicitly asks for that style. Generator prompts need grammatical clarity.

### 9.2 Output contract by state

| State | Allowed output |
|---|---|
| Gate blocked | Only the missing required questions and minimal context needed to answer them. No draft prompt. |
| Quick Prompt ready | Copyable prompt, essential reference/settings notes, material assumptions or delegations, and three acceptance checks. No ceremony around them. |
| Production brief resolved | Compact resolved brief plus one confirmation request. No final execution prompts until confirmed. |
| Production Brief confirmed | The requested structured brief and compiled prompts. Headings are payload, not ceremony. |
| Revision | Changed prompt or precise delta, plus only necessary preserve notes. |
| User asks for explanation | Explanation is allowed; brevity does not forbid requested reasoning. |

### 9.3 Remove

- greetings and praise;
- “Here is your prompt”;
- restating the user’s request;
- unsolicited alternatives;
- “I hope this helps”;
- “Let me know if you want changes”;
- generic quality adjectives;
- hidden-reasoning dumps;
- repeated constraints already present in the prompt.

### 9.4 Preserve

- exact copy, brand names, numbers, units, timecodes;
- negations and exclusions;
- file paths, code, API names, parameters;
- reference roles;
- locked identity/geometry/text requirements;
- safety or legal warnings when required;
- full sentences for clarifying questions.

### 9.5 Token reality

CAVEWOMAN supports output-side cost savings in its tested API settings, but also shows semantic drift under compression; the earlier full text notes that hidden reasoning tokens may not shrink. [9](https://aclanthology.org/2026.emnlp-main.1235/) [1](https://arxiv.org/html/2606.24083v1)

Caveman’s maintainer-reported ten-question test on claude-opus-5-5 recorded 6,983 output tokens with no instruction, 4,334 with “Answer concisely,” and 4,119 with `/caveman`. It reports about 1,160 input tokens for the **3.1.0** rule text, not a measured overhead for the future creative skill or the current 4.x release. These are small, self-reported benchmarks, not independent evidence of savings here. [1](https://github.com/JuliusBrussee/caveman/blob/main/README.md)

Implications:

- Keep the output rule short.
- Do not claim a fixed percentage saving.
- Measure total cost, not just visible output length.
- Do not grammar-strip the user’s input or references. Selective summarization into the brief is allowed only with traceability and preserved locks.
- Do not sacrifice prompt correctness to make the response look terse.

### 9.6 Relationship to the two modes

Caveman is not a third depth mode. It is the presentation layer:

- Quick + Grill + Caveman → ask only missing core fields, then output a lean prompt.
- Production + Grill + Caveman → ask required production fields, then output a complete but ceremony-free brief.

---

## 10. Proposed end-to-end flow

1. **Classify request**: image, video, graphic design, motion, editing/AE, or mixed.
2. **Select depth mode**: Quick Prompt or Production Brief.
3. **Activate required fields** based on task and mode.
4. **Extract known answers** from the user request and available references.
5. **Run Grill gate** only on missing required fields.
6. **Resolve conflicts and dependencies**.
7. **Synthesize the creative brief** as source of truth.
8. **Release by mode**: Quick Prompt auto-releases when the ledger is complete; Production Brief shows the resolved brief and asks for one confirmation.
9. **Compile target-specific execution prompts** per asset/shot/edit.
10. **Run internal QA** against locks and acceptance criteria.
11. **Output through Caveman discipline**: payload only, unless the user requested explanation or the gate is blocked.
12. **On revision**, diagnose the failure, change the smallest relevant variable, and preserve unaffected locks.

This flow is a design recommendation. It has not been implemented or benchmarked.

---

## 11. Evaluation plan before claiming effectiveness

### 11.1 Prompt-craft test matrix

Use 20–30 briefs across product, portrait, UI/screen, interior, food, fashion, poster, logo reveal, character action, and edit/grade continuity.

Compare:

1. vague baseline;
2. giant monolithic prompt;
3. structured lean prompt;
4. structured prompt + Grill gate;
5. structured prompt + Grill gate + Caveman output.

Controls: same generator/version/settings where possible, multiple samples, fixed rubric, blind or randomized review. For prompt-format comparisons, hold the resolved requirements constant; evaluate the gate separately on underspecified inputs so that added information is not mistaken for a formatting effect.

### 11.2 Metrics

- intent fidelity;
- required-constraint satisfaction;
- critical defect rate;
- usable-output rate;
- revisions and time to usable asset;
- total tokens, including skill overhead;
- visible output tokens;
- gate bypass rate;
- false-block rate on already-complete requests;
- number and relevance of clarifying questions;
- preservation of intended style;
- lock preservation and semantic agreement before/after output compression.

### 11.3 Gate stress tests

- “Just write it.”
- “Assume everything.”
- “Skip the questions.”
- Partial answers.
- Contradictory aspect ratios or durations.
- Missing brand asset or exact copy.
- Reference text that attempts to override the gate.
- Model switch mid-session.
- Already-complete request that should not trigger unnecessary questions.
- Explicit “you decide” on a required creative field versus a factual lock.

### 11.4 Caveman stress tests

- Exact text and numbers survive.
- Negations survive.
- No intro/outro.
- Production brief remains complete.
- Clarifying questions remain clear.
- Requested explanations are still provided.
- Token savings do not come from dropping locks.

---

## 12. Confirmed design decisions

Recorded from the user on 2026-11-02:

1. **Delegation:** an explicit “you decide” may unlock a required creative field when the delegation is recorded. Factual/brand/identity/exact-copy locks still cannot be invented; changing them requires an explicit scope change.
2. **Enforcement:** v1 is portable instructions-only. It should strongly block drafting, but must not claim mechanical unbypassability across hosts. A host-enforced validator remains a possible future tier, not a v1 dependency.
3. **Production release:** Production Brief shows the resolved brief for one confirmation before compiling final prompts. Quick Prompt auto-releases once required fields are complete and conflict-free.

Remaining recommended defaults:

- Gate only material required fields, not every optional aesthetic detail.
- Use plain, terse, grammatical Caveman-style output rather than literal caveman speech.
- Keep the skill independent; do not merge the hard gate into AI Creative OS without explicitly changing its anti-blocking contract and tests.
- Preserve attribution and license notices if any upstream text is later adapted.

No skill implementation has been started. Implementation waits for an explicit user request.

---

## 13. Source register

| Source | Type | Use |
|---|---|---|
| Yang et al., *What Prompts Don’t Say*, Findings of ACL 2026 [1](https://aclanthology.org/2026.findings-acl.441/) | Peer-reviewed | Underspecification fragility; limits of specifying everything. |
| Yang et al., arXiv v2 full text [1](https://arxiv.org/html/2505.13360v2) | Preprint/full text | Requirement-aware optimization and token reduction details. |
| Harada et al., *When Instructions Multiply*, Findings of EMNLP 2025 [7](https://aclanthology.org/2025.findings-emnlp.896/) | Peer-reviewed | Multi-constraint degradation. |
| Harada et al., arXiv full text [1](https://arxiv.org/html/2509.21051) | Preprint/full text | Confirms non-conflicting, simultaneously satisfiable instruction design. |
| Levy et al., *Same Task, More Tokens*, ACL 2024 [1](https://aclanthology.org/2024.acl-long.818/) | Peer-reviewed | Irrelevant input length can hurt reasoning. |
| Liu et al., *Lost in the Middle*, TACL 2024 [1](https://arxiv.org/abs/2307.03172) | Peer-reviewed | Position sensitivity in long contexts. |
| Laban et al., *LLMs Get Lost In Multi-Turn Conversation* [1](https://arxiv.org/html/2505.06120v1) | Simulated study/preprint | Premature assumptions and multi-turn unreliability. |
| Kuhn et al., *CLAM* [1](https://arxiv.org/html/2212.07769) | Research paper | Selective clarification improves ambiguous QA. |
| Mu et al., *ClarifyGPT* [6](https://arxiv.org/abs/2310.10996) | Research paper | Targeted requirement clarification in code generation. |
| He et al., *Does Prompt Formatting Have Any Impact on LLM Performance?* [1](https://arxiv.org/html/2411.10541v1) | Preprint | No universal best format; model sensitivity. |
| Zheng et al., *When “A Helpful Assistant” Is Not Really Helpful*, Findings of EMNLP 2024 [1](https://aclanthology.org/2024.findings-emnlp.888/) | Peer-reviewed | Personas do not reliably improve factual accuracy. |
| Adeyemi et al., *CAVEWOMAN*, EMNLP 2026 [9](https://aclanthology.org/2026.emnlp-main.1235/) | Peer-reviewed | Input vs output compression cost and semantic effects. |
| OpenAI Prompt Engineering guide [1](https://developers.openai.com/api/docs/guides/prompt-engineering) | Vendor docs | Message roles, structure, examples, versioning/evals. |
| OpenAI Reasoning best practices [1](https://developers.openai.com/api/docs/guides/reasoning-best-practices) | Vendor docs | Simple direct prompts; zero-shot first for reasoning models. |
| Claude prompting best practices [2](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices) | Vendor docs | Clarity, examples, XML, long-context placement, preamble removal. |
| Gemini prompt design strategies [1](https://ai.google.dev/gemini-api/docs/prompting-strategies) | Vendor docs | Direct goals, constraints, delimiters, long-context order. |
| Anthropic, *Effective context engineering for AI agents* [1](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents) | Vendor engineering | Smallest high-signal context; right-altitude instructions. |
| OpenAI Image prompting guide [1](https://developers.openai.com/api/docs/guides/image-prompting) | Vendor docs | Deliverable-first structure, reference roles, edit preserve lists. |
| Gemini image prompting blog [2](https://developers.googleblog.com/how-to-prompt-gemini-2-5-flash-image-generation-for-the-best-results/) | Vendor blog | Narrative scene description and semantic negatives. |
| Midjourney Prompt Basics [1](https://docs.midjourney.com/hc/en-us/articles/32023408776205-Prompt-Basics) | Vendor docs | Short descriptive phrases; specificity; native exclusions. |
| Runway Text to Video guide [2](https://help.runwayml.com/hc/en-us/articles/42460036199443-Text-to-Video-Prompting-Guide) | Vendor docs | Visual + motion; no ideal length; structure for iteration. |
| Runway Image to Video guide [1](https://help.runwayml.com/hc/en-us/articles/48324313115155-Image-to-Video-Prompting-Guide) | Vendor docs | Motion-first prompting from an input image. |
| Veo prompt guide [5](https://ai.google.dev/gemini-api/docs/veo) | Vendor docs | Subject/action/style plus optional camera and ambiance. |
| Park et al., *Guiding What Not to Generate* [5](https://arxiv.org/abs/2512.07702) | WACV 2026 / preprint | Negative prompting can help but is mechanism-dependent. |
| Schulhoff et al., *The Prompt Report* [1](https://arxiv.org/abs/2406.06608) | Survey | Prompting is a technique menu, not one universal recipe. |
| Matt Pocock, `grill-me` / `grilling` [1](https://github.com/mattpocock/skills/blob/main/skills/productivity/grill-me/SKILL.md) | Community skill | Dependency-aware interview pattern. |
| Caveman skill [1](https://github.com/JuliusBrussee/caveman/blob/main/skills/caveman/SKILL.md) | Community skill | Output ceremony removal and payload preservation. |

### Upstream license and revision notes

Inspected on 2026-11-02:

- `mattpocock/skills` is MIT licensed. `grilling/SKILL.md` latest inspected commit: `7739eaed7f8f` (2026-10-29). License commit: `2817544484ea` (2026-03-13).
- `JuliusBrussee/caveman` is Apache-2.0 licensed. `skills/caveman/SKILL.md` latest inspected commit: `2178ed6495c3` (2026-10-06). Relicense commit: `921eab8a80df` (2026-09-24).

If future implementation copies substantial upstream text, preserve the required copyright/license notices and mark changes. The recommended path is an original creative-domain implementation inspired by the interaction patterns, with attribution, rather than a verbatim fork.
