# When AI Understands Where You Are in Your Thinking

[![ADD Framework Integration](assets/hero-claude-mega-prompt.png)](https://dragosroua.com/supercharging-claude-with-the-assess-decide-do-framework-mega-prompt-inside/)

[![GitHub stars](https://img.shields.io/github/stars/dragosroua/claude-assess-decide-do-mega-prompt?style=social)](https://github.com/dragosroua/claude-assess-decide-do-mega-prompt) [![GitHub Sponsors](https://img.shields.io/github/sponsors/dragosroua?style=social)](https://github.com/sponsors/dragosroua)

**What if AI didn't just answer questions, but understood whether you're exploring, deciding, or executing?**

This is the first integration of a human cognitive framework into a Large Language Model. Not training AI to be smarter—training AI to recognize human mental states.

The result: Cognitive alignment that users describe as "weirdly empathic."

---

## The Problem

AI assistants create subtle but constant friction:

- **You're exploring options** → AI jumps to solutions
- **You're mid-execution** → AI suggests rethinking everything  
- **You need support** → AI provides complete answers

AI doesn't understand **where you are** in your thinking process.

## The Solution

The **Assess-Decide-Do (ADD) framework** teaches Claude to recognize three fundamental cognitive states:

- **🔴 Assess** - Exploring possibilities without pressure to commit
- **🟠 Decide** - Choosing direction and allocating resources
- **🟢 Do** - Executing and completing with focus

When Claude understands your realm, it provides cognitive support instead of generic responses.

**[Quick Start →](#quick-start)** | **[Why This Matters →](docs/philosophy/WHY_THIS_MATTERS.md)**

---

## What You'll Experience

### Cognitive Benefits
✅ **Reduced mental friction** - Responses match your actual needs  
✅ **Clearer thinking** - Realm boundaries reduce overwhelm  
✅ **Natural flow** - Smooth progression through work phases  
✅ **ADHD-friendly** - Cognitive load management by design

### Workflow Benefits
✅ **Fewer misaligned responses** - Claude detects your mental state  
✅ **Smoother execution** - No premature solutions or re-evaluation  
✅ **Better completion rates** - Support when and how you need it  
✅ **Balanced rhythm** - Not just perpetual task-churning

### The Relational Shift (Unexpected)
✅ **Feels more collaborative** - Less transactional, more understood  
✅ **Cognitive alignment creates empathy** - Tool matches how you think  
✅ **Reduced frustration** - Support that fits your state  
✅ **Smoother interactions** - Natural conversation flow

> *"Nice! I have a similar problem and have been looking for a solution."* - r/ClaudeAI comment

> *"This definitely is a problem I was having. Sometimes Claude gets too eager and just wasted a ton of token while other times it just doesn't understand what to do which ends up me doing multiple rounds of reject comment loops. This framework sounds very interesting."* - r/ClaudeAI comment user  

> *"This is brilliant! I've been strugling with Claude jumping to solutions when I'm still exploring ideas, this framework makes so much sense."* - r/ClaudeAI comment

---

## Quick Start

### Option 1: Custom Instructions (5 minutes)

**For all Claude conversations:**

1. Go to Claude Settings → Custom Instructions
2. Add:
```
Framework: Operate with Assess-Decide-Do (ADD) life management framework.
- Detect user's realm (Assess/Decide/Do) based on language patterns
- Identify imbalances (analysis paralysis, decision avoidance, execution shortcuts)
- Guide balanced flow between realms
- Reference: Load ADD_FRAMEWORK_MEGAPROMPT.md when needed
```

### Option 2: Per-Conversation (2 minutes)

**For specific conversations:**

1. Download [`docs/ADD_FRAMEWORK_MEGAPROMPT.md`](docs/ADD_FRAMEWORK_MEGAPROMPT.md)
2. Start Claude conversation
3. Say: "Load and operate with ADD framework awareness"
4. Attach the file

### Option 3: Project-Level with Skills (10 minutes) *(Recommended for Claude Code)*

**For development projects using Claude Code:**

1. Clone or fork the repository
2. The skills-first architecture activates automatically:
   - `CLAUDE.md` loads minimal core awareness (~1.5KB)
   - Skills in `.claude/skills/` provide deep support on demand
3. Try `/add-status` and `/add-reflect` commands

**[Complete Setup Guide →](integration/setup-guide.md)** | **[Skills Documentation →](docs/ADD_SKILLS.md)**

---

## Claude Code Users: Enhanced Integration

If you're using **Claude Code**, you get native skills integration plus persistent visual statusline:

**Skills Commands:**
- `/add-status` - Display current flow status and session metrics
- `/add-reflect` - Trigger session reflection (saves history for pattern awareness)

**Automatic Features:**
- Model-invocable skills maintain flow status automatically
- Progressive context disclosure (load only what's needed)
- Subagent integration for isolated reflection work

**Visual Statusline:**
- 🔴 🟠 🟢 Visual realm indicator at bottom of interface
- Live flow status updates as conversation progresses
- Session metrics tracked and available on request

**Example statusline:**
```
[ADD Flow: 🔴+ Assess | Exploring implementation options]
```

**[Skills Documentation →](docs/ADD_SKILLS.md)** | **[Setup Claude Code Statusline →](docs/CLAUDE_CODE_STATUSLINE.md)**

---

## How It Works

### Five Levels of Integration

**Level 1: Claude Operating with ADD Awareness**
Claude automatically detects your realm and structures responses appropriately. You benefit without thinking about ADD.

**Level 2: User Guided Toward ADD**
Claude helps you recognize patterns, detect when you're stuck, and transition smoothly between phases.

**Level 3: Tool & Environment Integration**
The framework shapes file creation, code development, research processes, and project management workflows.

**Level 4: Flow Status Observability** *(Optional)*
Visual tracking of realm patterns with toggleable status bar:
```
[ADD Flow: 🔴+ Assess | Deep exploration - 8 data points gathered]
```

**Level 5: Skills Integration** *(Claude Code)*
Native skills with progressive disclosure, automatic status updates, and subagent-powered reflection:
- `/add-status` - Explicit flow check
- `/add-reflect` - Session reflection with forked context
- Model-invocable skills for automatic realm support

### The Architecture

```
User Request → Detect Realm → Check Imbalances → Response Strategy
                     ↓
        Assess: Expansive, exploratory
        Decide: Values-based, supportive  
           Do: Clear, actionable, completion-focused
```

**[Technical Deep Dive →](docs/ADD_TECHNICAL_INTEGRATION.md)**

---

## Choose Your Configuration

The framework is modular - select your experience level:

### Core Framework Only *(Recommended start)*
**Files:** `ADD_FRAMEWORK_MEGAPROMPT.md`  
**Experience:** Implicit ADD awareness, realm detection, no visible metrics

### Core + Flow Status *(For self-awareness)*
**Files:** Core + `ADD_FLOW_STATUS_EXTENSION.md`  
**Experience:** Everything above + visible status bar showing realm and patterns

**[Configuration Guide →](docs/ADD_MODULAR_ARCHITECTURE.md)**

---

## What Makes This Different

### First Cognitive Framework + LLM Integration

**Traditional AI development:** Make models more capable (better answers, faster responses)  
**This integration:** Teach AI to understand human cognitive states (where you are mentally)

**Why it matters:** Path toward AI that augments human thinking instead of automating tasks.

**[Read: Why This Integration Matters →](docs/philosophy/WHY_THIS_MATTERS.md)**

### Human Enhancement, Not Just AI Enhancement

**Automation paradigm:** AI does the work, human becomes passive  
**Augmentation paradigm:** AI supports human cognition, human remains active creator

This integration keeps you in the creative loop while reducing cognitive friction.

**[Read: Human-Centered AI Philosophy →](docs/philosophy/HUMAN_CENTERED_AI.md)**

### The Empathy Discovery

Users report Claude feeling "more empathic" with ADD integration. This isn't anthropomorphizing—it's **cognitive alignment creating the experience of being understood**.

When tools match your cognitive patterns instead of fighting them, interactions shift from transactional to relational.

---

## About the Assess-Decide-Do Framework

Created by [Dragos Roua](https://dragosroua.com) in 2010 as an alternative to traditional task-focused productivity systems.

**Core Philosophy:**
- Flow matters more than completion rate
- Decisions are creative acts that shape reality
- Completions create "livelines" (new starting points, not endpoints)
- Framework operates fractally (single tasks → lifetime goals)
- Each realm has strict boundaries and specific functions

**Real-world implementations:**
- Used personally for 15 years
- Powers [addTaskManager](https://itunes.apple.com/app/apple-store/id1492487688?mt=8) iOS/macOS app
- Applied to work, relationships, health, creativity

**[Learn more about ADD →](https://www.dragosroua.com/assess-decide-do/)**

### Multi-Model Compatibility

The ADD framework has been successfully tested with multiple LLMs:
- **Claude** (Anthropic) - Primary implementation, fully documented
- **Gemini** (Google) - Compatible, tested
- **Grok** (xAI) - Compatible, tested
- **Kimi** (Moonshot AI) - Compatible, tested

The core principles translate across models, though setup and language may vary by platform.

**[Multi-Model Setup Guide →](docs/MULTI_MODEL_GUIDE.md)**

---

## Common Questions

### "How do I know if it's working?"

Test with: "I'm exploring options for X..."

If Claude stays in exploration mode without pushing you to decide, it's working. The integration is subtle when working well—you mostly notice reduced friction.

### "Does this work for everyone?"

ADD isn't universal. It works well for:
- People who get stuck in analysis paralysis
- ADHD individuals needing cognitive load management
- Anyone wanting balanced workflow (not just task-churning)

It might not suit those who prefer completely unstructured exploration.

### "Can I turn it off?"

Yes. For per-conversation use, simply don't load the framework. For custom instructions, remove them. The framework only operates when explicitly loaded.

### "What about other AI tools?"

**Yes!** The ADD framework has been tested with multiple LLMs:
- **Claude** (Anthropic) - Primary, fully documented
- **Gemini** (Google) - Compatible, tested
- **Grok** (xAI) - Compatible, tested
- **Kimi** (Moonshot AI) - Compatible, tested

The core principles are model-agnostic. See [Multi-Model Guide](docs/MULTI_MODEL_GUIDE.md) for setup instructions.

**Community contributions welcome** for additional models!

**[Full Troubleshooting Guide →](integration/troubleshooting.md)**

---

## Repository Structure

```
CLAUDE.md                                # Auto-loaded memory for Claude Code ⭐

.claude/
├── settings.json                       # Statusline configuration
├── statusline.sh                       # Visual display script
└── skills/                             # ADD Skills (new!)
    ├── add-flow-check.md               # Model-invocable: auto status updates ⭐
    ├── add-status.md                   # User-invocable: /add-status command ⭐
    ├── add-reflect.md                  # Subagent: session reflection ⭐
    ├── add-assess.md                   # Assess realm support
    ├── add-decide.md                   # Decide realm support
    ├── add-do.md                       # Do realm support
    └── add-imbalance.md                # Imbalance detection

docs/
├── ADD_FRAMEWORK_MEGAPROMPT.md         # Core integration prompt ⭐
├── ADD_FLOW_STATUS_EXTENSION.md        # Optional observability
├── ADD_SKILLS.md                       # Skills documentation (new!) ⭐
├── CLAUDE_CODE_STATUSLINE.md           # Claude Code statusline setup
├── MULTI_MODEL_GUIDE.md                # Multi-model compatibility guide
├── ADD_MODULAR_ARCHITECTURE.md         # Configuration guide
├── ADD_TECHNICAL_INTEGRATION.md        # Deep technical guide
├── ADD_QUICK_REFERENCE.md              # Patterns & test scenarios
├── ADD_PHILOSOPHY.md                   # Framework history
└── philosophy/
    ├── WHY_THIS_MATTERS.md             # Significance & implications
    └── HUMAN_CENTERED_AI.md            # Augmentation philosophy

templates/
└── claude-code/
    ├── statusline.sh                   # Statusline script template
    └── settings.json                   # Settings configuration example

examples/
├── .claude-minimal                      # Core framework only
├── .claude-full-observability          # Core + Flow Status
├── .claude-on-demand                   # Flow Status on-demand
├── .claude-contextual                  # Conditional observability
├── custom-instructions.txt             # Claude settings example
├── test-scenarios.md                   # Verification tests
├── gemini/                             # Gemini-specific
│   ├── GEMINI_ADD_MEGAPROMPT.md
│   ├── INSTRUCTIONS.md
│   └── CLI_INSTRUCTIONS.md
├── grok/                               # Grok-specific
│   ├── GROK_ADD_MEGAPROMPT.md
│   └── INSTRUCTIONS.md
└── kimi/                               # Kimi-specific
    ├── KIMI_ADD_MEGAPROMPT.md
    └── INSTRUCTIONS.md

integration/
├── setup-guide.md                      # Step-by-step setup
└── troubleshooting.md                  # Common issues
```

---

## Resources

**Framework Documentation:**
- [Original ADD Introduction](https://www.dragosroua.com/assess-decide-do/) (2010)
- [The Assess Stage](https://www.dragosroua.com/assess-decide-do-stages-assess/)
- [The Decide Stage](https://www.dragosroua.com/assess-decide-do-stages-decide/)  
- [The Do Stage](https://www.dragosroua.com/assess-decide-do-stages-do/)

**Applications:**
- [addTaskManager App](https://itunes.apple.com/app/apple-store/id1492487688?mt=8) - [ app ] iOS/macOS implementation
- [ADD MCP Server](https://github.com/dragosroua/addtaskmanager-mcp-server) - [ repo ] Claude Desktop integration
- [Claude Content Skills](https://github.com/dragosroua/claude-content-skills/) - [ repo ] a collection of 3 production ready Claude skills for managing content: link analyzer, SEO manager and CTA injector (built with this enhanced Claude Code version)

**Community:**
- [Blog Post: Full Story](https://dragosroua.com/supercharging-claude-with-the-assess-decide-do-framework-mega-prompt-inside/)
- [Reddit Discussion](https://www.reddit.com/r/ClaudeAI/comments/1ovu5av/i_taught_claude_my_15year_productivity_framework/) - 50K+ views, active community feedback on r/ClaudeAI
- [GitHub Repository](https://github.com/dragosroua/claude-assess-decide-do-mega-prompt) - 42 stars, 12 forks
- [Creator's Blog](https://dragosroua.com)

---

## Contributing

Insights and improvements welcome:

- **Experience reports** - How ADD integration affected your workflow
- **Domain applications** - ADD patterns in specific fields  
- **Calibration suggestions** - Better realm detection patterns
- **Documentation improvements** - Clarity enhancements

Open an issue to discuss before submitting PRs.

---

## License

MIT License - See [LICENSE](LICENSE) for details.

---

## Acknowledgments

- Framework created by [Dragos Roua](https://dragosroua.com)
- Integration developed collaboratively with Claude (Anthropic)
- Built on 15 years of ADD framework evolution
- Inspired by addTaskManager app development

---

**Ready to experience AI that understands where you are in your thinking?**

**[Quick Start →](#quick-start)** | **[Why This Matters →](docs/philosophy/WHY_THIS_MATTERS.md)** | **[Get Started Now](docs/ADD_FRAMEWORK_MEGAPROMPT.md)**

---

*This integration represents a small step toward human-centered AI: tools that augment cognition instead of automating it. When AI understands your mental state, collaboration transforms from transactional to relational.*

*That transformation might be more important than any single AI capability improvement.*