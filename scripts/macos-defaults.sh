#!/usr/bin/env sh
# Scaffold: macOS defaults for a keyboard-first dwm-style workflow.
set -eu

defaults write com.apple.dock workspaces-auto-swoosh -bool NO
defaults write -g ApplePressAndHoldEnabled -bool false
killall Dock >/dev/null 2>&1 || true

# Terminal uses Command+Return for "New Window with Same Command" on some macOS
# setups. Move those actions to obscure chords so Super+Return can be owned by
# Karabiner/AeroSpace without repeat-spawning Terminal windows.
defaults write com.apple.Terminal NSUserKeyEquivalents -dict-add "New Window with Same Command" '@^~$\UF71E'
defaults write com.apple.Terminal NSUserKeyEquivalents -dict-add "New Tab with Same Command" '@^~$\UF71D'
