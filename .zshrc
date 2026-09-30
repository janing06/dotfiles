# -------------------------
# NVM / Node Config
# -------------------------
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # nvm bash completion

# -------------------------
# Anyenv / Nodenv
# -------------------------
eval "$(anyenv init -)"

# -------------------------
# PATH setup
# -------------------------
# Homebrew binaries first (CLI tools)
export PATH="/opt/homebrew/bin:$PATH"

# Node global packages (pnpm, npm global installs)
export PATH="$HOME/.npm-global/bin:$PATH"

# Local scripts
export PATH="$HOME/scripts:$PATH"

# libpq (Postgres)
export PATH="/usr/local/opt/libpq/bin:$PATH"

# -------------------------
# Zsh prompt
# -------------------------
eval "$(starship init zsh)"


# -------------------------
# Zsh plugins
# -------------------------
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# -------------------------
# FZF setup
# -------------------------
eval "$(fzf --zsh)"
bindkey -e
bindkey -r '^[c'   # disable fzf-cd-widget (Option+C); gco/gcoa still work
export FZF_CTRL_T_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always {}' --bind 'enter:execute(nvim {} > /dev/tty < /dev/tty)+abort'"

# -------------------------
# Zsh history settings
# -------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# -------------------------
# Git Aliases
# -------------------------
alias ga='git add -A'
alias grt='git reset --hard && git clean -fd'
alias gu='git restore --staged $(git rev-parse --show-toplevel)/'
alias gc='git cz'
alias gr="git reset --hard && git clean -fd"
alias gs='git status'
alias gps='git push'
alias gpf='git push --force-with-lease'
alias gph='git push -u origin HEAD'
alias gf='git fetch'
alias gp='gf; git pull'
alias gb="git branch --sort=-committerdate --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:cyan)%(authorname)%(color:reset) %(color:dim white)(%(committerdate:relative))%(color:reset)'"
alias gst="git stash -u"
alias gsta="git stash apply"
alias gstp="git stash pop"
alias gcon="git checkout -b"
alias gd="git checkout -- ."

alias gll='git log --pretty="%C(auto)%h %C(auto)%d%Creset%n    %C(cyan)%an %C(dim white)%ad%n    %s%Creset%n" --date=format:"%a %Y-%m-%d %H:%M"  --graph'
alias glla='git log --full-history --pretty="%C(auto)%h %C(auto)%d%Creset%n    %C(cyan)%an %C(dim white)%ad%n    %s%Creset%n" --date=format:"%a %Y-%m-%d %H:%M"  --date-order --skip=0 --branches --tags --remotes --graph'

# -------------------------
# Custom commands / scripts
# -------------------------
alias mbs='make backend/start'
alias mgs='make gateway/start'
alias mge='make gateway/metadata/export'
alias mfs='make frontend/start'
alias mas='make admin/start'

# -------------------------
# Docker
# -------------------------
# Wipe containers before switching projects: every project publishes 5432/8080, and
# `docker compose up` reuses existing containers. Removing forces a fresh create with
# correct port bindings. Named volumes (your data) are untouched.
alias dclean='docker ps -aq | xargs -r docker rm -f'

alias vim="nvim"
alias lua-config="nvim ~/.config/nvim"
alias aerospace-config="vim ~/.config/aerospace/aerospace.toml"
alias ghostty-config="vim ~/.config/ghostty/config"

alias td="tmux detach"
alias ta="tmux attach"
alias tclean="tmux kill-session -a"
alias tkr='tmux kill-server'
alias tks='tmux kill-session'

alias cca='claude --permission-mode auto'
alias oc='opencode'

alias check="npm run generate-graphql; npm run build; npm run steiger"

# -------------------------
# Git interactive functions
# -------------------------
function gco () {
    if [[ $# -eq 0 ]]; then
        gb | fzf --reverse | xargs | cut -d ' ' -f 1 | xargs git checkout
    else
        git checkout "$@"
    fi
}

function gcoa {
    gb --all | fzf --reverse | xargs | cut -d ' ' -f 1 | sed 's/^origin\///' | xargs git checkout
}


# -------------------------
# Aliases for CLIs
# -------------------------
alias hasura='/opt/homebrew/bin/hasura'  # ensure Homebrew Hasura CLI always wins

# -------------------------
# Optional: Vim keybindings for Zsh
# -------------------------
# bindkey -v
# bindkey -M viins 'kj' vi-cmd-mode
# bindkey -v '^?' backward-delete-char
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"



function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

function yazi_cd() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
	zle reset-prompt
}
zle -N yazi_cd
bindkey '^f' yazi_cd

export EDITOR="nvim"

# -------------------------
# Environment variables
# -------------------------
export CC_ANALYTICS_BQ_PROJECT=hapins-infra
 
# -------------------------
# Zoxide
# -------------------------
export _ZO_RESOLVE_SYMLINKS=1
eval "$(zoxide init zsh --cmd cd)"
