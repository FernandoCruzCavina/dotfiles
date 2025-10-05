#!/bin/bash

title_artist=$(mpc -f '%title% - %artist%' current)
status=$(mpc status | grep -oP '^\[.*\]' | tr -d '[]')

safe_title=$(echo "$title_artist" \
  | sed -e 's/&/\&amp;/g' \
        -e 's/</\&lt;/g' \
        -e 's/>/\&gt;/g' \
        -e 's/"/\\"/g')

echo "{\"text\":\" $safe_title\", \"class\":\"$status\", \"alt\":\"$status\"}"
