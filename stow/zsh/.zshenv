# Tiny zsh entrypoint. Keep this safe for non-interactive shells.

export ZDOTDIR="${HOME}/.config/zsh"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-${HOME}/.local/state}"

typeset -U path PATH
[[ -d "${HOME}/.local/bin" ]] && path=("${HOME}/.local/bin" $path)
if [[ -d /opt/homebrew/bin ]]; then
  path=(/opt/homebrew/bin /opt/homebrew/sbin $path)
elif [[ -d /usr/local/bin ]]; then
  path=(/usr/local/bin /usr/local/sbin $path)
fi
export PATH
