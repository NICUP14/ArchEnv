#!/bin/bash

pactl set-sink-mute @DEFAULT_SINK@ toggle
STATUS=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

if [ "$STATUS" = "yes" ]; then
    notify-send "Volume" "Muted"
else
    notify-send "Volume" "Unmuted"
fi
