# UGC-Style & Digital-Human Avatar Image Prompts

**Important — read before using:** These prompts are **newly written for this request** — they are **not** part of the original 8-part AI Creative Operating System library. I checked the original image-generation library (Part 5) and it contains no prompt literally called "UGC" or "Avatar"; the only existing adjacent content is `IP-06` (Photoreal lifestyle image), `IP-03`/`IP-04` (Character design/pose variation), `CC-01` (Character Consistency), `IP-11` (Thumbnail/social ad visual), and `REF-01` (Reference Engineering). The prompts below were built fresh, in the same format as the rest of the library, specifically for:
1. **UGC-style content images** — photos meant to read as authentic, unpolished, user-generated content (not studio-produced).
2. **Avatar prompts = photoreal AI digital humans** — a synthetic spokesperson/talking-head identity meant to be reused consistently across an ad or video campaign (per your clarification).

They follow the same `STD-00` shape as the original library (ID, Purpose, Required Inputs, Prompt, Expected Output, Quality Check, Follow-ups) and reuse the original library's conventions where relevant (`REF-01` reference roles, `CC-01` consistency checks). They have **not** been tested against specific model adapters the way the original library's prompts were — treat the bracketed model suggestions as starting points, not verified routing.

**A compliance note that applies to every prompt below (read once, applies throughout):** Synthetic "UGC" and "digital human/avatar" content sits in an area with real legal and platform-policy exposure:
- If an avatar/digital human is meant to be **fully synthetic** (no real person behind it), say so explicitly in the prompt and verify the output doesn't accidentally resemble an identifiable real person (especially a public figure) before using it in paid media.
- If it's based on a **real person's likeness**, you need that person's documented consent before generating or using the content — this is not something the image model can verify for you.
- Several ad platforms (Meta, TikTok, YouTube/Google) and some jurisdictions require **disclosure when content is AI-generated or features a synthetic person**, especially in advertising or testimonial-style content. Check current platform policy and local advertising law before publishing — this library can't confirm current rules for you.
- None of this is enforced by the image model itself; it's a human review step you need to keep in your process.

---

## Section A — UGC-Style Content Image Prompts

### `UGC-01` v1.0 — UGC-Style Product/Lifestyle Photo

**Purpose:** Generate a single still image that reads as authentic, non-produced user-generated content — the kind of photo a real customer would post, not a brand's studio shot.

**Use when:** the brief calls for an "authentic," "organic," or "native-feeling" image for social/ad placements where a polished look would undercut credibility.

**Don't use when:** the deliverable needs to look like professional brand photography — use `IP-06` (Photoreal lifestyle image) instead.

**Required inputs:** `SUBJECT_OR_PRODUCT`, `ENVIRONMENT`/setting, target platform (e.g., Instagram feed, TikTok, Reels cover).

**Prompt:**
```
ROLE: You generate a single still image that must read as authentic,
unpolished user-generated content — not professional or brand photography.

SUBJECT: [SUBJECT_OR_PRODUCT]
SETTING: [ENVIRONMENT — a real, everyday location, not a studio]
PLATFORM: [target platform, for aspect ratio/framing conventions]

REQUIREMENTS:
- Composition should feel casual and slightly imperfect — off-center framing,
  a natural (not centered/symmetrical) crop, like someone quickly took the shot.
- Lighting must be ambient/available light only (window light, indoor lamp,
  daylight) — no studio lighting, softboxes, or rim lighting language.
- Use "phone camera" visual language: natural depth of field a phone camera
  produces, slight imperfection acceptable (not professional bokeh control).
- Do not add overt branding, polish, or graphic design elements — this is a
  photo, not an ad layout.
- State plainly if any people are synthetic (no real-world counterpart) or
  if this depicts a real, consented subject — do not leave this ambiguous.

AVOID: tripod-stable framing, symmetrical composition, studio lighting setups,
camera/lens language associated with commercial photography (e.g., "85mm
portrait lens, softbox key light"), an overly "produced" result.
```

**Expected output:** a single image that could plausibly have been taken by a real person on a phone, featuring the subject/product in a real-feeling setting.

**Quality check:** Does this still look "produced" or "commercial" despite the casual wording? If yes, reject and push harder on imperfection (see follow-ups). Confirm the synthetic-vs-real-person disclosure question above was actually answered, not skipped.

**Common failure:** image models default toward polished, well-composed results even when asked for "casual" — the commercial-photography training bias tends to win unless explicitly fought.

**Follow-ups:**
- "Make the framing more off-center and less composed, like a quick phone photo."
- "Add a slight reflection or glare, like a real phone camera in this lighting."
- "Reduce the production quality — this should look like a candid snapshot, not a shoot."

---

### `UGC-02` v1.0 — UGC-Style Testimonial / Selfie Portrait

**Purpose:** A believable "customer selfie" or testimonial-style portrait of a person holding or using a product — for a static UGC-style ad image, or as a base frame feeding a UGC-style video.

**Use when:** the brief needs a "real customer" look for a testimonial, review-style ad, or before/after post.

**Required inputs:** either (a) a description of a fully synthetic person [age range, general styling — described, not based on anyone real], or (b) a real reference photo **with documented consent on file**; product reference; platform/aspect ratio.

**Prompt:**
```
ROLE: You generate a single testimonial/selfie-style portrait that reads
as a real customer photo, not a staged or professional portrait.

PERSON: [EITHER: "a fully synthetic person, no real-world counterpart —
describe only general, non-identifying styling: age range, general look" |
OR: "based on attached reference photo of [NAME], consent on file dated
[DATE]"] — state explicitly which case applies; do not leave this blank.
PRODUCT: [product reference — preserve exact geometry/branding if a real
product]
SETTING: [a plausible everyday location for a selfie: bathroom, car,
bedroom, kitchen]
PLATFORM: [target platform/aspect ratio]

REQUIREMENTS:
- Selfie-style framing: arm's-length or near-arm's-length distance, slightly
  elevated or straight-on angle, not a professional portrait setup.
- Expression should look natural/candid, not posed or commercial.
- Lighting: ordinary room/available light, not studio lighting.
- If the product is real, preserve its exact packaging/label/logo — do not
  invent or alter branding details.

AVOID: studio lighting, professional posing, airbrushed/retouched skin
texture, perfectly centered symmetrical framing.
```

**Expected output:** a single selfie-style portrait image with the product visible, looking like an authentic customer photo.

**Quality check:** If "fully synthetic" was specified, does the face resemble any identifiable real/public person? If so, regenerate — do not use. If based on a real person, confirm consent documentation exists before use, separately from this prompt.

**Common failure:** the model generates a face that coincidentally resembles a recognizable public figure even with no reference supplied — always visually cross-check before use in paid media.

**Follow-ups:**
- "Regenerate the face only, keep the same pose, framing, and product position."
- "Make this look more like a quick, unplanned selfie rather than a posed photo."
- "Diagnose which facial feature reads as recognizable/too specific, then regenerate with more generic styling."

---

### `UGC-03` v1.0 — UGC-Style Unboxing / Product-in-Hand Close-Up

**Purpose:** A close, casual shot of hands holding, unwrapping, or using a product — a common UGC ad format (unboxing, close-up demo).

**Use when:** the format calls for a hands-on, close-up "real person using the product" shot rather than a full-scene lifestyle photo.

**Required inputs:** real product reference (geometry/branding must come from a real photo, not invented), setting/surface description.

**Prompt:**
```
ROLE: You generate a close-up, casual "hands-on" product shot in the style
of an unboxing or demo clip still — not a studio product shot.

PRODUCT: [reference image — preserve exact packaging, logo, and geometry]
ACTION: [unboxing / holding / applying / demonstrating — be specific]
SURFACE_OR_SETTING: [e.g., kitchen counter, bed, car seat — an ordinary,
real-feeling surface, not a seamless studio backdrop]

REQUIREMENTS:
- Framing: close, slightly cropped, as if captured mid-action rather than
  composed — hands and product should dominate the frame.
- Lighting: ordinary indoor/available light, not studio lighting.
- Preserve the product's real packaging and branding exactly as referenced.
- Minor visual imperfection (slight blur, uneven framing) is acceptable and
  often desirable for authenticity.

AVOID: seamless studio backdrops, perfectly centered product placement,
invented or altered logos/label text.
```

**Expected output:** a close, casual image of hands interacting with the real product, in a plausible everyday setting.

**Quality check:** Run the same check as `PC-01` (Product Consistency) on the packaging/logo — zoom to full resolution and confirm no label text or logo was altered or misspelled.

**Common failure:** label/logo text is subtly re-rendered or distorted on small packaging — easy to miss at thumbnail size.

**Follow-ups:**
- "Regenerate only the background/surface, keep the product and hand position identical."
- "Zoom in tighter / pull back slightly" (framing adjustment only).

---

## Section B — Digital-Human Avatar Prompts (Photoreal, for Video/Ads)

### `AVA-01` v1.0 — Digital Human Base Identity (Spokesperson Avatar)

**Purpose:** Establish a single, locked, photoreal **synthetic** "digital human" identity to be reused consistently as an AI spokesperson/avatar across a campaign — the base reference everything else (poses, talking-head frames, video) gets generated from.

**Use when:** you need a recurring AI-generated person (spokesperson, host, reviewer-style presenter) for ads or UGC-style video, and no real person is being depicted.

**Don't use when:** the "avatar" is meant to represent a real, specific person — that requires documented consent and a real reference photo, not this prompt.

**Required inputs:** campaign/brand descriptor, general (non-identifying) styling direction — age range, general look, wardrobe style; explicit confirmation this is fully synthetic.

**Prompt:**
```
ROLE: You generate a single, neutral reference image establishing a fully
synthetic digital-human identity. This person does not represent, and must
not resemble, any real or identifiable individual, living or dead.

BRAND/CAMPAIGN CONTEXT: [brief descriptor, for styling tone only]
GENERAL STYLING: [age range, general look/wardrobe direction — described
in non-identifying terms, not based on any real reference photo]

REQUIREMENTS:
- Direct camera-facing angle, front-on or very slight 3/4 turn.
- Neutral, even studio-style lighting (this is the one case in this set
  where studio lighting is correct — this is a reference asset, not UGC).
- Neutral, closed-mouth, relaxed expression (a good base for later lip-sync/
  animation tools, which generally animate best from a neutral starting
  frame).
- Plain, uncluttered background.
- State explicitly in the output notes: "fully synthetic identity, no
  real-world counterpart."

AVOID: any mention of or resemblance to a named real person, celebrity, or
public figure; dynamic expression or mid-motion mouth position; cluttered
or branded backgrounds at this stage.
```

**Expected output:** one clean, neutral, front-facing reference image establishing the digital human's base appearance.

**Quality check:** Before treating this as the locked identity, visually confirm it does not resemble any specific identifiable real or public person. Run `CC-01` (Character Consistency) against this base before generating any further poses or frames from it.

**Common failure:** the model produces a face that coincidentally resembles a known public figure — always cross-check manually; text descriptions alone don't prevent this.

**Follow-ups:**
- "Generate the same identity from a 3/4 angle and a profile view, same lighting and background" (feeds pose-variation use, same role as `IP-04` for this new identity).
- "Adjust [one feature] to reduce resemblance to any recognizable individual, keep everything else identical."

---

### `AVA-02` v1.0 — Digital Human Talking-Head Frame (Video-Ready Base Frame)

**Purpose:** Produce a single front-facing, well-lit frame of the **already-locked** `AVA-01` identity, suitable as the driver/base image for downstream talking-head, lip-sync, or UGC-style video generation tools.

**Use when:** `AVA-01`'s identity has been generated and approved, and you now need a scene-specific frame (wardrobe/background for a particular video) to feed into a video or lip-sync tool.

**Required inputs:** the approved `AVA-01` reference image; wardrobe/background description for this specific scene.

**Prompt:**
```
ROLE: You generate a single video-ready reference frame of an already-
approved synthetic identity, preserving its exact facial geometry and
identity while placing it in a new scene.

IDENTITY REFERENCE: [approved AVA-01 image — Identity role = preserve
exactly, per REF-01 conventions]
SCENE: [wardrobe + background/setting for this specific video]

REQUIREMENTS:
- Preserve the reference identity's facial structure and features exactly
  — this is not a new character, it is the same person in a new scene.
- Mouth must be fully closed or in a neutral, relaxed position — not mid-
  speech, not smiling broadly, not mid-expression. This matters for lip-
  sync/animation tools that animate from a neutral starting mouth shape.
- Direct eye line to camera.
- Lighting and background should match the intended scene/brand context,
  but keep the face area evenly lit (avoid harsh shadows across the face
  that would complicate downstream animation).

AVOID: generating a "similar-looking" person instead of the exact same
identity; any mid-speech or extreme-expression mouth position; harsh or
uneven lighting across the face.
```

**Expected output:** a single frame of the same locked identity, dressed/placed for the specific scene, with a neutral mouth and clear eye line — ready to hand to a lip-sync/talking-head video tool.

**Quality check:** Run `CC-01`'s drift check against the `AVA-01` base before use — confirm this is still recognizably the same identity, not a drifted variant. If you know the specific downstream video/lip-sync tool, confirm its input requirements (framing, resolution, headroom) separately — this prompt doesn't guarantee compatibility with any particular tool.

**Common failure:** the generated frame has the mouth already mid-motion or an expression that doesn't match "neutral," producing an awkward starting point for lip-sync animation.

**Follow-ups:**
- "Regenerate with the mouth fully closed and relaxed, keep everything else identical."
- "Diagnose which feature drifted from the AVA-01 reference" (same pattern as `REF-01`'s drift-diagnosis follow-up).

---

## What to do next

- These are starting templates, not finished, model-tuned prompts — adapt the bracketed sections to your actual brief, and check Part 5's **Model-Specific Adapters** section (Deliverable 3) for how your chosen image model wants references/instructions phrased.
- If you want, I can also pull in the original library's closest matching content (`IP-03`, `IP-04`, `CC-01`, `IP-06`, `IP-11`, `REF-01` — the real, original-library prompts these new ones build on) into the same document so you have both in one place.
