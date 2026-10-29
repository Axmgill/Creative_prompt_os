# Creator Prompts Using Your Own Character Reference

This builds directly on `CREATOR-00`/`CREATOR-01`/`CREATOR-02` (the general creator-style prompts). The difference here: instead of describing a creator from scratch, you attach **your own reference photo of a real person** (yourself, a client, hired talent) and the prompt locks that exact face/identity in place while generating new poses, settings, and lighting around it.

**Required before you use any of this:** a real photo, and **documented consent** from that person to generate AI images of their likeness. This is not optional and not something any prompt or tool can verify for you — confirm it yourself before generating anything. If the reference is a public figure or anyone other than you, get that confirmed in writing.

**A practical limitation to expect:** several image models restrict or outright refuse generating photoreal images of real, identifiable people from a single reference photo — this is a deliberate policy guardrail against impersonation/deepfakes, not a prompt-wording problem. If a model refuses or the identity doesn't carry over reliably, that's a tool/policy limitation, not something to "prompt-engineer around" — you may need a tool explicitly built for consented identity-preservation (and that still verifies consent on its end). `CREATOR-REF-00` below includes a test step specifically to catch this early, before you build a whole shot list around a reference that won't actually hold.

---

## `CREATOR-REF-00` v1.0 — Lock In Your Character's Identity (prep step — do this first)

**Purpose:** Confirm your reference photo can actually be used as a reliable identity lock before generating a full set of scenes from it — one small test generation instead of discovering the problem after building everything else.

**Required inputs:** the reference photo; confirmation that consent is documented.

**Prompt:**
```
ROLE: You generate a single confirmation image to test whether this
reference photo's identity can be reliably preserved before further use.

IDENTITY REFERENCE: [attached photo] — preserve facial structure, features,
and proportions exactly, per REF-01 conventions. This role outranks every
other instruction in this prompt.

TASK: Generate the same person, same framing and angle as the reference,
in a plain neutral setting with even, neutral lighting — no stylistic
changes. This is a fidelity check, not a creative shot.
```

**Quality check:** Compare the output directly against the reference photo. Does it read as unmistakably the same person — same facial structure, proportions, distinguishing features? If it's a "similar-looking" generic person rather than that specific individual, stop here: this model/workflow isn't preserving identity reliably enough for production use. Try a tool built specifically for consented identity/face preservation instead of plain text-to-image.

**Common failure:** the model generates someone who resembles the reference in general terms (age, hair, build) but not in the specific facial structure that makes them recognizable as that individual — easy to miss at a glance, so compare side-by-side, not from memory.

---

## `CREATOR-REF-01` v1.0 — Seated, Mid-Gesture Shot (your character)

**Purpose:** The `CREATOR-01` seated/gesturing creator shot, built around your specific reference identity instead of a described one.

**Required inputs:** the confirmed reference photo (passed `CREATOR-REF-00`); wardrobe; setting; lighting mood.

**Prompt:**
```
ROLE: You generate a single, highly photorealistic still image of a content
creator mid-explanation, filmed for a talking-head YouTube/podcast segment.

IDENTITY REFERENCE: [attached, confirmed reference photo] — preserve facial
structure, features, and proportions exactly. This is the same individual
as the reference, not a new or similar-looking person. Everything else in
this prompt (wardrobe, pose, setting, lighting) may change freely.

WARDROBE: [e.g., an oversized, relaxed crewneck sweatshirt, jeans, mic
clipped to the collar]
POSE: seated in a modern upholstered accent chair, legs casually crossed,
both hands raised at chest height mid-gesture as if explaining a point —
natural, unposed hand positions
SETTING: [e.g., a warm, cozy home-studio living-room corner — framed art,
plants, a softly glowing floor lamp, a shelf with small decor items]
LIGHTING: warm, neutral daylight-balanced key light, soft and even on the
face, shallow depth of field blurring the background
CAMERA: eye-level, vertical 9:16 framing, medium-wide shot showing the full
seated figure

[Insert Photorealism Reinforcement Block from the main Creator Prompts doc]
```

**Expected output:** a vertical, photoreal seated creator shot — the specific reference identity, in a new pose/setting.

**Quality check:** run the same side-by-side identity comparison as `CREATOR-REF-00` before accepting — don't assume a successful first shot means every future shot from this reference will hold. Also check hands (this pose is hand-heavy) and that no wardrobe/background text is garbled.

**Common failure:** identity holds in a straightforward, front-facing shot but drifts once a more dynamic pose or different lighting is requested — if so, simplify the pose/lighting change and reintroduce complexity gradually rather than changing everything at once.

**Follow-ups:**
- "Regenerate keeping the identity and pose identical, change only [wardrobe/setting/lighting element]."
- "Diagnose which facial feature drifted from the reference, then regenerate."

---

## `CREATOR-REF-02` v1.0 — Close-Up, Presenting an Object (your character)

**Purpose:** The `CREATOR-02` close-up/presenting creator shot, built around your specific reference identity.

**Required inputs:** the confirmed reference photo; the object being presented; lighting mood.

**Prompt:**
```
ROLE: You generate a single, highly photorealistic close-up still image of
a content creator presenting an object directly to camera, filmed for a
talking-head review/vlog-style video segment.

IDENTITY REFERENCE: [attached, confirmed reference photo] — preserve facial
structure, features, and proportions exactly. This is the same individual
as the reference, not a new or similar-looking person.

ACTION: holding [PROP] up toward the camera with both hands, roughly chest-
to-face height, as if actively showing/reviewing it, mouth open mid-
sentence, direct eye contact with camera
FRAMING: tight chest-up close-up, the object prominent in the lower-middle
of frame, face clearly visible above it
SETTING: [e.g., a dim, moody room with a blurred shelf of books/objects in
the background]
LIGHTING: [e.g., warm amber/red accent lighting as the dominant tone, a
single key light on the face from the front]
CAMERA: eye-level, close distance, vertical 9:16 framing, shallow depth of
field, background details indistinct

[Insert Photorealism Reinforcement Block from the main Creator Prompts doc]
```

**Expected output:** a vertical, close-up photoreal still of the specific reference identity presenting an object to camera.

**Quality check:** identity comparison as above; also zoom into the held object's label/cover text, which is the most common place for garbled text to appear — regenerate the object only if needed, keeping identity and pose identical.

**Follow-ups:**
- "Regenerate only the object, keep identity, pose, and lighting identical — the label text is garbled."
- "Change only the lighting mood, keep identity and pose identical."

---

## Keeping it consistent across a whole shot list

Once `CREATOR-REF-00` confirms the reference holds reliably:
1. Reuse the **exact same reference photo** for every subsequent shot — don't regenerate or "refresh" the identity reference between shots, which reintroduces drift risk.
2. After each new shot, do a quick side-by-side check against the original reference, not against the previous generated shot (errors compound if you check against the last output instead of the source).
3. Keep a short log of which shots passed/failed the identity check — if a particular pose or lighting style reliably causes drift, avoid that combination rather than retrying it repeatedly.
4. If you're publishing this content as advertising or in a context where it could be mistaken for the real person's live appearance, check current platform policy on AI-generated likeness disclosure — separate from the generation process itself.
