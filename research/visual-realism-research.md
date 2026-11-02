# Visual Realism Research Brief

- **Status:** research synthesis only; not yet converted into skill rules
- **Date:** 2026-11-02
- **Question:** What actually makes visuals look real rather than AI-generated?
- **Scope:** images, video, graphic design, motion design, and editing/AE workflows. This brief is about perceptual believability and production quality, not about proving whether a file is authentic.

---

## Bottom line

The strongest cross-domain answer is **coherence, not decoration**. A believable visual is not made real by adding grain, lens flare, pores, scratches, or “8k” detail. It is made believable when its cues agree: geometry, light, materials, camera capture, time, function, and context. Ferwerda’s framework separates physical realism, photorealism, and functional realism, which matters because a graphic design, an explainer, and a cinematic product shot should not be judged by the same standard. [1](https://cin.ufpe.br/~in1123/material/vor_hvei03_v20.pdf)

AI-generated visuals often fail not because every patch looks fake, but because locally plausible patches disagree with each other: a strap merges into a shirt, a reflection does not match the scene, a face changes across frames, or an object has no plausible function. Kamali et al.’s artifact taxonomy is useful here because it covers anatomical, stylistic, functional, physics, and sociocultural implausibilities rather than only fingers and teeth. [1](https://arxiv.org/abs/2406.08651)

But human vision is not a physics engine. Observers often miss large lighting inconsistencies, especially across separate objects, while being very sensitive to faces, eyes, shading, motion, and semantic violations once attention lands on them. [6](https://link.springer.com/article/10.3758/s13414-023-02718-0) [1](https://dl.acm.org/doi/10.1145/2620030) [1](https://link.springer.com/article/10.3758/s13428-016-0820-3) So the skill should not aim for “perfect physics everywhere” as an abstract ideal. It should aim for **task-relevant coherence under a chosen realism target**.

Finally, “looks real” is not “is real.” Human detection of synthetic faces has been near chance in controlled studies, and forensic detectors generalize poorly across generator families. [2](https://research.lancaster-university.uk/en/publications/ai-synthesized-faces-are-indistinguishable-from-real-faces-and-mo/) [2](https://utkarshojha.github.io/universal-fake-detection/) Authenticity requires provenance and context, not visual inspection alone. C2PA explicitly separates verifiable provenance claims from factual truth. [1](https://spec.c2pa.org/specifications/specifications/2.4/explainer/Explainer.html)

---

## 1. Define the realism target before optimizing it

Ferwerda distinguishes three standards:

| Standard | Criterion | Creative implication |
|---|---|---|
| Physical realism | Same visual stimulation as the scene | Useful for simulation, engineering, predictive rendering; often overkill for creative communication. |
| Photorealism | Same visual response as the scene, or indistinguishable from a photograph | Relevant for photography-style ads, product shots, live-action-adjacent video. |
| Functional realism | Same useful visual information as the scene | Relevant for graphic design, motion design, explainers, UI, diagrams, and stylized work. |

Source: Ferwerda, *Three Varieties of Realism in Computer Graphics*. [1](https://cin.ufpe.br/~in1123/material/vor_hvei03_v20.pdf)

**Implication for the skill:** ask or infer “what kind of real?” before applying checks. A believable stylized poster is not a failed photorealistic image. A clear instructional animation can be functionally realistic without looking like live action. A product hero shot, a candid smartphone photo, and a surreal brand image need different realism contracts.

---

## 2. What the evidence supports

| Finding | Evidence | Practical meaning | Limit |
|---|---|---|---|
| Realism has multiple standards. | Ferwerda separates physical, photo-, and functional realism. [1](https://cin.ufpe.br/~in1123/material/vor_hvei03_v20.pdf) | Do not force photorealism onto every creative task. | Does not provide a prompt recipe. |
| Scene grammar matters. | Semantic and syntactic inconsistencies produce longer dwell times in eye-tracking studies using SCEGRAM. [1](https://link.springer.com/article/10.3758/s13428-016-0820-3) | Objects should belong in the scene, sit on surfaces, attach plausibly, and behave according to function. | Attention effects are not a universal “fake detector.” |
| Humans tolerate some lighting inconsistency. | Observers struggle to locate oddly illuminated objects; local lighting estimates may not be globally verified. [6](https://link.springer.com/article/10.3758/s13414-023-02718-0) | A casual glance is a low bar; deliberate review should still check light logic. | Do not conclude lighting is unimportant. |
| Material appearance depends on illumination. | Gloss and reflectance perception depend on natural illumination structure; atypical lighting can make glossy surfaces look matte. [8](https://jov.arvojournals.org/article.aspx?articleid=2717773) | Materials are behaviors under light, not texture stickers. | Laboratory stimuli do not map perfectly to every production case. |
| Composites need statistical compatibility. | Luminance, color temperature, saturation, and local contrast are strongly correlated with composite realism; zone-based matching can improve it. [1](https://graphics.cs.yale.edu/sites/default/files/2012sig_compositing.pdf) | Harmonization matters, but it is not a substitute for correct geometry, shadows, reflections, or semantics. | The study explicitly leaves semantics and 3D reasoning outside its 2D adjustment scope. |
| Faces are judged holistically and locally. | Fan et al. find holistic and piecemeal processing; shading is more important than color for holistic realism, and eyes are the most influential face part. [1](https://dl.acm.org/doi/10.1145/2620030) | Face QA needs identity, gaze, shading, eyes, and part-to-whole consistency. | Does not mean every face needs exaggerated imperfection. |
| Perceptual mismatch is a supported uncanny trigger. | Kätsyri et al. find strongest support for perceptual mismatch, not a simple “more realistic is creepier” curve. [1](https://research.aalto.fi/en/publications/a-review-of-empirical-evidence-on-different-uncanny-valley-hypoth/) | Mixed realism levels are dangerous: photoreal skin with cartoon eyes, or realistic lighting on impossible anatomy. | The uncanny valley is not a universal law for all media. |
| “Average” can look more real than real. | Miller et al. report AI hyperrealism for White StyleGAN2 faces and identify attributes misinterpreted by observers. [2](https://research-repository.uwa.edu.au/en/publications/ai-hyperrealism-why-ai-faces-are-perceived-as-more-real-than-huma/) | Generic attractiveness, smoothness, and averageness can fool people; they are not authenticity signals. | Findings are model- and dataset-specific; do not generalize to all demographics or generators. |
| Camera cues are coupled. | Computational photography shows depth of field, aperture, focal length, exposure, gain/noise, motion blur, and synthetic bokeh interact. [1](https://ar5iv.labs.arxiv.org/html/2102.09000) | Capture effects must agree with a plausible camera pipeline. | Real cameras also process images computationally; “raw imperfection” is not the only photographic standard. |
| Motion needs temporal and biomechanical coherence. | Video evaluation surveys identify dynamic, physical, consistency, quality, and alignment failures; HumanScore finds gaps between pixel realism and biomechanical fidelity. [1](https://arxiv.org/html/2410.19884v2) [3](https://arxiv.org/html/2604.20157v1) | Video QA must check action, contact, weight, identity drift, object permanence, and frame-to-frame stability. | Benchmarks are dated and model-specific. |
| Animation craft supports motion plausibility. | Lasseter describes timing, anticipation, follow-through, overlapping action, arcs, and secondary action as principles for believable animation. [2](https://education.siggraph.org/static/HyperGraph/animation/character_animation/principles/prin_trad_anim.htm) | Motion design should specify cause, timing, and follow-through, not just “smooth animation.” | Craft principles are not a controlled proof of photorealism. |
| AI artifacts are broader than anatomy. | Kamali et al. categorize anatomical, stylistic, functional, physics, and sociocultural artifacts. [1](https://arxiv.org/abs/2406.08651) | Anti-slop checks must include function, context, text, culture, and production usability. | Artifacts are not always present, and real photos can look implausible. |
| Appearance cannot prove origin. | Nightingale & Farid report near-chance face classification; Ojha et al. show detector generalization failures across generator families. [2](https://research.lancaster-university.uk/en/publications/ai-synthesized-faces-are-indistinguishable-from-real-faces-and-mo/) [2](https://utkarshojha.github.io/universal-fake-detection/) | Do not optimize the skill for “undetectable.” Optimize for quality, intent, and disclosure/provenance where needed. | Detection studies age quickly as generators change. |

---

## 3. Findings in detail

### 3.1 Coherence before detail

The recurring failure in “AI slop” is not lack of detail. It is **incompatible detail**. A generated image may have crisp hair, glossy skin, and dramatic lighting, but the hair belongs to a different lighting environment, the skin has no subsurface variation, and the background perspective disagrees with the subject. Kamali et al. describe stylistic artifacts such as plastic texture, cinematization, hyper-real detail, and resolution/color inconsistencies alongside functional and physics errors. [1](https://arxiv.org/abs/2406.08651)

Scene-perception research supports the importance of semantic and syntactic consistency: objects that violate scene expectations or spatial support attract longer dwell times once fixated. [1](https://link.springer.com/article/10.3758/s13428-016-0820-3) This does not mean every unusual object is “fake”; surrealism and collage are valid. It means the visual should obey the rules of its own declared world.

**Skill implication:** prioritize relationships before surface polish: object-to-object, object-to-ground, object-to-light, object-to-camera, and object-to-time.

### 3.2 Light is a field, not a filter

Lighting is not just “cinematic,” “soft,” or “golden hour.” It is a spatial condition: direction, size, diffuseness, color, intensity, bounce, occlusion, and how it interacts with materials. Material perception research shows that gloss and reflectance judgments depend on illumination structure; unnatural illumination can remove the highlight structure that makes a surface read as glossy. [8](https://jov.arvojournals.org/article.aspx?articleid=2717773)

At the same time, human observers are surprisingly insensitive to some global lighting inconsistencies. [6](https://link.springer.com/article/10.3758/s13414-023-02718-0) That is a warning against two opposite mistakes:

1. Assuming any lighting mismatch will be noticed by everyone.
2. Assuming lighting does not matter because casual viewers miss it.

For professional creative work, the second mistake is worse. A visual may pass a feed scroll but fail close review, client scrutiny, or brand consistency.

**Skill implication:** specify a light setup and check its consequences: shadows, contact shadows, highlights, reflections, rim light, color cast, and falloff. Mixed lighting can be realistic if motivated by real sources; random mixed lighting is usually not.

### 3.3 Materials are behavior under light

A material is not a texture adjective. “Metal,” “skin,” “glass,” and “fabric” are reflectance behaviors shaped by geometry, roughness, illumination, and viewpoint. The composite-realism literature shows that foreground/background compatibility in luminance, color temperature, saturation, and local contrast strongly affects perceived realism. [1](https://graphics.cs.yale.edu/sites/default/files/2012sig_compositing.pdf) But the same work explicitly notes that semantics and 3D reasoning, such as inter-reflections, are outside the scope of simple 2D adjustment. [1](https://graphics.cs.yale.edu/sites/default/files/2012sig_compositing.pdf)

**Skill implication:** describe material + finish + condition + light response. For example: brushed aluminum under soft window light, worn cotton with tension folds, oily skin with localized specular highlights, frosted glass with blurred transmitted light. Avoid treating “add texture” as a universal realism fix.

### 3.4 Faces: holistic structure, eyes, shading, and mismatch

Fan et al. show that face realism is not judged only by local parts. Holistic processing matters, especially at lower resolution; shading is more important than color for holistic processing; eyes are the most influential face part; and face context is critical for evaluating parts. [1](https://dl.acm.org/doi/10.1145/2620030)

Kätsyri et al. review uncanny-valley hypotheses and find strongest support for perceptual mismatch: inconsistent levels of realism or atypical features within an otherwise human-like face. [1](https://research.aalto.fi/en/publications/a-review-of-empirical-evidence-on-different-uncanny-valley-hypoth/) Miller et al. add a caution: AI faces can be judged as more human than real faces, and observers may misread proportionality, familiarity, symmetry, attractiveness, and smoothness as “real.” [2](https://research-repository.uwa.edu.au/en/publications/ai-hyperrealism-why-ai-faces-are-perceived-as-more-real-than-huma/)

**Skill implication:** face quality needs identity lock, skull/proportion coherence, gaze and expression alignment, eyelid/eye moisture/shading, skin texture under the same light, and part-to-whole consistency. Do not use “perfect face,” “flawless skin,” or “beautiful” as default realism goals. Do not add random blemishes or asymmetry as a fake authenticity hack.

### 3.5 Camera capture is a shared constraint

Photographic realism is not a list of independent effects. Depth of field depends on aperture, focal length, sensor, and distance; exposure affects motion blur; gain affects noise; computational pipelines merge frames, denoise, tone-map, and synthesize bokeh using depth or segmentation. [1](https://ar5iv.labs.arxiv.org/html/2102.09000)

This means “shot on 35mm, f/1.4, ISO 6400, motion blur, crisp background, zero noise, cinematic bokeh” may be internally contradictory unless the scene and processing justify it. Smartphone images, studio product shots, documentary footage, and film scans have different capture signatures.

**Skill implication:** choose a capture profile and keep focus, blur, exposure, noise, color, and lens behavior consistent. Grain, vignetting, chromatic aberration, and lens flare are not realism by themselves. They are only believable when motivated by the capture system and scene.

### 3.6 Motion adds time, weight, and causality

Video cannot be evaluated as a stack of good stills. AI-video evaluation surveys identify failures in dynamics, physics, consistency, quality, and alignment. [1](https://arxiv.org/html/2410.19884v2) HumanScore specifically finds gaps between perceptual plausibility and biomechanical fidelity, including temporal jitter, implausible poses, and motion drift. [3](https://arxiv.org/html/2604.20157v1)

Animation craft gives a production language for this: timing and spacing convey weight; anticipation prepares action; follow-through and overlapping action prevent mechanical stops; arcs and secondary action make movement readable and alive. [2](https://education.siggraph.org/static/HyperGraph/animation/character_animation/principles/prin_trad_anim.htm)

**Skill implication:** for video and motion design, specify start state, end state, action order, contact points, acceleration/deceleration, secondary motion, object permanence, identity/wardrobe continuity, camera path, and what must not change. Review at intended playback speed and frame-by-frame. A thumbnail pass is not a motion pass.

### 3.7 Complexity increases both risk and detectability

Kamali et al.’s guide and related commentary emphasize that complex scenes create more opportunities for artifacts: groups, straps, buckles, buttons, reflections, text, and background objects. Simple portraits can be harder to judge because they provide fewer contextual clues. [1](https://arxiv.org/abs/2406.08651) [6](https://insight.kellogg.northwestern.edu/article/ai-photos-identification)

**Skill implication:** reduce unnecessary entities and interactions when the brief does not need them. Put precision effort where attention will land: faces, hands, product geometry, text, contact points, and reflections. Do not use blur, crop, or darkness to hide defects as a quality strategy; use them only when they serve the creative intent.

### 3.8 Authenticity is a separate problem

Nightingale and Farid found that StyleGAN2 faces were classified at near-chance accuracy and rated more trustworthy than real faces in their study. [2](https://research.lancaster-university.uk/en/publications/ai-synthesized-faces-are-indistinguishable-from-real-faces-and-mo/) Ojha et al. show that detectors trained on GAN images can fail on diffusion and autoregressive images, motivating more general feature-based approaches. [2](https://utkarshojha.github.io/universal-fake-detection/) C2PA’s explainer states that Content Credentials verify provenance claims and integrity, not whether the depicted content is true, accurate, or factual. [1](https://spec.c2pa.org/specifications/specifications/2.4/explainer/Explainer.html)

**Skill implication:** the skill should not promise “undetectable AI.” It should help make work coherent, intentional, production-usable, and honest about origin where disclosure or provenance matters.

---

## 4. What the research does **not** support

These are common prompt heuristics that should be treated as weak or conditional, not universal rules:

- **“Add 8k, masterpiece, photorealistic.”** These are style/quality tokens, not a scene model. They do not specify geometry, light, material, camera, or time.
- **“Perfect hands, no extra fingers.”** Symptom suppression is weaker than specifying pose, grip, occlusion, and camera angle. Kamali et al. show hand artifacts are only one part of a broader failure space. [1](https://arxiv.org/abs/2406.08651)
- **“Add grain and imperfections.”** Capture artifacts can be plausible when coupled to a camera pipeline, but random imperfection does not fix broken structure. [1](https://ar5iv.labs.arxiv.org/html/2102.09000)
- **“More detail everywhere.”** Hyper-real detail can itself be a stylistic artifact, and detail without coherence increases contradiction. [1](https://arxiv.org/abs/2406.08651)
- **“Make it asymmetrical so it looks real.”** Atypicality and mismatch can increase eeriness; authenticity is not achieved by random flaws. [1](https://research.aalto.fi/en/publications/a-review-of-empirical-evidence-on-different-uncanny-valley-hypoth/)
- **“Use an AI detector as the quality metric.”** Detection generalization is unreliable across generator families, and detection is not the same as creative quality. [2](https://utkarshojha.github.io/universal-fake-detection/)
- **“One prompt template works across all models.”** The research supports portable reasoning about coherence, not a claim that every generator responds identically to the same wording.

---

## 5. Provisional priority stack for the future skill

This is a research-to-design proposal, not a final skill contract.

1. **Define the target.** What kind of realism is required: photographic, cinematic, candid smartphone, studio product, stylized believable, functional/informational, or intentionally surreal?
2. **Lock non-negotiables.** Identity, product geometry, brand assets, text, UI, logo, aspect ratio, duration, and client constraints.
3. **Establish scene grammar.** What objects exist, what they do, where they sit, what they attach to, and what is occluded.
4. **Set the light field.** Sources, direction, size/diffuseness, color, intensity, bounce, shadows, reflections, and material response.
5. **Set the capture profile.** Lens/sensor behavior, focus plane, depth of field, exposure, motion blur, noise, color pipeline, and processing style.
6. **Add temporal rules for video/motion.** Start/end states, action order, contact, weight, acceleration, secondary motion, continuity, and forbidden drift.
7. **Add motivated detail.** Texture, wear, microvariation, and imperfection only where they follow from material, use, light, and capture.
8. **Verify at intended use.** Feed size, print size, close inspection, playback speed, frame stepping, and client review context.

The order is dynamic. Exact product text may outrank lighting. A surreal poster may intentionally break physics but must keep its own internal rules. A motion graphic may need functional clarity more than photographic texture.

---

## 6. How to test this before writing the skill

The research gives a strong direction, but it does not prove that a particular prompt format improves output across models. Before claiming skill effectiveness, run controlled comparisons:

- **Brief set:** product hero, person holding phone, UI on screen, interior scene, food, fashion, group scene, surreal brand image, motion logo reveal, character action, edit/grade continuity.
- **Conditions:** baseline prompt vs structured coherence prompt; concise vs long; reference-guided vs text-only; camera-profile vs no camera-profile; negative constraints vs positive constraints.
- **Controls:** same generator/version/settings where possible, multiple samples, fixed evaluation rubric, blind or randomized review.
- **Metrics:** intent fidelity, critical defect rate, coherence, production usability, revision count, time to usable asset, and preservation of intended style.
- **Separate judgments:** “looks photographic,” “looks believable,” “works for the task,” and “is authentic” should not be collapsed into one score.
- **Portability test:** the same reasoning should produce usable outputs when adapted to different assistants and generators, even if wording and syntax differ.

---

## 7. Source register

| Source | Type | Use in this brief |
|---|---|---|
| Ferwerda, *Three Varieties of Realism in Computer Graphics* [1](https://cin.ufpe.br/~in1123/material/vor_hvei03_v20.pdf) | Graphics/perception framework | Separates physical, photo-, and functional realism. |
| Öhlschläger & Võ, *SCEGRAM* [1](https://link.springer.com/article/10.3758/s13428-016-0820-3) | Eye-tracking/database paper | Semantic/syntactic inconsistencies affect dwell time. |
| *Estimating lighting direction in scenes with multiple objects* [6](https://link.springer.com/article/10.3758/s13414-023-02718-0) | Perception study | Human insensitivity to some lighting inconsistencies. |
| *Naturally glossy: Gloss perception, illumination statistics, and tone mapping* [8](https://jov.arvojournals.org/article.aspx?articleid=2717773) | Perception study | Material/gloss perception depends on illumination structure. |
| Xue et al., *Understanding and Improving the Realism of Image Composites* [1](https://graphics.cs.yale.edu/sites/default/files/2012sig_compositing.pdf) | Graphics/perception study | Composite realism and statistical harmonization. |
| Fan et al., *Human Perception of Visual Realism for Photo and Computer-Generated Face Images* [1](https://dl.acm.org/doi/10.1145/2620030) | Perception study | Holistic/piecemeal face realism, eyes, shading, context. |
| Kätsyri et al., uncanny valley review [1](https://research.aalto.fi/en/publications/a-review-of-empirical-evidence-on-different-uncanny-valley-hypoth/) | Review | Perceptual mismatch as supported uncanny trigger. |
| Miller et al., *AI Hyperrealism* [2](https://research-repository.uwa.edu.au/en/publications/ai-hyperrealism-why-ai-faces-are-perceived-as-more-real-than-huma/) | Human-perception study | AI faces can be judged more real; observer misinterpretation. |
| *Mobile Computational Photography: A Tour* [1](https://ar5iv.labs.arxiv.org/html/2102.09000) | Technical survey | Camera pipeline, DoF, noise, exposure, synthetic bokeh. |
| Lasseter, *Principles of Traditional Animation Applied to 3D Computer Animation* [2](https://education.siggraph.org/static/HyperGraph/animation/character_animation/principles/prin_trad_anim.htm) | Craft/technical paper | Timing, anticipation, follow-through, arcs, secondary action. |
| *A Survey of AI-Generated Video Evaluation* [1](https://arxiv.org/html/2410.19884v2) | Survey/preprint | Video failure modes and evaluation dimensions. |
| *HumanScore: Benchmarking Human Motions in Generated Videos* [3](https://arxiv.org/html/2604.20157v1) | Benchmark/preprint | Gap between pixel realism and biomechanical motion fidelity. |
| Kamali et al., *How to Distinguish AI-Generated Images from Authentic Photographs* [1](https://arxiv.org/abs/2406.08651) | Artifact guide | Five artifact categories and limits of visual detection. |
| Nightingale & Farid, *AI-synthesized faces are indistinguishable from real faces and more trustworthy* [2](https://research.lancaster-university.uk/en/publications/ai-synthesized-faces-are-indistinguishable-from-real-faces-and-mo/) | Peer-reviewed study record | Near-chance human face detection in controlled conditions. |
| Ojha et al., *Towards Universal Fake Image Detectors that Generalize Across Generative Models* [2](https://utkarshojha.github.io/universal-fake-detection/) | CVPR paper page | Detector generalization limits across generator families. |
| C2PA Explainer [1](https://spec.c2pa.org/specifications/specifications/2.4/explainer/Explainer.html) | Technical specification explainer | Provenance/integrity is not factual truth. |
