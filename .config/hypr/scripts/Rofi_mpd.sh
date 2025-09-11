#!/bin/bash

THEME="~/.config/rofi/config-rofi-mpd.rasi"

# Pega a playlist atual do mpc (queue)
# Formato: [pos] artista - titulo
QUEUE=$(mpc playlist | nl -w2 -s'. ')

if [ -z "$QUEUE" ]; then
    notify-send "🎶 MPC" "A fila está vazia."
    exit 0
fi

CHOSEN=$(echo "$QUEUE" | rofi -dmenu -i -theme "$THEME")

[ -z "$CHOSEN" ] && exit 0

SONG_POS=$(echo "$CHOSEN" | awk '{print $1}' | tr -d '.')

mpc play "$SONG_POS"
