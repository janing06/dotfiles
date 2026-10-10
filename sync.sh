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

# Hammerspoon
cp ~/.hammerspoon/init.lua "$DOTFILES/.hammerspoon/init.lua"

# Obsidian (vim keymaps for the Vimrc Support plugin, lives at the vault root)
cp ~/Documents/"Obsidian Vault"/.obsidian.vimrc "$DOTFILES/.obsidian.vimrc"

# Neovim (full directory)
rsync -a --delete --exclude .DS_Store ~/.config/nvim/ "$DOTFILES/.config/nvim/"

# Yazi
cp ~/.config/yazi/yazi.toml "$DOTFILES/.config/yazi/yazi.toml"
cp ~/.config/yazi/keymap.toml "$DOTFILES/.config/yazi/keymap.toml"

# mpv
cp ~/.config/mpv/mpv.conf "$DOTFILES/.config/mpv/mpv.conf"
cp ~/.config/mpv/input.conf "$DOTFILES/.config/mpv/input.conf"

# Starship
cp ~/.config/starship.toml "$DOTFILES/.config/starship.toml"

# Tmux
cp ~/.config/tmux/tmux.conf "$DOTFILES/.config/tmux/tmux.conf" 2>/dev/null || true

# Zed
cp ~/.config/zed/keymap.json "$DOTFILES/.config/zed/keymap.json"
cp ~/.config/zed/settings.json "$DOTFILES/.config/zed/settings.json"

# Opencode
cp ~/.config/opencode/AGENTS.md "$DOTFILES/.config/opencode/AGENTS.md"

# Claude
cp ~/.claude/CLAUDE.md "$DOTFILES/.claude/CLAUDE.md"
cp ~/.claude/keybindings.json "$DOTFILES/.claude/keybindings.json"
# This repo is public — strip work telemetry (incl. bearer token) and the org environment description
jq 'del(.autoMode.environment) | .env |= with_entries(select(.key | test("^(OTEL_|CLAUDE_CODE_ENABLE_TELEMETRY$)") | not))' \
  ~/.claude/settings.json > "$DOTFILES/.claude/settings.json"
rsync -a --delete ~/.claude/commands/ "$DOTFILES/.claude/commands/"

echo "Done. Review changes with: git diff"
