#!/bin/bash

pactl set-sink-volume @DEFAULT_SINK@ -5%
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)
notify-send "Volume" "$vol" -h int:value:${vol%\%} -h string:synchronous:volume
