#!/usr/bin/env bash

if [[ "$HOSTNAME" == "nixos-galaxy" ]]; then
    exec /run/current-system/sw/bin/swaymsg output HDMI-A-1 pos 0 0 res 2560x1440
    exec /run/current-system/sw/bin/swaymsg output DP-1 pos 2560 0 res 3440x1440
    exec /run/current-system/sw/bin/swaymsg output eDP-1 pos 6000 0 res 1920x1080
fi
