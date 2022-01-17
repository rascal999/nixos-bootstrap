#!/usr/bin/env bash

STATUS=`nmcli con show --active | grep wg0 | wc -l`
CONNECTION=`nmcli con show --active | grep -oE "[a-f0-9-]{32,36}" | head -1`

if [[ "$STATUS" == "1" ]]; then
    nmcli connection down wg0
    nmcli connection down $CONNECTION
    nmcli connection up $CONNECTION
    i3-msg "restart"
else
    nmcli connection up wg0
    i3-msg "restart"
fi
