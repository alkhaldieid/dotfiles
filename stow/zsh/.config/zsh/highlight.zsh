# Source syntax highlighting last, after widgets, bindings, and prompt hooks.

for plugin in   /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh   /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh   /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; do
  [[ -r "$plugin" ]] && source "$plugin" && break
done
