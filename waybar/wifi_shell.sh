#!/bin/bash

while true; do
    # Get the current WiFi signal strength
    SIGNAL=$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep '^*' | awk -F: '{print $2}')

    # Default to disconnected
    ICON="󰤮"

    if [[ -n "$SIGNAL" ]]; then
        if (( SIGNAL >= 75 )); then
            ICON="󰤨" # Full signal
        elif (( SIGNAL >= 50 )); then
            ICON="󰤥" # Medium signal
        elif (( SIGNAL >= 25 )); then
            ICON="󰤢" # Low signal
        else
            ICON="󰤟" # Very low signal
        fi
    fi

    # Output JSON for Waybar
    echo "{\"icon\": \"$ICON\"}"

    # Update every 5 seconds
    sleep 5
done

