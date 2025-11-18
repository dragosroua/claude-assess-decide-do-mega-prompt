#!/bin/bash
# ADD Flow Status Line for Claude Code
#
# This script displays the current ADD Flow status in Claude Code's statusline.
# It reads from .add-status file in the project root and formats the output
# with color-coded realm indicators.
#
# Installation:
#   1. Copy this file to .claude/statusline.sh in your project root
#   2. Make it executable: chmod +x .claude/statusline.sh
#   3. Configure in .claude/settings.json (see templates/claude-code/settings.json)
#
# More info: docs/CLAUDE_CODE_STATUSLINE.md

PROJECT_STATUS=".add-status"

# ANSI color codes for realm visualization
RED='\033[0;31m'      # 🔴 Assess - Exploration, gathering
ORANGE='\033[0;33m'   # 🟠 Decide - Evaluation, choosing
GREEN='\033[0;32m'    # 🟢 Do - Execution, completion
RESET='\033[0m'
BOLD='\033[1m'

# Check if status file exists
if [ ! -f "$PROJECT_STATUS" ]; then
    echo "[ADD Flow: Initializing exchange]"
    exit 0
fi

# Read status file with error handling
if ! status=$(cat "$PROJECT_STATUS" 2>&1); then
    echo "[ADD Flow: Error reading status - $status]"
    exit 0
fi

# Parse status components
# File format: REALM|EMOJI|PATTERN|EXCHANGES|TRANSITIONS
IFS='|' read -r realm emoji pattern exchanges transitions <<< "$status"

# Set color based on realm
case "$realm" in
    "Assess")
        COLOR="$RED"
        ;;
    "Decide")
        COLOR="$ORANGE"
        ;;
    "Do")
        COLOR="$GREEN"
        ;;
    *)
        COLOR="$RESET"
        ;;
esac

# Output formatted status with colors
# Note: Metrics (exchanges, transitions) are tracked in file but not displayed
# Ask Claude in natural language to see them: "Show me session metrics"
echo -e "[${BOLD}ADD Flow:${RESET} ${COLOR}${emoji} ${realm}${RESET} | ${pattern}]"

# Optional: Uncomment to show metrics in statusline
# echo -e "[${BOLD}ADD Flow:${RESET} ${COLOR}${emoji} ${realm}${RESET} | ${pattern} - ${exchanges}ex, ${transitions}tr]"
