#!/usr/bin/env sh
# Scaffold: common environment for bootstrap scripts.

export DOTFILES="${DOTFILES:-$HOME/dotfiles}"
export EDITOR="${EDITOR:-emacsclient -t -a emacs}"
export VISUAL="${VISUAL:-emacsclient -c -a emacs}"
