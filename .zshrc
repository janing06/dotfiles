source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ~/bin
export PATH="$HOME/bin:$PATH"

# ~/.zshrc
eval "$(starship init zsh)"

# zoxide
export _ZO_RESOLVE_SYMLINKS=1
eval "$(zoxide init zsh --cmd cd)"

# Aliases
alias vim='nvim'
alias ghostty-config='vim ~/.config/ghostty/config' 
alias vim-config='vim ~/.config/nvim' 
alias aerospace-config='vim ~/.config/aerospace/aerospace.toml' 
alias ga='git add -A'
alias gr='git reset --hard && git clean -fd' 
alias gu='git restore --staged $(git rev-parse --show-toplevel)/'
alias gps='git push && git fetch --prune'
alias gpf='git push --force-with-lease'
alias gph='git push -u origin HEAD'
alias gp='git pull'
alias mbs='make backend/start'
alias mgs='make gateway/start'
alias mge='make gateway/metadata/export'
alias mfs='make frontend/start'
alias gb="git branch --sort=-committerdate --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:cyan)%(authorname)%(color:reset) %(color:dim white)(%(committerdate:relative))%(color:reset)'"
alias gst="git stash -u"
alias gsta="git stash apply"
alias tclean="tmux kill-session -a"
alias tkr='tmux kill-server' 
alias tks='tmux kill-session' 
alias ccd='claude' 
alias oc='opencode' 

alias gll='git log --pretty="%C(auto)%h %C(auto)%d%Creset%n    %C(cyan)%an %C(dim white)%ad%n    %s%Creset%n" --date=format:"%a %Y-%m-%d %H:%M"  --graph'
alias glla='git log --full-history --pretty="%C(auto)%h %C(auto)%d%Creset%n    %C(cyan)%an %C(dim white)%ad%n    %s%Creset%n" --date=format:"%a %Y-%m-%d %H:%M"  --date-order --skip=0 --branches --tags --remotes --graph'



# Use vim keybindings for zsh
# bindkey -v
# bindkey -M viins 'kj' vi-cmd-mode
# bindkey -v '^?' backward-delete-char


# NOTE: FZF
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
bindkey -e

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


# Node Version Manager(NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"
 
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
 
# export EDITOR="nvim"
