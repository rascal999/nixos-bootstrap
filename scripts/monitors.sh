#!/usr/bin/env bash

sleep 5

if [[ `hostname` == "nixos-rig" ]]; then
    # 0
    /run/current-system/sw/bin/xrandr --output DP-4 --auto --left-of HDMI-0
    # 2
    /run/current-system/sw/bin/xrandr --output USB-C-0 --auto --right-of HDMI-0
fi
