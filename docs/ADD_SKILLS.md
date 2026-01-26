# ADD Skills for Claude Code

This document describes the ADD framework skills system, enabling native Claude Code integration with progressive context disclosure and subagent support.

## Why Skills?

The original ADD integration used a 24KB megaprompt loaded every conversation. It worked, but wasted context on overhead.

The skills-first architecture reduces base load by 94%:

| Approach | Base Load | On-Demand |
|----------|-----------|-----------|
| Megaprompt (legacy) | ~26KB always | None |
| Skills (current) | ~1.5KB | ~2KB per skill when needed |

## Overview

The ADD skills system provides:
- **Progressive disclosure** - Load only relevant ADD context when needed
- **Model-invocable automation** - Claude automatically maintains flow status
- **User-invocable commands** - Explicit control via `/add-status`, `/add-reflect`
- **Subagent integration** - Isolated context for reflection and memory

## Skills Architecture

```
.claude/skills/
├── add-flow-check.md    # Model-invocable: automatic status updates
├── add-status.md        # User-invocable: /add-status command
├── add-reflect.md       # Both: session reflection with forked context
├── add-assess.md        # Model-invocable: Assess realm support
├── add-decide.md        # Model-invocable: Decide realm support
├── add-do.md            # Model-invocable: Do realm support
└── add-imbalance.md     # Model-invocable: imbalance detection
```

## User-Invocable Skills

### `/add-status`

Display current ADD flow status and session metrics.

**Usage:**
```
/add-status
```

**Output:**
```
[ADD Flow: 🟠? Decide | Narrowing phase - 3 options to 1 finalist]

Session Metrics:
- Exchanges this session: 12
- Realm transitions: 3
- Time in current realm: 4 exchanges
- Flow quality: Balanced
```

### `/add-reflect`

Trigger session reflection. Spawns a subagent with forked context to analyze patterns and save to history.

**Usage:**
```
/add-reflect
```

**Output:**
```
Session reflection captured.

Quick summary:
- Flow quality: Balanced
- Realm focus: Assess-heavy (exploration phase)
- Key insight: Thorough foundation built for upcoming decisions

Full reflection saved to .add-session-history.md
```

**History File:**
Reflections are appended to `.add-session-history.md` for long-term pattern awareness.

## Model-Invocable Skills

These skills are automatically invoked by Claude when relevant.

### `add-flow-check`

Automatically monitors conversation for realm patterns and updates `.add-status` file at natural boundaries.

**Triggers:**
- Realm transitions
- Significant pattern shifts
- Completion events
- Every 5-7 exchanges (ambient awareness)

**Effect:**
Updates `.add-status` silently, enabling the statusline display.

### `add-assess` / `add-decide` / `add-do`

Loaded when Claude needs deep support for a specific realm. Provides:
- Detailed realm definition
- Language patterns for detection
- Response strategies
- Imbalance handling specific to realm

**Benefit:** Progressive disclosure - full realm guidance loads only when needed, preserving context window.

### `add-imbalance`

Loaded when stuck patterns are detected. Provides:
- Five imbalance patterns with detailed recognition
- Support strategies for each
- Intervention principles
- Tone guidelines

## Subagent Integration

### Forked Context (`/add-reflect`)

The reflect skill uses `context: fork` to:
1. Preserve full conversation history
2. Analyze session in isolated context
3. Generate structured reflection
4. Save to history file
5. Return brief summary to main conversation

**Why fork?** Reflection analysis doesn't belong in main context - it would pollute the working conversation with meta-analysis.

### Future: Explore Agent for Deep Assessment

Skills can specify `agent: Explore` for research-heavy tasks. Potential use:
- Deep exploration during Assess realm
- Codebase analysis without context pollution
- Return synthesized findings

## Configuration

### Enable Skills

Skills are active when placed in `.claude/skills/` directory. No additional configuration needed.

### Customize Invocability

Each skill can specify:
```yaml
model-invocable: true/false   # Claude can invoke automatically
user-invocable: true/false    # User can invoke with /command
```

### Skill References

Skills can reference other files for progressive context:
```markdown
@docs/ADD_FRAMEWORK_MEGAPROMPT_USER_CONTEXT.md
@docs/ADD_FLOW_STATUS_EXTENSION.md
```

## Comparison: Before and After

### Before (Megaprompt)

```
CLAUDE.md loads    → Full 24KB via @ references
Every conversation → ~26KB context overhead
Status updates     → Claude "remembers" to do it
Reflection         → Clutters main context
User control       → Natural language only
```

### After (Skills-First)

```
CLAUDE.md loads    → ~1.5KB core awareness
Conversation start → Minimal overhead
Realm support      → Load ~2KB skill when needed
Status updates     → Model-invocable, automatic
Reflection         → Forked context, isolated
User control       → Explicit commands + natural language
```

**Benefits:**
- 94% reduction in base context overhead
- Automatic flow maintenance
- Clean separation of concerns
- Subagent isolation for meta-work
- Explicit user commands alongside natural language

## File Reference

| File | Purpose | Type |
|------|---------|------|
| `.add-status` | Current session state | Auto-generated |
| `.add-session-history.md` | Reflection history | Append-only |
| `.claude/statusline.sh` | Visual display script | Template |
| `.claude/settings.json` | Statusline config | Template |

## Migration

No migration needed. Existing setups continue working:
- `CLAUDE.md` still loads core framework awareness
- Skills add capabilities on top
- Gradual adoption possible

**Recommended path:**
1. Add skills directory (done if you have this repo)
2. Test `/add-status` command
3. Observe automatic status updates
4. Use `/add-reflect` at session ends

## Troubleshooting

### Skills not loading

Ensure files are in `.claude/skills/` with `.md` extension.

### Status not updating

Check that `add-flow-check.md` is present and has `model-invocable: true`.

### Reflection not saving

Verify write permissions in project directory for `.add-session-history.md`.

### Context still large

Skills provide progressive disclosure - context loads when needed. Heavy assessment work may still load full realm guidance temporarily.

## Philosophy

The skills system embodies ADD principles:

- **Assess (Skills Architecture)**: Explore what's needed before loading
- **Decide (Invocability)**: Choose what Claude can invoke vs. user control
- **Do (Execution)**: Clean, focused execution with minimal overhead

Skills are ADD applied to ADD integration itself.
