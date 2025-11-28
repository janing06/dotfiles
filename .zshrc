24
 23 export NVM_DIR="$HOME/.nvm"
 22
 21 export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$PATH"
 20
 19 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
 18 eval "$(anyenv init -)"
 17 eval "$(anyenv init -)"
 16 eval "$(anyenv init -)"
 15
 14 eval "$(starship init zsh)"
 13
 12 export _ZO_RESOLVE_SYMLINKS=1
 11 eval "$(zoxide init zsh --cmd cd)"
 10
  9 source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
  8 source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  7
  6  # --- Zsh History Config ---
  5 HISTFILE=~/.zsh_history
  4 HISTSIZE=10000
  3 SAVEHIST=10000
  2
  1 setopt HIST_IGNORE_DUPS        # Ignore duplicate commands
25  setopt HIST_IGNORE_ALL_DUPS    # Remove older duplicate entries
  1 setopt SHARE_HISTORY           # Share history between terminal tabs
  2 setopt INC_APPEND_HISTORY      # Immediately append to history file
  3 setopt HIST_REDUCE_BLANKS      # Strip extra spaces
  4 setopt HIST_VERIFY             # Let you edit before executing from history
  5
  6
  7 export PATH="$HOME/scripts:$PATH"export PATH="/usr/local/opt/libpq/bin:$PATH"
  8
  9 # ALIASES
 10 alias ga='git add -A'
 11 alias gu='git restore --staged $(git rev-parse --show-toplevel)/'
 12 alias gc='git cz'
 13 alias gulc="git reset --soft HEAD~1"
 14 alias gs='git status'
 15 alias gps='git push'
 16 alias gpf='git push --force-with-lease'
 17 alias gph='git push -u origin HEAD'
 18 alias gf='git fetch'
 19 alias gp='gf; git pull'
 20 alias mbs='make backend/start'
 21 alias mgs='make gateway/start'
 22 alias mge='make gateway/metadata/export'
 23 alias mfs='make frontend/start'
 24 alias gb="git branch --sort=-committerdate --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:cyan)%(authorname)%(color:reset) %(color:dim white)(%(committerdate:relative))%(colo
    r:reset)'"
 25 alias gst="git stash -u"
 26 alias gsta="git stash apply"
 27 alias gstp="git stash pop"
 28 alias gcon="git checkout -b"
 29 alias vim="nvim"
 30 alias lua-config="nvim ~/.config/nvim"
.zshrc                                                                                                                                                                                     25,63          Top
