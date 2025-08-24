#!/bin/bash

title_artist=$(mpc -f '%title% - %artist%' current)
status=$(mpc status | grep -oP '^\[.*\]' | tr -d '[]')

echo "{\"text\":\" $title_artist\", \"class\":\"$status\", \"alt\":\"$status\"}"
