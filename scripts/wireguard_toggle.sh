#!/usr/bin/env bash

STATUS=`nmcli con show --active | grep wg0 | wc -l`
CONNECTION=`nmcli con show --active | head -2 | grep -v "NAME.*UUID" | gawk '{ print $1 }'`

if [[ "$STATUS" == "1" ]]; then
    nmcli connection down wg0
    nmcli connection down "$CONNECTION"
    nmcli connection up "$CONNECTION"
else
    nmcli connection up wg0
fi
