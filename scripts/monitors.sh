#!/usr/bin/env bash

if [[ `hostname` == "nixos-rig" ]]; then
    /run/current-system/sw/bin/xrandr --output DP-4 --auto --right-of HDMI-1
fi
