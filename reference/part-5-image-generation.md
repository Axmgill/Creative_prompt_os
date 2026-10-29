# AI Creative Operating System — Part 5: Image-Generation Prompts and Reference Control

**Builds on:** Part 1 (routing method), Part 2 (`STD-00` standard, variables, IDs), Part 3 (`AD-01` rules, `RA-01` Reference Role Map), Part 4 (`DNA-00` Design DNA, `SF-01` styleframe specs). This part translates those into model-specific image-generation workflows. **This builds the library, not images** — no generation is executed unless explicitly requested.

**New domain codes** (under `/Library/05_Image-Generation/`): `IMG` (shared spec), `ADP-[MODEL]` (adapters), `IP` (core prompt library, 12 entries), `REF` (reference controller), `CC`/`PC` (character/product consistency), `EDIT` (controlled editing), `IGC` (image generation critic).

**Research method note:** every capability claim below was checked against the cited official source during this session (verification date **2026-10-06**, matching today's date). Everything else is explicitly marked as a secondary/aggregator claim. Model version numbers move quickly — re-verify before relying on an exact parameter name, count, or resolution figure in production.

---

## 1. Deliverable 1 — Image Model Routing

### 1.1 Routing table

| Exact model/product | Interface | Best-fit tasks | Reference support | Editing support | Text/typography | Output/editability | Important limitations | Source / verified |
|---|---|---|---|---|---|---|---|---|
| **GPT Image 2.5** (Sunburst = precision, Flare = speed) | Model, via OpenAI **API** (Images API `/v1/images`, Responses API `image_generation` tool) and via the **ChatGPT application** | Multi-reference compositing, instruction-following edits, programmatic/batch production | Multiple `input_image` items per call (confirmed example: combining 4 product photos into one scene) | Dedicated `/v1/images/edits` endpoint; optional mask for targeted inpainting; without a mask the edit region is inferred from the instruction | Strong, instruction-driven | Raster (PNG/WebP/JPEG); transparent background supported on PNG/WebP only, preview-stage | No confirmed seed-lock or named "reference strength" parameter — don't invent one; ChatGPT app exposes fewer raw settings than the API | [1](https://developers.openai.com/api/docs/guides/image-generation), [2](https://platform.openai.com/docs/guides/tools-image-generation) — 2026-10-06 |
| **Nano Banana Pro** (Gemini 3 Pro Image) / **Nano Banana 2** (Gemini 3.1 Flash Image) | Model, via **Gemini app** (consumer), **Google AI Studio**, **Gemini API**, **Vertex AI** (enterprise) | Conversational no-mask editing, multi-image fusion/style transfer, character/style consistency across a sequence | Multiple reference images per turn; an aggregator model card cites "up to 14" for Nano Banana 2 — **unverified exact count, re-check before relying on it** | Natural-language instruction edits, no manual mask tool in the consumer app | Notably improved over earlier Flash versions, multilingual | Raster; every output carries an invisible, non-removable **SynthID** watermark | Consumer app likely exposes fewer resolution/aspect options than API/Vertex — verify per surface before export | [3](https://cloud.google.com/blog/products/ai-machine-learning/gemini-2-5-flash-image-on-vertex-ai) (official), [4](https://replicate.com/google/nano-banana-2) (aggregator, flag exact reference-count claim) — 2026-10-06 |
| **Midjourney V8.2** with **Edit Model** | Single integrated **application** (web + Discord). **No official general-purpose developer API** — any "Midjourney API" is an unofficial third party | Highest baked-in aesthetic/art-direction quality, fast stylistic exploration, up to 4-image reference composition | Edit Model: up to 4 reference images, replacing the old Omni Reference/Character Reference (`--oref` now **V7-only**, unsupported on V8.2) | Web **Editor**: brush inpainting/outpainting now runs on the Edit Model itself; Discord: `--edit` + image URL(s) | Weaker than Ideogram/GPT Image for exact on-screen copy | Raster only | Edit Model results are **not compatible with Remix**; no confirmed API means no native batch/programmatic path | [5](https://docs.midjourney.com/hc/en-us/articles/48495453462797-Edit-Model), [6](https://docs.midjourney.com/hc/en-us/articles/32199405667853-Version) (official) — 2026-10-06 |
| **FLUX.2** (current BFL flagship) / **FLUX.1 Kontext** [pro/max/dev] | Model, via **official BFL API** (docs.bfl.ai), open-weight self-hosting (schnell/dev variants via Hugging Face), and multiple **third-party aggregators** (Replicate, fal.ai, Runway, others) | Structural conditioning (Canny edge / Depth map control for geometry lock), masked in/outpainting (Fill), image variation preserving composition (Redux), strong photorealism | FLUX.2: up to 10 reference images; Kontext: context-aware multi-reference editing | FLUX.1 Fill [dev] = dedicated masked in/outpainting; Canny/Depth [dev] = structure-locked regeneration from an edge or depth map | Kontext/FLUX.2 marketed as strong typography handling | Raster; open-weight variants downloadable | [dev] open weights are **non-commercial license** — commercial use needs separate licensing; aggregator pricing/features may lag BFL's own API | [7](https://docs.bfl.ai/kontext/kontext_overview), [8](https://github.com/black-forest-labs/flux) (official) — 2026-10-06 |
| **Ideogram 3.0** | Model, via **ideogram.ai application** and an official **API** | On-screen text/typography accuracy, Style References, Character Consistency, poster/packaging/label work | Style References (up to 3 images, preserves palette/composition/feel) and Character Consistency (1 reference image, locks identity) — two distinct features | **Magic Fill** (inpaint), **Extend** (outpaint), **Reframe** (aspect-ratio conversion via generative fill), **Replace Background** | Strongest in this set for legible in-image text | Raster | Named commercial fonts are unreliable; non-English/complex-script text noticeably weaker than English | [9](https://ideogram.ai/models/3.0/) (official) — 2026-10-06 |
| **Recraft V4.1** (raster + native-SVG-vector variants) | Model, via **recraft.ai application** and official **API** | Editable vector icons/logo concepts/flat illustration, brand-consistent batch production | **Brand Kit** (persistent palette/style/identity across a session) + style training on reference images — session-level, not a single per-image reference | Image-to-image, inpainting, background removal, and raster→SVG vectorization are separate priced operations | Design-ready typography in its vector styles | **Real SVG path output** on vector variants — the one tool here producing a genuine editable vector artifact | Vector quality weak on photoreal/organic/complex imagery; treat any output logo as a concept needing human refinement, not a final mark | [10](https://www.recraft.ai/) (official), secondary pricing/variant corroboration — 2026-10-06 |
| **Adobe Firefly** — **Firefly Image Model 5** (own model, GA) + Generative Fill/Expand/Match inside **Photoshop/Illustrator/Express/InDesign/Lightroom**; Firefly app also now **aggregates 30+ partner models** (Nano Banana 2, Veo 3.1, Runway Gen-4.5, Kling 2.5 Turbo) | Application (Firefly web app) **and** embedded in-app features inside Creative Cloud tools; also an **aggregator surface** for partner models | Extending/filling within an already-real Photoshop composition; style/color-grade matching via Generative Match; commercially-safe generation | **Generative Match**: 1 reference image, applies its style/color/technique — style-only, does not lock subject identity/geometry | **Generative Fill** (selection-based, lands as a new Photoshop layer) and **Generative Expand** (canvas extension) — native in-app, not just web | Improved over Image Model 4, native 4MP | Output lands as a real layer inside your working PSD — closest thing in this set to true in-pipeline editability | Adobe's "commercially-safe training" claim applies to **Adobe's own** Firefly models only — verify separately for any partner model selected inside Firefly; some 2026 "agentic"/"unlimited" claims online are **not** corroborated by Adobe's own blog | [11](https://blog.adobe.com/en/publish/2026/03/19/adobe-firefly-expands-video-image-creation-with-new-ai-capabilities-custom-models), [12](https://www.adobe.com/products/firefly/features/generative-match.html) (official) — 2026-10-06 |

No eighth tool was added — these seven cover every production gap relevant to this stack (instruction-following/multi-reference, no-mask conversational editing, highest aesthetic default, structural/geometry-locked editing, typography accuracy, true vector output, and in-Photoshop compositing). Comparative "which is best" rankings cited inside secondary sources (e.g. text-rendering percentages, consistency percentages) are **comparative performance judgments from third parties**, not verified specs — treated as directional only, not fact, and never used as the sole basis for a routing decision.

### 1.2 When traditional software is still the right call

None of the seven tools above reliably produce:
- **Exact logos** — even Recraft's SVG logo concepts need human refinement before use as a final mark.
- **Final production typography** — build real type in Illustrator/Photoshop/After Effects once wording is locked; use image models only for placeholder/exploration text.
- **Precise product geometry** — no model guarantees exact dimensions/proportions; use the product's real reference photography, a 3D model (Blender), or vector tracing for anything requiring geometric accuracy.
- **Editable vectors** in the general case — only Recraft's vector variant produces real SVG, and only for its flat/icon/illustration styles; everything else is raster.
- **Layered motion assets** — every model here (including Firefly's in-app result) outputs a flattened or single-layer result, never a clean multi-element layer stack ready for After Effects. Build layer separation manually (Illustrator/Photoshop) or generate isolated elements one at a time (`IP-10`) and composite them yourself.
- **Repeated layout production at scale with pixel-identical structure** — use a real template in Illustrator/Photoshop/After Effects, not repeated generation, when the same layout must recur exactly.

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

## 9. Deliverable 9 — Practical Workflow and Examples

```
APPROVED DESIGN DNA (DNA-00)
  → IMAGE SPECIFICATION (IMG-00, via IP-01..12)
  → REFERENCE ROLE MAP (REF-01)
  → TARGET MODEL ADAPTER (Section 3)
  → GENERATION  [human-executed — not performed by this prompt]
  → REVIEW (IGC-01)
  → CONTROLLED REVISION (EDIT-01 or IGC-02)
  → HUMAN APPROVAL  [your own, separate from any client approval]
  → ASSET RECORD (lightweight CC-01/PC-01 log; full system in Part 8)
```

### Example 1 — Flat side-view character, neutral pose, for animation `[SIMULATED — no image generated or inspected]`

```
IMG-00 (abbreviated): SUBJECT: fictional mascot "Pip," a rounded courier
character. ACTION/POSE: side view, standing neutral, arms at sides.
ENVIRONMENT: plain flat color, no background detail. COMPOSITION: centered,
full body, even margins. STYLE: flat 2D, inherited from a hypothetical
DESIGN_DNA (rounded shapes, 2-color palette). EXACT TEXT: N/A.
ASPECT RATIO: 1:1. OUTPUT NEEDS: PNG, transparent background, high enough
resolution to crop tightly for a turnaround set.
REFERENCE ROLES (REF-01): none yet — this generation becomes the Identity master.
ROUTING: Recraft (vector, flat/illustration strength) — chosen because this
asset benefits from true editable vector output for a line/flat illustration
style, over Ideogram/GPT Image's raster-only output.
ACCEPTANCE CHECKLIST: pose is genuinely neutral; background is clean/removable;
proportions match the brief's described proportions; no accidental expression
bias.
LOCAL FAILURE [SIMULATED]: the returned pose leaned slightly forward instead of
neutral-upright.
SMALLEST CORRECTION: re-run with an explicit instruction "fully upright,
weight evenly balanced, no lean" rather than regenerating the whole character
from scratch.
```

### Example 2 — Product hero styleframe with exact product identity `[SIMULATED — no image generated or inspected]`

```
IMG-00 (abbreviated): SUBJECT: the Nomad portable coffee grinder [FICTIONAL,
continuing Parts 2–4]. ENVIRONMENT: plain warm-toned surface, single key light
(inherited from DNA-00's LOCKED lighting rule — DEC-003). COMPOSITION: product
centered, 3/4 angle. MUST PRESERVE: exact grinder silhouette, dial position,
label text — from a real product reference photo (hypothetical, since this is
a fictional product with no real photo). FORBIDDEN CHANGES: logo text,
proportions. ASPECT RATIO: 9:16 (vertical). OUTPUT NEEDS: PNG, high resolution.
REFERENCE ROLES (REF-01): Reference A = Product geometry + Identity (preserve
exactly, priority 1); Reference B (if a mood reference exists) = Lighting only.
ROUTING: GPT Image 2.5 Sunburst — chosen for strongest multi-reference
compositing and instruction-precision editing when exact product geometry
must be preserved while placing it in a new, generated environment.
ACCEPTANCE CHECKLIST (PC-01): silhouette matches master; label text
legible and correctly spelled; color accurate; single light source only,
consistent direction with DNA-00's rule.
LOCAL FAILURE [SIMULATED]: the generated label text was subtly misspelled.
SMALLEST CORRECTION: route to EDIT-01 — mask the label region only, re-run a
targeted edit rather than regenerating the whole product shot.
```

No image was generated or inspected for either example — both demonstrate the specification/routing/review reasoning only, consistent with Part 5's instruction not to execute generation unless explicitly requested.

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

### 10.2 Handoff for Part 6

```
VERIFIED MODELS / INTERFACES: GPT Image 2.5 (Sunburst/Flare, OpenAI API +
  ChatGPT); Nano Banana Pro / Nano Banana 2 (Gemini app, AI Studio, API,
  Vertex); Midjourney V8.2 + Edit Model (web/Discord, no official API);
  FLUX.2 / FLUX.1 Kontext family (BFL API, open-weight, aggregators); Ideogram
  3.0 (app + API); Recraft V4.1 (app + API, only verified true-SVG output in
  this set); Adobe Firefly Image Model 5 + in-app Generative Fill/Expand/
  Match, also an aggregator for 30+ partner models. All verified 2026-10-06;
  re-check before relying on an exact parameter, count, or resolution figure.

MODEL ADAPTER IDS: ADP-OAI-01, ADP-GGL-01, ADP-MJ-01, ADP-BFL-01, ADP-IDG-01,
  ADP-RCF-01, ADP-ADB-01.

SHARED IMAGE SPECIFICATION: IMG-00 (19 fields, required/optional/inherited
  marked). Camera/lens language reserved for photoreal categories only.

REFERENCE ROLE MAP: REF-01 format — REFERENCE ID / ASSIGNED ROLE / FEATURES TO
  PRESERVE / FEATURES TO IGNORE / PRIORITY / CONFLICTS / SUPPORTED INPUT
  METHOD. Conflicts resolved before generation, never blended silently.

APPROVED MASTER-ASSET RULES: CC-01 (character) and PC-01 (product) — establish
  master from a human-approved neutral pose or a real product photo (never a
  generated image as a product master); generate one controlled variation at a
  time; compare against master; classify KEEP/FIX/REGENERATE; log lightweight
  record (full registry is Part 8).

LOCKED IDENTITY FEATURES: Per-project, defined inside each CC-01/PC-01 record
  under "must not change" — none defined yet for any real project in this session.

EDITING AND DEBUGGING METHOD: EDIT-01 (scope edit region/protected
  regions/side effects before writing the edit prompt, route through the
  correct Section 3 adapter); IGC-01/IGC-02 (evidence-vs-cause separation,
  one-variable-at-a-time debugging, smallest correction first).

ACCEPTANCE CRITERIA: Defined per-image inside IMG-00's ACCEPTANCE CRITERIA
  field and per-asset inside CC-01/PC-01's comparison step — no universal
  threshold is imposed across all image types.

ASSET STATUS: No image has been generated, approved, or inspected in this
  Part. Both Deliverable 9 examples are explicitly [SIMULATED].

UNRESOLVED ITEMS: Carried from Parts 1–4 (model version churn; Nomad's DEC-002
  real-vs-AI-generated-environment question still open); new in Part 5 —
  Nano Banana 2's exact max reference-image count is aggregator-sourced only,
  not confirmed on Google's own docs in this check.

NEXT TASK: Part 6 will use approved images and identity rules to build
  video-generation prompts, camera modules, motion constraints, and
  continuity workflows.
```

**Stop — Part 5 complete.**
