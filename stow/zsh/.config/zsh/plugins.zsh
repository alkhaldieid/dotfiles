# Optional enhancements. Missing tools are skipped silently.

if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b 2>/dev/null)"
fi

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git 2>/dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git 2>/dev/null'
export FZF_DEFAULT_OPTS='--height=40% --layout=reverse --border --cycle --bind=ctrl-y:accept'

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh --cmd z)"
fi

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=40
for plugin in   /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh   /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh   /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh; do
  [[ -r "$plugin" ]] && source "$plugin" && break
done
