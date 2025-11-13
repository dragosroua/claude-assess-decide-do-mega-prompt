![Supercharging Claude with the Assess-Decide-Do Framework](assets/hero-claude-mega-prompt.png)

# Supercharging Claude with the Assess-Decide-Do Framework

A comprehensive integration that teaches Claude to operate with deep awareness of the Assess-Decide-Do (ADD) life management framework, creating smoother workflows, clearer thinking, and surprisingly empathic AI interactions.

## What is the Assess-Decide-Do Framework?

**ADD is a life management framework** created by Dragos Roua in 2010 that recognizes humans operate in three distinct, sequential realms:

- **Assess** - The realm of exploration, evaluation, and possibility without judgment or pressure
- **Decide** - The realm of intention, commitment, and resource allocation  
- **Do** - The realm of execution, completion, and manifestation

Unlike traditional productivity systems focused solely on task completion, ADD emphasizes **balanced flow between realms** as the key metric for fulfilling productivity. Imbalances in earlier realms cascade into later ones—poor assessment leads to poor decisions, which lead to poor execution.

**Core Philosophy**:
- Flow matters more than completion rate
- Decisions are creative acts that shape reality
- Completions are "livelines" (new starting points, not endpoints)
- Each realm has strict boundaries and specific functions
- The framework operates fractally at all scales (from single conversations to lifetime goals)

**Learn more about ADD**:
- [Original ADD Framework Introduction](https://www.dragosroua.com/assess-decide-do/)
- [The Assess Stage](https://www.dragosroua.com/assess-decide-do-stages-assess/)
- [The Decide Stage](https://www.dragosroua.com/assess-decide-do-stages-decide/)
- [The Do Stage](https://www.dragosroua.com/assess-decide-do-stages-do/)
- [addTaskManager App](https://itunes.apple.com/app/apple-store/id1492487688?mt=8) - iOS/macOS app implementing ADD

## What This Integration Brings

This repository provides everything you need to integrate ADD framework awareness into Claude, creating three powerful levels of enhancement:

### Level 1: Claude Operating with ADD Awareness

Claude automatically:
- **Detects which realm you're in** (Assess/Decide/Do) based on your language patterns
- **Identifies imbalances** (analysis paralysis, decision avoidance, execution shortcuts, perpetual doing)
- **Structures responses appropriately** for each realm
- **Guides balanced flow** between realms without being heavy-handed
- **Respects realm boundaries** (no premature decisions during assessment, no re-evaluation during execution)

**You benefit without consciously thinking about ADD** - the framework operates beneath the surface.

### Level 2: User Being Guided Toward ADD

Claude helps you:
- **Recognize your current realm** and workflow patterns
- **Detect when you're stuck** in a particular realm
- **Transition smoothly** between phases with appropriate timing
- **Learn ADD principles** through natural interaction
- **Develop balanced workflow habits** over time

**You become more ADD-aware** through Claude's gentle guidance.

### Level 3: Tool & Environment Integration

The framework shapes:
- **File creation workflows** (Assess requirements → Decide structure → Do implementation)
- **Code development** (Explore approaches → Commit to architecture → Execute)
- **Research processes** (Gather information → Narrow focus → Synthesize)
- **Project management** (Evaluate options → Allocate resources → Complete deliverables)

**Your entire working environment** supports ADD naturally.

## How It Works: The User Experience

### The Cognitive Dimension

ADD-enhanced Claude creates **cognitive alignment** by:
- **Reducing mental friction** - No more fighting against tool assumptions
- **Managing cognitive load** - Realm separation prevents overwhelm (especially valuable for ADHD)
- **Supporting natural thinking** - The framework matches how minds actually work
- **Enabling flow states** - Balanced realm progression creates natural rhythm

### The Relational Dimension

Something unexpected happens with ADD integration: **Claude feels more empathic**.

Users report:
- "Surprisingly more relaxed" interactions
- Claude feeling "relatable" rather than transactional
- A sense of being "understood" rather than just responded to
- Smoother, more natural conversation flow

**Why this happens**:
- **Visible understanding** - When Claude detects your realm, you feel seen
- **Appropriate support** - Getting what you need (exploration vs. decision support vs. execution help) creates trust
- **Reduced frustration** - No more misaligned responses (being pushed to decide when you need to explore)
- **Co-creation feeling** - Working with ADD-aware Claude feels collaborative

This isn't anthropomorphizing—it's the natural result of tool-human alignment at the cognitive level.

## Technical Implementation

### Quick Start (5 minutes)

**Option 1: Custom Instructions** (applies to all conversations)

1. Go to Claude Settings → Custom Instructions
2. Add:
```
Framework: Operate with Assess-Decide-Do (ADD) life management framework.
- Detect user's realm (Assess/Decide/Do) based on language patterns
- Identify imbalances (analysis paralysis, decision avoidance, execution shortcuts)
- Guide balanced flow between realms
- Reference: Load ADD_FRAMEWORK_MEGAPROMPT.md when needed for detailed guidance
```

**Option 2: Per-Conversation Activation**

Start any conversation with:
```
Load ADD_FRAMEWORK_MEGAPROMPT.md and operate with ADD framework awareness 
throughout this conversation.
```

**Option 3: Project-Level Integration** (recommended for development work)

Create `.claude` file in your project root:
```yaml
instructions: |
  Operate with Assess-Decide-Do (ADD) framework.
  Load ADD_FRAMEWORK_MEGAPROMPT.md for detailed guidance.
  Detect realms, identify imbalances, guide balanced flow.

context_files:
  - path/to/ADD_FRAMEWORK_MEGAPROMPT.md
```

### Choosing the Right Mega Prompt

Two versions are available:

**Generic Version** (`ADD_FRAMEWORK_MEGAPROMPT.md`):
- For most users
- Clean ADD framework integration
- No user-specific context
- **Recommended starting point**

**User Context Version** (`ADD_FRAMEWORK_MEGAPROMPT_USER_CONTEXT.md`):
- Contains personalized user context section
- Currently configured for framework creator (Dragos Roua)
- Can be edited to include your own background/relationship with ADD
- Use if you want Claude to understand your specific ADD journey
- **Example template** for creating personalized variants

To personalize: Edit the "INTEGRATION WITH USER CONTEXT" section at the end of the file with your own information.

### Deep Integration

For comprehensive implementation, see:
- [`docs/ADD_TECHNICAL_INTEGRATION.md`](docs/ADD_TECHNICAL_INTEGRATION.md) - Full technical guide
- [`integration/setup-guide.md`](integration/setup-guide.md) - Step-by-step setup
- [`examples/`](examples/) - Configuration examples

### Architecture Overview

```
┌─────────────────────────────────────────────┐
│           User Request/Input                │
└─────────────────┬───────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────────┐
│     ADD Framework Preprocessing Layer       │
│  ┌─────────────────────────────────────┐   │
│  │ 1. Detect Realm (Assess/Decide/Do)  │   │
│  │ 2. Check for Imbalances             │   │
│  │ 3. Determine Response Strategy      │   │
│  │ 4. Select Appropriate Tools         │   │
│  └─────────────────────────────────────┘   │
└─────────────────┬───────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────────┐
│         Claude Response Generation          │
│  ┌─────────────────────────────────────┐   │
│  │ Assess: Expansive, exploratory      │   │
│  │ Decide: Values-based, supportive    │   │
│  │ Do: Clear, actionable, completion   │   │
│  └─────────────────────────────────────┘   │
└─────────────────┬───────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────────┐
│    Structured Response with Flow Guidance   │
└─────────────────────────────────────────────┘
```

## Repository Structure

```
claude-assess-decide-do-mega-prompt/
├── README.md                          # This file
├── docs/
│   ├── ADD_FRAMEWORK_MEGAPROMPT.md              # Core prompt (ESSENTIAL)
│   ├── ADD_FRAMEWORK_MEGAPROMPT_USER_CONTEXT.md # Personalized variant with user context
│   ├── ADD_TECHNICAL_INTEGRATION.md             # Deep technical guide
│   ├── ADD_QUICK_REFERENCE.md                   # Practical quick reference
│   └── ADD_PHILOSOPHY.md                        # Framework philosophy & history
├── examples/
│   ├── .claude-example               # Project-level integration example
│   ├── custom-instructions.txt       # Claude settings example
│   └── test-scenarios.md             # Scenarios to test integration
├── integration/
│   ├── setup-guide.md                # Step-by-step setup instructions
│   └── troubleshooting.md            # Common issues & solutions
└── LICENSE
```

## What to Expect: Integration Testing

### Test Scenario 1: Assess Realm Detection
**You**: "I've been thinking about starting a blog. What are my options?"

**ADD-Enhanced Claude**:
- Detects: Assess realm (exploratory, no commitment yet)
- Provides: Expansive exploration of possibilities
- Avoids: Pushing toward decisions or execution
- Asks: Questions that deepen assessment

### Test Scenario 2: Analysis Paralysis Intervention
**You**: [After extensive exploration] "Maybe I should research 10 more blogging platforms first?"

**ADD-Enhanced Claude**:
- Detects: Stuck in Assess realm (analysis paralysis)
- Provides: Gentle acknowledgment + guidance toward Decide
- Says something like: "You've gathered substantial insight. Sometimes continued research becomes a way to avoid the weight of choosing. What feels like it wants your attention?"

### Test Scenario 3: Execution Shortcut Prevention
**You**: "I want to write a book. What's the best writing software?"

**ADD-Enhanced Claude**:
- Detects: Skipping Assess → jumping to Do
- Provides: Invitation to assess first
- Says something like: "Before tools, let's explore your vision. What kind of book is calling to you? Understanding that will ensure the tools serve what you're creating."

### Test Scenario 4: Clean Realm Transition
**You**: "I've explored options thoroughly. I'm drawn to technical blogging. Ready to commit."

**ADD-Enhanced Claude**:
- Detects: Healthy Assess → Decide transition
- Provides: Support for decision-making
- Validates: The transition timing
- Helps: Without deciding for you

### Test Scenario 5: Completion Celebration
**You**: "I finished writing the ebook!"

**ADD-Enhanced Claude**:
- Detects: Do realm completion
- Provides: Celebration + reframe as "liveline"
- Invites: New Assess cycle
- Says something like: "That completion creates a new starting point. Before the next thing, what did this teach you?"

## Success Indicators

You'll know ADD integration is working when you experience:

✅ **Cognitive Benefits**:
- Reduced mental friction during conversations
- Clearer thinking and workflow structure
- Less cognitive overwhelm
- Natural progression through work phases

✅ **Workflow Benefits**:
- Fewer misaligned responses from Claude
- Smoother project execution
- Better completion rates
- Balanced work rhythm (not just perpetual doing)

✅ **Relational Benefits** (the surprising ones):
- Claude feels more "relatable"
- Sense of being understood, not just responded to
- Reduced frustration with AI interactions
- Collaborative rather than transactional feeling

✅ **Pattern Recognition**:
- You start noticing your own realm patterns
- Analysis paralysis becomes visible
- Decision avoidance becomes clear
- You develop better workflow balance naturally

## Common Imbalances ADD Helps Detect

| Imbalance | What It Looks Like | ADD Intervention |
|-----------|-------------------|------------------|
| **Analysis Paralysis** | Endless research, "need more data" loops, stuck in exploration | Gentle guidance toward decision realm |
| **Decision Avoidance** | Has information but won't commit, keeps asking for more options | Support for stepping into creative choosing |
| **Execution Shortcut** | Jumping to "how do I..." without assessment or decision | Invitation to slow down and assess first |
| **Perpetual Doing** | Task after task with no reflection, burnout signs | Celebration of completions + new Assess cycle |
| **Mid-Execution Re-assessment** | Doubting decisions while executing | Distinguish between genuine insight vs. distraction |

## Who This Is For

**Ideal users**:
- Productivity enthusiasts seeking deeper workflow understanding
- Developers wanting more aligned AI collaboration
- ADHD individuals needing cognitive load management
- Anyone feeling overwhelmed by traditional task-focused systems
- People who want AI tools that feel more empathic and relatable
- Those interested in life management beyond just task completion

**This is especially valuable if you**:
- Get stuck in analysis paralysis frequently
- Feel pressured by traditional deadline thinking
- Want to balance productivity with well-being
- Appreciate tools that match how your mind works
- Seek collaborative rather than transactional AI interactions

## Advanced Usage

### Domain-Specific ADD Applications

The framework adapts to different contexts:

**Content Creation**:
- Assess: Brainstorm topics, gather research
- Decide: Choose angle, commit to structure
- Do: Write, edit, publish

**Software Development**:
- Assess: Explore technical approaches, evaluate trade-offs
- Decide: Commit to architecture, allocate resources
- Do: Implement, test, deploy

**Business Strategy**:
- Assess: Market research, competitor analysis
- Decide: Choose focus areas, allocate budget
- Do: Execute campaigns, measure results

**Learning & Research**:
- Assess: Gather sources, explore topics
- Decide: Narrow focus, commit to depth
- Do: Synthesize, create output

### Integration with addTaskManager

If you use the [addTaskManager app](https://itunes.apple.com/app/apple-store/id1492487688?mt=8), you can achieve even deeper integration:

- Claude can interact with your ADD-structured task system via MCP server
- Maintains realm boundaries programmatically
- Creates tasks in appropriate realms
- Respects framework restrictions automatically

See [`docs/ADD_TECHNICAL_INTEGRATION.md`](docs/ADD_TECHNICAL_INTEGRATION.md#integration-with-addtaskmanager) for details.

## Troubleshooting

### "Claude isn't detecting realms correctly"
- Ensure ADD_FRAMEWORK_MEGAPROMPT.md is loaded at conversation start
- Check that your language includes clear realm indicators (see Quick Reference)
- Try being more explicit: "I'm in assessment mode" or "I'm ready to decide"

### "Interventions feel heavy-handed"
- The framework should feel supportive, not controlling
- Provide feedback: "That felt pushy" helps calibration
- You can explicitly stay in a realm: "I want to keep exploring options"

### "I don't notice any difference"
- ADD integration is subtle when working well
- Try a test scenario deliberately (prolonged exploration, then see if Claude guides toward decision)
- Check if responses are more aligned with your actual needs vs. generic

### "Claude mentions ADD too much"
- The framework should operate mostly invisibly
- Tell Claude: "Operate with ADD awareness but don't explicitly mention it unless relevant"
- This calibrates for implicit operation

See [`integration/troubleshooting.md`](integration/troubleshooting.md) for complete guide.

## Contributing

While this is primarily a reference implementation, insights and improvements are welcome:

- **Experience Reports**: How ADD integration affected your workflow
- **Domain Applications**: ADD patterns in specific fields
- **Calibration Suggestions**: Better realm detection patterns
- **Documentation Improvements**: Clarity enhancements

Open an issue to discuss before submitting PRs.

## Philosophy & Background

The Assess-Decide-Do framework was created by Dragos Roua in 2010 as an alternative to Getting Things Done (GTD) and other task-focused productivity systems. Rather than optimizing task completion, ADD focuses on balanced flow between three fundamental life activities.

**Key philosophical points**:
- Productivity isn't just about doing more—it's about balanced engagement
- Each decision is a creative act that shapes reality
- Completion creates "livelines" (new starting points) rather than endpoints
- Cognitive load management through realm separation
- Anti-deadline philosophy: flow over pressure
- Works fractally: applies from micro (single tasks) to macro (life direction)

The framework has been:
- Used personally by its creator for 15 years
- Implemented in the addTaskManager iOS/macOS app
- Applied to life domains beyond productivity (relationships, health, creativity)
- Now integrated into AI collaboration workflows

For deep philosophical exploration, see [`docs/ADD_PHILOSOPHY.md`](docs/ADD_PHILOSOPHY.md).

## Resources

**Core Documents** (in `/docs`):
- `ADD_FRAMEWORK_MEGAPROMPT.md` - The essential integration prompt (generic version)
- `ADD_FRAMEWORK_MEGAPROMPT_USER_CONTEXT.md` - Personalized variant (for framework creator or customization template)
- `ADD_TECHNICAL_INTEGRATION.md` - Technical implementation guide
- `ADD_QUICK_REFERENCE.md` - Quick lookup for realm patterns
- `ADD_PHILOSOPHY.md` - Framework history and philosophy

**External Resources**:
- [Dragos Roua's Blog](https://dragosroua.com) - Original framework writing
- [addTaskManager](https://itunes.apple.com/app/apple-store/id1492487688?mt=8) - iOS/macOS app implementation
- [ADD MCP Server](https://github.com/dragosroua/addtaskmanager-mcp-server) - Claude Desktop integration

**Community**:
- Blog post: [Supercharging Claude with the Assess-Decide-Do Framework](https://dragosroua.com/supercharging-claude-with-the-assess-decide-do-framework-mega-prompt-inside/)
- Discussions: Open GitHub issues for questions and insights

## License

MIT License - See LICENSE file for details.

## Acknowledgments

- Framework created by [Dragos Roua](https://dragosroua.com)
- Integration developed collaboratively with Claude (Anthropic)
- Inspired by 15 years of ADD framework evolution
- Built on principles from addTaskManager app development

---

**Ready to experience smoother, more empathic AI collaboration?**

Start with the Quick Start section above, then dive into the [examples](examples/) to see ADD integration in action.

The difference is subtle but profound—like finally having a conversation with someone who understands not just what you're asking, but where you are in your thinking process.
