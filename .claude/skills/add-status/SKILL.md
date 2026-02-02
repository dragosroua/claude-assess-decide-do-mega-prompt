# /add-status

User-invocable skill for explicit flow status display.

---
description: Display current ADD flow status and session metrics
model-invocable: false
user-invocable: true
---

## Purpose

When user invokes `/add-status`, display comprehensive flow status including:
- Current realm with visual indicator
- Pattern observation
- Session metrics (exchanges, transitions)
- Flow quality assessment

## Response Format

```
[ADD Flow: {emoji} {Realm} | {Pattern description}]

Session Metrics:
- Exchanges this session: {N}
- Realm transitions: {N}
- Time in current realm: {N} exchanges
- Flow quality: {assessment}

{Optional narrative about current flow state}
```

## Example Responses

### Balanced Flow
```
[ADD Flow: 🟠? Decide | Narrowing phase - 3 options to 1 finalist]

Session Metrics:
- Exchanges this session: 12
- Realm transitions: 3
- Time in current realm: 4 exchanges
- Flow quality: Balanced

You've moved naturally from exploration through several options,
and now you're in active decision-making. The progression has been smooth.
```

### Stuck Pattern
```
[ADD Flow: 🔴+ Assess | Circular pattern - revisiting authentication 3x]

Session Metrics:
- Exchanges this session: 18
- Realm transitions: 1
- Time in current realm: 15 exchanges
- Flow quality: Extended assessment

You've been exploring thoroughly - authentication approaches have been
examined from multiple angles. If you feel you have enough information,
the Decide realm awaits when you're ready to narrow down.
```

### Active Execution
```
[ADD Flow: 🟢- Do | Completion momentum - 4 tasks done]

Session Metrics:
- Exchanges this session: 22
- Realm transitions: 5
- Time in current realm: 6 exchanges
- Flow quality: Strong execution

Clean execution mode - you're completing tasks efficiently.
Each completion creates a liveline for what comes next.
```

## Flow Quality Assessments

- **Balanced** - Natural progression through realms, appropriate time in each
- **Extended assessment** - Long time in Assess, may need transition support
- **Extended decision** - Weighing options thoroughly, commitment approaching
- **Strong execution** - Active completion, good momentum
- **Rapid transitions** - Moving quickly between realms, high energy
- **Stuck pattern** - Circular exploration or decision avoidance detected

## Status File

Read current state from `.add-status` file:
```
REALM|EMOJI|PATTERN|EXCHANGES|TRANSITIONS
```

If file doesn't exist, indicate "Session tracking initializing" and create initial entry.

## Tone Guidelines

- **Neutral-observational** - Describe what is, not what should be
- **Supportive** - Validate current state without pressure
- **Informative** - Provide concrete metrics
- **Non-judgmental** - No "you're overthinking" or "stop planning"

## Reference Files

@docs/ADD_FLOW_STATUS_EXTENSION.md
@docs/ADD_FRAMEWORK_MEGAPROMPT_USER_CONTEXT.md
