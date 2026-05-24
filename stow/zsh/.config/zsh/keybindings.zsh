# Vi-style zsh editing plus fzf and fast history navigation.

export KEYTIMEOUT=1
bindkey -v

function zle-keymap-select {
  case $KEYMAP in
    vicmd) printf '\e[2 q' ;;
    viins|main) printf '\e[6 q' ;;
  esac
}
zle -N zle-keymap-select

function zle-line-init {
  zle -K viins
  printf '\e[6 q'
}
zle -N zle-line-init

function zle-line-finish {
  printf '\e[0 q'
}
zle -N zle-line-finish

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M viins '^[[A' up-line-or-beginning-search
bindkey -M viins '^[[B' down-line-or-beginning-search
bindkey -M vicmd '^[[A' up-line-or-beginning-search
bindkey -M vicmd '^[[B' down-line-or-beginning-search

# In vi command mode: Esc, then h/j/k/l, w/b/e, 0/$, i/a, dd, cw, x.
# In tmux copy mode: prefix+v, then / search, v select, y copy.
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
  bindkey -M viins '^R' fzf-history-widget
  bindkey -M viins '^T' fzf-file-widget
  bindkey -M viins '^[c' fzf-cd-widget
  bindkey -M vicmd '^R' fzf-history-widget
  bindkey -M vicmd '^T' fzf-file-widget
  bindkey -M vicmd '^[c' fzf-cd-widget
fi

if (( $+widgets[autosuggest-accept] )); then
  bindkey -M viins '^F' autosuggest-accept
fi
