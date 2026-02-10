#!/usr/bin/env bash
#
# tmux-status-signal: Toggle tmux status bar with a single keypress
#

# Get custom key binding or use default (Alt+s)
key_binding="$(tmux show-option -gqv @toggle-status-key)"
: "${key_binding:=M-s}"

# Silently unbind - expected to fail if key not previously bound
tmux unbind-key -n "$key_binding" 2>/dev/null

# Bind toggle key (no prefix required)
tmux bind-key -n "$key_binding" run-shell "\
    if [ \"\$(tmux show -g status | cut -d' ' -f2)\" = 'on' ]; then \
        tmux set -g status off; \
    else \
        tmux set -g status on; \
    fi"
