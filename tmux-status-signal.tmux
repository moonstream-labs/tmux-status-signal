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

# Get custom key binding or use default
key_binding="$(tmux show-option -gqv @toggle-status-key)"
if [ -z "$key_binding" ]; then
    key_binding="M-s"  # Default to Alt+s to avoid Emacs keybinding conflicts
fi

# Remove existing binding if it exists
tmux unbind-key "$key_binding" 2>/dev/null

# Set up new key binding
tmux bind-key "$key_binding" run-shell "$TOGGLE_SCRIPT"