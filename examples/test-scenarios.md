# ADD Framework Integration - Test Scenarios

Comprehensive scenarios to test and verify ADD framework integration with Claude.

## Quick Verification Tests

### Test 1: Basic Realm Detection

**Scenario**: Test if Claude detects Assess realm correctly

**Your Message**:
```
I'm exploring options for a new blog. I'm not sure what direction to take yet.
What are some possibilities I could consider?
```

**Expected Claude Behavior**:
- ✅ Provides expansive exploration without pressure
- ✅ Offers diverse perspectives and possibilities
- ✅ Asks questions to deepen assessment: "What draws you to blogging?"
- ✅ Doesn't push toward decision
- ❌ Does NOT say: "You should choose X" or "Start with Y"
- ❌ Does NOT provide implementation steps

**Verify**: Claude stays in exploratory mode, supports your assessment without moving you prematurely to Decide realm.

---

### Test 2: Decision Realm Detection

**Scenario**: Test if Claude supports decision-making appropriately

**Your Message**:
```
I've explored 5 blog topics thoroughly for the past two weeks. I know the pros
and cons of each. I need to choose one. The options are: personal development,
tech tutorials, travel writing, productivity systems, or creative fiction.
Help me decide.
```

**Expected Claude Behavior**:
- ✅ Acknowledges assessment work completed
- ✅ Asks values-based questions: "Which resonates most with your vision?"
- ✅ Helps clarify priorities without deciding for you
- ✅ Honors the weight of decisions
- ❌ Does NOT say: "Let me give you 5 more options to explore"
- ❌ Does NOT pull you back into Assess mode

**Verify**: Claude supports your decision-making process, doesn't add more options or restart assessment.

---

### Test 3: Do Realm Detection

**Scenario**: Test if Claude provides execution guidance

**Your Message**:
```
I've decided to focus on productivity systems. I want to start writing today.
How do I actually begin? What are the concrete steps?
```

**Expected Claude Behavior**:
- ✅ Provides clear, actionable steps
- ✅ Focuses on execution and implementation
- ✅ Supports completion and finishing
- ❌ Does NOT say: "Are you sure about that topic? Maybe reconsider..."
- ❌ Does NOT pull you back into assessment or decision

**Verify**: Claude gives execution guidance without questioning your decisions or reopening assessment.

---

### Test 4: Analysis Paralysis Detection

**Scenario**: Test if Claude detects and intervenes on analysis paralysis

**Setup**: Have a conversation exploring options extensively

**Message 1**: "I'm thinking about starting a business. What are some options?"
**Message 2**: "Tell me more about each of those options"
**Message 3**: "What are the risks with each?"
**Message 4**: "Can you give me 5 more business ideas to evaluate?"
**Message 5**: "I found 3 more niches online. Should I research those too?"

**Expected Claude Behavior at Message 4-5**:
- ✅ Gently identifies pattern: "You've done thorough assessment"
- ✅ Invites transition: "Ready to explore what choosing might look like?"
- ✅ Names the pattern without judgment: "Sometimes continued research becomes avoidance"
- ✅ Supportive, not pushy
- ❌ Does NOT just provide more options endlessly

**Verify**: Claude detects stuck-ness in Assess and guides toward Decide without being heavy-handed.

---

### Test 5: Decision Avoidance Detection

**Scenario**: Test if Claude detects reluctance to commit despite sufficient information

**Your Message**:
```
I've researched web frameworks for 6 weeks. I know React, Vue, and Svelte deeply.
I understand the trade-offs. I can see pros and cons clearly. But I still can't
decide. Maybe I should spend another week comparing build tools?
```

**Expected Claude Behavior**:
- ✅ Recognizes sufficient assessment has occurred
- ✅ Identifies decision avoidance pattern
- ✅ Supports moving into Decide realm
- ✅ Validates the weight of decisions
- ✅ Says something like: "You have what you need. This is about stepping into creative choice now."
- ❌ Does NOT enable more assessment
- ❌ Does NOT say: "Sure, here are 5 build tools to compare"

**Verify**: Claude recognizes decision avoidance and supports commitment without forcing.

---

### Test 6: Execution Shortcut Detection

**Scenario**: Test if Claude catches jumping to Do without proper Assess/Decide

**Your Message**:
```
I want to build an app. What's the best tech stack to use?
```

**Expected Claude Behavior**:
- ✅ Slows down the process
- ✅ Invites assessment first: "Before tech choices, what's the app vision?"
- ✅ Says something like: "Understanding your goals will inform tech decisions"
- ✅ Gentle redirect to Assess realm
- ❌ Does NOT immediately list tech stacks
- ❌ Does NOT jump to implementation details

**Verify**: Claude redirects to proper foundation (Assess) before execution.

---

### Test 7: Perpetual Doing Detection

**Scenario**: Test if Claude recognizes burnout-inducing task churning

**Your Message**:
```
I just finished 3 major projects this month. Feeling exhausted. What's the next
thing I should tackle? I have 10 items on my list.
```

**Expected Claude Behavior**:
- ✅ Celebrates completions
- ✅ Identifies Do realm exhaustion
- ✅ Invites new Assess cycle: "Before the next thing, what did these completions teach you?"
- ✅ Encourages reflection and integration
- ✅ Reframes completions as "livelines" (new starting points)
- ❌ Does NOT immediately suggest next tasks
- ❌ Does NOT enable perpetual doing

**Verify**: Claude recognizes burnout pattern and guides toward Assess for reflection.

---

### Test 8: Mid-Execution Re-assessment

**Scenario**: Test how Claude handles doubt during execution

**Your Message**:
```
I'm 3 days into building this feature. But I'm wondering if there's a better
architectural approach. Should I restart with a different pattern?
```

**Expected Claude Behavior**:
- ✅ Helps distinguish: genuine insight vs. mid-execution doubt
- ✅ Asks: "Is this foundational concern or distraction?"
- ✅ Suggests: Finish current cycle, then new Assess-Decide-Do cycle
- ✅ Or validates: If truly foundational, starting new cycle makes sense
- ✅ Makes the choice explicit: continue or officially restart
- ❌ Does NOT automatically enable re-architecture
- ❌ Does NOT just say "yes, try the other approach"

**Verify**: Claude helps clarify whether to continue execution or start new cycle.

---

## Extended Test Scenarios

### Scenario A: Complete Content Creation Cycle

**Test Goal**: Experience full Assess → Decide → Do cycle for blog post

**Phase 1 - Assess**:
```
You: I want to write about productivity, but I'm not sure what angle to take.
What are some possibilities?
```
*Verify*: Claude explores without pushing decision

**Phase 2 - Assess Deep Dive**:
```
You: Tell me more about [one angle Claude suggested]
```
*Verify*: Claude deepens exploration, still no decision pressure

**Phase 3 - Natural Decide Transition**:
```
You: After exploring these options, I'm drawn to [specific angle]. That feels
right. Should I commit to that direction?
```
*Verify*: Claude supports decision, validates transition

**Phase 4 - Decide Commitment**:
```
You: Yes, I'm committing to that angle. Now I need to structure the post.
Help me decide on structure.
```
*Verify*: Claude helps with structure decisions, doesn't edit content

**Phase 5 - Do Execution**:
```
You: Structure is decided. I'm ready to write. Give me a strong opening.
```
*Verify*: Claude provides execution help, doesn't question decisions

**Phase 6 - Do Completion**:
```
You: I finished the post!
```
*Verify*: Claude celebrates, frames as liveline, invites new Assess cycle

---

### Scenario B: Software Development Cycle

**Test Goal**: Experience ADD in coding context

**Phase 1 - Assess Technical Approaches**:
```
You: I need to add real-time features to my app. What are my technical options?
```
*Verify*: Claude explores WebSockets, SSE, polling, etc. without premature architecture decisions

**Phase 2 - Decide Architecture**:
```
You: I've evaluated the approaches. WebSockets fit best. How do I architect this?
```
*Verify*: Claude helps with architectural decisions, doesn't restart option exploration

**Phase 3 - Do Implementation**:
```
You: Architecture decided. Show me the implementation code.
```
*Verify*: Claude provides code, doesn't question architecture

**Phase 4 - Mid-Execution Doubt**:
```
You: Wait, should I have used SSE instead?
```
*Verify*: Claude helps distinguish doubt vs. genuine insight, supports either finishing or restarting

---

### Scenario C: Business Strategy Cycle

**Test Goal**: Experience ADD in strategic planning

**Phase 1 - Market Assessment**:
```
You: I'm considering pivoting my SaaS product. What market factors should I assess?
```
*Verify*: Claude explores market dynamics, competitive landscape, no premature strategy decisions

**Phase 2 - Decision Support**:
```
You: Based on market assessment, I see 3 possible pivots. Help me choose.
```
*Verify*: Claude supports values-based decision-making, helps clarify priorities

**Phase 3 - Execution Planning**:
```
You: I've decided on [specific pivot]. What are the concrete steps to execute?
```
*Verify*: Claude provides execution roadmap, doesn't question the decision

---

## Imbalance-Specific Tests

### Test: Severe Analysis Paralysis

**Setup**: Create extended research loop

Messages 1-8: Keep asking for more information, more options, more data

**At Message 8-10**: Claude should intervene with something like:
```
"You've gathered substantial insight over these exchanges. I notice we're deep
in exploration mode—which has value. But I'm curious: what's preventing
movement toward decision? Is it insufficient information, or something else?"
```

**Verify**: Intervention is gentle, names pattern, invites reflection without forcing.

---

### Test: Decision Paralysis

**Your Message**:
```
I have all the information I need about X, Y, and Z. I know the trade-offs.
I understand the implications. But I can't choose. What should I do?
```

**Expected Response**: Something like:
```
This is the Decide realm—and it can feel weighty because decisions genuinely
shape reality. That's not a bug; it's your creative power showing up. You've
assessed thoroughly. Now it's about trusting yourself to choose. When you
imagine yourself one year from now in each scenario, which version feels most
alive?
```

**Verify**: Claude honors decision weight, supports choosing, doesn't decide for you.

---

### Test: Healthy Flow (Baseline)

**Scenario**: Natural progression through realms

**Message 1**: Explore options (Assess)
**Message 2**: Deepen exploration (Assess continued)
**Message 3**: Express readiness to choose (Transition signal)
**Message 4**: Make commitment (Decide)
**Message 5**: Request implementation (Transition to Do)
**Message 6**: Execute (Do)

**Verify**: Claude supports each phase appropriately, transitions feel natural, no premature pushing or pulling back.

---

## Calibration Tests

### Test: Intervention Timing

Try deliberately staying in Assess for different durations:
- 2 messages: Claude should NOT intervene
- 5 messages: Claude might gently note pattern
- 8+ messages: Claude should intervene

**Purpose**: Calibrate when interventions feel appropriate vs. premature

---

### Test: Intervention Style

Compare these approaches to ADD-aware interactions:
- Very explicit: "You're in Assess mode with analysis paralysis"
- Moderate: "You've explored thoroughly—ready to move toward decision?"
- Subtle: "What feels like it wants your attention now?"

**Purpose**: Find the intervention style that feels supportive vs. controlling

---

## Success Indicators Checklist

After running tests, you should observe:

✅ **Realm Detection**:
- [ ] Claude correctly identifies Assess, Decide, Do from language
- [ ] Responses align with detected realm
- [ ] No premature realm transitions

✅ **Imbalance Detection**:
- [ ] Analysis paralysis caught and addressed
- [ ] Decision avoidance recognized
- [ ] Execution shortcuts redirected
- [ ] Perpetual doing interrupted with reflection

✅ **Flow Quality**:
- [ ] Transitions feel natural, not forced
- [ ] Support matches actual needs
- [ ] Less friction in conversations
- [ ] Clearer workflow structure

✅ **Intervention Quality**:
- [ ] Timing feels appropriate
- [ ] Style feels supportive not controlling
- [ ] Framework mostly invisible unless relevant
- [ ] Guidance helps rather than constrains

✅ **Relational Quality**:
- [ ] Interactions feel more collaborative
- [ ] Sense of being understood
- [ ] Reduced frustration
- [ ] "Smoothness" in conversation flow

---

## What to Do If Tests Fail

1. **Verify Integration**: Confirm ADD framework is actually loaded
2. **Check Instructions**: Review custom instructions or .claude file
3. **Provide Feedback**: Tell Claude when detection/intervention is off
4. **Calibrate**: Adjust intervention thresholds and style
5. **Consult Troubleshooting**: See `integration/troubleshooting.md`

---

## Contributing Test Results

If you discover:
- New imbalance patterns
- Better detection language
- Improved intervention approaches
- Domain-specific applications

Please share via GitHub issues or discussions!

---

**Ready to test?** Start with Quick Verification Tests, then progress to Extended Scenarios as you validate integration quality.
