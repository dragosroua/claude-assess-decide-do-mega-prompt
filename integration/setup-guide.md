# ADD Framework Integration - Setup Guide

Complete step-by-step instructions for integrating the Assess-Decide-Do framework into your Claude workflow.

## Prerequisites

- Access to Claude (via claude.ai, Claude Desktop, or Claude Code)
- Basic familiarity with markdown files
- (Optional) Git for cloning the repository

## Installation Options

Choose the integration level that matches your needs:

### Option 1: Quick Start - Custom Instructions (5 minutes)

**Best for**: Users who want ADD awareness in all Claude conversations

**Steps**:

1. **Access Claude Settings**
   - Go to claude.ai and log in
   - Click your profile icon (bottom left)
   - Select "Settings"
   - Navigate to "Custom Instructions"

2. **Add ADD Framework Instructions**
   Copy and paste this into your custom instructions:
   ```
   Framework: Operate with Assess-Decide-Do (ADD) life management framework.
   
   Core principles:
   - Detect user's current realm: Assess (explore), Decide (commit), Do (execute)
   - Identify imbalances: analysis paralysis, decision avoidance, execution shortcuts
   - Guide balanced flow between realms
   - Structure responses appropriately for each realm
   
   When relevant, reference ADD_FRAMEWORK_MEGAPROMPT.md for detailed guidance.
   ```

3. **Test the Integration**
   Start a new conversation and try:
   - "I'm exploring options for X..." (Assess realm - Claude should support exploration)
   - "I need to choose between A and B..." (Decide realm - Claude should support decision-making)
   - "How do I implement X?" (Do realm - Claude should provide execution guidance)

4. **Verify Success**
   You should notice:
   - Responses aligned with your realm
   - Gentle guidance when stuck in one realm
   - No premature pushing (e.g., to decide when you're assessing)

### Option 2: Per-Conversation Activation (2 minutes per conversation)

**Best for**: Users who want ADD awareness for specific conversations only

**Steps**:

1. **Clone or Download This Repository**
   ```bash
   git clone https://github.com/dragosroua/add-claude-framework.git
   ```
   Or download as ZIP from GitHub

2. **Locate ADD_FRAMEWORK_MEGAPROMPT.md**
   File location: `docs/ADD_FRAMEWORK_MEGAPROMPT.md`

3. **Start Your Conversation**
   Begin any Claude conversation with:
   ```
   Load and operate with ADD framework awareness from ADD_FRAMEWORK_MEGAPROMPT.md
   throughout this conversation. Detect realms, identify imbalances, guide
   balanced flow.
   ```

4. **Upload the Mega Prompt (if using web interface)**
   - Attach `docs/ADD_FRAMEWORK_MEGAPROMPT.md` to the conversation
   - Claude will read and integrate it automatically

5. **For Claude Desktop/Code**
   - Place the repository in an accessible location
   - Reference the file path in your initial message

### Option 3: Project-Level Integration (10 minutes)

**Best for**: Developers using Claude Code or working on specific projects

**Steps**:

1. **Clone the Repository**
   ```bash
   git clone https://github.com/dragosroua/add-claude-framework.git
   cd add-claude-framework
   ```

2. **Copy Files to Your Project**
   ```bash
   # Create ADD directory in your project
   mkdir -p your-project/.claude-add
   
   # Copy essential files
   cp docs/ADD_FRAMEWORK_MEGAPROMPT.md your-project/.claude-add/
   cp docs/ADD_QUICK_REFERENCE.md your-project/.claude-add/
   ```

3. **Create .claude File**
   In your project root, create `.claude`:
   ```yaml
   instructions: |
     Operate with Assess-Decide-Do (ADD) life management framework.
     
     Core integration:
     - Detect user's realm (Assess/Decide/Do) from language patterns
     - Identify workflow imbalances
     - Structure responses appropriate to current realm
     - Guide balanced flow without being heavy-handed
     
     Load ADD_FRAMEWORK_MEGAPROMPT.md for complete framework guidance.
   
   context_files:
     - .claude-add/ADD_FRAMEWORK_MEGAPROMPT.md
     - .claude-add/ADD_QUICK_REFERENCE.md
   ```

4. **Test in Claude Code**
   - Open your project in Claude Code
   - Start a coding session
   - Claude should operate with ADD awareness automatically

5. **Verify Integration**
   Try these tests:
   - Explore technical approaches (Assess) - no premature implementation
   - Discuss architecture decisions (Decide) - supportive of commitment
   - Request implementation (Do) - focused execution guidance

### Option 4: Deep Integration with Memory (Advanced)

**Best for**: Users wanting persistent ADD awareness across all sessions

**Steps**:

1. **Complete Option 1 (Custom Instructions)**
   Follow steps above to set base integration

2. **Add Memory Edits**
   In any Claude conversation, say:
   ```
   Please add these memory edits:
   1. "User operates with Assess-Decide-Do (ADD) framework"
   2. "Detect user's realm and guide balanced flow"
   3. "Reference ADD_FRAMEWORK_MEGAPROMPT.md for ADD integration"
   ```

3. **Verify Memory Integration**
   Start a new conversation and check if Claude:
   - References ADD framework naturally
   - Detects realms without being told
   - Guides flow appropriately

4. **Calibrate Over Time**
   As you use ADD-enhanced Claude:
   - Provide feedback on interventions (too pushy vs. too subtle)
   - Refine memory edits based on what works
   - Adjust custom instructions as needed

## Configuration Examples

### Example 1: Content Creator Setup

**Custom Instructions**:
```
ADD Framework for Content Creation:
- Assess: Brainstorm topics, research, explore angles
- Decide: Choose structure, commit to key messages
- Do: Write, edit, publish

Detect realm from my language. Guide balanced flow.
Load ADD_FRAMEWORK_MEGAPROMPT.md when needed.
```

### Example 2: Developer Setup

**.claude file**:
```yaml
project: "My Development Project"

instructions: |
  ADD Framework for Development:
  - Assess: Explore technical approaches, evaluate trade-offs
  - Decide: Commit to architecture, choose implementation
  - Do: Code, test, deploy
  
  Enforce realm boundaries:
  - No premature implementation during assessment
  - No re-architecture during execution
  
  Load ADD_FRAMEWORK_MEGAPROMPT.md for complete guidance.

context_files:
  - .claude-add/ADD_FRAMEWORK_MEGAPROMPT.md
```

### Example 3: Business Strategist Setup

**Custom Instructions + Memory**:
```
Custom Instructions:
ADD Framework for Business Strategy
- Assess realm: Market research, competitive analysis
- Decide realm: Focus areas, resource allocation
- Do realm: Campaign execution, measurement

Memory Edits:
1. "User applies ADD framework to business strategy"
2. "Detect realm from business language patterns"
3. "Guide flow between research, decision, and execution phases"
```

## Verification & Testing

### Quick Verification Test

Run this test sequence in a new conversation:

**Test 1: Assess Detection**
```
You: "I'm exploring options for a new blog. What topics could I write about?"

Expected: Claude provides expansive exploration without pushing to decide.
Should NOT say: "You should choose X" or "Start with Y"
```

**Test 2: Decide Detection**
```
You: "I've explored 5 blog topics thoroughly. I need to choose one. Help me decide."

Expected: Claude supports decision-making, asks values-based questions.
Should NOT say: "Let me give you more options to explore"
```

**Test 3: Do Detection**
```
You: "I've decided on the blog topic. How do I actually start writing?"

Expected: Claude provides clear execution steps.
Should NOT say: "Are you sure about that topic? Maybe reconsider..."
```

**Test 4: Imbalance Detection**
```
You: [After 5 messages exploring] "Maybe I should research 10 more topics first?"

Expected: Claude gently identifies analysis paralysis and guides toward Decide.
Should say something like: "You've done thorough assessment. Ready to explore what choosing might look like?"
```

### Full Test Scenarios

See `examples/test-scenarios.md` for comprehensive testing instructions.

## Troubleshooting Common Issues

### Issue: "Claude doesn't seem ADD-aware"

**Solutions**:
1. Verify mega prompt is loaded (check file path)
2. Ensure custom instructions are saved
3. Try explicit activation: "Operate with ADD framework from now on"
4. Check if you're using clear realm language in your requests

### Issue: "Interventions feel too heavy-handed"

**Solutions**:
1. Provide calibration feedback: "That felt pushy"
2. Add to instructions: "Guide subtly, don't lecture about ADD"
3. Request: "Operate with ADD but keep framework mostly invisible"

### Issue: "Not noticing any difference"

**Solutions**:
1. Test with deliberate imbalances (stay in Assess for extended period)
2. Use explicit realm language ("I'm exploring..." vs "I need to decide...")
3. Try comparison: same task with and without ADD integration
4. Focus on feeling/flow rather than explicit framework mentions

### Issue: "Claude mentions ADD too much"

**Solutions**:
1. Say: "Operate with ADD awareness but don't name it unless relevant"
2. Update instructions: "Framework operates implicitly, not explicitly"
3. Provide feedback: "Less ADD terminology, more natural guidance"

## Success Indicators

You'll know integration is working when you experience:

✅ **Reduced friction** - Fewer misaligned responses
✅ **Clearer thinking** - Better workflow structure
✅ **Natural flow** - Smooth realm transitions
✅ **Balanced work** - Not stuck in one realm
✅ **Better completions** - Higher finish rate
✅ **Relational quality** - Claude feels more collaborative

## Next Steps

After successful integration:

1. **Use Daily** - Let ADD awareness become natural
2. **Provide Feedback** - Help calibrate interventions
3. **Explore Domains** - Try ADD in different work contexts
4. **Share Insights** - Contribute to GitHub discussions
5. **Evolve Setup** - Refine based on what works for you

## Support & Resources

- **GitHub Issues**: Report problems or ask questions
- **Documentation**: Read complete guides in `docs/`
- **Examples**: Check `examples/` for configuration files
- **Blog Post**: Read the full story at dragosroua.com
- **addTaskManager**: Try the iOS/macOS app for deeper ADD experience

## Advanced Configuration

For advanced users wanting deeper integration:

- **MCP Server Integration**: See `docs/ADD_TECHNICAL_INTEGRATION.md`
- **Custom Skills**: Build ADD-aware skills for specific domains
- **Memory Systems**: Persistent realm tracking across conversations
- **Tool Restrictions**: Enforce realm boundaries programmatically

---

**Questions?** Open an issue on GitHub or visit dragosroua.com for more ADD resources.

**Ready to begin?** Pick your integration option above and start experiencing ADD-enhanced Claude collaboration.
