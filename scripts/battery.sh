#!/bin/bash
# battery.sh: Display battery percentage for dwmblocks

BAT=$(upower -e | grep "$1")
INFO=$(upower -i "$BAT")
PERC=$(echo "$INFO" | grep -oP 'percentage:\s+\K[0-9]+')
STATE=$(echo "$INFO" | grep -oP 'state:\s+\K\w+')

[[ "$STATE" == "charging" ]] && echo "${PERC}% C" || echo "$PERC%"
