# ADD Framework Integration - Troubleshooting Guide

Common issues and solutions when integrating the Assess-Decide-Do framework with Claude.

## Table of Contents
- [Integration Issues](#integration-issues)
- [Detection Issues](#detection-issues)
- [Intervention Issues](#intervention-issues)
- [Experience Issues](#experience-issues)
- [Technical Issues](#technical-issues)

## Integration Issues

### Claude doesn't seem ADD-aware

**Symptoms**:
- Responses feel generic
- No realm detection
- No flow guidance
- Framework not operational

**Diagnosis**:
1. Check if mega prompt is actually loaded
2. Verify file path in `.claude` or custom instructions
3. Confirm conversation started with ADD activation

**Solutions**:

**For Custom Instructions**:
```
1. Go to Settings → Custom Instructions
2. Verify this text is present:
   "Operate with Assess-Decide-Do (ADD) framework"
3. Save and refresh
4. Start NEW conversation (doesn't apply to existing ones)
```

**For Per-Conversation**:
```
1. Explicitly say: "Load ADD_FRAMEWORK_MEGAPROMPT.md and operate 
   with ADD awareness throughout this conversation"
2. Attach/reference the actual file
3. Verify Claude confirms loading
```

**For Project-Level**:
```
1. Check .claude file exists in project root
2. Verify file paths are correct (relative to project root)
3. Confirm Claude Code has access to the directory
4. Restart Claude Code session
```

**Quick Test**:
Say: "I'm exploring options for X" and see if Claude stays in exploratory mode without pushing to decide/execute.

### ADD seems partially working

**Symptoms**:
- Occasional realm detection
- Inconsistent flow guidance
- Framework "fades" during conversation

**Diagnosis**:
ADD awareness may not be deeply integrated, or context got lost.

**Solutions**:

1. **Reinforce Mid-Conversation**:
   ```
   "Remember to operate with ADD framework awareness - 
   detect realms, identify imbalances, guide flow"
   ```

2. **Check Context Length**:
   - Very long conversations may lose ADD context
   - Reinforce framework periodically
   - Or start fresh conversation with ADD loaded

3. **Strengthen Instructions**:
   Update custom instructions to emphasize ADD priority:
   ```
   PRIORITY FRAMEWORK: Assess-Decide-Do (ADD)
   - This framework overrides generic response patterns
   - Always detect realm before responding
   - Guide balanced flow as primary objective
   ```

### ADD works in some conversations but not others

**Symptoms**:
- Inconsistent ADD awareness across conversations
- Some sessions feel ADD-aligned, others don't

**Diagnosis**:
Likely using per-conversation activation without consistency.

**Solutions**:

1. **Switch to Custom Instructions**: Makes ADD persistent across all conversations

2. **Use Memory Edits**: Add to Claude's memory:
   ```
   "User operates with ADD framework and expects realm detection"
   ```

3. **Create Conversation Template**: Keep a saved message you can paste at start:
   ```
   "Load ADD_FRAMEWORK_MEGAPROMPT.md. Operate with ADD awareness:
   detect realms, identify imbalances, guide balanced flow."
   ```

## Detection Issues

### Claude misidentifies my realm

**Symptoms**:
- You're exploring but Claude pushes to decide
- You're deciding but Claude offers more options to assess
- You're executing but Claude suggests re-evaluation

**Diagnosis**:
Language patterns aren't clearly signaling your realm.

**Solutions**:

1. **Use Explicit Realm Language**:
   - Assess: "I'm exploring...", "I'm not sure yet...", "What are my options..."
   - Decide: "I need to choose...", "Should I...", "I want to commit to..."
   - Do: "How do I actually...", "I'm working on...", "Steps to complete..."

2. **Name Your Realm Explicitly**:
   ```
   "I'm in Assess mode right now - just exploring possibilities"
   "I'm ready to move to Decide - help me choose"
   "I'm in Do mode - need execution guidance only"
   ```

3. **Provide Feedback**:
   ```
   "That response pushed me toward decision, but I'm still assessing"
   "I was looking for execution help, not re-evaluation"
   ```

4. **Check Your Language Patterns**: Review your messages - do they actually signal the realm you think you're in?

### Claude doesn't detect my imbalances

**Symptoms**:
- Stuck in analysis paralysis but no intervention
- Avoiding decisions but not guided
- Jumping to execution without foundation but not slowed down

**Diagnosis**:
Either imbalance isn't severe enough yet, or detection threshold too high.

**Solutions**:

1. **Lower Intervention Threshold**:
   Add to instructions:
   ```
   "Be more proactive in detecting imbalances
   - Analysis paralysis: after 3-4 Assess exchanges
   - Decision avoidance: when info is sufficient but no commitment
   - Execution shortcut: when jumping to 'how' without 'why'"
   ```

2. **Request Explicit Check**:
   ```
   "Do you notice any realm imbalances in our conversation?"
   "Am I stuck in a particular realm?"
   ```

3. **Make Pattern More Obvious**: If you're testing detection, exaggerate the imbalance:
   ```
   Multiple messages asking for more options
   Repeatedly postponing decision
   Continuous jumping between topics
   ```

## Intervention Issues

### Interventions feel too pushy

**Symptoms**:
- Claude lectures about ADD
- Guidance feels controlling
- Framework overshadows actual work
- Interventions break flow rather than support it

**Diagnosis**:
Intervention style too explicit or frequent.

**Solutions**:

1. **Calibrate Intervention Style**:
   ```
   "Your ADD guidance is helpful but feels too explicit.
   Operate more subtly - gentle nudges not lectures."
   ```

2. **Update Instructions**:
   ```
   ADD Framework Integration - Subtle Mode:
   - Detect realms silently
   - Intervene only when imbalance is significant
   - Guide through natural conversation, not framework terminology
   - Framework operates beneath surface
   ```

3. **Set Boundaries**:
   ```
   "Don't mention ADD explicitly unless I ask about it.
   Just operate with ADD awareness implicitly."
   ```

4. **Provide Specific Feedback**:
   ```
   "That felt pushy: [quote the response]
   Better approach would be: [describe what you wanted]"
   ```

### Interventions are too subtle (not noticing them)

**Symptoms**:
- No guidance when stuck
- Imbalances continue unaddressed
- Framework feels inactive

**Diagnosis**:
Interventions too gentle or ADD too implicit.

**Solutions**:

1. **Request Explicit Mode**:
   ```
   "Be more direct with ADD interventions.
   Name the realm, identify imbalances clearly."
   ```

2. **Lower Subtlety**:
   Update instructions:
   ```
   "When detecting imbalances, make interventions clear:
   - Name the realm I'm in
   - Identify the imbalance pattern
   - Suggest realm transition explicitly"
   ```

3. **Ask for Analysis**:
   ```
   "Analyze our conversation through ADD lens.
   What realm am I in? Any imbalances?"
   ```

### Interventions at wrong timing

**Symptoms**:
- Pushed to decide too early
- Prevented from completing natural assessment
- Interrupted during focused execution

**Diagnosis**:
Timing thresholds need calibration.

**Solutions**:

1. **Provide Timing Feedback**:
   ```
   "That intervention was too early - I wasn't done assessing"
   "That was perfect timing - I was stuck"
   "Too late - I'd already decided"
   ```

2. **Adjust Thresholds**:
   Add to instructions:
   ```
   "Intervention timing:
   - Let Assess run longer before suggesting Decide
   - Catch decision avoidance earlier
   - Don't interrupt focused Do execution"
   ```

3. **Request Permission Model**:
   ```
   "Before intervening, ask:
   'You've been exploring for a while. Ready to move toward decision?'
   Rather than: 'Time to decide'"
   ```

## Experience Issues

### Not feeling the "smoothness" mentioned

**Symptoms**:
- Interactions feel same as before
- No sense of improved flow
- Missing the relational quality

**Diagnosis**:
Either ADD not deeply integrated, or expectations mismatch.

**Solutions**:

1. **Verify Deep Integration**: Run full test suite from `examples/test-scenarios.md`

2. **Check Expectations**:
   - "Smoothness" is subtle, not dramatic
   - Look for: fewer misaligned responses, better workflow structure
   - It's cumulative - becomes more noticeable over time

3. **Try Comparison**:
   - Have same conversation twice
   - Once with ADD, once without
   - Notice the difference in flow

4. **Focus on Specific Benefits**:
   Rather than general "smoothness", track:
   - How many times responses feel "off"
   - How often you get stuck in one realm
   - How clear your workflow progression feels

5. **Give It Time**:
   ADD integration benefits compound:
   - Week 1: Subtle differences
   - Week 2: Patterns become visible
   - Week 3+: Natural flow develops

### Claude feels less helpful, more restricted

**Symptoms**:
- Responses feel limited
- Framework feels constraining
- Preferred generic Claude

**Diagnosis**:
ADD integration creating friction rather than reducing it.

**Solutions**:

1. **This Framework Might Not Suit You**: ADD isn't universal. Some people prefer:
   - Free-form exploration without structure
   - Pure task-completion focus
   - No workflow meta-awareness

   **It's okay to not use ADD if it doesn't serve you.**

2. **Try Lighter Integration**:
   - Remove custom instructions
   - Use ADD only for specific projects
   - Apply selectively rather than universally

3. **Adjust Strictness**:
   ```
   "Operate with ADD awareness but don't enforce realm boundaries rigidly.
   Use framework as guide, not rule system."
   ```

4. **Disable Temporarily**:
   ```
   "Pause ADD framework for this conversation.
   Operate without realm detection."
   ```

### Can't tell if ADD is active or not

**Symptoms**:
- Framework too invisible
- No clear indication of operation
- Uncertainty about integration status

**Diagnosis**:
ADD operating at implicit level without visibility.

**Solutions**:

1. **Request Visibility**:
   ```
   "When operating with ADD, occasionally mention which realm
   you detect me in. Make framework visible."
   ```

2. **Add Explicit Markers**:
   Update instructions:
   ```
   "Begin responses with subtle realm indicator:
   [Assess mode] or [Decide support] or [Do execution]
   Or integrate naturally: 'As you're exploring...' or 'To support your decision...'"
   ```

3. **Request Status Checks**:
   ```
   "At conversation milestones, summarize:
   - Which realm we're in
   - Flow progression so far
   - Any imbalances noticed"
   ```

## Technical Issues

### .claude file not loading

**Symptoms**:
- Project-level instructions ignored
- ADD not active despite .claude file
- File seems invisible to Claude

**Diagnosis**:
Path issues, syntax errors, or Claude Code not reading file.

**Solutions**:

1. **Verify File Location**:
   ```bash
   # .claude should be in PROJECT ROOT
   your-project/
   ├── .claude          # ← Here
   ├── .claude-add/
   ├── src/
   └── ...
   ```

2. **Check File Syntax**:
   ```yaml
   # Must be valid YAML
   instructions: |
     Your instructions here
     Multi-line is fine
   
   context_files:
     - path/to/file.md
   ```

3. **Verify File Permissions**:
   ```bash
   ls -la .claude
   # Should be readable
   chmod 644 .claude
   ```

4. **Try Absolute Paths**:
   If relative paths fail, use absolute:
   ```yaml
   context_files:
     - /absolute/path/to/ADD_FRAMEWORK_MEGAPROMPT.md
   ```

5. **Restart Claude Code**:
   - Close project
   - Reopen
   - Verify .claude is loaded

### File paths not resolving

**Symptoms**:
- Error: "Cannot find file"
- References to ADD documents fail
- Context files not loading

**Diagnosis**:
Path resolution issues.

**Solutions**:

1. **Use Relative Paths from Project Root**:
   ```yaml
   context_files:
     - .claude-add/ADD_FRAMEWORK_MEGAPROMPT.md
     # NOT: ../add-claude-framework/docs/...
   ```

2. **Verify Files Exist**:
   ```bash
   ls -la .claude-add/ADD_FRAMEWORK_MEGAPROMPT.md
   # Should show file
   ```

3. **Copy Files Locally**:
   Don't reference external repository - copy files into project:
   ```bash
   mkdir -p .claude-add
   cp ~/add-claude-framework/docs/*.md .claude-add/
   ```

### ADD documents not updating

**Symptoms**:
- Changes to mega prompt not reflected
- Old version seems cached
- Updates don't take effect

**Diagnosis**:
Caching or stale file references.

**Solutions**:

1. **Start Fresh Conversation**:
   - New conversation picks up current file version
   - Old conversations may reference old content

2. **Explicit Reload**:
   ```
   "Reload ADD_FRAMEWORK_MEGAPROMPT.md and refresh your
   ADD awareness with the updated version"
   ```

3. **Verify File Content**:
   ```bash
   head -n 20 .claude-add/ADD_FRAMEWORK_MEGAPROMPT.md
   # Check that changes are actually in file
   ```

4. **Clear and Restart**:
   - Close all Claude sessions
   - Verify files updated
   - Restart with fresh session

## Getting Help

If issues persist:

1. **GitHub Issues**: Open issue with:
   - Symptoms description
   - Integration method used
   - Example conversation showing problem
   - What you've tried

2. **Community Discussion**: Check existing issues for similar problems

3. **Diagnostics to Share**:
   - Integration method (custom instructions / per-conversation / project-level)
   - Approximate number of ADD-aware conversations
   - Specific examples of misalignment
   - Your expectations vs. actual experience

4. **Blog Comment**: Comment on the blog post at dragosroua.com

## When ADD Might Not Be Right

ADD framework isn't universal. It might not suit you if:

- ❌ You prefer completely unstructured exploration
- ❌ You dislike meta-awareness of thinking processes
- ❌ You find workflow frameworks constraining rather than liberating
- ❌ You work better with pure task-completion focus
- ❌ You prefer AI interactions to be purely transactional

**That's completely fine.** ADD is one approach, not the only approach.

If after trying ADD integration you find it doesn't serve you, simply:
1. Remove custom instructions
2. Don't use .claude files with ADD
3. Work with Claude normally

The framework exists to support, not constrain.

---

**Still stuck?** Open a GitHub issue or visit dragosroua.com for more ADD resources.
