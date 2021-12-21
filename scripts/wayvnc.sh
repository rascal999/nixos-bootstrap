#!/usr/bin/env bash

if [[ "$HOST" == "nixos-zalman" ]]; then
    exec /run/current-system/sw/bin/swaymsg create_output
    exec /run/current-system/sw/bin/swaymsg output HEADLESS-1 pos 0 0 res 2560x1440
    exec /run/current-system/sw/bin/wayvnc --output=HEADLESS-1 -f 60 &
fi
