#!/bin/bash
  # ADD Flow Status Line for Claude Code

  PROJECT_STATUS=".add-status"

  # ANSI color codes
  RED='\033[0;31m'
  ORANGE='\033[0;33m'
  GREEN='\033[0;32m'
  RESET='\033[0m'
  BOLD='\033[1m'

  if [ ! -f "$PROJECT_STATUS" ]; then
      echo "[ADD Flow: Initializing exchange]"
      exit 0
  fi

  # Read status file
  if ! status=$(cat "$PROJECT_STATUS" 2>&1); then
      echo "[ADD Flow: Error reading status - $status]"
      exit 0
  fi

  # Parse status components
  # Format: REALM|EMOJI|PATTERN|EXCHANGES|TRANSITIONS
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

  # Output formatted status with colors (metrics tracked but not displayed)
  echo -e "[${BOLD}ADD Flow:${RESET} ${COLOR}${emoji} ${realm}${RESET} | ${pattern}]"