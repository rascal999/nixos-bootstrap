#!/usr/bin/env bash

if [[ `hostname` == "nixos-rig" ]]; then
    sleep 5

    # 0
    /run/current-system/sw/bin/xrandr --output DP-4 --auto --left-of HDMI-0
    # 2
    /run/current-system/sw/bin/xrandr --output USB-C-0 --auto --right-of HDMI-0

    sleep 5
    i3-msg "workspace 1, move workspace to output HDMI-0"
    i3-msg "workspace 2, move workspace to output USB-C-0"
    i3-msg "workspace 7, move workspace to output DP-4"

    i3-msg 'workspace 1; append_layout /home/user/.config/i3/nixos-rig-workspace-1.json'
    i3-msg 'workspace 2; append_layout /home/user/.config/i3/nixos-rig-workspace-2.json'
    i3-msg 'workspace 7; append_layout /home/user/.config/i3/nixos-rig-workspace-7.json'
    /run/current-system/sw/bin/obsidian &
    /run/current-system/sw/bin/firefox -P "Default User" &
    /run/current-system/sw/bin/slack &
fi
