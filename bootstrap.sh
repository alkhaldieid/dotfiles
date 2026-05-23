#!/usr/bin/env sh
# Scaffold: OS-detecting dotfiles bootstrap.
set -eu

cd "$(dirname "$0")"
git submodule update --init --recursive || true

case "$(uname -s)" in
  Darwin)
    make install-macos
    ;;
  Linux)
    make install-linux
    ;;
  *)
    echo "Unsupported OS: $(uname -s)" >&2
    exit 1
    ;;
esac
