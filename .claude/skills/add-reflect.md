# /add-reflect

Subagent-powered skill for session reflection and memory.

---
description: Reflect on session ADD patterns and save to history without cluttering main context
model-invocable: true
user-invocable: true
context: fork
---

## Purpose

This skill spawns a subagent with forked context to:
1. Analyze the current session's ADD flow patterns
2. Generate a reflection summary
3. Save insights to `.add-session-history.md`
4. Return a brief summary to main conversation

The forked context ensures reflection work doesn't pollute the main conversation window.

## When to Invoke

**User-invoked:**
- User says "/add-reflect" or "reflect on this session"
- User asks "what patterns have emerged?"
- User wants to capture session insights before ending

**Model-invoked:**
- At significant completion milestones (liveline moments)
- When session has been particularly rich with realm transitions
- Before natural conversation endings
- After resolving a stuck pattern

## Reflection Analysis

The subagent should analyze:

### Realm Distribution
- Time spent in each realm (Assess/Decide/Do)
- Balance assessment
- Dominant realm for this session

### Transition Quality
- Number and nature of transitions
- Smooth vs. abrupt transitions
- Any realm skipping (Assess→Do without Decide)

### Pattern Recognition
- Stuck patterns that emerged
- How they were resolved (if at all)
- Healthy flow moments

### Key Topics
- Main subjects explored
- Decisions made
- Tasks completed (livelines created)

### Imbalances Detected
- Analysis paralysis episodes
- Decision avoidance moments
- Execution shortcuts
- Perpetual doing without reflection

## Output Format

### To Session History File (`.add-session-history.md`)

```markdown
## Session: {date} {time}

### Summary
{2-3 sentence overview}

### Realm Distribution
- Assess: {percentage/count}
- Decide: {percentage/count}
- Do: {percentage/count}

### Flow Quality
{assessment: Balanced | Assess-heavy | Decide-heavy | Do-heavy | Stuck}

### Key Transitions
- {transition 1 description}
- {transition 2 description}

### Topics Covered
- {topic 1}: {outcome}
- {topic 2}: {outcome}

### Patterns Observed
- {pattern 1}
- {pattern 2}

### Livelines Created
- {completion 1}
- {completion 2}

---
```

### To Main Conversation (Brief)

```
Session reflection captured.

Quick summary:
- Flow quality: {assessment}
- Realm focus: {dominant realm}
- Key insight: {one-sentence pattern observation}

Full reflection saved to .add-session-history.md
```

## Subagent Instructions

When this skill is invoked:

1. **Fork current context** - Preserve full conversation history
2. **Analyze session** - Review all exchanges for ADD patterns
3. **Generate reflection** - Create structured analysis
4. **Append to history** - Add to `.add-session-history.md` (create if needed)
5. **Return summary** - Brief message to main conversation

## File Management

- Create `.add-session-history.md` if it doesn't exist
- Append new reflections (don't overwrite)
- Use markdown headers with timestamps for each session
- Keep history file readable and scannable

## Privacy Note

Session history stays local in the project directory. Users can:
- Delete `.add-session-history.md` to clear history
- Add it to `.gitignore` to keep private
- Review it anytime for personal pattern awareness

## Reference Files

@docs/ADD_FLOW_STATUS_EXTENSION.md
@docs/ADD_PHILOSOPHY.md
