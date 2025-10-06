#!/bin/bash
# Toggle the default source (microphone) mute state

# Get current mute state
status=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')

# Toggle mute
if [ "$status" = "yes" ]; then
    pactl set-source-mute @DEFAULT_SOURCE@ 0
    notify-send "Microphone" "Unmuted" -h string:synchronous:mic
else
    pactl set-source-mute @DEFAULT_SOURCE@ 1
    notify-send "Microphone" "Muted" -h string:synchronous:mic
fi

