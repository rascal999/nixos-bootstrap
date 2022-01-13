#!/usr/bin/env bash

STATUS=`nmcli con show --active | grep wg0 | wc -l`

if [[ "$STATUS" == "1" ]]; then
    nmcli connection down wg0
    nmcli connection down "Wired connection 1"
    nmcli connection up "Wired connection 1"
else
    nmcli connection up wg0
fi
