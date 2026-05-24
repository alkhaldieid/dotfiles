# Custom shell functions for daily use.

take() {
  [[ $# -eq 1 ]] || { echo "usage: take DIR" >&2; return 2; }
  mkdir -p -- "$1" && cd -- "$1"
}

mkcd() {
  take "$@"
}

extract() {
  [[ $# -eq 1 ]] || { echo "usage: extract ARCHIVE" >&2; return 2; }
  [[ -f "$1" ]] || { echo "extract: file not found: $1" >&2; return 1; }
  case "$1" in
    *.tar.bz2|*.tbz2) tar xjf "$1" ;;
    *.tar.gz|*.tgz)   tar xzf "$1" ;;
    *.tar.xz|*.txz)   tar xJf "$1" ;;
    *.tar.zst)        tar --zstd -xf "$1" ;;
    *.tar)            tar xf "$1" ;;
    *.zip)            unzip "$1" ;;
    *.rar)            unrar x "$1" ;;
    *.7z)             7z x "$1" ;;
    *.gz)             gunzip "$1" ;;
    *.bz2)            bunzip2 "$1" ;;
    *.xz)             unxz "$1" ;;
    *)                echo "extract: unsupported archive: $1" >&2; return 1 ;;
  esac
}

venv() {
  local dir="${1:-.venv}"
  python3 -m venv "$dir" && source "$dir/bin/activate"
}

serve() {
  local port="${1:-8000}"
  python3 -m http.server "$port"
}

path-prepend() {
  [[ $# -eq 1 ]] || { echo "usage: path-prepend DIR" >&2; return 2; }
  [[ -d "$1" ]] || return 0
  path=("$1" $path)
}

path-append() {
  [[ $# -eq 1 ]] || { echo "usage: path-append DIR" >&2; return 2; }
  [[ -d "$1" ]] || return 0
  path=($path "$1")
}

cdf() {
  local dir
  dir=$(fd --type d --hidden --exclude .git . "${1:-.}" 2>/dev/null | fzf) || return
  cd -- "$dir"
}

ff() {
  local file
  file=$(fd --type f --hidden --exclude .git . "${1:-.}" 2>/dev/null | fzf) || return
  print -r -- "$file"
}
