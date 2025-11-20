# ADD Framework: Multi-Model Guide

## Overview

The Assess-Decide-Do framework is **model-agnostic**—the core principles of realm detection and balanced flow apply regardless of which LLM you use. This guide covers implementation across Claude, Gemini, Grok, and Kimi.

While the framework was developed with Claude, successful testing across multiple models demonstrates its **universal applicability to human-AI cognitive alignment**.

---

## Quick Model Selector

| Model | Platform | Setup Complexity | Best For |
|-------|----------|------------------|----------|
| **Claude** (Anthropic) | claude.ai, Claude Code | Medium | Full feature set, statusline support, most documentation |
| **Gemini** (Google) | AI Studio, Consumer App | Low-Medium | Google ecosystem integration, state machine clarity |
| **Grok** (xAI) | x.com | Low | Maintaining flow |
| **Kimi** (Moonshot AI) | moonshot.cn | Low | Maintaining flow |

**All models support the core framework.** Choose based on your platform preference and existing workflow.

---

## General Principles (All Models)

The ADD framework works by teaching the LLM to:

1. **Detect your current cognitive realm**
   - Assess: Exploring, researching, gathering information
   - Decide: Evaluating options, choosing direction, planning
   - Do: Executing, implementing, completing

2. **Identify workflow imbalances**
   - Analysis paralysis (stuck in Assess)
   - Decision avoidance (Assess-Decide gap)
   - Execution shortcuts (skipping Assess/Decide)
   - Perpetual doing (no reflection)

3. **Structure responses appropriately**
   - Assess: Expansive, exploratory, question-driven
   - Decide: Analytical, comparative, recommendation-focused
   - Do: Directive, actionable, completion-oriented

**These concepts translate universally.** Implementation language and activation methods vary by platform.

---

## Claude (Anthropic)

**Status:** ✅ Primary implementation, fully tested

### Features

- Complete framework integration
- Flow status observability
- Claude Code statusline support (persistent visual tracking)
- Extensive documentation and examples
- Session metrics tracking

### Setup Options

**Option 1: Custom Instructions** (All conversations)
- Go to Claude Settings → Custom Instructions
- Add framework instructions
- See [main README](../README.md#quick-start)

**Option 2: Per-Conversation** (Specific chats)
- Load `ADD_FRAMEWORK_MEGAPROMPT.md` in conversation
- Attach file or paste content
- See [setup guide](../integration/setup-guide.md)

**Option 3: Project-Level** (Development work)
- Create `CLAUDE.md` in project root
- Configure `.claude/settings.json`
- See [Claude Code guide](CLAUDE_CODE_STATUSLINE.md)

### Documentation

- [Main README](../README.md) - Complete overview
- [Framework Megaprompt](ADD_FRAMEWORK_MEGAPROMPT.md) - Core integration
- [Flow Status Extension](ADD_FLOW_STATUS_EXTENSION.md) - Observability layer
- [Claude Code Statusline](CLAUDE_CODE_STATUSLINE.md) - Visual tracking
- [Modular Architecture](ADD_MODULAR_ARCHITECTURE.md) - Configuration levels

**Best for:** Users wanting full ADD experience with maximum features and documentation.

---

## Gemini (Google)

**Status:** ✅ Tested, compatible

### Key Differences from Claude

**Language Style:**
- Uses "Workflow State Machine" terminology
- Persona-based (Explorer/Strategist/Builder)
- More directive/algorithmic tone
- Explicit state markers in responses

**Platform Specifics:**
- Google AI Studio: System instructions support
- Consumer app: Requires "pinning" activation
- CLI: Different invocation method

### Setup Options

**Option A: Google AI Studio** (Recommended for developers)

1. Go to [Google AI Studio](https://aistudio.google.com)
2. Create New Prompt → Chat Prompt
3. Locate "System Instructions" box (top left)
4. Paste framework from `examples/gemini/GEMINI_ADD_MEGAPROMPT.md`
5. Save as "ADD Framework Agent"

**Option B: Gemini Advanced / Consumer App**

1. Open new chat in Gemini
2. Paste framework as first message
3. **Critical:** Activate by saying:
   - "Acknowledge you have loaded the ADD framework by analyzing: 'I want to build a website but don't know what stack to use'"
4. Verify it responds with realm detection (`[ADD STATE: ASSESS]`)

**Option C: CLI Usage**

See `examples/gemini/CLI_INSTRUCTIONS.md` for command-line integration.

### Files

- **Framework:** [examples/gemini/GEMINI_ADD_MEGAPROMPT.md](../examples/gemini/GEMINI_ADD_MEGAPROMPT.md)
- **Setup Guide:** [examples/gemini/INSTRUCTIONS.md](../examples/gemini/INSTRUCTIONS.md)
- **CLI Guide:** [examples/gemini/CLI_INSTRUCTIONS.md](../examples/gemini/CLI_INSTRUCTIONS.md)

**Best for:** Google ecosystem users, developers wanting state machine clarity.

---

## Grok (xAI)

**Status:** ✅ Tested, compatible

### Key Differences from Claude

[Framework adapts to Grok's conversational style and platform constraints]

### Setup

1. Access Grok via [x.com](https://x.com)
2. Load framework from `examples/grok/GROK_ADD_MEGAPROMPT.md`
3. Follow activation steps in `examples/grok/INSTRUCTIONS.md`

### Files

- **Framework:** [examples/grok/GROK_ADD_MEGAPROMPT.md](../examples/grok/GROK_ADD_MEGAPROMPT.md)
- **Setup Guide:** [examples/grok/INSTRUCTIONS.md](../examples/grok/INSTRUCTIONS.md)

**Best for:** X/Twitter ecosystem users, Grok platform preference.

---

## Kimi (Moonshot AI)

**Status:** ✅ Tested, compatible

### Key Differences from Claude

[Framework adapts to Kimi's capabilities and platform]

### Setup

1. Access Kimi via [moonshot.cn](https://moonshot.cn)
2. Load framework from `examples/kimi/KIMI_ADD_MEGAPROMPT.md`
3. Follow activation steps in `examples/kimi/INSTRUCTIONS.md`

### Files

- **Framework:** [examples/kimi/KIMI_ADD_MEGAPROMPT.md](../examples/kimi/KIMI_ADD_MEGAPROMPT.md)
- **Setup Guide:** [examples/kimi/INSTRUCTIONS.md](../examples/kimi/INSTRUCTIONS.md)

**Best for:** Kimi platform users, Chinese language ecosystem.

---

## Adaptation Guidelines (For Other Models)

Want to adapt ADD for a different LLM? Here's the process:

### Step 1: Understand the Model

**Research:**
- What language style does it respond to best? (Formal, casual, technical?)
- System instructions vs. user prompts? (Where does configuration go?)
- Context window size? (How much framework text can it handle?)
- Any platform-specific constraints? (API limits, message structure?)

### Step 2: Adapt the Megaprompt

**Core concepts to preserve:**
- Three realms: Assess, Decide, Do
- Imbalance detection: Analysis paralysis, decision avoidance, etc.
- Flow guidance: Gentle transitions between realms
- Realm-appropriate responses: Match user's cognitive state

**Language to adapt:**
- **Terminology:** "State machine" vs "Framework" vs "Workflow engine"
- **Personas:** "Explorer" vs "Assessor" vs "Researcher"
- **Tone:** Directive vs suggestive vs Socratic
- **Structure:** Algorithmic steps vs narrative explanation

**Example transformations:**

Claude style:
```
Detect which realm the user is in based on language patterns.
Provide expansive exploration during Assess phase.
```

Gemini style:
```
Execute realm detection algorithm:
IF user_prompt contains ["explore", "what if"] → ASSESS state
PERSONA: The Explorer (curious, expansive, non-judgmental)
```

### Step 3: Test Activation

**Verify the framework loads:**
1. Input the adapted prompt
2. Test with sample scenario: "I'm thinking about starting a blog"
3. Check if model detects Assess realm
4. Verify it asks exploratory questions (not solutions)

**Test realm transitions:**
1. Move from exploration to decision
2. Verify model shifts tone/approach
3. Check imbalance detection triggers

**Test across scenarios:**
- Analysis paralysis detection
- Decision avoidance recognition
- Execution shortcut prevention

### Step 4: Document and Share

**Create example structure:**
```
examples/[model-name]/
├── [MODEL]_ADD_MEGAPROMPT.md  # Your adapted framework
├── INSTRUCTIONS.md             # Platform-specific setup steps
└── (optional) NOTES.md         # Testing observations
```

**Contribute back:**
- Fork this repository
- Add your model adaptation
- Submit PR with brief summary
- Help expand the ecosystem!

---

## Contributing Model Adaptations

**We welcome community contributions for additional models!**

### Models We'd Love to See

- **ChatGPT** (OpenAI) - GPT-4, GPT-3.5
- **Mistral** - Mistral AI models
- **LLaMA** - Meta's open models
- **Perplexity** - Search-integrated AI
- **Claude Opus/Haiku** - Other Claude variants
- **Your favorite model** - Help expand compatibility!

### Contribution Guidelines

**What we need:**
1. **Adapted megaprompt** - Framework translated for the model
2. **Setup instructions** - Step-by-step activation guide
3. **Test results** (optional) - What works well, what doesn't

**File naming:**
```
examples/[model-name]/
├── [MODEL]_ADD_MEGAPROMPT.md
├── INSTRUCTIONS.md
└── NOTES.md (optional)
```

**Quality criteria:**
- Framework concepts preserved (realms, imbalances, flow)
- Clear setup steps anyone can follow
- Tested with at least 3 different scenarios
- Documentation explains model-specific quirks

**How to contribute:**
1. Fork the repository
2. Create your model directory in `examples/`
3. Add your files
4. Test thoroughly
5. Submit PR with description of results
6. We'll review and merge!

**Recognition:**
- Contributors credited in this guide
- Model maintainer listed
- Community appreciation

---

## Comparison: Framework Adaptations

### Language Style Differences

| Aspect | Claude | Gemini | Others |
|--------|--------|--------|--------|
| **Tone** | Collaborative, guidance-focused | Algorithmic, state-driven | [Varies] |
| **Structure** | Narrative + principles | Step-by-step logic | [Varies] |
| **Personas** | Implicit realm behaviors | Explicit roles (Explorer/Strategist/Builder) | [Varies] |
| **Status Display** | Flow status bar | State markers in response | [Varies] |

### Platform Differences

| Platform | Activation Method | Configuration Location | Persistence |
|----------|-------------------|------------------------|-------------|
| **Claude** | Custom instructions, CLAUDE.md, per-conversation | Settings, project files | Across sessions |
| **Gemini** | System instructions, "pinning" | AI Studio, first message | Per-conversation |
| **Grok** | [Details in guide] | [Platform-specific] | [Varies] |
| **Kimi** | [Details in guide] | [Platform-specific] | [Varies] |

### Feature Availability

| Feature | Claude | Gemini | Grok | Kimi |
|---------|--------|--------|------|------|
| **Core Framework** | ✅ Full | ✅ Full | ✅ Full | ✅ Full |
| **Flow Observability** | ✅ Native | ✅ State markers | ⚠️ [TBD] | ⚠️ [TBD] |
| **Statusline** | ✅ Claude Code | ❌ N/A | ❌ N/A | ❌ N/A |
| **Session Metrics** | ✅ Tracked | ⚠️ Manual | ⚠️ [TBD] | ⚠️ [TBD] |

**Note:** Community can expand "TBD" sections through testing and contributions!

---

## Frequently Asked Questions

### "Which model should I use?"

**Use Claude if:**
- You want the most complete ADD experience
- You're using Claude Code (statusline support)
- You want extensive documentation

**Use Gemini if:**
- You're in the Google ecosystem
- You prefer state machine language
- You want AI Studio integration

**Use Grok/Kimi if:**
- You prefer those platforms
- You want to test framework portability
- You're contributing to ecosystem growth

**Truth:** All models support core framework. Choose based on platform preference.

### "Does the framework work as well on other models?"

The core concepts translate universally:
- ✅ Realm detection works across models
- ✅ Imbalance identification functions similarly
- ✅ Flow guidance principles apply everywhere

**Differences:**
- Language/terminology may vary
- Activation methods differ by platform
- Some features are Claude-specific (statusline)

**Result:** Framework is robust across models, though implementation details vary.

### "Can I switch between models?"

**Yes!** The framework isn't model-locked.

You can:
- Use Claude for development (statusline, full docs)
- Use Gemini for quick chats (Google ecosystem)
- Use Grok/Kimi for specific use cases

The concepts you learn transfer across models.

### "Will you support more models?"

**Community-driven expansion!**

We're open to:
- Additional model adaptations (community contributions)
- Platform-specific integrations
- Language translations

**Future possibilities:**
- Dedicated repos per model (if adoption grows)
- Umbrella organization with sub-repos
- Plugin systems for various platforms

### "How can I contribute?"

See [Contributing Model Adaptations](#contributing-model-adaptations) above!

We welcome:
- New model adaptations
- Improved instructions for existing models
- Test results and observations
- Documentation improvements

---

## Future: Dedicated Model Repositories

As the ADD framework ecosystem grows, we may create dedicated repositories for each model:

**Potential structure:**
```
github.com/add-framework/  (umbrella organization)
├── claude-add-framework    (this repo, renamed)
├── gemini-add-framework    (community-maintained)
├── grok-add-framework      (community-maintained)
├── kimi-add-framework      (community-maintained)
└── add-framework-core      (shared principles/docs)
```

**Or separate independent repos:**
- Easier per-model maintenance
- Model-specific communities
- Faster iteration

**Current structure supports either direction.** Community feedback will guide the path forward.

---

## Resources

**This Repository:**
- [Main README](../README.md) - Project overview
- [Claude Setup](../integration/setup-guide.md) - Detailed Claude guide
- [Examples Directory](../examples/) - All model examples

**External:**
- [Original ADD Framework](https://dragosroua.com/assess-decide-do-framework/) - Philosophy and background
- [addTaskManager App](https://itunes.apple.com/app/apple-store/id1492487688?mt=8) - iOS/macOS implementation

**Community:**
- [Issues](https://github.com/dragosroua/claude-assess-decide-do-mega-prompt/issues) - Bug reports and feature requests

---

**The ADD framework is model-agnostic. Choose the LLM that fits your workflow—the cognitive principles remain universal.**

[← Back to README](../README.md) | [View Examples](../examples/)
