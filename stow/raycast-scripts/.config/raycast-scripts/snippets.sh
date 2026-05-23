#!/bin/zsh
# @raycast.schemaVersion 1
# @raycast.title Snippets
# @raycast.mode silent
# @raycast.icon scissors
[ -f ~/.local/share/larbs/snippets ] || exit 0
choice=$(osascript -e 'tell app "System Events" to choose from list (paragraphs of (do shell script "cat ~/.local/share/larbs/snippets")) with prompt "Snippet:"')
[ -z "$choice" ] || [ "$choice" = "false" ] && exit 0
echo "$choice" | cut -d' ' -f1 | tr -d '\n' | pbcopy
osascript -e 'tell app "System Events" to keystroke "v" using command down'
