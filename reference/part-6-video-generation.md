# AI Creative Operating System — Part 6: Video Generation, Camera Control and Continuity

**Builds on:** Part 1 (routing method), Part 2 (`STD-00` standard), Part 3 (art direction), Part 4 (`DNA-00`, `MR-01` motion-readiness), Part 5 (`IMG-00`, `REF-01` Reference Role Map, `CC-01`/`PC-01` identity rules). This part builds prompts and workflows only — **no video is generated unless explicitly requested.**

**New domain codes** (under `/Library/06_Video-Generation/`): `VID` (shared shot spec), `ADPV-[MODEL]` (video adapters), `VP` (core video prompt library, 16 entries), `MCE` (motion constraint engine), `CAM` (camera language modules), `ASQ` (action sequencer), `VCC` (video continuity critic), `VPD` (video prompt debugger).

**Verification date for every claim below: 2026-10-06.** This space moves fast (Kling 4.0 was still rolling out as of this check) — re-verify before production use, especially any exact duration/resolution/reference-count figure.

---

## 1. Deliverable 1 — Video Model Routing

| Exact model/product | Interface | Supported input modes | Reference support | Duration/format | Camera control | Audio | Best-fit tasks | Important limitations | Source/verified |
|---|---|---|---|---|---|---|---|---|---|
| **Veo 3.1** (Google DeepMind) | Model, via Gemini app, Google AI Studio, Gemini API, Vertex AI, Google Flow | Text-to-video, image-to-video (first frame), first-and-last-frame ("Frames to Video"), reference-driven ("Ingredients to Video") | Multiple reference images (secondary sources consistently cite **~3**; not independently confirmed to an exact figure on Google's own page in this check — treat as secondary-sourced) | 4s/6s/8s; **1080p and 4K require the 8s option**; 16:9 and 9:16 | **Prompt-based only** — no structured camera parameter confirmed; can segment a prompt by timestamp (e.g. `[00:00–00:03]`) to vary camera moves within one clip | **Native, synchronized** — dialogue, SFX, ambient, generated in the same pass | Cinematic shots needing native dialogue/audio, highest resolution ceiling in this set | 8s hard cap per generation before scene extension; higher resolution/references/audio functionally gated behind the 8s duration; exact max extension length not verified here | [1](https://deepmind.google/models/veo/) (official) + secondary corroboration — 2026-10-06 |
| **Runway Gen-4.5** | Model, via Runway app and Runway API (`docs.dev.runwayml.com`) | **Text-to-video and image-to-video only** — official docs state "additional inputs coming soon"; video-to-video/keyframes not yet available on Gen-4.5 itself | **No confirmed reference-image input on Gen-4.5 video generation.** Runway's separate "Gen-4 Image References" tool (up to 3 images) is an **image**-generation feature — the practical workflow is: build a reference-guided image first, then animate it via Gen-4.5 image-to-video | 2–10s; 24 or 25fps; aspect ratio defaults to the input image, can be cropped | **Prompt-based only** — Runway's own Gen-4 Video Prompting Guide describes camera motion as prompt language (locked/handheld/dolly/pan); the old dedicated Camera Control GUI was a **Gen-3 Alpha Turbo-only** feature, retired July 2026, with no confirmed structured replacement on Gen-4.5 | Not confirmed as a native Gen-4.5 feature in the docs reviewed — treat as unsupported until verified | Complex sequenced instructions in a single prompt, strong motion/prompt-adherence quality, first all-text-capable Gen-4-family model | Runway's own documented failure modes: causal reasoning can run backwards, object permanence can fail, "success bias" (actions succeed more than realistic) | [2](https://help.runwayml.com/hc/en-us/articles/46974685288467-Creating-with-Gen-4-5), [3](https://help.runwayml.com/hc/en-us/articles/39789879462419-Gen-4-Video-Prompting-Guide), [4](https://help.runwayml.com/hc/en-us/articles/34926468947347-Creating-with-Camera-Control-on-Gen-3-Alpha-Turbo) (official) — 2026-10-06 |
| **Kling 4.0** (full, launching Oct 2026) / **Kling 4.0 Flash** (early access since Sept 28, 2026) — Kuaishou | Model, via the Kling AI app and multiple third-party aggregators (confirmed distribution via Runway's own app listing, others) | Text-to-video, image-to-video (first frame, or first+last frame), Multi-Keyframe (up to 10, full model only), Omni Reference | **Omni Reference**: up to 15 combined items — up to 10 images, up to 5 videos (30s combined), up to 7 "elements" (up to 3 video-based), voice reference (audio-only) | Full model: 3–30s, 720p/1080p/4K, 10-bit HDR at 1080p/4K listed **"coming soon" — not yet live**; 21:9 to 9:16. Flash: 3–20s, 720p only, 8-bit SDR, no confirmed first/last-frame or multi-keyframe | Camera moves are described via detailed prompt language (confirmed by Kuaishou's own example prompts); functions as strong prompt adherence rather than a separately documented discrete control in the material reviewed | Native, stereo, lip-sync across 9 languages (full model) / included on Flash | Longest native single-generation duration in this set (up to 30s), multi-keyframe narrative control, richest combined reference input | **Just announced/launching as of this verification date** — several headline features (HDR, 2-minute extension) explicitly marked "coming soon" by Kling itself; treat all figures as provisional pending re-confirmation; broader API access model not fully verified here | [5](https://kling.ai/feature/kling-4-ai-video-generation), [6](https://kling.ai/) (official) — 2026-10-06 |
| **Seedance 2.0** (ByteDance Seed) | Model; official access via **Volcengine Ark** (international API) and **Doubao/Jimeng** (ByteDance's own CN-market consumer apps); also distributed through third-party platforms (Runway API since May 2026, PixVerse, getimg.ai) | Text-to-video, image-to-video, video-to-video, first-and-last-frame transition | Up to 9 reference images + 3 reference videos + 3 reference audio clips (12 combined), addressed by label in the prompt — **exact tagging syntax is platform-specific** (e.g. PixVerse's `@image1` vs. other platforms' `[Image 1]`) — confirm the syntax on whichever platform you actually use | 4–15s (default 5s); up to 1080p confirmed, "2K on some provider tiers" is unverified; aspect ratios include 16:9/9:16/1:1/4:3/3:4/21:9 | Described as automatic "camera planning" from the combined inputs; a reference video can transfer its camera motion to a new generation (corroborated across several independent platform write-ups, not confirmed directly on ByteDance's own page in this pass) | Native, dual-channel/stereo — dialogue, SFX, ambient, generated jointly with video | Richest combined image+video+audio reference input for matching an existing brand/character/camera style | ByteDance's own global consumer product is limited; most international access runs through third-party platforms layering their own UI/tagging syntax over the same API | [7](https://seed.bytedance.com/en/blog/official-launch-of-seedance-2-0) (official ByteDance Seed) + aggregator corroboration — 2026-10-06 |
| **Luma Ray3.2** | Model, via Luma's **Dream Machine** app and, for the first time, a full **Ray API** | Text-to-video, image-to-video, **Multi-Keyframe** (up to 16 keyframes/clip), **Modify Video V2** (video-to-video on real footage), Reframe (aspect-ratio conversion) | **Character Reference** (single image, locks identity across generations); Modify Video's Start/End Frame control guides transitions in **existing real footage** | Up to 20s at 1080p (per Luma's own framing); native 16-bit HDR / EXR export | **Multi-Keyframe is a genuinely structured, frame-targeted control** (pin up to 16 specific moments, including camera position) — the strongest documented camera control in this set, not just prompt language | Not highlighted as a native feature on the pages reviewed — treat as unconfirmed; Luma's differentiation is visual fidelity/control, not audio | Studio-grade HDR/EXR pipeline integration, precise multi-keyframe narrative direction, transforming **real captured footage** rather than only generating from scratch | Exact current resolution ceiling varies by source; Draft Mode's "5x faster/cheaper" figures are secondary-sourced, not independently confirmed here | [8](https://lumalabs.ai/ray), [9](https://lumalabs.ai/news/ray3-modify) (official) — 2026-10-06 |
| **Adobe Firefly Video** (own model) + **Firefly Video Editor**, also an **aggregator** for 30+ partner models (officially confirmed: Veo 3.1, Runway Gen-4.5, Nano Banana 2, Kling 3.0 and Kling 3.0 Omni) | Application (firefly.adobe.com, Firefly Video Editor) + deep Premiere Pro integration (Generative Extend) | Text-to-video, image-to-video, **prompt-based editing of existing footage** (ask for a different "camera" framing — wider/bird's-eye/closeup), first/last-frame-guided camera movement between two uploaded images | First/last-frame images for camera-movement direction (officially confirmed); "Structure Reference"/"Style Reference" claims appear only on secondary feature guides, not independently confirmed on Adobe's own blog here | Adobe's own 2026 posts don't restate an exact native duration/resolution ceiling for its own model in the sources reviewed; AI upscaling (Boards) confirmed to push 1080p to 4K | Prompt-based camera language + officially confirmed first/last-frame-guided movement; a discrete numeric focal-length/pan-speed slider is claimed **only** on unverified SEO-aggregator sites, not on Adobe's own pages reviewed | "Studio-quality sound" and advanced color tools confirmed in the Firefly Video Editor (April 2026); exact native-generation audio capability of Adobe's own model isn't fully disentangled from editor-level sound tools in the sources reviewed | Editing/extending/reframing existing footage inside a Creative-Cloud-native workflow; one-stop access to many partner models without leaving Firefly/Premiere | Adobe's "commercially-safe" guarantee applies to **Adobe's own** Firefly models, not the 30+ partner models also offered inside Firefly — verify per selected model. Multiple 2026 "Firefly 5"/"Pixel Control"/"unlimited agentic" claims circulate on SEO-aggregator sites and are **not corroborated** by Adobe's own blog/newsroom — excluded here as unverified | [10](https://blog.adobe.com/en/publish/2026/04/15/adobe-extends-leadership-video-unleashing-new-ai-powered-creation-firefly-reinventing-color-editors-in-premiere), [11](https://news.adobe.com/news/2026/04/adobe-new-creative-agent) (official) — 2026-10-06 |

**OpenAI:** Sora is **fully discontinued** — the consumer app shut down April 26, 2026, and the Sora 2 API sunset September 24, 2026 (already past as of this verification date). No successor video product has been announced. OpenAI is excluded from this routing table. [12](https://openai.com/index/sora-2/) (official) — 2026-10-06.

**Higgsfield / Freepik:** both are **aggregator platforms**, not independent foundation models — they bundle access to several of the models above (Veo, Kling, Seedance, Runway, etc.) under one credit system and UI. Treat any feature seen on an aggregator as belonging to whichever underlying model is actually selected there, not as a new capability of the aggregator itself — verify against that model's own adapter in Section 3, since an aggregator's UI can expose, rename, or delay a feature relative to the model's own official interface.

### 1.1 When traditional production still wins

No model above reliably delivers: frame-accurate lip sync to a locked VO track; guaranteed exact timing/choreography across a full edit; complex multi-character interaction with dependable physics; precise kinetic typography or data visualization; pixel-perfect brand/product accuracy sustained across many frames; long-form narrative continuity; or sound design synced to specific edit points. For all of these, After Effects, Premiere, traditional frame-by-frame animation, or Blender remain the more reliable tool — use generated video as a layer or plate within that pipeline, not as the final deliverable for these specific needs.

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

## 10. Deliverable 10 — Worked Examples `[SIMULATED — no video generated or inspected]`

### A. Product reveal — Nomad grinder `[FICTIONAL, continuing Parts 2–5]`

```
VID-00 (abbreviated): PURPOSE: reveal the Nomad grinder as a hand lifts away a
cloth covering it. STARTING STATE: grinder fully covered by a plain cloth on a
warm-toned surface; single key light (DNA-00 locked rule). ACTION ORDER:
(1) hand enters and grips cloth, (2) hand lifts cloth and exits frame,
(3) ONLY THEN does the grinder become fully visible. MUST REMAIN LOCKED:
grinder position/orientation never shifts during the whole shot. FORBIDDEN:
grinder becoming visible before the hand fully exits. END STATE: grinder
fully revealed, hand out of frame, single light unchanged.
REFERENCE ROLE MAP (REF-01 format, video-adapted): Reference A (fictional
product photo) = Product geometry + Identity, preserve exactly, priority 1.
MOTION CONSTRAINTS (MCE-01): MUST MOVE = cloth, hand. MUST REMAIN LOCKED =
grinder, camera, light. FORBIDDEN = grinder visible/changing before hand exit.
ASQ-01 CHECK: 3 beats in a ~5-8s clip is plausible; flagged risk = "premature
reveal" if the model blends lift-and-reveal into one motion — explicitly
call out in the prompt that the reveal must follow the exit, not overlap it.
ROUTING: Veo 3.1 (ADPV-GGL-01) — chosen for native audio (a soft cloth-fabric
sound cue) and strong prompt adherence to a precise action order within its
8s duration.
ACCEPTANCE CHECKLIST: grinder not visible until hand fully exits; grinder
position identical in the first and last frame; label/logo legible once revealed.
LOCAL FAILURE [SIMULATED]: the model revealed the grinder partially while the
hand was still mid-exit.
SMALLEST CORRECTION: re-run with the action order stated even more explicitly
("the grinder remains fully covered until the hand has completely left the
frame, then and only then becomes visible") rather than rewriting the whole prompt.
PRACTICAL FALLBACK: split into two generations — covering-hand motion, then a
separate reveal generation — and cut between them in editing (Part 7) if the
single-pass version keeps revealing early.
```

### B. Character shot — approved mascot `[FICTIONAL, continuing Part 5's "Pip" example]`

```
VID-00 (abbreviated): SUBJECTS/ASSET IDS: Pip (CC-01 master, Part 5). ACTION:
Pip waves once, then turns to walk off-frame left. CAMERA BEHAVIOR: locked
tripod (Section 6) — explicitly chosen to isolate identity-preservation
testing from camera-motion variables. IDENTITY RULES: rounded shapes, 2-color
palette, proportions per the CC-01 master record.
MOTION CONSTRAINTS (MCE-01): MUST MOVE = Pip's arm (wave), Pip's whole body
(walk-off). MUST REMAIN LOCKED = palette, proportions, background (plain,
per Part 5's IP-03 neutral setup). MAY MOVE = n/a (no secondary elements in frame).
ROUTING: Kling 4.0 (ADPV-KLG-01) — chosen for Omni Reference's identity-lock
strength and native multi-keyframe option if the wave-then-walk needs a
mid-point pin.
ACCEPTANCE CHECKLIST (VCC-01 applied): palette and proportions match the CC-01
master throughout, not just in frame 1; wave reads as a clear, singular
gesture; exit is a clean walk-off with no body distortion.
LOCAL FAILURE [SIMULATED]: Pip's color palette shifted slightly warmer midway
through the walk.
SMALLEST CORRECTION: re-run with the Identity reference weighted higher in
Omni Reference (per ADPV-KLG-01's settings) rather than regenerating with a
new prompt from scratch.
PRACTICAL FALLBACK: if drift persists, generate the wave and the walk-off as
two separate short clips with the master reference re-attached to each, and
cut between them.
```

### C. Continuous camera journey — FPV through the "Anywhere Bar" setting `[FICTIONAL]`

```
VID-00 (abbreviated): PURPOSE: an immersive FPV path moving across a cafe
counter toward the Nomad grinder, ending in a close framing on it.
STARTING STATE: wide view of a busy counter surface. CAMERA BEHAVIOR: FPV
module (Section 6) — fast, continuous, no cut. END STATE: close framing on
the grinder, motion has stopped or nearly stopped.
ASQ-01 CHECK: path length vs. available duration — flagged risk: an FPV path
crossing an entire counter surface in under 8s (Veo's cap) may read as
unrealistically fast; recommend either shortening the path or choosing a
longer-duration model (Kling 4.0, up to 30s) for this specific shot.
MOTION CONSTRAINTS (MCE-01): MUST MOVE = camera (continuous FPV path).
MUST REMAIN LOCKED = grinder position/orientation at the destination.
FORBIDDEN = any implied cut or teleportation mid-path.
ROUTING: Kling 4.0 (ADPV-KLG-01) — chosen specifically for its longer native
duration (up to 30s), giving the FPV path enough time to read as continuous
rather than compressed.
ACCEPTANCE CHECKLIST: no visible jump-cut mid-path; ending framing matches
the stated END STATE; environment detail remains specific (not generic/
repeating) along the whole route.
LOCAL FAILURE [SIMULATED]: the path's middle section showed generic,
repeating counter texture with no specific detail.
SMALLEST CORRECTION: add more specific environment description at the
midpoint of the path (per ASQ-01's beat-by-beat structure) rather than
re-describing the whole environment generally.
PRACTICAL FALLBACK: shorten the FPV path to the final approach only, and
handle the earlier wide establishing view as a separate, simpler locked or
slow-push shot cut together with it in editing.
```

No video was generated or inspected for any of the three examples — all specifications, routing choices, and "failures" are illustrative reasoning only.

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

### 11.2 Handoff for Part 7

```
VERIFIED MODELS / INTERFACES: Veo 3.1 (Gemini app/AI Studio/API/Vertex/Flow);
  Runway Gen-4.5 (app/API, text+image-to-video only, no native camera-control
  GUI or confirmed audio); Kling 4.0 / 4.0 Flash (app + aggregators, longest
  native duration, several headline features still "coming soon" as of
  2026-10-06); Seedance 2.0 (Volcengine/Doubao/Jimeng + third-party
  aggregators, richest combined reference input, platform-specific tag
  syntax); Luma Ray3.2 (Dream Machine + new Ray API, Multi-Keyframe is the
  one genuinely structured camera control in this set); Adobe Firefly Video
  (own model + 30+ aggregated partner models, strongest for editing existing
  footage in-pipeline). OpenAI/Sora confirmed fully discontinued, no
  successor. Higgsfield/Freepik are aggregators, not separate models. All
  verified 2026-10-06 — re-check before production use.

VIDEO ADAPTER IDS: ADPV-GGL-01, ADPV-RUN-01, ADPV-KLG-01, ADPV-SDC-01,
  ADPV-LUM-01, ADPV-ADB-01.

SHOT SPECIFICATION FORMAT: VID-00 (23 fields; DURATION/ASPECT RATIO marked as
  interface settings resolved per chosen model; TIMING/BEATS treated as
  intent unless the model's adapter confirms an enforceable timing control).
  Mandatory contradiction check: locked-camera language vs. a described
  camera move must be flagged, never silently resolved.

APPROVED ASSET IDS: None from a real project in this session — Part 5's
  CC-01/PC-01 format is the source for any real project's master identity/
  product IDs going forward.

IDENTITY RULES: Inherited unchanged from Part 5 (CC-01 character / PC-01
  product "must not change" fields) — video generation must preserve the same
  locked features defined there, checked via VCC-01 across the whole clip,
  not just the first frame.

CAMERA MODULES: 19 modules (Section 6) describing visible behavior only;
  explicitly flagged which is a genuine structured control (Luma
  Multi-Keyframe) vs. prompt-based influence (everything else in this set).
  Camera movement must trace to shot PURPOSE, never added only for "dynamic" effect.

ACTION SEQUENCING RULES: ASQ-01 — ordered beats, dependencies, approximate
  timing bounded by the target model's actual duration options; explicit
  checks for too-many-actions, conflicting motions, impossible state changes,
  premature reveals, missing exits, ambiguous actor/object relationships;
  required event order preserved or explicitly flagged as unreliable, never
  silently dropped.

MOTION CONSTRAINTS: MCE-01 format — MUST MOVE / MAY MOVE / MUST REMAIN LOCKED
  / FORBIDDEN, separated into subject/camera/environmental/lighting/editorial
  categories, with allowed behavior, range, timing relationship, protected
  appearance, and an inspection method for each.

START / END STATES: Defined per-shot inside VID-00's STARTING STATE/END
  STATE fields; for multi-shot work, each shot's END STATE must match the
  next shot's STARTING STATE (checked in ASQ-01/VP-12).

AUDIO REQUIREMENTS: Only Veo 3.1, Kling 4.0, Seedance 2.0 confirmed to have
  native audio generation in this set; Runway Gen-4.5 and Luma Ray3.2 audio
  support unconfirmed; Adobe Firefly's native-generation audio specifics
  (vs. its editor-level sound tools) are not fully disentangled here —
  re-verify before relying on native audio from either.

CONTINUITY CHECKS: VCC-01 format — evidence-vs-cause separation, no invented
  timestamps beyond what was actually observable, consequential errors
  (identity/product/text/action-order) prioritized over minor artifacts,
  concluding KEEP/FIX/REGENERATE/REBUILD-COMPOSITE.

GENERATION STATUS: No video has been generated, approved, or inspected in
  this Part. All three Deliverable 10 examples are explicitly [SIMULATED].

PRODUCTION FALLBACKS: Traditional animation/compositing/editing/3D (Blender)
  remains preferable for frame-accurate lip sync, guaranteed exact timing,
  complex multi-character physics, precise kinetic typography, sustained
  pixel-perfect brand accuracy, long-form continuity, and edit-point-synced
  sound design — none of the six models here reliably replace these.

UNRESOLVED ITEMS: Carried from Parts 1–5 (model version churn generally;
  Nomad's DEC-002 real-vs-AI-generated-environment question still open; Nano
  Banana 2's exact reference-image count still unconfirmed). New in Part 6 —
  Kling 4.0's headline features (10-bit HDR, 2-minute extension) were
  explicitly "coming soon" as of this verification date, not yet live;
  Adobe's own Firefly Video Model's exact native duration/resolution ceiling
  (distinct from its aggregated partner models) was not clearly restated in
  the 2026 official sources reviewed.

NEXT TASK: Part 7 will build storyboard, motion-direction, editing, After
  Effects, and sound workflows for turning approved plans and generated
  assets into finished production.
```

**Stop — Part 6 complete.**
