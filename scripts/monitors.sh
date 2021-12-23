#!/usr/bin/env bash

if [[ `hostname` == "nixos-rig" ]]; then
    /run/current-system/sw/bin/swaymsg output HDMI-A-1 pos 0 0 res 2560x1440
    /run/current-system/sw/bin/swaymsg output DP-4 pos 2560 0 res 3440x1440
    /run/current-system/sw/bin/swaymsg output DP-2 disable
    /run/current-system/sw/bin/swaymsg output DP-3 disable
fi
