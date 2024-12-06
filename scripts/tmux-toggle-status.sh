#!/usr/bin/env bash

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

main() {
    toggle_status
}

main