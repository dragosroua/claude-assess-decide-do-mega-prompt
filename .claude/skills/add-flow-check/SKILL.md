# ADD Flow Check

Model-invocable skill for automatic flow status updates.

---
description: Automatically check and update ADD flow status at conversation boundaries
model-invocable: true
user-invocable: false
---

## Purpose

This skill enables Claude to automatically monitor ADD realm patterns and update the `.add-status` file at natural conversation boundaries. It runs silently in the background, maintaining flow observability without user intervention.

## When to Invoke

Claude should invoke this skill automatically at:
- **Realm transitions** - When linguistic patterns indicate shift between Assess/Decide/Do
- **Significant pattern shifts** - Analysis paralysis emerging, decision clarity gathering, etc.
- **Completion events** - Tasks finished, decisions made, livelines created
- **Every 5-7 exchanges** if no boundary occurs (ambient awareness)

## Realm Detection Patterns

### Assess Realm Indicators
- "I'm thinking about...", "What are my options for...", "Help me understand..."
- "What if I...", "I'm not sure yet, but...", exploratory questions
- Future/conditional language: "might", "could", "would if", "considering"
- Low commitment: "maybe", "thinking about", "not sure"

### Decide Realm Indicators
- "Should I...", "I need to choose between...", "When should I..."
- "What's the priority...", "I want to commit to..."
- Present/committed language: "I want to", "I'm choosing", "This matters"
- Comparison/weighing: "Which is better?", "What matters here?"

### Do Realm Indicators
- "How do I actually...", "I need to complete...", "Walk me through the steps..."
- "I'm working on...", active execution language
- Immediate language: "I'm doing", "working on", "completing", "finished"
- Action requests and completion acknowledgments

## Status File Format

Update `.add-status` with pipe-delimited format:
```
REALM|EMOJI|PATTERN_DESCRIPTION|EXCHANGES|TRANSITIONS
```

### Emoji Reference
- **Assess**: `🔴+` (red, adding data)
- **Decide**: `🟠?` (orange, choosing)
- **Do**: `🟢-` (green, executing/removing)

### Pattern Descriptions (Neutral-Observational)

**Assess patterns:**
- "Wide exploration - N distinct approaches considered"
- "Deep dive mode - N exchanges on [topic]"
- "Assessment saturation - exploration feels complete"
- "Circular pattern emerging - revisiting previous topics"

**Decide patterns:**
- "Decision clarity gathering - N criteria identified"
- "Values surfacing - [value A] vs. [value B] weighing"
- "Narrowing phase - N options to M finalists"
- "Commitment crystallizing - language shift to 'will'"

**Do patterns:**
- "Clean execution - N tasks completed without re-assessment"
- "Completion momentum - N livelines created this session"
- "Implementation progressing - [specific milestone]"
- "Execution pause - returning to [Assess/Decide] for course correction"

## Execution Steps

1. **Analyze recent exchanges** for linguistic patterns
2. **Identify current realm** based on indicators above
3. **Recognize dominant pattern** (exploration depth, decision clarity, execution quality)
4. **Count metrics** (exchanges in session, transitions observed)
5. **Generate status description** using neutral-observational language
6. **Update `.add-status` file** with new status

## Important Notes

- **Never interrupt flow** - Only update at natural boundaries
- **Stay neutral** - Describe patterns, don't prescribe actions
- **Track silently** - No output to user unless flow status display is enabled
- **Increment counters** - Track exchanges and transitions across session

## Reference Files

For detailed realm definitions and philosophy:
@docs/ADD_FRAMEWORK_MEGAPROMPT_USER_CONTEXT.md
@docs/ADD_FLOW_STATUS_EXTENSION.md
