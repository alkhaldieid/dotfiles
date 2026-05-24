# Layered zsh config for a fast, keyboard-first shell.

export DOTFILES="${HOME}/dotfiles"
export EDITOR="emacsclient -t -a emacs"
export VISUAL="emacsclient -c -a emacs"
export PAGER="less"
export LESS="-FRX"
export LESSHISTFILE="-"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

zmodload zsh/complist 2>/dev/null || true
zmodload zsh/datetime 2>/dev/null || true

for file in "${ZDOTDIR:-${HOME}/.config/zsh}"/{options,history,completion,plugins,aliases,functions,keybindings,prompt,highlight}.zsh; do
  [[ -r "$file" ]] && source "$file"
done

[[ -r "${DOTFILES}/private/shell/zsh.local.zsh" ]] && source "${DOTFILES}/private/shell/zsh.local.zsh"
[[ -r "${ZDOTDIR:-${HOME}/.config/zsh}/local.zsh" ]] && source "${ZDOTDIR:-${HOME}/.config/zsh}/local.zsh"
