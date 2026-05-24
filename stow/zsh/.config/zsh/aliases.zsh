# Scaffold: aliases for the cross-platform dwm-style dotfiles shell.

# Files
alias ls='eza --group-directories-first --icons=never 2>/dev/null || command ls'
alias ll='eza -la --group-directories-first --icons=never 2>/dev/null || command ls -la'
alias la='command ls -la'
alias grep='grep --color=auto'
alias cat='bat --paging=never 2>/dev/null || command cat'

# Git
alias g='git'
alias gs='git status --short'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --decorate --graph --all'
alias gd='git diff'

# Emacs
alias e='emacsclient -c -a emacs'
alias et='emacsclient -t -a emacs'
alias ekill='emacsclient -e "(kill-emacs)"'

# Dotfiles
alias dot='git -C ${HOME}/dotfiles'
alias dots='git -C ${HOME}/dotfiles status --short'
alias dotedit='emacsclient -c -a emacs ${HOME}/dotfiles'

# Safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'


# Tmux
alias ta='tmux new-session -A -s main'
alias tl='tmux list-sessions'
alias tk='tmux kill-session -t main'
