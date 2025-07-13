#!/bin/bash

INFO="$(upower -i $(upower -e | grep $@))"
STATE=$(echo "$INFO" | grep "state" | cut -d ':' -f 2 | tr -d ' ')
PERCENTAGE=$(echo "$INFO" | grep "percentage" | cut -d ':' -f 2 | tr -d ' ')

if [ "$STATE" = "charging" ]; then
	echo "$PERCENTAGE C"
else
	echo "$PERCENTAGE"
fi

