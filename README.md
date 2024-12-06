# Tmux Toggle Status

A tmux plugin that provides a simple key binding to toggle the status bar on and off.

## Features

- Toggle the tmux status bar with a single key binding
- Customizable key binding
- Preserves status bar settings between toggles
- Minimal and lightweight

## Installation

### Using TPM (recommended)

1. Add this line to your `~/.tmux.conf`:
```bash
set -g @plugin 'username/tmux-toggle-status'
```

2. Press `prefix` + <kbd>I</kbd> to fetch and install the plugin.

### Manual Installation

1. Clone the repository:
```bash
git clone https://github.com/username/tmux-toggle-status ~/.tmux/plugins/tmux-toggle-status
```

2. Add this line to your `~/.tmux.conf`:
```bash
run-shell ~/.tmux/plugins/tmux-toggle-status/tmux-toggle-status.tmux
```

3. Reload tmux environment:
```bash
tmux source-file ~/.tmux.conf
```

## Configuration

By default, the status bar toggle is bound to `prefix` + <kbd>Ctrl</kbd> + <kbd>S</kbd>.

You can customize the key binding in your `~/.tmux.conf`:
```bash
set -g @toggle-status-key 'X'  # Replace 'X' with your preferred key
```

## Usage

1. Press `prefix` + <kbd>Ctrl</kbd> + <kbd>S</kbd> (or your custom key binding) to toggle the status bar
2. The status bar will toggle between visible and hidden states

## License

MIT

## Author

[Your Name]