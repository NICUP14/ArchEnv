#!/bin/sh

touchpad_id=$(xinput list | grep -i touchpad | grep -oP 'id=\K\d*')
touchpad_state=$(xinput list-props "$touchpad_id" | grep "Device Enabled" | awk '{print $NF}')

# Checks if any touchpad device was found
if [ -z "$touchpad_id" ]; then
    notify-send "Error: No touchpad found"
    exit 1
fi


if [ "$touchpad_state" -eq 1 ]; then
    xinput disable "$touchpad_id"
    notify-send "Touchpad Disabled" # Optional: Notification
else
    xinput enable "$touchpad_id"
    notify-send "Touchpad Enabled" # Optional: Notification
fi
