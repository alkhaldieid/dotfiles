# Scaffold: layered zsh entrypoint imported from an empty live ~/.config/zsh/.zshrc.
# Keep this file tiny: it only points zsh at the versioned config directory.

export ZDOTDIR="${HOME}/.config/zsh"

# Homebrew lives outside macOS' default non-login PATH on Apple Silicon.
typeset -U path PATH
if [[ -d /opt/homebrew/bin ]]; then
  path=(/opt/homebrew/bin /opt/homebrew/sbin $path)
elif [[ -d /usr/local/bin ]]; then
  path=(/usr/local/bin /usr/local/sbin $path)
fi
export PATH
