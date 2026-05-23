#!/usr/bin/env sh
# Scaffold: macOS defaults for a keyboard-first dwm-style workflow.
set -eu

defaults write com.apple.dock workspaces-auto-swoosh -bool NO
defaults write -g ApplePressAndHoldEnabled -bool false
killall Dock >/dev/null 2>&1 || true
