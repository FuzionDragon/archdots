#!/usr/bin/bash
ac="$(cat /sys/class/power_supply/AC/online)"
check=0
if [[ $ac == $check ]]
then
    hyprlock
fi
