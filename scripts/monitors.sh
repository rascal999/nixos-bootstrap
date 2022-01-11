#!/usr/bin/env bash

sleep 5

if [[ `hostname` == "nixos-rig" ]]; then
    # 0
    /run/current-system/sw/bin/xrandr --output DP-4 --auto --left-of HDMI-0
    # 2
    /run/current-system/sw/bin/xrandr --output USB-C-0 --auto --right-of HDMI-0

    i3-msg 'workspace 1; append_layout /home/user/.config/i3/nixos-rig-workspace-1.json'
    i3-msg 'workspace 2; append_layout /home/user/.config/i3/nixos-rig-workspace-2.json'
    i3-msg 'workspace 7; append_layout /home/user/.config/i3/nixos-rig-workspace-7.json'
fi
