#!/usr/bin/env bash

DISABLED=`xinput list 11 | grep disabled | wc -l`

xinput set-prop 11 "Device Enabled" $DISABLED
