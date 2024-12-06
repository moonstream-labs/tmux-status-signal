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

# Function to set up the key binding
setup_key_binding() {
    local key_binding="$(tmux show-option -gqv @toggle-status-key)"
    # Default to 'S' if no custom binding is set
    if [ -z "$key_binding" ]; then
        key_binding="S"
    fi
    
    # Remove existing binding if it exists
    tmux unbind-key "C-$key_binding" 2>/dev/null
    
    # Add new binding that directly calls toggle_status
    tmux bind-key "C-$key_binding" run-shell "\
        current_state=\$(tmux show -g status | cut -d' ' -f2); \
        if [ \"\$current_state\" = \"on\" ]; then \
            tmux set -g status off; \
        else \
            tmux set -g status on; \
        fi"
}

main() {
    setup_key_binding
}

main