#!/usr/bin/env sh
# Scaffold: Linux setup hook for Arch-based machines.
set -eu

sudo pacman -S --needed - < arch-packages.txt
systemctl --user enable --now emacs.service
