# Compact prompt: user@host:path git-branch status.

autoload -Uz vcs_info colors
colors
zstyle ':vcs_info:git:*' formats ' %F{blue}(%b)%f'
zstyle ':vcs_info:git:*' actionformats ' %F{yellow}(%b|%a)%f'

precmd() {
  vcs_info
}

PROMPT='%F{green}%n@%m%f:%F{cyan}%~%f${vcs_info_msg_0_} %# '
RPROMPT='%(?..%F{red}%?%f)'
