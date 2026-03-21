#!/usr/bin/env zsh
# Run from repo root to sync all tracked configs from their live system locations.
# Usage: ./sync.sh

set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "Syncing dotfiles to $DOTFILES..."

# Shell
cp ~/.zshrc "$DOTFILES/.zshrc"

# Aerospace
cp ~/.config/aerospace/aerospace.toml "$DOTFILES/.config/aerospace/aerospace.toml"

# Ghostty
cp ~/.config/ghostty/config "$DOTFILES/.config/ghostty/config"

# Git
cp ~/.config/git/ignore "$DOTFILES/.config/git/ignore"

# Karabiner (main config only — automatic_backups/ are excluded intentionally)
cp ~/.config/karabiner/karabiner.json "$DOTFILES/.config/karabiner/karabiner.json"

# Neovim (full directory)
rsync -a --delete ~/.config/nvim/ "$DOTFILES/.config/nvim/"

# Starship
cp ~/.config/starship.toml "$DOTFILES/.config/starship.toml"

# Tmux
cp ~/.config/tmux/tmux.conf "$DOTFILES/.config/tmux/tmux.conf" 2>/dev/null || true

# Zed
cp ~/.config/zed/keymap.json "$DOTFILES/.config/zed/keymap.json"
cp ~/.config/zed/settings.json "$DOTFILES/.config/zed/settings.json"

# Claude
cp ~/.claude/CLAUDE.md "$DOTFILES/.claude/CLAUDE.md"
cp ~/.claude/keybindings.json "$DOTFILES/.claude/keybindings.json"
cp ~/.claude/settings.json "$DOTFILES/.claude/settings.json"
rsync -a --delete ~/.claude/commands/ "$DOTFILES/.claude/commands/"

echo "Done. Review changes with: git diff"
