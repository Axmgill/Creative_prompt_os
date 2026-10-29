# AI Creative Operating System — Part 1: Research & Model Routing

**Research date:** October 5, 2026 (Asia/Karachi)
**Version:** 1.0
**Prepared for:** 2D Motion Designer / Animator / Short-Form Video Editor / Visual Storyteller / AI-assisted creative (After Effects, Premiere Pro, Photoshop, Illustrator, Blender)

---

## 0. Research Coverage & Limitations

- This report is based on live web research (official docs, vendor blogs, release notes, and independent/practitioner reviews) conducted on the research date above. Browsing **was** available and used.
- **The AI landscape moves weekly.** Several products in this report shipped new versions *during* the research window (e.g., Claude Sonnet 5.5 on Sept 28, 2026; Kling 4.0 beta on Sept 28, 2026). Treat specific version numbers as a snapshot, not a permanent fact — see Deliverable 5 for a verification checklist.
- **Source quality varies a lot.** Official sources (OpenAI, Anthropic, Google DeepMind, Adobe, Runway, Luma, Black Forest Labs, Ideogram, ElevenLabs help/blog pages) are trusted as **Verified**. Many SEO/affiliate "review" sites produce confident but inconsistent numbers (exact durations, resolutions, prices). Where independent sources conflicted, this is flagged explicitly rather than averaged or guessed.
- **Confidence labels used throughout:**
  - **[Verified]** — confirmed on an official vendor page/doc/help-center during this research.
  - **[Vendor claim]** — stated by the maker but not independently cross-checked (marketing copy, benchmarks run by the vendor).
  - **[Practitioner observation]** — third-party reviewer/user testing, labeled as opinion/experience, not spec.
  - **[Inference]** — my own reasoning from verified facts, not a direct claim by any source.
  - **[Unverified / conflicting]** — multiple non-official sources disagree, or only low-quality SEO sources could be found.
- No prices, specs, or availability claims below were invented; where I could not verify them, they are explicitly marked unverified and you should confirm on the vendor's pricing page before buying.

---

## 1. Claude Design — Verification (as requested)

**What it actually is [Verified]:** Claude Design is a real Anthropic product, not a rumor or a repackaging of general Claude chat. It launched April 17, 2026 from Anthropic Labs as a standalone research-preview workspace at `claude.ai/design`, powered by Claude Opus 4.7's vision/coding capabilities. On September 16, 2026, Anthropic folded it into the main Claude app as a **"Design" Artifact type** (alongside Document and Presentation artifacts), accessible from regular chat, Claude Cowork, and Claude Code — the standalone `/design` experience still works but Anthropic's stated focus has shifted to the integrated version. [[Neowin]](https://www.neowin.net/news/anthropic-is-turning-claude-into-a-full-blown-design-tool-with-this-latest-update/) [[VentureBeat]](https://venturebeat.com/technology/anthropic-just-launched-claude-design-an-ai-tool-that-turns-prompts-into-prototypes-and-challenges-figma) [[DataCamp]](https://www.datacamp.com/blog/claude-design) [[Magic Patterns]](https://www.magicpatterns.com/blog/claude-design-now-lives-inside-claude)

**How it's accessed [Verified]:** Web only, at `claude.ai/design` or inside a Claude chat/Artifact. Included (usage-metered, not extra cost) on **Pro, Max, Team subscriptions**; off by default for **Enterprise** until an admin enables it. **No Free-tier access.**

**What it can create/edit [Verified — per Anthropic's own description]:** It is a **prompt-to-prototype and document-generation engine**, not a pixel-based image generator. It produces: interactive UI prototypes/mockups, presentation decks, one-pagers, marketing collateral, and simple web pages — built from HTML/code under the hood, refined via chat, inline comments, direct text edits, and auto-generated sliders for spacing/color/layout. It can ingest a brand's existing codebase/design files to auto-apply colors, type, and components ("brand learning").

**Inputs/outputs [Verified]:** Inputs are text prompts, uploaded brand assets/design systems, and a "web capture" tool that pulls live-site elements as reference. Outputs are interactive canvas artifacts, exportable to **PDF, PPTX, or standalone HTML**, with a direct **Canva handoff** (becomes an editable Canva file) and a **Claude Code handoff** (packages a "handoff bundle" for implementation).

**Export/editability limitations [Verified, per DataCamp's direct reporting on the product docs]:** No audit logs or admin usage reporting during the research-preview period; web-only; weekly usage allowances that may change; uploaded assets are stored persistently; does not currently support data-residency requirements for regulated enterprises.

**Relevance to motion design and styleframes — [Inference, clearly flagged]:** **Low-to-moderate, and indirect.** Claude Design is built for *UI prototypes, slide decks, and brand documents* — not for painterly/illustrative styleframe art, not for raster or vector image generation in the way Midjourney/Nano Banana/Ideogram/Recraft are, and it has no timeline, keyframe, or animation output. Do **not** substitute it for an image model when the deliverable is a styleframe, concept-art board, or shot composition. Its genuinely useful roles in your pipeline are narrower:
  - Turning a brief/outline into a **client-facing pitch deck or one-pager** fast.
  - Building a **shareable mood/brand-reference document** when a client supplies a style guide or site to mirror.
  - Light **storyboard *document* assembly** (arranging already-generated frames/notes into a presentable deck) — not generating the frames themselves.

**Practical fallback [Inference]:** For styleframes, concept boards, and shot composition, use a dedicated image model (Midjourney, Nano Banana Pro, Ideogram, Recraft, FLUX, Firefly — see Deliverable 1) and use Claude (regular chat, any current model) or ChatGPT for the *reasoning/prompt-crafting/critique* layer. Use Claude Design specifically when the output needed is a *document or interactive mockup*, e.g., presenting a treatment to a client.

---

## 2. Deliverable 1 — Practical Tool Landscape

Only production-relevant facts are included. Where vendors ship many sub-variants, only the variant(s) relevant to a solo/small-studio creative are listed.

### Reasoning, Research, Coding

| Tool / Exact Model | Category | Access Method | Relevant Verified Capabilities | Important Limitations | Best Use in Your Work | Evidence |
|---|---|---|---|---|---|---|
| **ChatGPT — GPT‑5.5 Instant (default) / GPT‑5.4 Thinking / GPT‑5.3‑Codex** | LLM — reasoning, research, coding assistant | ChatGPT web/mobile/desktop app; API | [Verified] Auto-switching reasoning model; web search with upfront planning; long-context handling; dedicated coding model (Codex) for scripting/automation tasks. | Version numbers iterate roughly monthly — anything you read about a specific "GPT‑5.x" behavior should be re-checked each project cycle. | Research, brief analysis, scriptwriting, AE/ExtendScript code generation, client-feedback synthesis. | [OpenAI release notes](https://help.openai.com/en/articles/9624314-model-release-notes), [TechCrunch](https://techcrunch.com/2026/05/05/openai-releases-gpt-5-5-instant-a-new-default-model-for-chatgpt/) |
| **Claude — Sonnet 5.5 / Opus 5.5 (current); Fable 5.1 / Mythos 5.1 (higher tier, limited access)** | LLM — reasoning, writing, coding, agentic work | claude.ai (Free/Pro/Max/Team/Enterprise); API; Claude Code (CLI/agent) | [Verified] Strong long-document analysis (up to 1M-token context on some tiers), vision input, Claude Code for scripting/automation, Claude Cowork for multi-step office work. Mythos-tier models are invite-only/trusted-access, not broadly available. | Mythos/Fable tier access is restricted — don't plan workflows around a model you can't reliably get into. Rapid renaming (Sonnet/Opus/Fable/Mythos as separate numbered lines) makes "the latest Claude" ambiguous — always name the exact model. | Creative strategy, structured critique, long script/brief analysis, AE expression/ExtendScript generation, QA checklists. | [Anthropic/Wikipedia timeline](https://en.wikipedia.org/wiki/Claude_(AI)), [Lorka model list](https://www.lorka.ai/ai-models/anthropic) |
| **Claude Design** (Artifact inside Claude / claude.ai/design) | Prompt-to-prototype / document design tool | Pro, Max, Team (included); Enterprise (admin-enabled) | [Verified] See Section 1 above. | Not an image generator; no animation/timeline output; preview-stage governance gaps. | Client decks, brand-reference documents, quick UI/one-pager mockups — **not** styleframes. | See Section 1 citations |
| **Gemini — Gemini 3 Pro / Gemini 3.1 Pro / Gemini 3.x Flash family** | LLM — reasoning, multimodal (text/image/video/audio input), coding | Gemini app, AI Studio, Vertex AI, Search "AI Mode" | [Verified] Native multimodal input (can reason over video/audio directly, useful for client-video or reference-video analysis); 1M-token context; Deep Think mode for complex reasoning; integrated with Nano Banana image models. | Flash vs. Pro vs. Deep Think tiers have very different capability/cost — picking the wrong one wastes either quality or money. | Video/image analysis (feeding in actual reference footage or client cuts), research, long-document review, Blender/Python scripting help. | [Google blog](https://blog.google/products-and-platforms/products/gemini/gemini-3/), [Gemini API changelog](https://ai.google.dev/gemini-api/docs/changelog) |

### Image Generation & Design

| Tool / Exact Model | Category | Access Method | Relevant Verified Capabilities | Important Limitations | Best Use in Your Work | Evidence |
|---|---|---|---|---|---|---|
| **OpenAI GPT Image (gpt-image-1.5 / gpt-image-2 / 2.5 "sunburst"/"flare")** | Image generation & editing model | OpenAI API (`images.edit`/`generate`); ChatGPT (as `chatgpt-image-latest`) | [Verified] Edits accept **up to 16 reference images** per call; transparent background support; up to 32,000-char prompts; strong instruction-following for composited/edited scenes. | Not a dedicated character-consistency tool (no named "reference ID" system like Midjourney/Nano Banana); vector/editable output not supported (raster only). | Fast iterative compositing, product/prop mockups from multiple references, quick concept variations inside a ChatGPT workflow you already use for scripting. | [OpenAI dev docs](https://developers.openai.com/api/docs/guides/image-generation), [OpenAI API reference](https://developers.openai.com/api/reference/resources/images/methods/edit) |
| **Google Gemini 3 Pro Image ("Nano Banana Pro") / Gemini 3.1 Flash Image ("Nano Banana 2")** | Image generation & editing model | Gemini app, AI Studio, Vertex AI, API; also bundled inside Freepik/Higgsfield | [Verified, DeepMind model page] Reasoning/plan-then-render pipeline; **subject consistency for up to 5 characters + 14 objects in one workflow**; aspect-ratio reflow that keeps a locked character in place; 4K upscaling; strong text rendering; SynthID watermarking. | [Verified] DeepMind's own page states it "may not always get [character consistency] right" and can struggle with small faces/fine text — do not treat consistency as guaranteed. | **Primary tool for character/product-consistent styleframe sets** and multi-angle product shots; strong second opinion to Midjourney for brand work needing accurate on-image text. | [DeepMind model page](https://deepmind.google/models/gemini-image/pro/), [AI Studio model card](https://aistudio.google.com/models/gemini-3-pro-image) |
| **Midjourney — V7 (current default model)** | Image generation (stylized/photoreal) | Web app (Discord no longer required) or Discord; subscription tiers | [Verified, official Midjourney update] V7 replaced the old `--cref` Character Reference with **Omni Reference (`--oref`/`--ow`)** — locks a character/object/creature/logo from one reference image into new scenes; separate Style Reference (`--sref`) for mood/lighting; Draft Mode (10x faster). [Practitioner observation] Reviewers report noticeable character drift re-emerging by the 3rd–5th scene in a series even with Omni Reference at high weight — do not assume perfect consistency across a long sequence. | No native vector/text-editable output; text-in-image rendering remains comparatively weak; one Omni Reference image per prompt (can't blend two references in one call). | Best raw aesthetic/photoreal quality for **styleframes, mood boards, concept art**; use Omni Reference + Style Reference together to hold a recurring character/brand look across a shot list. | [Midjourney update post](https://updates.midjourney.com/v7-is-now-the-default-model/), [Danex.ai reference guide](https://danex.ai/midjourney-character-reference) |
| **FLUX.2 (Black Forest Labs) — Pro / Flex / Dev / Klein** | Image generation & editing model family (closed + open-weight) | BFL Playground/API; open-weight Dev/Klein self-hostable; via Cloudflare Workers AI and other partners | [Verified, BFL blog] Multi-reference conditioning across **up to 10 images** for character/product/style consistency; editing at up to 4MP; JSON/structured prompting and hex-code color control; Dev tier is open-weight (self-hostable, Apache-licensed Klein variant). | Requires more technical setup to self-host (Dev/Klein); Pro tier is API/commercial, not a polished consumer app like Midjourney. | Brand/product work needing **exact color control** (hex codes) and multi-reference consistency; good option when you need an open-weight fallback independent of any single vendor. | [BFL blog](https://bfl.ai/blog/flux-2), [Cloudflare blog](https://blog.cloudflare.com/flux-2-workers-ai/) |
| **Ideogram 3.0** | Image generation, text-in-image specialist | ideogram.ai web app, API | [Vendor claim, cross-confirmed by multiple practitioner reviews] Best-in-class legible text/typography rendering in-image; Character Consistency feature added August 2025 (single reference image). | Chinese/CJK text rendering notably weaker than Latin text (vendor's own model page implies Latin-script focus); character consistency is newer/less mature than Midjourney's or Google's. | Title cards, lower-third mockups, on-screen graphic concepts, poster/thumbnail design where accurate text matters more than painterly style. | [Ideogram model page](https://ideogram.ai/models/3.0/) |
| **Recraft V3** | Image generation with native **vector (SVG) output** | recraft.ai web app, API | [Verified by multiple independent reviews + vendor] Produces genuine editable SVG (real paths/anchor points, not a raster traced into a wrapper); brand color/style-lock system; AI vectorizer (raster→SVG); infinite canvas; Agentic conversational editing mode. | Not a video/animation tool (confirmed — animate separately); artistic range skews toward clean/flat/graphic styles, less suited to painterly photoreal work; complex vectorizations can need manual cleanup in Illustrator. | **The one tool on this list that outputs natively editable vector assets** — ideal for logos, icon sets, lower-thirds, flat-design motion graphics elements you'll animate in AE/Illustrator. | [Recraft V3 guide](https://magichour.ai/blog/recraft-v3-ai-image-video-tool-guide), [ToolJunction review](https://www.tooljunction.io/ai-tools/recraft) |
| **Adobe Firefly — Image Model 4 / 4 Ultra** | Image generation, commercially-safe | Firefly web app; embedded in Photoshop (Generative Fill), Illustrator, Express | [Verified, Adobe blog] Trained exclusively on licensed Adobe Stock/public-domain content for commercial-safety; integrates third-party models (Google Imagen, OpenAI, FLUX) inside the same commercially-safe wrapper with source transparency. | Raw aesthetic quality trails Midjourney/Nano Banana Pro on pure photorealism per independent comparisons [Practitioner observation]; best value is the *integration*, not raw model quality. | **Lowest-legal-risk option** for client/commercial deliverables, and the most frictionless when you're already inside Photoshop/Illustrator for touch-ups and generative fill. | [Adobe Firefly video-model launch blog](https://blog.adobe.com/en/publish/2025/02/12/meet-firefly-video-model-ai-powered-creation-with-unparalleled-creative-control) |

### Video Generation

| Tool / Exact Model | Category | Access Method | Relevant Verified Capabilities | Important Limitations | Best Use in Your Work | Evidence |
|---|---|---|---|---|---|---|
| **Google Veo 3.1** | Video generation model | Gemini app, Google Flow, Vertex AI, API; YouTube Shorts integration; also via aggregators (Freepik, Higgsfield) | [Verified, DeepMind's own Veo page still headlines Veo 3.1 as the current flagship] Native synchronized audio (dialogue + SFX + ambience) generated with the video, not bolted on; "Ingredients to Video" reference-image system for character/product consistency; Scene Extension to chain beyond the base clip; native 9:16 vertical. [Unverified/conflicting specifics] Secondary sources disagree on exact numbers (base clip 8s is the consistent figure; claimed max extended length ranges from 60s to 140+s depending on source — verify in-product before quoting a client). | Highest-priced tier for 4K; reference-image count (3 vs 4) and exact extension ceiling are inconsistently reported — confirm current limits in Google Flow before planning a shot list around them. | Shots that **need spoken dialogue baked in**, or narrative b-roll where native audio saves a separate sound pass. | [DeepMind Veo page](https://deepmind.google/models/veo/), multiple secondary comparisons (flagged unverified above) |
| **Runway — Gen-4 / Gen-4.5** | Video generation + a creative suite (not just a model) | Runway web/iOS app; API | [Verified, Runway's own help docs + API changelog] Gen-4: image-required, 5s/10s durations, 720p base (4K upscale option), `@`-reference system for up to 3 reference images, strong temporal consistency within a clip. Gen‑4.5 (API-confirmed Feb 10, 2026): adds text-to-video (no image needed) and runs 2–10s per generation via the documented API. [Practitioner observation, not Runway's own spec] Some reviewers describe a 60-second "character-consistent" ceiling for Gen-4.5 — this appears to describe stitched/Extended output, not a single generation; don't promise a client a single 60s native clip. | No native audio generation on Runway's own model (confirmed absent from official Gen-4/4.5 docs) — always plan a separate audio pass or use Runway's **Act-Two** companion for performance-driven lip-sync. | Shot-level control via **Motion Brush, camera controls, and the reference system** when you need to art-direct a specific composition rather than accept whatever the model proposes; good "sits beside your edit" workflow since it's built as an editing-adjacent suite. | [Runway help center](https://help.runwayml.com/hc/en-us/articles/37327109429011-Creating-with-Gen-4-Video), [Runway API changelog](https://docs.dev.runwayml.com/api-details/api_changelog/) |
| **Kling (Kuaishou) — 3.0 (current GA); 4.0 announced in beta** | Video generation model | Kling web app/API; heavily resold through aggregators (Higgsfield, Freepik) | [Practitioner-consistent across many sources, not an official Kling spec page] Multi-shot "AI Director" sequencing up to 6 connected shots in one generation; up to 15s clips; native multilingual lip-sync audio; one of the lower per-second prices among frontier video models. [Unverified] Exact resolution/frame-rate ceiling (native 4K/60fps) is repeated across many SEO sources but could not be confirmed on an official Kuaishou spec page — treat as a strong claim pending first-party confirmation. | Kling 4.0 Flash entered closed beta Sept 28, 2026 for top-tier annual subscribers only, with full 4.0 "due in October 2026" — i.e., right around now; **check the app for which version you're actually on** before relying on any spec in this table. | Best current option for **in-generation multi-shot sequences** (e.g., hook + product + reaction in one continuous take) and budget-conscious high-volume short-form work. | [usefastlane.ai spec summary](https://www.usefastlane.ai/models/kling-3-0) (secondary; verify in-app) |
| **Seedance (ByteDance) — 2.0 (GA-ish) / 2.5 (announced, rolling out)** | Video generation model | Primarily Volcano Engine API / Jimeng app (China-first); also via Runway API and aggregators (Freepik, Higgsfield) for international access | [Practitioner-consistent across sources] Genuinely multimodal reference input (text + up to ~9 images + ~3 videos + ~3 audio clips in one request); native audio-video joint generation; motion/camera-style transfer from a reference video. Seedance 2.5 (announced June 23, 2026) claims a native 30-second single-pass clip and local "re-draw" region editing. | **Access-method caveat [Inference]:** Seedance is ByteDance's model and is not natively sold as a simple international consumer subscription the way Runway/Kling are — plan to access it through Runway's API or an aggregator (Freepik/Higgsfield) rather than expecting a dedicated international Seedance website/app. | Best reference-richness of any video model here — useful when you have a storyboard image **and** a motion-reference clip **and** a temp audio cue and want them combined in one generation. | [Runway API changelog confirms Seedance availability via Runway](https://docs.dev.runwayml.com/api-details/api_changelog/), [digitalapplied.com summary](https://www.digitalapplied.com/blog/seedance-2-5-bytedance-ai-video-model-2026) (secondary) |
| **Luma AI — Ray3 (Ray3.14 / Ray3.2 updates)** | Video generation + video-to-video editing model | Dream Machine (lumalabs.ai), API, aggregators | [Verified, Luma's own launch materials] First model to generate **native HDR** (10/12/16-bit, ACES2065‑1 EXR export) for real color-grading pipelines; "reasoning" self-critique step before finalizing a generation; Draft Mode for fast cheap iteration before "mastering" to full quality; single-image Character Reference; Modify Video for wardrobe/environment/relighting swaps on existing footage; frame-level directional control added in Ray3.2. | Resolution is native 1080p (not native 4K — 4K is an upscale); HDR/EXR pipeline is a genuine differentiator but only matters if your downstream grading/comp pipeline (After Effects/DaVinci) is set up to use it. | **Best fit for a motion-design/VFX pipeline specifically** because of the EXR/HDR export and Modify Video (wardrobe/relight/environment swap) working on footage you already shot or generated, rather than only generating from scratch. | [Luma Ray3 product page](https://lumalabs.ai/ray3), [Luma launch post](https://lumalabs.ai/news/ray3) |
| **Adobe Firefly Video Model** | Video generation, commercially-safe | Firefly web app; Premiere Pro (Generative Extend) | [Verified, Adobe's own Feb 2025 launch blog] Text-to-video and image-to-video; start/end keyframe control; camera angle/shot/motion controls; **Generative Extend** in Premiere Pro adds matching frames to the head/tail of a real clip to fix timing — this is Adobe's most production-relevant feature and is confirmed directly on Adobe's blog. [Unverified] Many 2026 claims of "4K," "unlimited generations," and an "agentic assistant" come only from SEO aggregator sites, not Adobe's own current docs — verify on Adobe's Firefly/Premiere help pages before planning around them. | 1080p was the confirmed resolution at the official Feb 2025 launch; later resolution increases are plausible given Adobe's cadence but were not independently confirmed here. | **Generative Extend specifically** is a genuinely useful, verified edit-rescue tool inside Premiere — use it to fix a clip that's a beat too short rather than reshooting or re-generating from scratch. | [Adobe Firefly video model launch](https://blog.adobe.com/en/publish/2025/02/12/meet-firefly-video-model-ai-powered-creation-with-unparalleled-creative-control) |
| **OpenAI video (Sora / Sora 2)** | — | **Discontinued** | [Verified, OpenAI's own Help Center] The Sora web and app experiences were **discontinued April 26, 2026**. The Sora API was **discontinued September 24, 2026** — i.e., already shut down as of today's research date. OpenAI has **no currently available video-generation product**, and no successor has been announced. | N/A | **Do not route any task to Sora.** If you see tutorials or old project files referencing Sora, treat them as historical. Re-check this status periodically since OpenAI could re-enter video generation. | [OpenAI Help Center — Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation), [Wikipedia](https://en.wikipedia.org/wiki/Sora_(text-to-video_model)) |

### Production Tools & Platforms

| Tool | Category | Access Method | Relevant Verified Capabilities | Important Limitations | Best Use in Your Work | Evidence |
|---|---|---|---|---|---|---|
| **Higgsfield** | Multi-model **aggregator** + proprietary camera/character tools | Web app, mobile app ("Diffuse"), MCP/CLI, DaVinci/Photoshop plugins; credit-based subscription | [Practitioner-consistent across many reviews] Not a foundation-model maker — it's a layer over 15–50+ third-party video/image models (Veo, Kling, Seedance, etc. — note Sora listings in older reviews are now stale per the Sora shutdown above) plus its own **Soul ID** (character-consistency lock), **Cinema Studio** (70+ camera-movement presets), **Lipsync Studio**, and a Marketing/UGC Studio that turns a product URL into a draft ad. | Credit system widely reported as confusing/expensive on premium models; character consistency across multiple shots still inconsistent per reviewers even with Soul ID; any specific model list should be re-checked since it resells other vendors' models. | **Model comparison and camera-direction layer** — useful early in a project to test the same shot across Veo/Kling/Seedance without separate subscriptions, and for its camera-preset library when you want directable motion without learning each native tool's camera syntax. | [aiforesight360 review](https://aiforesight360.com/higgsfield-ai-review-2026/), [imperialaitools guide](https://imperialaitools.com/higgsfield-ai-guide/) |
| **Freepik (AI suite)** | Multi-model **aggregator** + stock library + editing suite | Web app, subscription + credits | [Practitioner-consistent] Aggregates 30–40+ image models and 30+ video models (Kling, Veo, Runway, Seedance, Hailuo, PixVerse, Wan) under one credit pool, bundled with a large stock-asset library, **Pikaso** (real-time sketch-to-image), and a non-destructive editing suite (upscale, background removal, relight, expand/uncrop). [Unverified / conflicting] One source claims an April 2026 rebrand to "Magnific" — this was **not** corroborated by Freepik-branded reviews published as late as September 2026, so treat the rebrand claim as unconfirmed and check freepik.com directly. | Consistency across a multi-shot series is reported as weaker than going native with one model's own reference system; no first-party foundation model of its own beyond "Mystic." | Fast **sketch-to-image ideation** (Pikaso) for layout/composition exploration, and convenient access to stock + multiple video models without separate accounts when budget favors one bundled subscription. | [aiunpacking review](https://aiunpacking.com/review/freepik-ai/), [aisotools review](https://aisotools.com/blog/freepik-review-2026) |
| **Fable (Fable Studio — "Showrunner")** | AI-generated **animated episodic series** platform | Web + iOS app (originally Discord-based) | [Verified via multiple independent news sources] Multi-agent system that writes, voices, animates, and edits 2–16 minute animated episodes from a short text prompt; maintains persistent worlds/characters/casts across episodes; animation-only (no live-action). | **This is a narrow, consumer/prosumer storytelling product, not a general motion-design tool** — you don't get frame-level control comparable to AE/Blender, and output style is locked to its built-in show aesthetics. Confirm this is the "Fable" you meant; there's no evidence of a different, more AE-adjacent product by this name. | Only relevant if you're prototyping an **episodic narrative concept** quickly for pitch purposes; not a fit for client motion-graphics or short-form editing deliverables. | [cdomagazine.tech](https://www.cdomagazine.tech/aiml/meet-showrunner-the-first-streaming-platform-for-ai-generated-shows), [aiagentstore.ai](https://aiagentstore.ai/ai-agent/showrunner) |
| **ElevenLabs** | Voice/audio generation suite | Web app, API; credit-based tiers | [Verified across consistent sources] Eleven v3 TTS (70+ languages, emotion tags), Instant + Professional Voice Cloning, Voice Design (text-to-voice), Voice Changer, Dubbing Studio, Scribe v2 speech-to-text, Eleven Music (text-to-music with vocals), Sound Effects generation, Voice Isolator, Studio (timeline editor), conversational Agents. | Pricing/credit costs vary by tier and are **reported inconsistently** across sources — verify current numbers at elevenlabs.io/pricing before budgeting. Dubbing/music tools rated weaker than the core TTS/cloning engine by reviewers. | VO, temp dialogue, SFX, and music beds for short-form edits; dubbing for multi-language versions of a finished cut. | [supergok guide](https://supergok.com/elevenlabs/), [unite.ai review](https://www.unite.ai/elevenlabs-review/) |
| **Topaz Labs (Photo AI / Video AI / Gigapixel / Astra / Bloom)** | Upscaling & restoration suite | Desktop apps (Photo AI, Video AI, Gigapixel) + cloud credits (Astra for video, Bloom for images); Premiere/Lightroom/Photoshop/DaVinci plugins | [Verified across consistent sources] Specialized AI models for denoise, sharpen, face recovery, upscale (to 4K/8K, with 16K claimed for Video AI by one source), frame interpolation for slow-motion, stabilization, SDR→HDR. **Astra** is specifically marketed for cleaning up/upscaling AI-generated video (e.g., raw Kling/Runway/Seedance output). | [Unverified/conflicting] Pricing model is disputed between sources — one claims a move to subscription-only in late 2025, another states one-time pricing ($199 Photo AI / $299 Video AI) still applies. **Verify current pricing directly on topazlabs.com before budgeting.** | **Final-mile delivery tool**: upscale AI-generated or legacy footage to broadcast resolution, clean up AI-video artifacts before compositing in After Effects, interpolate frames for smooth slow-motion from standard-frame-rate source. | [computertech.co review](https://computertech.co/topaz-labs-review/), [aivario.com review](https://aivario.com/tools/topaz-labs) |

---

## 3. Deliverable 2 — Task Routing Matrix

Legend: **H** = human must review/decide; AI output is a draft or option set, not a final deliverable.

| Task | Primary Option | Fallback | Why | Required Inputs | Limitation / Human Check |
|---|---|---|---|---|---|
| Research | ChatGPT (GPT‑5.5/5.4 Thinking) | Gemini 3 Pro | Both have strong live web search; pick whichever you're already paying for. | Clear question/brief | **H:** verify any factual/pricing claim before quoting a client. |
| Brief analysis | Claude (Sonnet/Opus 5.5) | ChatGPT Thinking | Claude's long-context reasoning is well-suited to parsing dense briefs/contracts. | Full brief text/PDF | **H:** confirm it hasn't missed an edge-case requirement. |
| Creative strategy | Claude (Opus-tier) | ChatGPT Thinking | Strong at structured, multi-angle strategic reasoning when prompted for options, not a single answer. | Brief + audience/goals | **H:** strategy is your judgment call, not the model's — use it to widen options, not choose for you. |
| Concept development | Claude or ChatGPT (text) + Midjourney/Nano Banana (visual) | Gemini 3 Pro (text) | Concept work benefits from text ideation *and* quick visual sketches together. | Brief, mood references | **H:** curate; models over-generate generic ideas. |
| Creative direction | Human-led, AI as sounding board (Claude/ChatGPT) | — | This is inherently a human judgment task; AI can stress-test a direction, not originate your taste. | Your direction draft | **H:** final call is always yours — do not force an AI "winner." |
| Art direction | Midjourney / Nano Banana Pro (visual options) + Claude/ChatGPT (rationale) | Ideogram (if text-heavy) | Visual exploration needs an image model; written rationale benefits from an LLM. | Mood references, palette | **H:** style consistency across a board needs manual curation. |
| Design exploration | Midjourney, Recraft (vector), Nano Banana Pro | FLUX.2 | Different tools for different output needs — vector vs. raster vs. consistency-first. | References, format needs (vector/raster) | **H:** check usable resolution/format before committing. |
| Design critique | Claude or ChatGPT (upload image) | Gemini 3 Pro | All current flagship LLMs can analyze an uploaded image and critique composition/hierarchy. | Image file | **H:** AI critique is generic design theory — weigh against brief/brand fit yourself. |
| Reference analysis | Gemini 3 Pro (native video/image/audio input) | Claude (image input) | Gemini's native multimodal input is strongest for directly analyzing reference video/audio, not just stills. | Reference file(s) | **H:** verify extracted "style" notes against your own eye. |
| Scriptwriting | Claude or ChatGPT | — | Comparable quality; pick by voice/tone preference. | Brief, tone, length | **H:** read aloud / time it — AI scripts often run long or flat in rhythm. |
| Long-document analysis | Claude (large context window) | Gemini 3 Pro (1M-token context) | Both support very long context; Claude is generally preferred for nuanced extraction. | Full document | **H:** spot-check extracted facts/quotes against the source. |
| Storyboard planning | Claude/ChatGPT (shot list + beats) + Midjourney/Nano Banana (panel images) | Claude Design (for the *deck/document* only) | Planning (text) and panel generation (image) are different tasks routed to different tools; Claude Design only formats the presentation. | Script/beats, references | **H:** check shot continuity and coverage — no tool tracks your edit logic for you. |
| Styleframe creation | Midjourney (Omni Reference) or Nano Banana Pro | Ideogram (text-heavy), FLUX.2 (multi-ref/color-exact) | These are the strongest dedicated image models for aesthetic quality + reference control (your top two priorities). | Character/brand/style references | **H:** character drift across a set is common — see Deliverable 4. |
| Image analysis | Gemini 3 Pro or Claude (vision) | ChatGPT (vision) | All three handle image-in analysis well; pick whichever you're already using for text tasks. | Image file | **H:** verify factual claims about real-world content (e.g., logo/brand accuracy). |
| Video analysis | Gemini 3 Pro (native video input) | Claude (frame-by-frame stills if no native video) | Gemini currently has the most mature native video-understanding input among these tools. | Video file | **H:** confirm timestamp/shot references are accurate — don't trust them blindly on long videos. |
| Image prompting | You + any image model's own prompt guide | ChatGPT/Claude to help structure the prompt | Prompt *crafting* is a text task; the image model executes it. | Desired result description | **H:** iterate — first result rarely matches intent exactly. |
| Video prompting | You + the video model's own prompt/camera syntax | ChatGPT/Claude to help structure the prompt | Same logic as image prompting; each video model has its own camera-control vocabulary (see Deliverable 1). | Shot description, references | **H:** prompting cannot guarantee a deterministic camera move — see Deliverable 4. |
| Character-consistent assets | Nano Banana Pro (up to 5 characters/14 objects) or Midjourney Omni Reference | Ideogram Character Consistency, FLUX.2 multi-reference | These have the most explicit, named consistency controls among image tools. | Clean reference image(s) of the character | **H:** drift increases with scene count — test on 3–5 scenes before committing to a full set. |
| Product-consistent assets | FLUX.2 (multi-reference, hex-color-exact) or Nano Banana Pro | Recraft (if a vector/brand-system asset) | Product/brand work needs exact color and logo fidelity, not just "looks similar." | Product photos/specs, brand colors | **H:** logo/label text and proportions need manual QA — see Deliverable 4. |
| Animation planning | Claude/ChatGPT (beat sheet, timing notes) | — | Planning motion/timing in writing is a reasoning task, not a generation task. | Shot list, reference footage/style | **H:** actual animation execution stays in AE/Blender — AI plans, doesn't animate your rig. |
| Short-form edit planning | Claude/ChatGPT (structure, pacing, hook) | Gemini 3 Pro (if analyzing existing footage first) | Planning cut structure/pacing/hooks is text reasoning, informed by platform best practices. | Raw footage list or script, platform/format | **H:** actually cutting the timeline is a Premiere task — see "editing" distinction below. |
| AE expressions | Claude or ChatGPT (code generation) | — | Both generate working ExtendScript/expressions well; Claude Code/Codex if you want agentic file-level changes. | Describe the rig/behavior needed | **H:** test in AE — expressions commonly need small syntax fixes per AE version. |
| AE scripts (ExtendScript/UXP) | ChatGPT (GPT‑5.3/5.4-Codex) or Claude Code | Gemini 3 Pro | Dedicated coding-oriented models/modes handle multi-file scripting more reliably. | Describe the automation goal, AE version | **H:** run in a test project first — scripts can mutate project files destructively. |
| Extension development | Claude Code or ChatGPT Codex | Gemini 3 (coding mode) | Agentic coding tools (Claude Code, Codex) are built for multi-step, multi-file dev work. | Spec/goal, target platform (CEP/UXP) | **H:** code review before shipping to a client machine or production project. |
| Client feedback analysis | Claude or ChatGPT | — | Synthesizing scattered feedback (email/call notes) into actionable items is a text-reasoning task. | Raw feedback (text/email/notes) | **H:** confirm priority/interpretation with the client before acting on AI's summary. |
| Asset management | Human-led; LLM to help write naming conventions/structure | — | No tool here is an asset-management system; LLMs can help design your folder/naming logic. | Describe your current structure/pain points | **H:** this is operational discipline, not something AI executes for you. |
| Continuity review | Claude/Gemini 3 Pro (compare frames/clips you upload) | Human eye (always) | Useful as a second pass to catch obvious continuity breaks across AI-generated shots. | Shot sequence (images/video) | **H:** AI continuity checks are not reliable enough to replace a human pass — treat as a first-pass flag only. |
| Final QA | Human-led, always | AI as a checklist generator (Claude/ChatGPT) | Final sign-off on a client deliverable should never be delegated to a model. | Deliverable + checklist | **H:** mandatory — no AI substitute for final QA. |

---

## 4. Deliverable 3 — Minimum Practical Stack

**Access assumption [stated explicitly, per your instructions]:** Your budget and current subscriptions are unspecified. The recommendation below assumes a **solo or small-studio freelancer who wants to avoid redundant subscriptions** and will add tools only when a project specifically needs them. If you already hold a subscription not listed as "Core," keep it and treat the equivalent Core recommendation as optional instead.

### Core (recommended starting point)

| Need | Tool | What it contributes | Overlap note |
|---|---|---|---|
| Reasoning & research | **ChatGPT Plus or Claude Pro** (pick one, not both to start) | Research, briefs, scripts, critique, basic coding help | These two overlap heavily on general reasoning — the deciding factor is which coding/agent tool you prefer (Codex vs. Claude Code) and whether you want Claude Design bundled in (Claude Pro). |
| Design support | **Claude Pro** (if chosen above) — Claude Design is included | Client decks, brand-reference docs, quick mockups | Do not buy a separate design tool for this purpose; it's bundled. |
| Image generation (styleframes, concept art) | **Midjourney** (Standard plan) | Best aesthetic quality + Omni Reference for character consistency | Overlaps with Nano Banana Pro on consistency; Midjourney currently has the stronger raw aesthetic/illustrative range for styleframe work. |
| Image generation (consistency/editing/brand text) | **Google AI (Gemini Advanced / Nano Banana Pro via AI Studio pay-as-you-go)** | Multi-character/object consistency, accurate on-image text, product shots | Use as the consistency-and-text specialist alongside Midjourney's aesthetic strength — not a redundant purchase if you use each for its strength. |
| Video generation | **One pay-as-you-go aggregator (Freepik or Higgsfield) to start**, not a native subscription | Lets you test Veo/Kling/Seedance/Runway on real shots before committing to one native subscription | Graduate to a native subscription (likely Runway or Kling) once you know which model's control system fits your workflow — avoid paying for 3+ native video subscriptions simultaneously. |
| Traditional production software | **Adobe Creative Cloud (apps you listed: AE, Premiere, Photoshop, Illustrator)** | Your actual animation/edit/comp pipeline; Firefly credits are bundled for in-app Generative Fill/Extend | Already assumed owned — reduces need for a separate "general" image tool for simple in-context edits. |
| 3D | **Blender** | Free/open-source — no subscription decision needed | N/A |

### Optional (clear value, not essential day one)

- **ElevenLabs (Starter tier)** — once a project needs real VO, dialogue, dubbing, or SFX beyond stock libraries.
- **FLUX.2 / Ideogram / Recraft accounts** — add when a specific project needs exact hex-color brand matching (FLUX.2), heavy on-image typography (Ideogram), or native editable vector output (Recraft). Don't subscribe to all three pre-emptively.
- **A second reasoning LLM** (whichever of ChatGPT/Claude/Gemini you didn't pick as Core) — useful for cross-checking research claims or when one model's style doesn't fit a particular brief.

### Project-dependent (only when a specific job calls for it)

- **Topaz Labs (Photo AI / Video AI / Astra)** — only when a deliverable needs upscaling, AI-video cleanup, or frame-interpolated slow motion. Verify current pricing before buying (see Deliverable 1 flag).
- **Fable/Showrunner** — only if a client specifically wants an episodic animated-series concept generated end-to-end; not a general-purpose tool for your usual deliverables.
- **A native video-model subscription** (Runway, Kling, Luma) — once the aggregator testing phase identifies a clear winner for your recurring shot types.

---

## 5. Deliverable 4 — Control & Limitations

No current tool guarantees deterministic output. The table below gives a default response per limitation; the right choice often depends on budget/deadline, not just "best practice."

| Limitation | What it looks like in practice | Improve references | Adjust prompt | Split the shot | Composite manually | Use traditional animation | Change tools |
|---|---|---|---|---|---|---|---|
| **Character drift** | A recurring character's face/outfit shifts across a multi-scene sequence. | ✅ First line of defense — use one clean, high-res reference image | ✅ Lock weight/strength parameters (e.g., Midjourney `--ow`, Ideogram Character Reference) | ✅ Generate fewer scenes per reference "session" | — | — | ✅ If drift persists past 3–5 scenes, try Nano Banana Pro's named multi-character consistency instead |
| **Product/logo deformation** | Brand logos warp, text on packaging garbles, proportions shift. | ✅ Supply a clean flat logo/product file as reference | ✅ Explicitly state "logo must remain unmodified" | ✅ Generate product-only passes separately from environment | ✅ Often the only reliable fix — composite the real logo/product plate in post | — | ✅ Try FLUX.2 (hex-exact color) or Recraft (vector) for brand-critical assets |
| **Text errors** (in-image or on-screen) | Garbled, misspelled, or malformed rendered text. | — | ✅ Use literal phrasing + explicit character counts (per Ideogram's own guidance) | — | ✅ Add real text in Photoshop/AE rather than relying on generation | ✅ For title cards/lower-thirds, hand-set type is often faster and guaranteed-correct | ✅ Ideogram specifically for text-heavy generations |
| **Camera inconsistency** | Camera move doesn't match the described direction, or jumps unnaturally between generated shots. | — | ✅ Use the specific model's documented camera vocabulary (Runway's explicit camera controls, Kling's AI Director) | ✅ Generate one camera move per clip rather than compound moves | ✅ Stabilize/re-frame in post (Premiere/AE) | ✅ Animate camera moves manually in AE/Blender when precision matters | ✅ Runway or Luma for more literal camera-direction control |
| **Temporal inconsistency** (flicker, morphing within a clip) | Textures/features shift frame-to-frame within one generated clip. | — | ✅ Shorter clip lengths reduce visible drift | ✅ Generate shorter segments and cut together | ✅ Frame-interpolate/stabilize with Topaz Video AI afterward | — | ✅ Try a model with stronger stated temporal-consistency claims (Runway Gen-4, Luma Ray3) |
| **Unreliable physical interactions** (object contact, grasping, collisions) | Hands/objects clip through each other, physics looks wrong. | ✅ Reference footage of the real interaction if available | ✅ Simplify the described action; avoid compound physical interactions in one prompt | ✅ Isolate the interaction into its own short generation | ✅ Composite a practical/real element for the contact moment | ✅ Hand-animate contact-heavy beats rather than relying on generation | — |
| **Limited editability** (can't adjust one element after generation) | Need to change one color/element without regenerating the whole image/clip | — | — | — | ✅ Generate elements separately so they can be layered/recombined in AE/Photoshop | — | ✅ Recraft (vector) or layered-generation workflows (Nano Banana's multi-image fusion) when editability matters more than one-shot speed |
| **Unsupported automation/exports** (no API, no batch, proprietary format lock-in) | A platform has no API or only exports to its own ecosystem | — | — | — | — | — | ✅ Prefer tools with documented APIs (OpenAI, Google, BFL, Runway, ElevenLabs) for anything you need to automate or pipeline |

**Important framing [Inference, stated plainly per your instructions]:** None of the "adjust the prompt" cells above should be read as a guarantee. Prompting shifts probability, not certainty — the same prompt can produce different drift/error behavior on different runs of the same model. Budget iteration time and a manual-compositing fallback into every AI-generated shot, especially for client-facing or brand-critical work.

---

## 6. Deliverable 5 — Model-Independent vs. Model-Specific Guidance

### Stable across the library (safe to reuse in Parts 2–8 without re-verifying each time)

- The **task-to-tool-category mapping** in Deliverable 2 (e.g., "character-consistent assets → an image model with a named reference/consistency system") — the *category* of solution is durable even if the specific winning model changes.
- The **control/limitation response framework** in Deliverable 4 (improve references → adjust prompt → split the shot → composite → traditional animation → change tools) — this escalation logic is a sound creative-production principle independent of which model is current.
- The **priority ordering** you set (Quality > Creative judgment > Control > Consistency > Speed > Reusability) as a decision filter for any new tool that appears later.
- The principle that **planning a task ≠ performing it** (e.g., AI can plan an edit; Premiere performs it) — this distinction should persist through every later part of the library.
- The distinction between **Verified / Vendor claim / Practitioner observation / Inference / Unverified** as a labeling discipline for all future research in this library.

### MODEL-SPECIFIC — VERIFY PERIODICALLY

- Every exact model name and version number in Deliverable 1 (e.g., "GPT‑5.5 Instant," "Claude Sonnet 5.5," "Midjourney V7," "Kling 3.0," "Veo 3.1," "Gemini 3.x Flash"). These will be outdated within weeks given the release cadence observed during this research.
- Any **specific numeric spec** (max duration, resolution, number of reference images, context window size) — several of these were found to conflict even across sources published in the same month.
- **Access method and pricing** for every tool — tiers, inclusion-vs-add-on status, and even whether a product still exists (Sora is the clearest example: fully discontinued mid-2026 after being a major player in 2025).
- Which platform currently has **the best character-consistency or video-quality claim** — this leadership position moved multiple times across 2025–2026 among Midjourney, Google, Runway, Kling, and Seedance.
- Claude Design's product status specifically — it already changed shape once (standalone → merged Artifact) within five months of launch.

### Update Checklist (run this before starting a new project, and definitely before Parts 2–8 rely on these facts)

1. **New major release announced?** (watch OpenAI, Anthropic, Google DeepMind, Black Forest Labs, Runway, Kuaishou/Kling, ByteDance/Seedance, Luma, Adobe blogs/release-notes pages directly — not aggregator sites.)
2. **Has a tool's access method changed?** (free→paid, standalone→merged feature, discontinued, region-restricted.)
3. **Have you hit a repeated production failure** (character drift, logo deformation, text errors) on a tool this guide currently recommends as Primary? If a failure repeats across 3+ attempts, demote it to Fallback and re-test the alternative.
4. **Did a price change** make the "Core" stack recommendation in Deliverable 3 no longer the most cost-effective option?
5. **Re-run a quick verification search** on anything labeled [Unverified / conflicting] in this document before quoting a client a specific capability (e.g., exact Veo extension length, Topaz pricing model, Freepik/Magnific branding).

---

## 7. Deliverable 6 — Handoff for Part 2

```
USER PROFILE:
2D Motion Designer / Animator / Short-Form Video Editor / Visual Storyteller / AI-assisted creative.
Production tools: After Effects, Premiere Pro, Photoshop, Illustrator, Blender.
Needs AI support across: research, strategy, creative direction, art direction, design,
scripts, storyboards, styleframes, asset generation, animation planning, editing, sound,
coding, and quality control.

PRIORITIES (in order):
1. Quality  2. Creative judgment  3. Control  4. Consistency  5. Speed  6. Reusability

VERIFIED TOOLS AND EXACT NAMES (as of research date):
- Reasoning/coding: ChatGPT (GPT-5.5 Instant / GPT-5.4 Thinking / GPT-5.3-Codex),
  Claude (Sonnet 5.5 / Opus 5.5; Fable 5.1 / Mythos 5.1 = limited access),
  Gemini (Gemini 3 Pro / 3.1 Pro / 3.x Flash family).
- Claude Design: real Anthropic product (Artifact inside Claude app, or claude.ai/design),
  prompt-to-prototype/document tool, NOT an image generator — limited relevance to styleframes.
- Image: OpenAI GPT Image (gpt-image-1.5/2/2.5), Google Nano Banana Pro/2 (Gemini 3 Pro/3.1
  Flash Image), Midjourney V7 (Omni Reference), FLUX.2 (Pro/Flex/Dev/Klein), Ideogram 3.0,
  Recraft V3 (native vector/SVG), Adobe Firefly Image Model 4/4 Ultra.
- Video: Google Veo 3.1, Runway Gen-4/Gen-4.5, Kling 3.0 (4.0 entering beta now), Seedance
  2.0/2.5 (ByteDance), Luma Ray3 (Ray3.14/Ray3.2), Adobe Firefly Video Model.
  OpenAI Sora/Sora 2: CONFIRMED FULLY DISCONTINUED (app April 26 2026, API Sept 24 2026) —
  do not route tasks to Sora.
- Platforms: Higgsfield (model aggregator + camera/character tools), Freepik (model
  aggregator + stock + Pikaso), Fable/Showrunner (narrow: AI animated episodic series tool,
  not a general motion-design tool), ElevenLabs (voice/audio suite), Topaz Labs
  (upscaling/restoration suite — pricing model disputed between sources, verify directly).

RECOMMENDED STARTING STACK:
Core: one reasoning LLM subscription (ChatGPT Plus or Claude Pro — Claude Pro also bundles
Claude Design), Midjourney (styleframes/aesthetic), Google AI/Nano Banana Pro
(consistency/text/product), one video aggregator to start (Freepik or Higgsfield) before
committing to a native video subscription, Adobe Creative Cloud (already assumed owned),
Blender (free).
Optional: ElevenLabs, FLUX.2/Ideogram/Recraft (add per-project), a second reasoning LLM.
Project-dependent: Topaz Labs, Fable/Showrunner, a native video-model subscription once a
winner is identified.

TASK-ROUTING DECISIONS: See full Deliverable 2 matrix (29 tasks) in this document —
key pattern: text/reasoning tasks → ChatGPT/Claude/Gemini interchangeably; styleframes/
character-consistent assets → Midjourney + Nano Banana Pro; vector/brand assets → Recraft;
text-heavy graphics → Ideogram; AE/code tasks → ChatGPT Codex or Claude Code; final QA and
creative direction are always human-led, never AI-delegated.

IMPORTANT CAPABILITY LIMITS:
No tool guarantees deterministic results. Character drift, logo/product deformation, text
errors, camera inconsistency, temporal flicker, and unreliable physical interactions are
all current, expected failure modes — not edge cases. Default escalation path: improve
references → adjust prompt → split the shot → composite manually → use traditional
animation → change tools. Budget manual-compositing time into every AI-generated shot used
for client or brand-critical work.

ACCESS ASSUMPTIONS:
Budget/subscriptions unspecified by user — Part 1 assumed a cost-conscious solo/small-studio
freelancer and recommended avoiding redundant subscriptions. Revisit Deliverable 3 if actual
budget or existing subscriptions differ from this assumption.

UNRESOLVED QUESTIONS:
- Exact current pricing for ElevenLabs tiers and Topaz Labs (subscription vs. one-time) —
  conflicting secondary sources, needs direct vendor-page verification.
- Whether "Freepik" has rebranded to "Magnific" — one source claims this, not corroborated
  elsewhere as of research date.
- Exact Veo 3.1 reference-image count (3 vs. 4) and maximum extended-clip length — conflicting
  secondary sources; verify in Google Flow directly.
- Kling 4.0's actual feature set once it exits beta (announced Sept 28, 2026, full release
  "due October 2026" — i.e., may already be live or imminent as you read this).
- Whether Gemini 4 ("Argon") is real/released — appeared in only one secondary aggregator
  source (benchlm.ai) dated Sept 30, 2026, not corroborated on an official Google page during
  this research; treat as unverified until confirmed directly.

SOURCE LINKS: see inline citations throughout this document (OpenAI, Anthropic, Google
DeepMind, Adobe, Runway, Luma, Black Forest Labs, Ideogram, ElevenLabs, and labeled
practitioner/secondary sources).

RESEARCH DATE: October 5, 2026
VERSION: 1.0
```

---

*End of Part 1. This document is the verified foundation for Part 2 (library structure, variable system, project starter, and universal project handoff).*
