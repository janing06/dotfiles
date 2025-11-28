
export NVM_DIR="$HOME/.nvm"
 
export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$PATH"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(anyenv init -)"
eval "$(anyenv init -)"
eval "$(anyenv init -)"

eval "$(starship init zsh)"

export _ZO_RESOLVE_SYMLINKS=1
eval "$(zoxide init zsh --cmd cd)"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
 
 # --- Zsh History Config ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS        # Ignore duplicate commands
setopt HIST_IGNORE_ALL_DUPS    # Remove older duplicate entries
setopt SHARE_HISTORY           # Share history between terminal tabs
setopt INC_APPEND_HISTORY      # Immediately append to history file
setopt HIST_REDUCE_BLANKS      # Strip extra spaces
setopt HIST_VERIFY             # Let you edit before executing from history


export PATH="$HOME/scripts:$PATH"export PATH="/usr/local/opt/libpq/bin:$PATH"

# ALIASES
alias ga='git add -A'
alias gu='git restore --staged $(git rev-parse --show-toplevel)/'
alias gc='git cz'
alias gulc="git reset --soft HEAD~1" 
alias gs='git status'
alias gps='git push'
alias gpf='git push --force-with-lease'
alias gph='git push -u origin HEAD'
alias gf='git fetch'
alias gp='gf; git pull'
alias mbs='make backend/start'
alias mgs='make gateway/start'
alias mge='make gateway/metadata/export'
alias mfs='make frontend/start'
alias gb="git branch --sort=-committerdate --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:cyan)%(authorname)%(color:reset) %(color:dim white)(%(committerdate:relative))%(color:reset)'"
alias gst="git stash -u"
alias gsta="git stash apply"
alias gstp="git stash pop"
alias gcon="git checkout -b"
alias vim="nvim"
alias lua-config="nvim ~/.config/nvim"
alias aerospace-config="vim ~/.config/aerospace/aerospace.toml" 
alias ghostty-config="vim $HOME/Library/Application\ Support/com.mitchellh.ghostty/config" 
alias gd="git checkout -- ."
 
alias gll='git log --pretty="%C(auto)%h %C(auto)%d%Creset%n    %C(cyan)%an %C(dim white)%ad%n    %s%Creset%n" --date=format:"%a %Y-%m-%d %H:%M"  --graph'
alias glla='git log --full-history --pretty="%C(auto)%h %C(auto)%d%Creset%n    %C(cyan)%an %C(dim white)%ad%n    %s%Creset%n" --date=format:"%a %Y-%m-%d %H:%M"  --date-order --skip=0 --branches --tags --remotes --graph'

# NOTE: FZF
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
# 
# export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"
# 
# # Setup fzf previews
# export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
# export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

export FZF_CTRL_T_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always {}' --bind 'enter:execute(nvim {} > /dev/tty < /dev/tty)+abort'"

alias check="npm run generate-graphql; npm run build; npm run steiger"

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


# Use vim keybindings for zsh
# bindkey -v
# bindkey -M viins 'kj' vi-cmd-mode
# bindkey -v '^?' backward-delete-char

export PATH=$HOME/.npm-global/bin:$PATH

alias claude="/Users/jhonmichaelturija/.claude/local/claude"
