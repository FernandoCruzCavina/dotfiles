#!/bin/bash
# For Searching via web browsers

# Rofi theme and message
rofi_theme="$HOME/.config/rofi/config-search.rasi"
msg='Search/URL'

# Kill Rofi if already running before execution
if pgrep -x "rofi" >/dev/null; then
    pkill rofi
fi

# Open Rofi and capture user input
query=$(rofi -dmenu -config "$rofi_theme" -mesg "$msg" -p "Search: ")

# Exit if the user didn't enter anything
[ -z "$query" ] && exit

# If the input looks like a URL, add the scheme if necessary
if [[ "$query" =~ ^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(/.*)?$ ]]; then
    query="https://$query"
else
    # Otherwise, treat it as a Brave Search
    query="https://search.brave.com/search?q=${query// /+}"
fi

# Open the query in Brave browser
brave "$query"

# Optional: kill any remaining rofi instance (usually desnecessário neste ponto)
pkill rofi
