#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Function to get the current status bar state
get_status_state() {
    tmux show -g status | cut -d' ' -f2
}

# Function to toggle the status bar
toggle_status() {
    local current_state=$(get_status_state)
    if [ "$current_state" = "on" ]; then
        tmux set -g status off
    else
        tmux set -g status on
    fi
}

# Get custom key binding or use default
key_binding="$(tmux show-option -gqv @toggle-status-key)"
if [ -z "$key_binding" ]; then
    key_binding="M-s"  # Default to Alt+s to avoid Emacs keybinding conflicts
fi

# Remove existing binding if it exists
tmux unbind-key -n "$key_binding" 2>/dev/null

# Set up new key binding
tmux bind-key -n "$key_binding" run-shell "\
    current_state=\$(tmux show -g status | cut -d' ' -f2); \
    if [ \"\$current_state\" = \"on\" ]; then \
        tmux set -g status off; \
    else \
        tmux set -g status on; \
    fi"