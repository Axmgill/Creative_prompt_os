# Highly Realistic "Content Creator" Talking-Head Prompts

**What changed from the last version:** you confirmed you don't need the rough, phone-shot "UGC" look — you need the **content-creator** look shown in your two reference images instead: a real-feeling person filmed with intentional lighting and a clip-on mic, in a cozy or moody set, either gesturing mid-talk or holding something up to camera. That's a meaningfully different aesthetic (polished-but-authentic, not amateur), so this replaces the UGC section with prompts built specifically around that look, with extra emphasis on photorealism.

**What I pulled from your two reference images:**
- **Image 1 (seated, gesturing):** medium-wide seated shot, cross-legged, mid-gesture talking with both hands raised, lavalier mic clipped to collar, warm neutral daylight-balanced lighting, shallow depth of field, cozy home-studio background (leaf art print, plants, floor lamp glow, shelf with candles/boxes), small round side table with a mug blurred in the foreground, vertical 9:16 framing.
- **Image 2 (close-up, holding object):** tight chest-up shot, holding a book up toward camera with both hands, direct eye contact, mouth open mid-sentence, warm amber/red moody lighting, blurred wooden shelf with books in the background, vertical 9:16 framing (this one is a screenshot from an actual video, which is why there's a player UI at the bottom — the prompts below recreate the *photo*, not the UI chrome; see note at the end if you actually want that overlay too).

These are newly written for this request (not pulled from the original 8-part library), but they follow the same format and reuse the library's identity-consistency approach (`CC-01`-style) if you need the same creator to recur across multiple images.

---

## Photorealism Reinforcement Block (use in every prompt below)

AI-generated "person talking to camera" shots commonly fail in specific, fixable ways. Append this block to any prompt in this set when realism is slipping:

```
REALISM REQUIREMENTS:
- Natural skin texture: visible pores, slight unevenness, natural oil/shine
  on forehead and nose — not airbrushed or plastic-smooth.
- Natural facial asymmetry — avoid a perfectly symmetrical, "generated"-
  looking face.
- Realistic eyes: natural catchlights from the room's actual light sources,
  slight redness/moisture, not glassy or waxy.
- Shot on [e.g., Sony A7S III / Canon R5, 35mm or 50mm lens] at a wide
  aperture (f/1.8–f/2.8) — natural falloff and background blur, not a
  synthetic/uniform blur.
- Lighting should behave physically: shadows fall consistently from the
  stated light sources, skin tones respond naturally to warm/cool light
  mixing in the room.
- Natural hand anatomy — correct finger count and proportion, especially
  important since both reference shots involve expressive or occupied hands.

AVOID: airbrushed/plastic skin, waxy or glassy eyes, perfectly symmetrical
features, "uncanny valley" smoothness, garbled text on any visible object
or background text/labels, extra or malformed fingers.
```

---

## `CREATOR-00` v1.0 — Master Creator Talking-Head Template (reusable)

**Purpose:** A parameterized base prompt for generating a single, highly photorealistic "content creator" still — the look of someone filming a YouTube/podcast/vlog segment with real intention behind the lighting and framing, not a phone-shot candid and not a commercial studio ad.

**Required inputs:** `CREATOR_DESCRIPTION` (appearance — only from a brief/reference, never invented identity details beyond what's specified), `WARDROBE`, `SETTING`, `FRAMING` (seated-wide / close-up chest-up), `LIGHT_MOOD`, optional `PROP` (object held toward camera), `ACTION` (gesture-while-talking / holding-and-presenting-object).

**Prompt:**
```
ROLE: You generate a single, highly photorealistic still image of a content
creator filming a talking-to-camera video segment (YouTube/podcast/vlog
style) — polished but authentic, not a phone-shot candid, not a commercial
studio ad.

CREATOR: [CREATOR_DESCRIPTION]
WARDROBE: [WARDROBE]
SETTING: [SETTING — a lived-in, intentionally decorated space: home studio,
living room corner, desk setup, etc.]
FRAMING: [FRAMING]
ACTION: [ACTION — e.g., "mid-sentence, both hands raised in an explaining
gesture" or "holding [PROP] up toward camera with both hands, presenting it"]
LIGHTING: [LIGHT_MOOD — e.g., "warm, neutral daylight-balanced key light
from one side, soft fill, gentle practical lamp glow in background" or
"warm amber/red moody accent lighting, single key light, dim ambient"]
MIC: a small lavalier microphone clipped to the collar, visibly present but
not the focus
CAMERA: eye-level with the subject, as if on a tripod a few feet away,
vertical 9:16 framing, shallow depth of field with the background
softly blurred

[Insert Photorealism Reinforcement Block here]
```

**Expected output:** one vertical, photoreal still that reads as a genuine frame from a creator's filmed content — intentional but not overproduced.

**Quality check:** Does the lighting look physically consistent (shadows, catchlights, color temperature)? Do the hands look anatomically correct? Does skin texture look real at full resolution, not airbrushed? If a prop/object is held, is its text/label legible and not garbled?

**Common failure:** the model defaults to either (a) an overly smooth, "AI-plastic" face, or (b) an overly staged/commercial look that loses the authentic-creator feel — push back explicitly on whichever direction it drifts.

**Follow-ups:**
- "Regenerate with more visible skin texture and less symmetry in the face."
- "Make the background softer/more out of focus, keep the subject sharp."
- "Adjust only the lighting warmth, keep pose and framing identical."

---

## `CREATOR-01` v1.0 — Seated Talking-Head, Mid-Gesture (matches reference image 1)

**Purpose:** A direct recreation of the seated, gesturing creator-shot style — useful as a go-to template for "explaining/talking" content stills.

**Prompt:**
```
ROLE: You generate a single, highly photorealistic still image of a content
creator mid-explanation, filmed for a talking-head YouTube/podcast segment.

CREATOR: an East Asian man in his early-to-mid 30s, short-to-medium wavy
dark hair, clean-shaven, warm approachable expression, mouth slightly open
mid-sentence
WARDROBE: an oversized, relaxed beige/cream crewneck sweatshirt, blue denim
jeans, white sneakers, small lavalier mic clipped to the collar
POSE: seated in a modern upholstered accent chair, legs casually crossed,
both hands raised at chest height mid-gesture as if explaining a point —
natural, unposed hand positions
SETTING: a warm, cozy home-studio living-room corner — a framed botanical
leaf print on the wall, potted plants, a floor lamp glowing softly on the
left, a shelf in the background with candles, small boxes, and a vase,
wood flooring with a patterned rug
FOREGROUND: a small round wooden side table at bottom-left with a plain
ceramic mug sitting on it, slightly soft-focused since it's closer to camera
LIGHTING: warm, neutral daylight-balanced key light from the front-left,
soft and even on the face, warm practical lamp glow in the background,
shallow depth of field blurring the background softly
CAMERA: eye-level, as if on a tripod several feet away, vertical 9:16
framing, medium-wide shot showing the full seated figure

[Insert Photorealism Reinforcement Block here]
```

**Expected output:** a vertical, medium-wide photoreal still of a seated creator mid-gesture, closely matching the warmth and composition of the reference image.

**Quality check:** same as `CREATOR-00`, plus: confirm both hands read naturally (this pose is hand-heavy and a common failure point).

**Follow-ups:**
- "Change only the wardrobe color to [X], keep the pose, lighting, and setting identical."
- "Regenerate the hands only, keep everything else the same — the left hand's fingers look malformed."

---

## `CREATOR-02` v1.0 — Close-Up, Presenting an Object to Camera (matches reference image 2)

**Purpose:** A direct recreation of the close-up "presenting/reviewing an object" creator shot — useful for book/product review, unboxing-review (not UGC-style, this is the intentional creator-studio version), or reaction-style content stills.

**Prompt:**
```
ROLE: You generate a single, highly photorealistic close-up still image of
a content creator presenting an object directly to camera, filmed for a
talking-head review/vlog-style video segment.

CREATOR: a man in his late 20s to early 30s, light-medium skin tone,
brown wavy/curly hair, light stubble beard, engaged expression, mouth open
mid-sentence as if explaining the object, direct eye contact with the camera
WARDROBE: a plain black crew-neck T-shirt or sweatshirt, a smartwatch visible
on one wrist
ACTION: holding [PROP — e.g., a hardcover book with a visible but simple
title on the cover] up toward the camera with both hands, roughly chest-to-
face height, as if actively showing/reviewing it
FRAMING: tight chest-up close-up, the object prominent in the lower-middle
of frame, face clearly visible above it
SETTING: a dim, moody room — a blurred wooden shelf lined with books and a
few dark decorative objects in the background
LIGHTING: warm amber/red accent lighting as the dominant tone, a single key
light on the face from the front, dim ambient fill, noticeable warm color
cast consistent across skin and background
CAMERA: eye-level, close distance, vertical 9:16 framing, shallow depth of
field with the background softly blurred, background shelf details
indistinct

[Insert Photorealism Reinforcement Block here]
```

**Expected output:** a vertical, close-up photoreal still of a creator presenting an object to camera, closely matching the mood and composition of the reference image.

**Quality check:** same as `CREATOR-00`, plus: zoom in on the object's cover/label text — this is the most likely spot for garbled or nonsensical text to appear; regenerate the object only if so, keeping the pose and face identical.

**Follow-ups:**
- "Regenerate only the object/book cover, keep the pose, face, and lighting identical — the title text is garbled."
- "Shift the lighting slightly warmer/cooler, keep composition identical."
- "Change only the held object to [X], keep everything else the same."

---

## Keeping the same creator consistent across multiple shots

If you want the **same** creator (same face) to recur across several images (e.g., a full content calendar, or both the seated and close-up shot being the same person):

1. Generate one clean, neutral reference image of the creator first (front-facing, neutral expression, even lighting — same approach as `IP-03`/`CC-01` in the original library).
2. Treat that reference as the **Identity (preserve exactly)** role for every subsequent `CREATOR-01`/`CREATOR-02`-style generation — describe the new pose/setting/lighting, but explicitly instruct the model to keep the face from the reference image unchanged.
3. After each new generation, compare it back to the reference and check for drift (does it still read as the same person?) before accepting it. If a feature has drifted (e.g., eye shape, hairline), regenerate that image rather than accepting a near-miss — small drifts compound across a whole content set.

---

## One thing to confirm

Image 2 in your reference includes a YouTube-style player overlay (progress bar, captions icon, speaker icon) at the bottom — that's almost certainly just an artifact of it being a screenshot from a real video, not something you'd want baked into a generated still. The prompts above recreate **the photo itself**, not that UI chrome. Let me know if you actually do want a fake player-UI overlay included (e.g., for a mockup), and I'll add a variant for that.
