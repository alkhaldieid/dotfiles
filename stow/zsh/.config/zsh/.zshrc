# Scaffold: layered zsh config generated because live ~/.config/zsh/.zshrc was empty.

export DOTFILES="${HOME}/dotfiles"
export EDITOR="emacsclient -t -a emacs"
export VISUAL="emacsclient -c -a emacs"
export PAGER="less"
export LESS="-R"
export HISTFILE="${ZDOTDIR:-${HOME}/.config/zsh}/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000

setopt AUTO_CD
setopt AUTO_PUSHD
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt PROMPT_SUBST

autoload -Uz compinit
compinit -d "${ZDOTDIR:-${HOME}/.config/zsh}/.zcompdump"

for file in "${ZDOTDIR:-${HOME}/.config/zsh}"/{aliases,functions,keybindings}.zsh; do
  [[ -r "$file" ]] && source "$file"
done

[[ -r "${DOTFILES}/private/shell/zsh.local.zsh" ]] && source "${DOTFILES}/private/shell/zsh.local.zsh"

prompt='%n@%m:%~%# '
