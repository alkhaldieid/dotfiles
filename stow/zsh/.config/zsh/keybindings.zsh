# Scaffold: zsh keybindings for fzf and fast history navigation.

bindkey -e

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
  bindkey '^R' fzf-history-widget
  bindkey '^T' fzf-file-widget
  bindkey '^[c' fzf-cd-widget
fi

if (( $+widgets[autosuggest-accept] )); then
  bindkey '^F' autosuggest-accept
fi
