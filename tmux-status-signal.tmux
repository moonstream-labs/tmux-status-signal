#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS_DIR="$CURRENT_DIR/scripts"

# Ensure scripts directory exists
if [ ! -d "$SCRIPTS_DIR" ]; then
    echo "Scripts directory not found: $SCRIPTS_DIR"
    exit 1
fi

# Ensure toggle script exists and is executable
TOGGLE_SCRIPT="$SCRIPTS_DIR/tmux-toggle-status.sh"
if [ ! -f "$TOGGLE_SCRIPT" ]; then
    echo "Toggle script not found: $TOGGLE_SCRIPT"
    exit 1
fi

# Make script executable if it isn't already
chmod +x "$TOGGLE_SCRIPT"

# Set up key binding
tmux bind-key C-S run-shell "$TOGGLE_SCRIPT"