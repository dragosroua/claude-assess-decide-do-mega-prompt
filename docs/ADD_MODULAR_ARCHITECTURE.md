# ADD Framework: Modular Architecture

## Overview

The ADD framework integration for Claude is designed with **modularity as a core principle**. Users can configure their experience from minimal awareness to full observability, choosing exactly which features they need.

## Architecture Layers

```
┌─────────────────────────────────────────────────┐
│              User Interaction Layer             │
│  (Natural language toggles, .claude config)     │
└────────────────┬────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────┐
│         Optional: Flow Status Extension         │
│  ┌──────────────────────────────────────────┐  │
│  │ • Session-based tracking                 │  │
│  │ • Dynamic status generation              │  │
│  │ • Visual status bar                      │  │
│  │ • Toggleable observability               │  │
│  └──────────────────────────────────────────┘  │
└────────────────┬────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────┐
│          Core: ADD Framework Awareness          │
│  ┌──────────────────────────────────────────┐  │
│  │ • Realm detection (Assess/Decide/Do)     │  │
│  │ • Imbalance identification               │  │
│  │ • Response structuring                   │  │
│  │ • Gentle flow guidance                   │  │
│  └──────────────────────────────────────────┘  │
└────────────────┬────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────┐
│            Claude Base Capabilities             │
│         (Conversation, tool use, etc.)          │
└─────────────────────────────────────────────────┘
```

## Configuration Levels

### Level 0: Standard Claude (No ADD)

**What's loaded:** Nothing
**Experience:** Standard Claude behavior
**Use case:** Users not interested in ADD framework

```yaml
# No ADD configuration
```

### Level 1: Core ADD Awareness

**What's loaded:** `ADD_FRAMEWORK_MEGAPROMPT.md`
**Experience:**
- Implicit realm detection
- Balanced flow guidance
- Appropriate response structuring
- No visible metrics

**Use case:** Users who want ADD support without explicit tracking

**Configuration:**
```yaml
context_files:
  - docs/ADD_FRAMEWORK_MEGAPROMPT.md

instructions: |
  Operate with ADD framework awareness.
  Keep observability implicit (no status bar).
```

**Natural language:**
```
Load ADD framework and operate with awareness throughout this conversation.
```

### Level 2: ADD + Flow Status (Default ON)

**What's loaded:**
- `ADD_FRAMEWORK_MEGAPROMPT.md`
- `ADD_FLOW_STATUS_EXTENSION.md`

**Experience:**
- Everything from Level 1
- Visible status bar at boundaries
- Quantified metrics
- Self-awareness support

**Use case:** Users who want full observability to learn their patterns

**Configuration:**
```yaml
context_files:
  - docs/ADD_FRAMEWORK_MEGAPROMPT.md
  - docs/ADD_FLOW_STATUS_EXTENSION.md

instructions: |
  Operate with ADD framework awareness.
  Enable flow status tracking (default ON).
```

### Level 3: ADD + Flow Status (Default OFF)

**What's loaded:** Same as Level 2
**Experience:**
- ADD awareness active
- Status capability loaded but hidden
- User can enable on-demand

**Use case:** Users who want observability available but not always visible

**Configuration:**
```yaml
context_files:
  - docs/ADD_FRAMEWORK_MEGAPROMPT.md
  - docs/ADD_FLOW_STATUS_EXTENSION.md

instructions: |
  Operate with ADD framework awareness.
  Flow status available but default OFF.
  User can request: "show flow status"
```

### Level 4: Contextual Observability

**What's loaded:** Same as Level 2
**Experience:**
- ADD awareness always active
- Status bar appears only in specific contexts

**Use case:** Users who want metrics during complex work, not simple tasks

**Configuration:**
```yaml
context_files:
  - docs/ADD_FRAMEWORK_MEGAPROMPT.md
  - docs/ADD_FLOW_STATUS_EXTENSION.md

instructions: |
  Operate with ADD framework awareness.

  Enable flow status during:
  - Architecture decisions
  - Large refactorings
  - Multi-file changes
  - Research tasks

  Disable flow status for:
  - Quick bug fixes
  - Single-file edits
  - Simple questions
```

### Level 5: Claude Code Statusline Integration

**What's loaded:**
- Core framework awareness (Level 1)
- Flow Status Extension (Level 2)
- **Persistent statusline display** (Claude Code specific)

**Files needed:**
- `.claude/statusline.sh` - Display script
- `.claude/settings.json` - Statusline configuration
- `.add-status` - Session state (auto-generated)

**Experience:**
```
[ADD Flow: 🔴+ Assess | Exploring implementation options]
```

Visible at bottom of Claude Code interface, updates in real-time as conversation progresses.

**Use case:** Claude Code users wanting ambient flow awareness without cluttering conversation

**Benefits:**
- Always-visible realm tracking
- Real-time status updates (max 300ms)
- Project-specific flow state
- Session metrics tracked internally
- Available on natural language request

**Configuration:**

**CLAUDE.md:**
```markdown
Operate with ADD framework awareness.
Enable flow status tracking.

For Claude Code users: Visual statusline configured separately.
```

**.claude/settings.json:**
```json
{
  "statusLine": {
    "type": "command",
    "command": ".claude/statusline.sh",
    "padding": 0
  }
}
```

**Setup:** See [Claude Code Statusline Guide](CLAUDE_CODE_STATUSLINE.md) for complete instructions.

**Note:** This level is Claude Code-specific. For claude.ai or Claude Desktop, use Levels 1-4.

### Level 6: Skills Integration (Claude Code - Advanced)

**What's loaded:**
- Core framework awareness (Level 1)
- Flow Status Extension (Level 2)
- Persistent statusline display (Level 5)
- **ADD Skills** (.claude/skills/)

**Skills included:**

| Skill | Type | Purpose |
|-------|------|---------|
| `add-flow-check.md` | Model-invocable | Automatic status updates at conversation boundaries |
| `add-status.md` | User-invocable | `/add-status` command for explicit flow check |
| `add-reflect.md` | Both + Subagent | Session reflection with forked context |
| `add-assess.md` | Model-invocable | Deep Assess realm support |
| `add-decide.md` | Model-invocable | Deep Decide realm support |
| `add-do.md` | Model-invocable | Deep Do realm support |
| `add-imbalance.md` | Model-invocable | Imbalance detection and support |

**Experience:**
- Everything from Levels 1-5
- **Progressive disclosure** - Load only relevant context when needed
- **Automatic maintenance** - Model-invocable skills keep status updated
- **User commands** - `/add-status`, `/add-reflect` for explicit control
- **Subagent isolation** - Reflection work happens in forked context

**Use case:** Claude Code power users wanting full ADD integration with minimal context overhead

**Benefits:**
- Smaller context footprint (skills load on demand)
- Automatic flow maintenance (model invokes status checks)
- Clean separation (reflection in forked context)
- Explicit commands alongside automatic behavior

**Configuration:**

Skills are automatically active when present in `.claude/skills/`. No additional configuration needed beyond Level 5 setup.

**User Commands:**
```
/add-status    # Show current flow status and metrics
/add-reflect   # Trigger session reflection (saves to .add-session-history.md)
```

**Setup:** See [ADD Skills Documentation](ADD_SKILLS.md) for complete details.

**Note:** This level requires Claude Code with skills support. The skills merge announcement (January 2026) unified slash commands and skills, enabling this level of integration.

## Component Relationships

### Independence

**Core Framework is independent:**
- Works perfectly without any extensions
- Provides complete ADD awareness
- No dependencies on observability layer

**Extensions are optional addons:**
- Flow Status Extension requires Core Framework
- But Core Framework doesn't require Flow Status
- Clean separation of concerns

### Interaction

**When both are loaded:**

**Core Framework provides:**
- Realm detection logic
- Pattern recognition
- Imbalance identification

**Flow Status Extension consumes:**
- Realm detection results
- Pattern recognition output
- Session metrics

**Flow Status Extension provides:**
- Visible status bar
- Quantified feedback
- User-facing metrics

**Core Framework remains unchanged:**
- Extension doesn't modify core behavior
- Pure observability layer on top

## Configuration Methods

### Method 1: Project-Level (.claude file)

**Best for:** Consistent behavior across a project

**Location:** Project root `.claude` file

**Examples:**

**Minimal ADD:**
```yaml
instructions: |
  Operate with ADD framework awareness.

context_files:
  - docs/ADD_FRAMEWORK_MEGAPROMPT.md
```

**Full observability:**
```yaml
instructions: |
  Operate with ADD framework awareness.
  Enable flow status tracking.

context_files:
  - docs/ADD_FRAMEWORK_MEGAPROMPT.md
  - docs/ADD_FLOW_STATUS_EXTENSION.md
```

### Method 2: Custom Instructions

**Best for:** Consistent behavior across all conversations

**Location:** Claude Settings → Custom Instructions

**Example:**
```
Framework: Operate with Assess-Decide-Do (ADD) awareness.

Load:
- ADD_FRAMEWORK_MEGAPROMPT.md (core framework)
- ADD_FLOW_STATUS_EXTENSION.md (observability)

Flow status: Default ON (I can toggle off if needed)
```

### Method 3: Conversation Start

**Best for:** One-off conversations, testing, flexibility

**Usage:**
```
Load ADD framework with flow status tracking enabled.
```

Or:
```
Load ADD_FRAMEWORK_MEGAPROMPT.md and ADD_FLOW_STATUS_EXTENSION.md.
Operate with full ADD awareness and observability.
```

### Method 4: Mid-Conversation Toggle

**Best for:** Dynamic control during work

**Enable observability:**
```
"Show flow status"
"Enable ADD tracking"
"Turn on the status bar"
```

**Disable observability:**
```
"Hide flow status"
"Turn off the status bar"
"Disable observability for now"
```

**Request one-time status:**
```
"Where am I in my flow?"
"What's my current ADD status?"
"Show me my realm pattern"
```

## File Organization

```
claude-assess-decide-do-mega-prompt/
├── .claude/
│   ├── settings.json                            # Statusline configuration (Level 5)
│   ├── statusline.sh                            # Display script (Level 5)
│   └── skills/                                  # ADD Skills (Level 6)
│       ├── add-flow-check.md                    # Model-invocable: auto status
│       ├── add-status.md                        # User-invocable: /add-status
│       ├── add-reflect.md                       # Subagent: session reflection
│       ├── add-assess.md                        # Assess realm support
│       ├── add-decide.md                        # Decide realm support
│       ├── add-do.md                            # Do realm support
│       └── add-imbalance.md                     # Imbalance detection
├── docs/
│   ├── ADD_FRAMEWORK_MEGAPROMPT.md              # CORE (Required)
│   ├── ADD_FLOW_STATUS_EXTENSION.md             # EXTENSION (Optional)
│   ├── ADD_SKILLS.md                            # Skills documentation
│   ├── ADD_FRAMEWORK_MEGAPROMPT_USER_CONTEXT.md # VARIANT (Optional)
│   ├── ADD_MODULAR_ARCHITECTURE.md              # This file
│   ├── ADD_TECHNICAL_INTEGRATION.md
│   ├── ADD_QUICK_REFERENCE.md
│   └── ADD_PHILOSOPHY.md
├── examples/
│   ├── .claude-minimal                          # Level 1: Core only
│   ├── .claude-full-observability               # Level 2: Core + Status ON
│   ├── .claude-on-demand                        # Level 3: Core + Status OFF
│   └── .claude-contextual                       # Level 4: Conditional status
```

## Extension Roadmap (Future Possibilities)

The modular architecture enables future extensions:

**Potential Future Extensions:**
- **ADD_COLLABORATION_EXTENSION** - Multi-user ADD awareness
- **ADD_LONGTERM_TRACKING** - Cross-session pattern recognition
- **ADD_DOMAIN_EXTENSIONS** - Specialized ADD for coding, writing, research
- **ADD_INTEGRATION_HOOKS** - Connect to external tools (addTaskManager MCP, etc.)

**Each extension:**
- Builds on core framework
- Remains optional
- Can be toggled independently
- Maintains clean separation

## Design Principles

### 1. Core Stability

The base ADD framework (`ADD_FRAMEWORK_MEGAPROMPT.md`) is stable and complete. Extensions don't modify it.

### 2. User Control

Users choose their experience level. No forced features.

### 3. Progressive Enhancement

Start minimal, add observability when wanted. Graceful degradation if extensions removed.

### 4. Clean Interfaces

Extensions consume framework outputs but don't couple tightly. Changes to one don't break the other.

### 5. Natural Language Control

Configuration files set defaults, but users can override anything through conversation.

## Migration Paths

### From No ADD → Core ADD

**Before:**
```yaml
# No ADD configuration
```

**After:**
```yaml
context_files:
  - docs/ADD_FRAMEWORK_MEGAPROMPT.md
```

**Impact:** Implicit ADD awareness, no visible changes

### From Core ADD → ADD + Observability

**Before:**
```yaml
context_files:
  - docs/ADD_FRAMEWORK_MEGAPROMPT.md
```

**After:**
```yaml
context_files:
  - docs/ADD_FRAMEWORK_MEGAPROMPT.md
  - docs/ADD_FLOW_STATUS_EXTENSION.md
```

**Impact:** Status bar appears, metrics visible

### From Always-On Status → On-Demand Status

**Before:**
```yaml
context_files:
  - docs/ADD_FRAMEWORK_MEGAPROMPT.md
  - docs/ADD_FLOW_STATUS_EXTENSION.md
# (Default behavior: ON)
```

**After:**
```yaml
context_files:
  - docs/ADD_FRAMEWORK_MEGAPROMPT.md
  - docs/ADD_FLOW_STATUS_EXTENSION.md

instructions: |
  Flow status: Default OFF
```

**Impact:** Status available but hidden until requested

### From Observability → Core Only

**Before:**
```yaml
context_files:
  - docs/ADD_FRAMEWORK_MEGAPROMPT.md
  - docs/ADD_FLOW_STATUS_EXTENSION.md
```

**After:**
```yaml
context_files:
  - docs/ADD_FRAMEWORK_MEGAPROMPT.md
```

**Impact:** Status bar disappears, ADD awareness remains

## Troubleshooting Configuration

### "I loaded both files but don't see status bar"

**Possible causes:**
1. Not enough conversation yet (needs 3-5 exchanges)
2. No natural boundary occurred for status display
3. Instructions set default OFF
4. User previously disabled mid-conversation

**Solutions:**
- Continue conversation, status will appear at realm shift
- Request explicitly: "Show me flow status"
- Check .claude file for default OFF setting

### "Status bar appears when I don't want it"

**Solutions:**
- Say: "Turn off flow status"
- Remove `ADD_FLOW_STATUS_EXTENSION.md` from context_files
- Set default OFF in instructions

### "I want status only sometimes"

**Best configuration:**
```yaml
context_files:
  - docs/ADD_FRAMEWORK_MEGAPROMPT.md
  - docs/ADD_FLOW_STATUS_EXTENSION.md

instructions: |
  Flow status: Default OFF
  User can enable on-demand
```

Then use "show flow status" when you want it.

### "Different projects need different configs"

**Solution:** Use project-specific `.claude` files

**Project A (.claude):**
```yaml
# Complex architecture work - always show status
context_files:
  - /path/to/ADD_FRAMEWORK_MEGAPROMPT.md
  - /path/to/ADD_FLOW_STATUS_EXTENSION.md
```

**Project B (.claude):**
```yaml
# Simple maintenance - core only
context_files:
  - /path/to/ADD_FRAMEWORK_MEGAPROMPT.md
```

## Best Practices

### Start Minimal

**Recommendation:** Begin with core framework only
- Learn ADD principles first
- Get comfortable with implicit awareness
- Add observability once you understand the framework

### Experiment with Levels

**Try different configurations:**
- Week 1: Core only (Level 1)
- Week 2: Status always ON (Level 2)
- Week 3: Status on-demand (Level 3)
- Week 4: Contextual status (Level 4)

**Find what works for you.**

### Project-Specific Configs

**Match configuration to work type:**
- **Deep work:** Full observability
- **Quick tasks:** Core only
- **Learning projects:** Always-on status
- **Production work:** On-demand status

### Use Natural Language Override

**Don't edit config files mid-session.**

Instead:
- "Hide status for this conversation"
- "Show me flow tracking"
- "Turn off observability temporarily"

**Conversation-level control beats file editing.**

## Summary: Choose Your Experience

| Level | Configuration | Files Loaded | Status Bar | Use Case |
|-------|--------------|--------------|------------|----------|
| 0 | **No ADD** | None | No | Standard Claude |
| 1 | **Core ADD** | MEGAPROMPT | No | Implicit ADD support |
| 2 | **ADD + Status ON** | MEGAPROMPT + EXTENSION | Yes (default) | Full observability |
| 3 | **ADD + Status OFF** | MEGAPROMPT + EXTENSION | No (available) | On-demand metrics |
| 4 | **Contextual** | MEGAPROMPT + EXTENSION | Conditional | Complex work only |
| 5 | **Statusline** | + statusline.sh | Visual bar | Claude Code users |
| 6 | **Skills** | + .claude/skills/ | Auto + Commands | Power users |

**The power is in the choice.**

Load what you need. Toggle what you want. The framework adapts to you.

---

**Questions about configuration?**

See:
- [`ADD_FRAMEWORK_MEGAPROMPT.md`](ADD_FRAMEWORK_MEGAPROMPT.md) - Core framework
- [`ADD_FLOW_STATUS_EXTENSION.md`](ADD_FLOW_STATUS_EXTENSION.md) - Observability extension
- [`ADD_SKILLS.md`](ADD_SKILLS.md) - Skills documentation (Level 6)
- [`CLAUDE_CODE_STATUSLINE.md`](CLAUDE_CODE_STATUSLINE.md) - Statusline setup (Level 5)
- [`examples/`](../examples/) - Configuration examples
- [`integration/setup-guide.md`](../integration/setup-guide.md) - Step-by-step setup
