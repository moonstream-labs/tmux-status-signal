#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux bind-key C-s run-shell "$CURRENT_DIR/tmux-toggle-status.sh"