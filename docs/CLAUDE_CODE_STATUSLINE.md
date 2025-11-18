# Claude Code Statusline Integration

## Overview

This guide enables persistent visual ADD Flow status in Claude Code's interface. Instead of seeing flow status only in conversation messages, you get a **live statusline** at the bottom of your Claude Code window that updates automatically as you work.

**What you'll see:**
```
[ADD Flow: 🔴+ Assess | Exploring implementation options]
```

Real-time realm tracking (🔴 Assess, 🟠 Decide, 🟢 Do) with contextual pattern descriptions.

---

## Why Use Statusline?

**Benefits:**
- **Ambient awareness** - Always visible, never intrusive
- **Real-time updates** - Changes as conversation progresses
- **Visual realm tracking** - Color-coded for quick recognition
- **Session metrics** - Tracked internally, available on request
- **Project-specific** - Each project maintains its own flow state

**When it's valuable:**
- Long coding sessions where flow awareness helps
- Complex projects with frequent context switching
- Learning ADD framework patterns through visual feedback
- ADHD users who benefit from persistent visual cues

---

## Prerequisites

**Required:**
- Claude Code installed and working
- ADD framework integrated (see [main README](../README.md#quick-start))
- Basic command line familiarity

**Recommended:**
- Understanding of ADD framework realms (Assess/Decide/Do)
- Familiarity with `.claude/settings.json` configuration

---

## Setup Guide

### Step 1: Create Statusline Script

**Option A: Copy from templates (Recommended)**

```bash
# From your project root
cp templates/claude-code/statusline.sh .claude/statusline.sh
chmod +x .claude/statusline.sh
```

**Option B: Create manually**

1. Create the script file:
```bash
mkdir -p .claude
touch .claude/statusline.sh
chmod +x .claude/statusline.sh
```

2. Copy the script content from [templates/claude-code/statusline.sh](../templates/claude-code/statusline.sh) into `.claude/statusline.sh`

---

### Step 2: Configure Claude Code Settings

**Create or update `.claude/settings.json` in your project root:**

```json
{
  "statusLine": {
    "type": "command",
    "command": ".claude/statusline.sh",
    "padding": 0
  }
}
```

**What this does:**
- Tells Claude Code to run `.claude/statusline.sh` for statusline content
- Updates automatically when conversation messages change (max 300ms)
- Reads from `.add-status` file for current state

---

### Step 3: Verify Setup

**Test the script manually:**
```bash
./.claude/statusline.sh
```

**Expected output:**
```
[ADD Flow: Initializing exchange]
```

If you see this, the script works! The statusline will start displaying once `.add-status` file is created during your first ADD-aware conversation.

**Check Claude Code:**
1. Restart Claude Code (or reload window)
2. Start a conversation
3. Look at the bottom of the interface for the statusline

---

## How It Works

### Architecture

```
┌─────────────────────────────────────────────┐
│         Claude (in conversation)            │
│  Generates flow status during responses    │
└─────────────────┬───────────────────────────┘
                  │ writes
                  ▼
          ┌───────────────┐
          │  .add-status  │  (session state file)
          └───────┬───────┘
                  │ reads
                  ▼
        ┌──────────────────────┐
        │  statusline.sh       │  (display script)
        └──────────┬───────────┘
                   │ outputs
                   ▼
     ┌─────────────────────────────┐
     │   Claude Code Statusline    │
     │  [ADD Flow: 🔴+ Assess...]  │
     └─────────────────────────────┘
```

### File Format

**`.add-status` contents:**
```
REALM|EMOJI|PATTERN_DESCRIPTION|EXCHANGES|TRANSITIONS
```

**Example:**
```
Assess|🔴+|Exploring options - gathering context|12|2
```

**Fields:**
- `REALM`: Assess, Decide, or Do
- `EMOJI`: Realm symbol (🔴+, 🟠?, 🟢-)
- `PATTERN_DESCRIPTION`: Contextual description of current activity
- `EXCHANGES`: Number of user-assistant exchanges
- `TRANSITIONS`: Number of realm changes

**Display format:**
```
[ADD Flow: 🔴+ Assess | Exploring options - gathering context]
```

Metrics (exchanges, transitions) are tracked but not displayed. Ask Claude in natural language to see them:
- "How many exchanges have we had?"
- "Show me session metrics"
- "What's my flow status?"

---

## Customization

### Change Colors

Edit `.claude/statusline.sh` color codes:

```bash
# ANSI color codes
RED='\033[0;31m'      # Assess realm
ORANGE='\033[0;33m'   # Decide realm
GREEN='\033[0;32m'    # Do realm
RESET='\033[0m'
BOLD='\033[1m'
```

### Adjust Display Format

Modify the output line in `statusline.sh`:

```bash
# Current format
echo -e "[${BOLD}ADD Flow:${RESET} ${COLOR}${emoji} ${realm}${RESET} | ${pattern}]"

# Add project name
echo -e "[${PROJECT_NAME} - ADD Flow: ${COLOR}${emoji} ${realm}${RESET} | ${pattern}]"

# Shorter format
echo -e "[${COLOR}${emoji} ${realm}${RESET} | ${pattern}]"
```

### Show Metrics in Statusline

Uncomment this line in `statusline.sh`:

```bash
# Add after pattern
echo -e "[${BOLD}ADD Flow:${RESET} ${COLOR}${emoji} ${realm}${RESET} | ${pattern} - ${exchanges}ex, ${transitions}tr]"
```

---

## Troubleshooting

### Statusline not appearing

**Check 1: Script exists and is executable**
```bash
ls -la .claude/statusline.sh
```
Should show `-rwxr-xr-x` (executable flag)

**Fix:**
```bash
chmod +x .claude/statusline.sh
```

**Check 2: Settings configured**
```bash
cat .claude/settings.json
```
Should contain `statusLine` configuration

**Check 3: Test script manually**
```bash
./.claude/statusline.sh
```
Should output statusline text

**Check 4: Restart Claude Code**
Settings changes require restart or reload

---

### Shows "Initializing exchange" forever

**Cause:** `.add-status` file not created yet

**Solution:**
1. Ensure ADD framework is loaded (check CLAUDE.md or custom instructions)
2. Start a conversation with ADD-aware Claude
3. Claude will create `.add-status` automatically during flow status updates

**Quick test:**
```bash
# Create test status manually
echo "Assess|🔴+|Testing statusline|1|0" > .add-status
./.claude/statusline.sh
```

Should display:
```
[ADD Flow: 🔴+ Assess | Testing statusline]
```

---

### Shows error message

**"Error reading status - Permission denied"**
- Check file permissions: `chmod 644 .add-status`
- Ensure script can read from current directory

**"No such file or directory"**
- Script path in settings.json incorrect
- Use `.claude/statusline.sh` (project-relative) not `~/.claude/statusline.sh`

**Script not found**
- Ensure script is in `.claude/statusline.sh`
- Check settings.json path matches actual location

---

### Colors not displaying

**Terminal doesn't support ANSI colors:**
- Most modern terminals support this
- Try different terminal emulator
- Or remove color codes from script

**Colors look wrong:**
- Depends on terminal theme
- Adjust color codes in script
- Test with `echo -e "\033[0;31mRED\033[0m"`

---

### Multiple projects interference

**Each project maintains separate status:**
- `.add-status` is project-specific
- Switching projects = different statusline
- Each `.claude/statusline.sh` can be customized per-project

**Global statusline:**
If you want same statusline across projects, use `~/.add-status` and `~/.claude/statusline.sh` (not recommended - loses project specificity)

---

## FAQ

### Do I need this for ADD framework to work?

**No.** The ADD framework works perfectly without statusline. This is an optional visual enhancement for Claude Code users.

### Will this work in terminal/VSCode/other editors?

**Partially.** The script works anywhere bash runs, but:
- **Claude Code**: Full integration via settings.json ✅
- **Terminal (tmux)**: Can display in tmux status bar (see below)
- **VSCode**: No built-in support (Claude Code only)
- **Other editors**: Depends on statusline capabilities

### Can I use this with tmux?

**Yes!** Add to `.tmux.conf`:

```bash
set -g status-right "#(cat /path/to/project/.add-status 2>/dev/null | cut -d'|' -f1-3 | tr '|' ' ' || echo 'ADD Flow: Ready') "
set -g status-interval 1
```

This shows simplified status in tmux status bar.

### How do I disable it temporarily?

**Option 1: Remove from settings**
Comment out in `.claude/settings.json`:
```json
{
  // "statusLine": {
  //   "type": "command",
  //   "command": ".claude/statusline.sh"
  // }
}
```

**Option 2: Make script return empty**
Edit `.claude/statusline.sh` to just `exit 0`

**Option 3: Delete .add-status**
```bash
rm .add-status
```
Statusline will show "Initializing exchange" until next update

### Does this affect performance?

**Negligible impact.** Script runs:
- Only when conversation updates (user message or Claude response)
- Maximum frequency: 300ms
- Lightweight bash script, fast execution

### Can I see historical flow patterns?

**Not currently.** `.add-status` only shows current session state.

**Future enhancement:** Session logging could track:
- Full conversation flow history
- Realm transition patterns
- Time spent in each realm
- Decision points and completions

Would you like to see this feature? Open a GitHub issue!

### What if I work on multiple sessions simultaneously?

**Each Claude Code window is independent:**
- Separate `.add-status` per project
- No conflict between sessions
- Each tracks its own flow state

**Caution:** If multiple Claude instances edit same project, last write wins. Shouldn't cause issues in practice.

---

## Advanced: Extending the Script

### Add Timestamp

```bash
timestamp=$(date '+%H:%M')
echo -e "[${timestamp}] [${BOLD}ADD Flow:${RESET} ${COLOR}${emoji} ${realm}${RESET} | ${pattern}]"
```

### Add Git Branch

```bash
branch=$(git branch --show-current 2>/dev/null || echo "")
if [ -n "$branch" ]; then
    echo -e "[${branch}] [${BOLD}ADD Flow:${RESET} ${COLOR}${emoji} ${realm}${RESET} | ${pattern}]"
fi
```

### Notifications on Realm Change

Track previous realm and notify on change:

```bash
PREV_REALM_FILE=".add-status.prev"
if [ -f "$PREV_REALM_FILE" ]; then
    prev_realm=$(cat "$PREV_REALM_FILE")
    if [ "$prev_realm" != "$realm" ]; then
        # Realm changed - could trigger notification
        osascript -e "display notification \"Transitioned to $realm\" with title \"ADD Flow\""
    fi
fi
echo "$realm" > "$PREV_REALM_FILE"
```

---

## Next Steps

**After setup:**
1. Start ADD-aware conversation in Claude Code
2. Watch statusline update as conversation progresses
3. Notice realm changes (🔴 → 🟠 → 🟢)
4. Ask Claude for session metrics when curious

**Learn more:**
- [ADD Framework Core](../ADD_FRAMEWORK_MEGAPROMPT.md) - Deep framework understanding
- [Flow Status Extension](../ADD_FLOW_STATUS_EXTENSION.md) - Observability layer details
- [Modular Architecture](../ADD_MODULAR_ARCHITECTURE.md) - Configuration levels

**Get help:**
- [Main Troubleshooting Guide](../integration/troubleshooting.md)

---

**Ready to experience ambient flow awareness?**

[← Back to README](../README.md) | [View Template Script](../templates/claude-code/statusline.sh)
