# Fast completion with cached compdump and useful menus.

autoload -Uz compinit
local zcompdump="${ZDOTDIR:-${HOME}/.config/zsh}/.zcompdump"
if [[ ! -r "$zcompdump" || "$zcompdump" -ot "${ZDOTDIR:-${HOME}/.config/zsh}/completion.zsh" ]]; then
  compinit -d "$zcompdump"
else
  compinit -C -d "$zcompdump"
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{blue}%d%f'
zstyle ':completion:*:messages' format '%F{yellow}%d%f'
zstyle ':completion:*:warnings' format '%F{red}no matches%f'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompcache"
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w -w'
