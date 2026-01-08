#!/bin/bash
# battery.sh: Display battery percentage for dwmblocks

BAT=$(upower -e | grep "$1")
INFO=$(upower -i "$BAT")

RATE=$(echo "$INFO" | grep -oP 'energy-rate:\s+\K\d+\.\d+')
STATE=$(echo "$INFO" | grep -oP 'state:\s+\K\w+')
PERC=$(echo "$INFO" | grep -oP 'percentage:\s+\K[0-9]+')

if [ "$STATE" = "charging" ]; then
	PERC_FULL="${PERC}% C"
else
	PERC_FULL="${PERC}%"
fi

echo "$PERC_FULL ${RATE}W"
