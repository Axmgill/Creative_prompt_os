# AI Creative Operating System — Part 9: Technical Craft Auto-Selection and Glossary

**Builds on:** Part 2 (`STD-00` output standard), Part 3 (art direction), Part 4 (Design DNA), Part 5 (`IMG-00`, image prompts), Part 6 (`VID-00`, camera modules), Part 7 (motion/edit/AE/sound), Part 8 (QA). This part supplies the technical craft layer that Parts 5–7 inherit.

**Purpose:** The user should not need to know cinematography, photography, lighting, motion-design, editing, or post-production terminology. When a request is visual or temporal, the agent selects a coherent technical package from plain-language intent, labels it as a default or proposal, and explains it in one short line.

**New domain code:** `TECH` — technical craft translation, defaults, glossary, and technical QA.

**Important boundary:** In AI image/video generation, camera/lens/lighting terms are usually *visual look cues*, not real camera metadata or guaranteed optical simulation. Do not claim the output was shot on a real camera, lens, or sensor. Do not invent EXIF. For flat vector, icon, logo, UI, or 2D motion work, literal camera/lens language is often `N/A`; use composition, hierarchy, shape, timing, and easing instead.

---

## 1. Deliverable 1 — Technical Craft Selector (`TECH-00`)

### 1.1 When to activate

Activate `TECH-00` automatically when the user asks for:

- an image prompt, video prompt, storyboard, shot list, motion direction, edit plan, AE plan, or visual QA;
- a “cinematic,” “premium,” “professional,” “clean,” “moody,” “documentary,” “UGC,” “commercial,” or similar look;
- help choosing camera, lens, angle, lighting, movement, frame rate, aspect ratio, color, audio, motion, or export settings;
- a prompt while saying they do not know technical terms.

Do not activate literal camera/lens selection for pure copywriting, strategy, brand naming, or non-visual tasks. For flat 2D design, activate the composition/motion/export parts only.

### 1.2 Operating rules

1. **Never require the user to know jargon.** Translate plain intent into technical choices.
2. **Choose one coherent package.** Do not stack every impressive term. A prompt needs a usable look, not a glossary dump.
3. **Label the source of each choice.** Use `[CONFIRMED]` if the user specified it, `[DEFAULT: value]` if applying a safe default, `[PROPOSED: value]` if suggesting a creative choice, `[LOCKED: value]` if inherited from approved context.
4. **Explain briefly.** Add one plain-English line: what the choice does visually.
5. **Separate prompt text from interface settings.** Aspect ratio, duration, resolution, seed, model, fps, and native camera controls belong in settings when the target tool exposes them.
6. **Respect locks.** If the user or brief locks lens, angle, lighting, aspect, duration, brand color, or identity, do not override it. Flag contradictions.
7. **Use camera bodies as optional look cues only.** “ARRI-like,” “RED-like,” “Sony Venice-like,” “35mm film,” or “smartphone look” may guide texture/color/rendering, but they are not proof of real capture.
8. **Keep it model-aware.** If the target generator has a native camera control, use the adapter. If it only accepts prose, describe the visible result.
9. **Do not over-specify flat work.** For vector, icon, logo, UI, or kinetic type, prefer layout, contrast, hierarchy, timing, easing, and export specs.
10. **Never block.** If technical information is missing, choose a labelled default and deliver. Ask at most one question only if the answer materially changes the deliverable.

### 1.3 Master prompt

```
ROLE: You are the technical craft translator for AI Creative OS. Convert plain-language creative intent into a coherent, production-ready technical direction without requiring the user to know camera, lens, lighting, motion, editing, or post-production terms.

INPUTS: [USER_REQUEST] [DELIVERABLE_TYPE] [TARGET_TOOL_OR_MODEL, if known] [REFERENCES, if any] [LOCKED_REQUIREMENTS, if any] [DESIGN_DNA, if any] [PLATFORM/ASPECT/DURATION, if known]

PROCESS:
1. Identify the deliverable: image, video, storyboard, motion, edit, AE, sound, export, or mixed.
2. Extract the user's plain-language intent: subject, mood, audience, use case, realism target, and any locked constraints.
3. If the user supplied technical terms, preserve them as [CONFIRMED] or [LOCKED]. Do not replace them with defaults.
4. If technical terms are missing, select one coherent package from TECH-01/TECH-02/TECH-03. Label choices [DEFAULT] or [PROPOSED].
5. For photoreal/cinematic work, choose: camera/look cue, lens/focal-length feel, shot size, angle/camera height, focus/depth of field, lighting setup, color/finish, movement (if video), frame rate/shutter (if video), aspect/delivery.
6. For flat/vector/UI/motion work, choose: composition, hierarchy, contrast, shape language, timing, easing, layer structure, transitions, export. Mark literal camera/lens fields N/A.
7. Check coherence: lens vs subject distance, angle vs product readability, depth of field vs required legibility, lighting direction vs shadows, camera move vs locked elements, fps vs shutter, aspect vs crop, audio vs target model, export vs alpha/color needs.
8. Separate copyable prompt language from tool/interface settings.
9. Add a short plain-English explanation of the technical direction.
10. If a critical contradiction exists, flag it and offer the smallest resolution. Do not silently overwrite locked context.

OUTPUT:
- TECHNICAL DIRECTION block, using the templates in Section 2.
- One copyable prompt or shot/motion/edit spec that inherits the technical direction.
- Settings block, if the target tool has native controls.
- One-line plain-English explanation.
- Assumptions/defaults, clearly labelled.
- At most one open question, only if it materially changes the deliverable.
```

**Expected output:** A filled technical direction plus the requested prompt/spec, not a questionnaire.

**Quality check:** A non-technical user can understand what was chosen and why; the prompt contains concrete craft choices; no locked requirement was overwritten; no fake camera metadata was claimed.

---

## 2. Deliverable 2 — Technical Direction Output Templates

### 2.1 Image technical direction

Use for photoreal, cinematic, product, portrait, fashion, food, interior, architecture, landscape, documentary, or live-action-style image prompts.

```
TECHNICAL DIRECTION — IMAGE
Status: [DEFAULT / PROPOSED / CONFIRMED / LOCKED]
Camera / look cue: [optional camera-body or capture-family look cue, or "neutral full-frame digital"]
Lens / focal-length feel: [e.g., 35mm environmental, 50mm natural, 85mm portrait, 100mm macro]
Shot size: [e.g., medium close-up, product hero, full-body, detail insert]
Angle / camera height: [e.g., eye-level, low three-quarter, overhead flat lay]
Focus / depth of field: [e.g., shallow focus on eyes, deep focus, label-sharp product focus]
Lighting: [e.g., large soft key upper left, cool rim right, negative fill camera right]
Color / finish: [e.g., neutral commercial grade, warm filmic, clean high-key, muted editorial]
Composition: [e.g., centered product, rule-of-thirds portrait, leading lines, negative space]
Aspect / delivery: [e.g., 4:5 social feed, 16:9 hero, 1:1 marketplace]
Why: [one plain-English sentence explaining the visible effect]
```

### 2.2 Video technical direction

Use for text-to-video, image-to-video, storyboard shots, and live-action-style motion.

```
TECHNICAL DIRECTION — VIDEO
Status: [DEFAULT / PROPOSED / CONFIRMED / LOCKED]
Camera / look cue: [optional capture-family look cue]
Lens / focal-length feel: [e.g., 24mm wide, 35mm documentary, 50mm natural, 85mm close-up]
Shot size: [e.g., wide establishing, medium, close-up, insert]
Angle / camera height: [e.g., eye-level, low angle, overhead, shoulder-height]
Focus / depth of field: [e.g., rack focus from foreground to product, deep focus, shallow close-up]
Lighting: [e.g., motivated window key, soft bounce, hard backlight, practical neon]
Camera movement: [e.g., locked tripod, slow dolly-in, gimbal walk, handheld micro-drift]
Movement quality: [e.g., smooth, weighted, energetic, restrained, documentary]
Frame rate / shutter feel: [e.g., 24fps with 180-degree motion blur, 60fps slow motion, high-shutter action]
Color / finish: [e.g., neutral commercial, warm filmic, cool tech, muted documentary]
Audio: [e.g., room tone, cloth foley, voiceover, music bed, silence — only if target supports or post will add]
Aspect / duration / delivery: [e.g., 9:16, 6s, 1080x1920, social reel]
Why: [one plain-English sentence explaining the visible effect]
```

### 2.3 Motion / edit / AE technical direction

Use for motion design, kinetic type, logo reveals, UI animation, explainer scenes, editing, compositing, and export.

```
TECHNICAL DIRECTION — MOTION / EDIT
Status: [DEFAULT / PROPOSED / CONFIRMED / LOCKED]
Format / canvas: [e.g., 1920x1080, 1080x1920, 30fps, 10s]
Timing / beats: [e.g., 0.0-0.5s hold, 0.5-1.2s reveal, 1.2-2.0s settle]
Easing / motion feel: [e.g., ease-out cubic, spring with small overshoot, linear mechanical]
Layer structure: [e.g., background, product, type, logo, accent particles]
Transition / edit logic: [e.g., match cut, mask wipe, J-cut, speed ramp, crossfade]
Camera / parallax: [e.g., 2.5D parallax, locked graphic frame, N/A for flat vector]
Color / type: [e.g., brand palette locked, high-contrast type, safe margins]
Audio / sync: [e.g., hit on logo settle, VO ducking, whoosh on wipe]
Export / delivery: [e.g., ProRes 4444 with alpha, H.264 MP4, Rec.709, PNG sequence]
Why: [one plain-English sentence explaining the visible effect]
```

---

## 3. Deliverable 3 — Selection Algorithm

Use this order. Stop when the deliverable is fully specified.

1. **Deliverable type.** Image, video, motion, edit, AE, sound, export, mixed.
2. **Subject and scale.** Person, product, food, room, landscape, UI, logo, type, abstract.
3. **Use case.** Marketplace, social feed, hero banner, billboard, pitch deck, film, reel, ad, tutorial.
4. **Emotional target.** Premium, friendly, dramatic, calm, energetic, trustworthy, playful, clinical, nostalgic.
5. **Realism target.** Photoreal, stylized realism, flat vector, 3D render, mixed media, documentary, UGC.
6. **Locked constraints.** Brand, identity, exact copy, aspect, duration, platform, legal, reference roles.
7. **Technical package.** Choose from TECH-01, TECH-02, or TECH-03. Prefer one strong default over many options.
8. **Coherence check.** Run TECH-06 before finalizing.
9. **Output.** Technical direction + prompt/spec + settings + one-line explanation.

If the user says “you choose,” treat technical craft choices as delegated creative decisions. Record them as `[DEFAULT]` or `[PROPOSED]`, not as user-confirmed facts.

---

## 4. Deliverable 4 — Default Packages

These are starting points, not laws. Inherit locked Design DNA first. If a reference image defines the look, match the reference before applying a generic package.

### 4.1 Image defaults (`TECH-01`)

| Use case | Lens / focal feel | Shot / angle | Focus / DOF | Lighting | Color / finish | Notes |
|---|---|---|---|---|---|---|
| Product hero, premium | 85mm or 100mm macro feel | Three-quarter eye-level or slightly low | Product sharp, background soft | Large soft key, rim/accent, negative fill | Clean commercial, controlled contrast | Keep label/geometry readable; avoid wide distortion. |
| E-commerce packshot | 70-100mm feel | Straight-on or slight three-quarter | Deep enough for full product | Even softbox, minimal shadow | Neutral white/grey, true color | Marketplace-safe; no lifestyle props unless requested. |
| Food hero | 50mm or 85mm feel | 45-degree or overhead | Food sharp, steam/garnish readable | Soft side/back light, bounce fill | Warm appetizing, fresh highlights | Avoid flat frontal light; show texture and moisture. |
| Portrait, professional | 85mm feel | Eye-level, head-and-shoulders | Eyes sharp, soft background | Soft key, gentle fill, hair light | Natural skin, neutral grade | Avoid wide-angle close faces. |
| Portrait, environmental | 35mm or 50mm feel | Medium or full-body, eye-level | Subject sharp, context readable | Motivated window/practical light | Documentary or editorial | Show person in place, not just face. |
| Fashion editorial | 50mm or 85mm feel | Full-body, low or eye-level | Model sharp, fabric readable | Directional key, rim, controlled shadows | Editorial grade, fabric-true | Preserve garment silhouette and texture. |
| Beauty / cosmetics | 100mm macro feel | Close-up, eye-level | Skin/product detail sharp | Large diffusion, clean catchlights | Clean, luminous, true tone | Avoid plastic skin unless requested. |
| Jewelry / watch macro | 100mm macro feel | Close three-quarter or top-down | Critical plane sharp, controlled falloff | Strip softboxes, flags, sparkles controlled | High clarity, metal-true | Reflections are design; specify reflection shape. |
| Interior / architecture | 20-24mm tilt-shift feel | Eye-level or corrected verticals | Deep focus | Natural window + balanced interior | Neutral, verticals straight | Avoid extreme wide distortion; keep lines clean. |
| Real estate listing | 16-24mm feel | Corner wide, chest height | Deep focus | Bright natural, balanced windows | Clean, inviting, true color | Must feel spacious but not fake. |
| Landscape / travel | 24-35mm feel | Wide, eye-level or elevated | Deep focus | Golden hour, blue hour, overcast | Natural or mild filmic | Foreground/midground/background depth. |
| Street / documentary | 35mm feel | Candid medium, eye-level | Subject sharp, context present | Available light, motivated | Natural, slight grain | Imperfect framing can feel authentic. |
| Automotive hero | 35mm or 70-100mm feel | Low three-quarter or tracking side | Car sharp, reflections controlled | Large soft sources, sky gradient | Glossy commercial, paint-true | Reflections define shape; avoid messy highlights. |
| Tech / UI product | 50mm or 85mm feel | Straight-on or slight three-quarter | Screen/product sharp | Clean studio, edge highlights | Cool neutral, crisp | Screen content must be supplied or marked placeholder. |
| Flat lay / overhead | 50mm or 85mm feel | Top-down 90 degrees | Even sharpness across layout | Large overhead soft light | Clean, organized, brand palette | Use grid/negative space; avoid perspective distortion. |
| Beverage / pour | 85mm or 100mm macro feel | Side or three-quarter close | Liquid/label sharp | Back/side light through liquid | Fresh, high clarity | Condensation, bubbles, meniscus matter. |
| Shoe / sneaker | 70-100mm feel | Low three-quarter or side profile | Shoe sharp, sole texture readable | Soft key + rim, ground shadow | Clean commercial or street | Preserve silhouette, lace logic, sole geometry. |
| Furniture / decor | 35mm or 50mm feel | Room context or detail three-quarter | Deep enough for form | Soft window, warm practicals | Lifestyle, material-true | Show scale with room context. |
| Concept / surreal | 35mm or 50mm feel | Depends on idea | Controlled by focal point | Motivated impossible light | Stylized but coherent | Even surreal work needs consistent light/physics. |
| Flat vector / icon / logo | N/A | Flat composition | N/A | N/A or graphic shading | Brand palette, high contrast | Use shape, hierarchy, negative space; no fake lens. |

### 4.2 Video defaults (`TECH-02`)

| Use case | Lens / shot | Angle / movement | Focus / lighting | Frame rate / shutter | Audio / delivery | Notes |
|---|---|---|---|---|---|---|
| Cinematic product reveal | 50-85mm feel, medium to close | Slow dolly-in or orbit, eye-level/slight low | Product sharp, soft key + rim | 24fps, 180-degree blur | Foley/music if supported | One reveal beat; lock product geometry. |
| Talking head, professional | 50mm feel, medium close-up | Locked tripod, eye-level | Eyes sharp, soft key/fill | 24/30fps, natural blur | Clean VO/room tone | Stable frame, safe headroom. |
| UGC / creator | 24-35mm smartphone feel | Handheld selfie or slight high angle | Face sharp, available light | 30fps, natural motion | Direct voice, room tone | Authentic imperfection; avoid cinema polish. |
| Interview / documentary | 35-50mm feel, medium | Locked or slight handheld, eye-level | Subject sharp, motivated key | 24/25fps, natural blur | Lav/room tone | Context visible; avoid glam lighting unless asked. |
| Food pour / cooking | 85-100mm macro feel | Side close, slow push or locked | Liquid/food sharp, back/side light | 24/60fps depending slow-mo | Pour/sizzle foley | Steam, droplets, viscosity matter. |
| Fashion walk | 50-85mm feel, full-body | Gimbal track or slow dolly, eye-level/low | Model sharp, directional key | 24fps, 180-degree blur | Music/footsteps | Garment motion and fabric weight. |
| Automotive tracking | 35-70mm feel, side three-quarter | Low tracking, gimbal/car mount | Car sharp, controlled reflections | 24fps, motion blur in background | Engine/road/music | Background motion sells speed; car stays stable. |
| Real estate walkthrough | 16-24mm feel, wide | Smooth gimbal, chest height | Deep focus, bright natural | 24/30fps, stable | Music/VO | Verticals straight; no warp-speed move. |
| Drone landscape | Wide aerial feel | High angle, slow forward/orbit | Deep focus, golden/blue hour | 24/30fps, smooth | Music/ambient | Avoid impossible drone physics. |
| Action / sports | 24-70mm feel | Tracking, low or dynamic | Subject sharp, high shutter feel | 60/120fps if slow-mo | Impact/ crowd | High shutter can feel staccato; use intentionally. |
| Macro texture | 100mm macro feel | Very slow slider or locked | Critical plane sharp, raking light | 24/60fps | Subtle foley | Tiny movement reads strongly. |
| Logo reveal | Graphic or 50mm feel | Locked or subtle push | Graphic light, brand palette | 24/30fps | Hit/whoosh | Timing/easing more important than lens. |
| Kinetic type | N/A | Locked graphic frame | Type contrast, safe margins | 24/30fps | VO/music sync | Easing, hierarchy, readability. |
| UI demo | N/A or 50mm feel | Locked screen or slight parallax | Screen sharp, clean light | 30fps | Click/VO | Exact screen content required. |
| Explainer scene | Graphic or 35mm feel | Simple pan/push or locked | Clear hierarchy, soft light | 24/30fps | VO/music | One idea per shot. |
| Music video | 24-85mm feel | Stylized moves, angles | Motivated stylized light | 24fps, creative shutter | Music playback | Consistent style beats; avoid random moves. |
| Slow motion | 70-100mm feel | Locked or slow track | Subject sharp, directional light | 60/120fps capture intent | Stretched foley/music | State slow-mo intent; not all models support true fps. |
| Timelapse | Wide feel | Locked or motion-controlled | Changing light, deep focus | Timelapse intent | Music/ambient | Clouds/shadows/traffic motion; avoid flicker. |
| Overhead process | 50mm feel | Top-down locked | Even sharpness, soft overhead | 24/30fps | Hands/tools foley | Great for crafts, cooking, assembly. |
| Handheld documentary | 35mm feel | Shoulder/handheld, eye-level | Available light, subject sharp | 24/25fps, natural blur | Location sound | Micro-drift, not shaky chaos. |
| Gimbal walk-and-talk | 24-35mm feel | Smooth follow, eye-level | Subject sharp, motivated light | 24/30fps, stable | VO/location | Smooth doesn't mean floating; keep weight. |

### 4.3 Motion / edit defaults (`TECH-03`)

| Use case | Timing / easing | Layer / transition logic | Camera / parallax | Export / delivery | Notes |
|---|---|---|---|---|---|
| Logo sting | 0.3-1.5s, ease-out or spring | Mask/shape reveal, settle hold | Locked graphic frame | ProRes 4444 alpha or MP4 | Settle must feel intentional; avoid endless bounce. |
| Lower third | 0.4-0.8s in, hold, 0.3s out | Slide/mask, safe margins | N/A | Alpha MOV/PNG sequence | Readability first; brand type locked. |
| Kinetic typography | Beat-synced, ease-in-out | Word/line hierarchy, mask wipes | N/A or subtle parallax | MP4/ProRes | Type must remain legible at speed. |
| UI animation | 150-400ms micro, ease-out | State changes, hover/press feedback | N/A | MP4/Lottie if supported | Match product motion language. |
| Explainer scene | 2-6s per idea, ease-in-out | Icon/label builds, match cuts | 2.5D parallax optional | MP4/ProRes | One concept per scene. |
| Transition pack | 0.2-0.8s, directional easing | Mask/wipe/shape match | Directional motion | Alpha MOV | Consistent direction and speed. |
| Social reel | Fast beats, snap/ease-out | Jump cuts, text pops, match cuts | Handheld or graphic | 1080x1920 MP4 | Hook in first 1-2s; captions safe. |
| Title sequence | 2-8s, cinematic easing | Layered reveals, atmosphere | Slow push/parallax | ProRes/MP4 | Mood over information density. |
| Data visualization | Staggered builds, linear/ease-out | Axis/label first, data second | N/A | MP4/PNG sequence | Accuracy and legibility over flourish. |
| Photo parallax | 2-6s, slow ease | Foreground/midground/background separation | 2.5D camera move | MP4/ProRes | Needs clean cutouts; avoid edge halos. |

---

## 5. Deliverable 5 — Plain-Language Translation Map (`TECH-05`)

Use this when the user gives mood words instead of technical terms.

| User says | Translate toward | Avoid |
|---|---|---|
| “Premium” | Controlled contrast, soft directional key, longer lens feel, clean composition, restrained palette | Random gold, lens flare, over-sharpening |
| “Luxury” | Negative space, precise highlights, matte/gloss contrast, slow movement, quiet palette | Clutter, flashy transitions, oversaturation |
| “Cinematic” | 24fps feel, 180-degree blur, motivated light, shallow/controlled DOF, deliberate camera move | Calling everything “cinematic” without a look |
| “Clean” | Even light, low clutter, neutral color, straight lines, deep enough focus | Sterile flatness unless requested |
| “Moody” | Low-key light, directional shadows, muted color, negative fill | Underexposed mud with no detail |
| “Dramatic” | Harder key, strong rim/backlight, low angle, high contrast | Random shake or chaos |
| “Friendly” | Eye-level, soft light, warm neutral palette, medium shot | Cold clinical light unless brand says so |
| “Trustworthy” | Neutral color, stable frame, soft even light, clear product/face | Distortion, extreme angles, heavy grade |
| “Energetic” | Wider lens feel, dynamic angle, faster cuts, motivated movement | Unreadable shake or random zooms |
| “Playful” | Bright palette, rounded shapes, spring easing, bouncy timing | Childish unless audience fits |
| “Documentary” | 35mm feel, available light, handheld micro-drift, natural grade | Over-polished commercial lighting |
| “UGC” | Smartphone wide feel, selfie angle, natural light, direct address, imperfect framing | Cinema camera language unless ironic |
| “Editorial” | 50/85mm feel, intentional composition, fabric/skin texture, controlled grade | Generic stock-photo smile/light |
| “Commercial” | Product-readable light, clean grade, controlled reflections, clear focal point | Artistic obscurity that hides product |
| “Cozy” | Warm practicals, soft shadows, close/medium framing, gentle movement | Orange overload |
| “Clinical” | Neutral white light, deep focus, straight-on angle, high clarity | Warm film grain |
| “Tech” | Cool neutral, edge highlights, crisp UI/product, precise motion | Random neon unless brand fits |
| “Vintage” | Film grain feel, softer contrast, period palette, halation if appropriate | Modern digital crispness unless mixed |
| “Futuristic” | Cool light, edge glow, clean geometry, precise motion | Random sci-fi clutter |
| “Minimal” | Negative space, few elements, locked/slow movement, restrained palette | Empty without hierarchy |
| “Epic” | Wide scale, low angle, slow push/orbit, atmospheric depth | Overused trailer braam without purpose |
| “Calm” | Slow movement, soft light, muted palette, stable frame | Fast cuts or high contrast |
| “Raw” | Available light, natural texture, handheld, minimal grade | Fake damage or excessive noise |
| “Glossy” | Controlled reflections, polished highlights, smooth motion | Plastic skin unless requested |
| “Organic” | Natural materials, imperfect texture, soft light, gentle easing | Overly mechanical motion |

---

## 6. Deliverable 6 — Technical Glossary (`TECH-04`)

This glossary is for the agent to translate from. Do not dump it into the user’s prompt. Use the shortest term that produces the visible result.

### 6.1 Shot size

| Term | Plain meaning | Use when |
|---|---|---|
| Extreme wide / establishing | Shows place and scale | Opening, location, context |
| Wide / full shot | Whole subject and environment | Body language, product in place |
| Medium | Waist-up or product with context | Dialogue, lifestyle, demo |
| Medium close-up | Chest-up or product detail with context | Talking head, hero product |
| Close-up | Face or important detail | Emotion, texture, label |
| Extreme close-up | Tiny detail | Eyes, hands, material, macro |
| Insert | Cutaway object/detail | Hands, label, button, prop |
| Over-the-shoulder | From behind one subject toward another | Dialogue, POV context |
| POV | What a character sees | Immersion, tutorial, UX |
| Two-shot | Two subjects in frame | Relationship, comparison |
| Cowboy / knee shot | Knees-up | Western, fashion, stance |
| Dutch angle | Tilted horizon | Unease, energy; use sparingly |

### 6.2 Angle and camera height

| Term | Plain meaning | Effect |
|---|---|---|
| Eye-level | Camera at subject eye height | Neutral, trustworthy |
| Low angle | Camera below subject looking up | Power, scale, heroism |
| High angle | Camera above subject looking down | Vulnerability, overview |
| Worm’s-eye | Very low, near ground | Extreme scale, drama |
| Bird’s-eye | High overhead | Pattern, layout, map-like |
| Top-down / overhead | Directly above at 90 degrees | Flat lay, process, food |
| Three-quarter | Subject turned slightly from camera | Depth, product form |
| Profile | Side view | Silhouette, shape, motion |
| Straight-on | Facing subject directly | Symmetry, UI, packshot |
| Shoulder-height | Documentary interview height | Natural presence |
| Waist/chest height | Interior/product walkthrough height | Human scale, less distortion |

### 6.3 Lens and focal-length feel

Assume full-frame equivalent unless the user specifies another sensor. Focal length is a look cue, not a guarantee.

| Focal feel | Plain meaning | Best for | Caution |
|---|---|---|---|
| 14-20mm ultra-wide | Very wide, exaggerated depth | Architecture, landscapes, dramatic interiors | Distorts faces/edges; avoid close portraits |
| 24mm wide | Wide but usable | Environmental portraits, real estate, action | Keep faces away from edges |
| 28mm wide | Natural wide | Street, documentary, lifestyle | Mild distortion if too close |
| 35mm environmental | Context plus subject | Documentary, storytelling, walk-and-talk | Not a beauty close-up lens |
| 50mm natural | Close to human perspective | General, product, medium portraits | Safe default when unsure |
| 85mm portrait | Flattering compression | Portraits, product hero, beauty | Needs space; can flatten context |
| 100mm macro | Close detail, tight framing | Jewelry, food, texture, product detail | Very shallow focus; specify focus plane |
| 135mm telephoto | Strong compression, isolated subject | Fashion, sports, portraits | Needs distance; background becomes abstract |
| 200mm+ super-tele | Extreme compression | Wildlife, sports, distant detail | Heat haze, flat perspective |
| Macro lens | Extreme close-up capability | Tiny detail, insects, product texture | Focus plane is critical |
| Tilt-shift | Corrects verticals or selective focus | Architecture, miniature effect | Use carefully; can look gimmicky |
| Anamorphic | Wider frame, oval bokeh, horizontal flares | Cinematic stylization | Flares/bokeh are style cues, not realism proof |
| Fisheye | Extreme curved distortion | Action, stylized POV | Rarely appropriate for product/brand |

### 6.4 Aperture, focus, and depth of field

| Term | Plain meaning | Use when |
|---|---|---|
| f/1.4-f/2.8 | Very shallow focus, blurred background | Portraits, night, isolation |
| f/4-f/5.6 | Moderate separation | Environmental portrait, product with context |
| f/8-f/11 | Deep focus, more sharpness | Interiors, landscapes, packshots |
| f/16+ | Very deep but diffraction risk | Rare; avoid unless needed |
| Shallow DOF | Only a slice is sharp | Emphasis, mood |
| Deep DOF | Most of scene sharp | Information, real estate, product clarity |
| Focus plane | The exact sharp slice | Macro, labels, eyes |
| Rack focus | Focus moves from one subject to another | Reveal, attention shift |
| Pull focus | Same as rack focus, often scripted | Dialogue, product reveal |
| Soft focus | Intentionally gentle sharpness | Dreamy, vintage; avoid for product labels |
| Focus breathing | Frame changes slightly while focusing | Usually unwanted; avoid unless realistic |
| Bokeh | Quality of out-of-focus areas | Portraits, lights, mood |

### 6.5 Exposure, shutter, ISO, and motion blur

| Term | Plain meaning | Use when |
|---|---|---|
| ISO 100-400 | Clean, low noise | Studio, daylight, commercial |
| ISO 800-1600 | Mild texture/noise | Low light, documentary |
| ISO 3200+ | Gritty/noisy | Night, raw look; use intentionally |
| Shutter speed | How long each frame exposes | Controls motion blur |
| 180-degree shutter | Natural motion blur, about double fps denominator | 24fps -> 1/48 or 1/50; cinematic default |
| High shutter | Crisp, staccato motion | Action, impact, saving-private-ryan feel |
| Low shutter | Smear/blur | Dreamy, drunk, night traffic; use sparingly |
| ND filter | Reduces light without changing color | Keep wide aperture in bright light |
| Exposure triangle | Aperture/shutter/ISO balance | Real-camera logic; AI uses it as look cue |
| Highlight rolloff | How bright areas transition | Filmic, soft commercial |
| Clipping | Lost white/black detail | Usually avoid unless stylized |
| Dynamic range | Detail in shadows/highlights | HDR, window interiors |

### 6.6 White balance and color temperature

| Kelvin feel | Plain meaning | Use when |
|---|---|---|
| 2700K | Warm tungsten/candle | Cozy, practical lamps |
| 3200K | Tungsten studio | Warm interior, stage |
| 4300K | Mixed neutral | Natural indoor/outdoor blend |
| 5600K | Daylight | Sun, studio daylight |
| 6500K | Overcast/cool daylight | Clean, neutral, tech |
| 7500K+ | Shade/blue cool | Moody, cold, winter |
| Tint | Green/magenta correction | Fluorescent/LED correction |
| Mixed lighting | Different color temperatures in one scene | Realism, depth; motivate it |

### 6.7 Lighting terms

| Term | Plain meaning | Use when |
|---|---|---|
| Key light | Main light | Defines form |
| Fill light | Softens shadows | Control contrast |
| Rim/back light | Separates subject from background | Hero, hair, product edge |
| Bounce | Light reflected from surface | Soft natural fill |
| Negative fill | Black flag absorbs light | Adds shape/mood |
| Soft light | Large diffuse source | Beauty, product, friendly |
| Hard light | Small direct source | Drama, texture, shadows |
| High-key | Bright, low contrast | Clean, commercial, friendly |
| Low-key | Dark, high contrast | Moody, dramatic |
| Rembrandt | Triangle of light on shadow cheek | Classic portrait |
| Loop | Small nose shadow loop | Natural portrait |
| Split | Half face lit, half shadow | Drama |
| Butterfly | Shadow under nose | Beauty/fashion |
| Broad lighting | Lit side of face toward camera | Opens face |
| Short lighting | Shadow side toward camera | Slims, moody |
| Motivated light | Light appears to come from a visible source | Realism |
| Practical | Visible lamp/screen/neon in scene | Depth, realism |
| Golden hour | Warm low sun | Landscape, romance |
| Blue hour | Cool ambient after sunset | Moody, urban |
| Overcast | Giant soft sky light | Even, soft, true color |
| Window light | Directional natural soft light | Interiors, portraits |
| Neon | Colored practical tubes | Urban, night, tech |
| Firelight | Warm flickering low source | Cozy, dramatic |
| Catchlight | Reflection in eyes | Life in portrait |
| Flag/cutter | Blocks light | Control spill/shadow |
| Gel | Colored filter on light | Stylized color |
| Diffusion | Softens light | Beauty, product |

### 6.8 Composition

| Term | Plain meaning | Use when |
|---|---|---|
| Rule of thirds | Subject on thirds intersections | Natural, editorial |
| Center composition | Subject centered | Symmetry, product, UI |
| Symmetry | Balanced left/right | Formal, premium, architecture |
| Leading lines | Lines guide eye | Depth, focus |
| Frame within frame | Door/window/arch frames subject | Depth, focus |
| Negative space | Empty area around subject | Premium, text room |
| Headroom | Space above head | Portraits, talking head |
| Lead room / nose room | Space in direction of gaze/motion | Natural framing |
| Foreground/midground/background | Depth layers | Cinematic depth |
| Foreground occlusion | Something partially blocks view | Depth, realism |
| Depth compression | Telephoto flattens layers | Fashion, sports |
| Wide distortion | Edges stretch | Use intentionally |
| Safe margins | Keep important content away from edges | Social, broadcast, UI |
| Visual hierarchy | What is seen first/second/third | Design, motion, ads |

### 6.9 Camera movement

| Term | Plain meaning | Use when |
|---|---|---|
| Locked / static | Camera does not move | Product, dialogue, stability |
| Pan | Camera rotates left/right horizontally | Reveal, follow |
| Tilt | Camera rotates up/down vertically | Reveal height |
| Dolly in/out | Camera physically moves toward/away | Intimacy, reveal |
| Truck left/right | Camera physically moves sideways | Parallax, tracking |
| Pedestal up/down | Camera moves vertically | Reveal, scale |
| Zoom | Lens focal length changes | Attention; different from dolly |
| Orbit / arc | Camera circles subject | Product hero, drama |
| Crane / jib | Sweeping vertical/horizontal move | Scale, opening |
| Handheld | Human-operated micro-drift | Documentary, urgency |
| Gimbal | Smooth stabilized move | Walkthrough, commercial |
| Steadicam | Smooth body-mounted move | Following, filmic |
| Slider | Short precise lateral move | Product, macro |
| Whip pan | Fast blur pan | Energy, transition |
| Rack focus move | Focus shifts while camera may move | Reveal |
| Dolly zoom | Dolly + zoom opposite | Vertigo, unease |
| FPV drone | Fast immersive aerial | Action, dynamic |
| Drone | Aerial elevated move | Landscape, real estate |
| Roll | Camera rotates around lens axis | Dutch, stylized |

### 6.10 Stabilization and movement quality

| Term | Plain meaning | Use when |
|---|---|---|
| Tripod | Perfectly stable | Interview, product |
| Fluid head | Smooth pan/tilt | Documentary, broadcast |
| Gimbal | Motorized stabilization | Walkthrough, commercial |
| Shoulder rig | Human-weighted stability | Documentary |
| Handheld | Organic micro-shake | Realism, urgency |
| Micro-drift | Very small handheld motion | Life without chaos |
| Floating | Unnaturally smooth/no weight | Usually avoid unless dreamlike |
| Weighted | Movement has mass | Realistic, premium |
| Snappy | Fast settle | Social, UI |
| Ease-out | Starts fast, slows to stop | Natural motion default |
| Ease-in | Starts slow, speeds up | Anticipation |
| Ease-in-out | Smooth start and stop | Most motion design |
| Linear | Constant speed | Mechanical, data |
| Spring | Physics bounce | Playful, UI |
| Overshoot | Goes past target then settles | Energy; use sparingly |

### 6.11 Frame rate, aspect, and delivery

| Term | Plain meaning | Use when |
|---|---|---|
| 24fps | Film/cinema cadence | Cinematic default |
| 25fps | PAL/broadcast cadence | Some regions/broadcast |
| 30fps | Social/web cadence | UGC, tutorials, reels |
| 48/50/60fps | Smooth motion or slow-mo source | Action, slow motion |
| 120fps+ | Slow motion source | Impact, beauty, food |
| Timelapse | Compressed time | Clouds, traffic, process |
| 16:9 | Widescreen | YouTube, hero, broadcast |
| 9:16 | Vertical | Reels, TikTok, Shorts |
| 1:1 | Square | Feed, marketplace |
| 4:5 | Vertical feed | Instagram feed, ads |
| 2.39:1 | Cinemascope | Film look; crop carefully |
| 4:3 | Classic/academy | Retro, interview |
| 21:9 | Ultrawide | Desktop, cinematic |
| Resolution | Pixel dimensions | Delivery requirement |
| Bitrate | Data per second | Quality/size tradeoff |
| Codec | Compression method | H.264, H.265, ProRes, DNx |
| Container | File wrapper | MP4, MOV, MXF |
| Alpha channel | Transparency | Logos, overlays, motion |
| Rec.709 | Standard HD color | Web/broadcast default |
| Rec.2020 / HDR | Wider/brighter color | HDR delivery; verify platform |
| Log | Flat capture for grading | Post workflow; not final look |
| LUT | Color transform | Grade starting point; not magic |

### 6.12 Audio

| Term | Plain meaning | Use when |
|---|---|---|
| Dialogue | Spoken words | Talking head, film |
| VO / voiceover | Narration over visuals | Ads, explainers |
| Room tone | Background room sound | Continuity, realism |
| Ambient | Environmental sound bed | Place, mood |
| Foley | Human/object sounds | Footsteps, cloth, props |
| SFX | Designed sound effect | Impact, UI, transition |
| Music bed | Background music | Mood, pacing |
| Sync | Sound matches picture | Hits, lips, actions |
| J-cut | Audio starts before picture | Smooth edit |
| L-cut | Audio continues after picture | Smooth edit |
| Ducking | Lower music under voice | VO clarity |
| LUFS | Loudness measurement | Platform delivery; verify target |
| Peak | Maximum level | Avoid clipping |
| Stereo | Left/right sound | Music, ambience |
| Mono | Single channel | VO, some social |
| Lip sync | Mouth matches speech | Dialogue; hard for AI video |

### 6.13 Motion design and AE

| Term | Plain meaning | Use when |
|---|---|---|
| Keyframe | Saved value at a time | Animation basics |
| Interpolation | How values move between keyframes | Easing |
| Ease | Acceleration/deceleration | Natural motion |
| Bezier | Custom easing curve | Precise motion |
| Graph editor | Curve editing | Polish timing |
| Parenting | Layer follows another | Hierarchical motion |
| Null object | Invisible controller | Group animation |
| Precompose | Group layers into comp | Organization, effects |
| Mask | Shape that hides/reveals | Reveals, wipes |
| Track matte | Uses another layer as mask | Type/shape reveals |
| Motion blur | Blur from movement | Realism; toggle intentionally |
| Parallax | Layers move at different speeds | Depth |
| 2.5D | Flat layers in 3D space | Photo animation |
| 3D camera | Virtual camera in comp | Depth moves |
| Expressions | Code-driven animation | Repeatable motion |
| Wiggle | Randomized movement | Handheld, organic |
| Loop | Repeating animation | Backgrounds, UI |
| Time remapping | Speed changes | Slow-mo, speed ramps |
| Rotoscope | Frame-by-frame masking | Cutouts, VFX |
| Tracking | Follows motion in footage | Attach graphics |
| Match move | Recreates camera motion | VFX integration |
| Safe areas | Broadcast/social margins | Readability |
| Render queue | Export jobs | Delivery |

### 6.14 Editing

| Term | Plain meaning | Use when |
|---|---|---|
| Cut | Instant shot change | Default edit |
| Match cut | Visual/audio similarity connects shots | Elegant transition |
| Jump cut | Time skip in same framing | Social, urgency |
| Crossfade | Dissolve between shots | Soft time passage |
| Dip to black | Fade through black | Scene break |
| Wipe | Shape moves across frame | Stylized transition |
| Speed ramp | Speed changes within shot | Action, emphasis |
| Montage | Compressed sequence | Time, training, energy |
| Continuity | Consistent space/time/action | Narrative clarity |
| 180-degree rule | Keep camera on one side of action | Spatial consistency |
| 30-degree rule | Change angle enough between cuts | Avoid jump cut |
| Eyeline match | Gaze direction connects shots | Dialogue |
| Shot/reverse shot | Alternating dialogue angles | Conversation |
| Cutaway | Insert detail | Context, pacing |
| B-roll | Supporting footage | Story, coverage |
| Pacing | Rhythm of cuts | Emotion, retention |
| Hook | First seconds grab attention | Social ads |
| CTA | Call to action | End card, conversion |

### 6.15 Compositing and color

| Term | Plain meaning | Use when |
|---|---|---|
| Keying | Remove green/blue screen | VFX |
| Roto | Manual mask over time | Cutouts |
| Mask | Hide/reveal region | Local edits |
| Track | Follow movement | Attach elements |
| Match grade | Make shots color-consistent | Multi-shot |
| Primary grade | Overall color/exposure | Base look |
| Secondary grade | Local color adjustments | Skin, sky, product |
| Power window | Local graded shape | Focus attention |
| LUT | Color lookup transform | Starting look |
| ACES | Color management system | High-end pipeline |
| OCIO | OpenColorIO | Consistent color across apps |
| Premultiplied alpha | Color already multiplied by alpha | Compositing default in many apps |
| Straight alpha | Color not premultiplied | Some exports/imports |
| Edge halo | Bright/dark fringe around cutout | Usually fix |
| Light wrap | Background light wraps subject | Integration |
| Grain match | Match noise/grain across elements | Realism |
| Motion blur match | Match blur across elements | Realism |

### 6.16 3D and render

| Term | Plain meaning | Use when |
|---|---|---|
| PBR | Physically based rendering | Realistic materials |
| Roughness | How matte/glossy a surface is | Material realism |
| Metallic | How metal-like a surface is | Metals |
| Normal map | Fake surface detail | Texture |
| Displacement | Real geometry detail | Close-up surfaces |
| SSS | Subsurface scattering | Skin, wax, food |
| HDRI | 360 lighting environment | Realistic reflections |
| Ray tracing | Light paths simulated | Reflections/shadows |
| Path tracing | Full light transport | High realism |
| Ambient occlusion | Contact shadow softness | Depth |
| Global illumination | Bounced light | Realism |
| Samples | Render quality/noise tradeoff | Final render |
| Denoise | Remove render noise | Clean final |
| DOF | 3D camera depth of field | Focus |
| Motion blur | 3D movement blur | Realism |
| Render pass | Separate AOV/layer | Compositing control |
| Alembic / USD | 3D scene interchange | Pipeline handoff |

### 6.17 Export and delivery

| Term | Plain meaning | Use when |
|---|---|---|
| ProRes 422 | High-quality edit codec | Master/edit |
| ProRes 4444 | High-quality + alpha | Motion overlays |
| DNxHR | Avid-friendly high-quality | Broadcast/edit |
| H.264 | Common web codec | MP4 delivery |
| H.265 / HEVC | Smaller high-efficiency | 4K/web; compatibility check |
| AV1 | Modern efficient codec | Web; compatibility check |
| PNG sequence | Lossless frames | VFX/motion handoff |
| TIFF | Lossless still | Print/archival |
| EXR | HDR linear frames | VFX/compositing |
| WAV | Uncompressed audio | Audio handoff |
| MP3/AAC | Compressed audio | Web delivery |
| Color space | Rec.709/sRGB/Display P3 etc. | Match platform |
| Alpha | Transparency | Overlays |
| Bit depth | 8/10/12-bit color precision | Grading/HDR |
| Chroma subsampling | 4:2:0/4:2:2/4:4:4 | Color detail |
| Burn-in | Visible timecode/watermark | Review only |
| Clean feed | No overlays | Final delivery |
| Stems | Separate audio/music/VO tracks | Localization/mix |
| M&E | Music and effects without dialogue | Localization |

---

## 7. Deliverable 7 — Camera Body and Capture-Family Look Cues

Use only when helpful. These are aesthetic shorthand, not verified metadata or guaranteed model behavior.

| Look cue | Common association | Use when | Caution |
|---|---|---|---|
| ARRI Alexa-like | Natural skin, gentle highlight rolloff, filmic color | Premium commercial, film look | Do not claim actual ARRI capture |
| RED-like | Crisp detail, high resolution feel, modern commercial | Tech, automotive, sharp product | Can feel clinical if overdone |
| Sony Venice-like | Natural color, wide dynamic range feel | Cinematic commercial, documentary | Look cue only |
| Canon C-series-like | Warm skin, approachable documentary | Interview, creator, corporate | Not a guarantee |
| Blackmagic-like | Filmic indie look, grade-friendly | Indie film, music video | Depends on grade |
| 35mm film | Grain, halation, organic color | Nostalgic, editorial, cinematic | Avoid fake dust unless requested |
| 16mm film | Heavier grain, raw texture | Documentary, music, indie | Can reduce clarity |
| Smartphone / iPhone-like | Computational HDR, wide lens, deep focus | UGC, social, authentic | Avoid cinematic lens language unless hybrid |
| DSLR/mirrorless | Shallow DOF, clean digital | Portrait, product, creator | Generic safe cue |
| Anamorphic | Oval bokeh, horizontal flares, wide frame | Stylized cinema | Flares can hide product |
| VHS / camcorder | Low resolution, tracking noise, timestamp | Retro, found footage | Use intentionally; not premium |
| CCTV / security | Fixed wide, low detail, timestamp | Surveillance, realism | Privacy/consent considerations |
| Drone | Elevated wide, smooth aerial | Landscape, real estate | Respect physical plausibility |
| GoPro / action cam | Ultra-wide, close, dynamic | Sports, POV | Distortion is part of look |

---

## 8. Deliverable 8 — Technical Coherence QA (`TECH-06`)

Run before finalizing any image/video/motion prompt.

### 8.1 Coherence checks

1. **Lens vs distance.** Wide lens close to a face distorts; telephoto needs space.
2. **Angle vs readability.** Extreme low/high can hide labels, screens, or product form.
3. **DOF vs required detail.** If label/text/eyes must be sharp, say the focus plane explicitly.
4. **Lighting vs shadows.** Key direction must match shadow direction and reflections.
5. **Movement vs locks.** Locked product/camera cannot also dolly/orbit unless the lock is changed.
6. **Frame rate vs shutter.** 24fps cinematic default implies natural 180-degree blur; high shutter is a different look.
7. **Aspect vs composition.** Vertical needs headroom/safe margins; ultrawide needs horizontal composition.
8. **Audio vs model.** Only request native audio if the target adapter confirms it; otherwise plan post.
9. **Motion vs easing.** Premium usually settles cleanly; playful may overshoot; mechanical may be linear.
10. **Export vs alpha/color.** Transparent motion needs ProRes 4444/PNG sequence; web delivery needs compatible codec.
11. **Reference vs default.** If a reference defines lighting/lens/angle, match it before applying a package.
12. **Flat work vs camera.** Do not add fake lens/aperture to vector/icon/UI unless it is a stylistic metaphor.

### 8.2 Common contradictions to flag

| Contradiction | Why it fails | Smallest fix |
|---|---|---|
| “Macro close-up” + “full body in frame” | Scale conflict | Choose one shot size |
| “Shallow DOF” + “entire label readable at angle” | Focus plane conflict | Stop down or align label to focus plane |
| “Locked tripod” + “slow orbit” | Camera lock conflict | Remove orbit or unlock camera |
| “UGC authentic” + “ARRI anamorphic cinema” | Capture-family conflict | Choose smartphone or cinema, or state hybrid |
| “Clean clinical” + “warm golden grain” | Grade conflict | Choose neutral or warm |
| “24fps cinematic” + “high-speed crisp action” | Shutter/fps conflict | Use 60/120fps or high-shutter 24 intentionally |
| “Vertical 9:16” + “wide horizontal ensemble” | Composition conflict | Reframe or stack elements |
| “Transparent background” + “JPEG” | Format conflict | Use PNG/WebP/ProRes 4444 as appropriate |
| “Native lip sync” + unsupported model | Capability conflict | Use supported model or post-sync |
| “Flat vector logo” + “85mm f/1.4 bokeh” | Medium conflict | Remove camera language; use graphic composition |

### 8.3 QA prompt

```
ROLE: You are the technical craft QA reviewer for AI Creative OS.

INPUTS: [TECHNICAL_DIRECTION] [PROMPT_OR_SPEC] [TARGET_TOOL] [LOCKED_REQUIREMENTS] [REFERENCES]

CHECK:
- Are all technical choices labelled by source?
- Is there one coherent look, not a keyword pile?
- Does lens/angle/DOF support the subject and required legibility?
- Does lighting direction match shadows/reflections?
- Does camera movement respect locked elements?
- Are frame rate/shutter/aspect/duration coherent?
- Are audio/export requests supported by the target tool or planned for post?
- Is flat/vector work free of meaningless camera metadata?
- Is there a plain-English explanation?

OUTPUT:
PASS / FIX / REGENERATE / REBUILD-COMPOSITE
For each issue: evidence, severity, smallest correction.
Do not rewrite the whole prompt unless the core look is contradictory.
```

---

## 9. Deliverable 9 — Worked Examples

### 9.1 User: “Make a product photo look expensive. I don’t know camera stuff.”

```
TECHNICAL DIRECTION — IMAGE
Status: [DEFAULT]
Camera / look cue: neutral full-frame digital, clean commercial
Lens / focal-length feel: 85mm product-hero feel
Shot size: product hero, three-quarter view
Angle / camera height: slightly below eye-level, label facing camera
Focus / depth of field: product and label sharp, background softly blurred
Lighting: large soft key upper left, cool rim right, negative fill camera right
Color / finish: restrained neutral palette, controlled contrast, true material color
Composition: centered product, negative space for optional copy
Aspect / delivery: 4:5 social feed
Why: A longer-lens feel and controlled soft light make the product read as premium without distorting its shape.
```

Copyable prompt:

```
Premium product hero photograph of [PRODUCT], three-quarter view, label facing camera and fully legible. 85mm product-hero look, slightly low eye-level angle, product and label sharp, background softly blurred. Large soft key from upper left, cool rim from right, negative fill camera right, controlled reflections. Neutral commercial grade, true material color, centered composition with negative space. 4:5.
```

### 9.2 User: “I need a cinematic video of a coffee pour.”

```
TECHNICAL DIRECTION — VIDEO
Status: [DEFAULT]
Camera / look cue: full-frame digital, warm filmic
Lens / focal-length feel: 100mm macro feel
Shot size: close-up insert
Angle / camera height: side three-quarter, slightly above cup
Focus / depth of field: focus on liquid stream and cup rim, shallow background
Lighting: soft back/side window light, warm bounce, steam visible
Camera movement: locked tripod, very slow push-in optional
Movement quality: smooth, weighted, restrained
Frame rate / shutter feel: 24fps with natural 180-degree motion blur; slow-motion intent if supported
Color / finish: warm appetizing grade, rich browns, clean highlights
Audio: pour sound and gentle room tone if supported; otherwise post foley
Aspect / duration / delivery: 9:16, 6s, social reel
Why: Macro side light shows texture and steam, while a locked slow push keeps the pour premium and readable.
```

### 9.3 User: “Make the logo feel professional in motion.”

```
TECHNICAL DIRECTION — MOTION / EDIT
Status: [DEFAULT]
Format / canvas: 1920x1080, 30fps, 3s
Timing / beats: 0.0-0.4s hold, 0.4-1.2s mask reveal, 1.2-1.6s settle, 1.6-3.0s hold
Easing / motion feel: ease-out cubic, no overshoot
Layer structure: background, logo mark, wordmark, optional accent line
Transition / edit logic: left-to-right mask reveal, clean settle
Camera / parallax: N/A, locked graphic frame
Color / type: brand palette locked, high contrast
Audio / sync: soft hit on settle if audio is requested
Export / delivery: ProRes 4444 with alpha; MP4 H.264 preview
Why: A clean mask reveal and controlled settle feel professional without distracting bounce.
```

---

## 10. Integration Rules

- `IMG-00` inherits `TECH-00` for photoreal/cinematic image prompts.
- `VID-00` inherits `TECH-00` for every shot; camera modules in Part 6 remain compatible.
- `SB-00`, `MD-00`, `ED-00`, `AEB-00`, and `AEX-00` inherit `TECH-03` for timing/easing/export.
- `QA-00`, `IGC-01`, `VCC-01`, and `VPD-01` should check technical coherence using `TECH-06`.
- Portable prompts must carry the short rule: auto-select technical craft, label defaults, explain briefly, never require jargon.
- Model adapters remain thin: technical direction is core reasoning; native controls are adapter settings.
