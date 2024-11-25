#!/usr/bin/bash
DISCHARGING=$(acpi -b | grep "Battery 0" | grep -c "Discharging")

if [[ ($DISCHARGING == '1') && ($1 == 'L')]]; then
    hyprlock
elif [[ ($DISCHARGING == '1') && ($1 == 'D')]]; then
    hyprctl dispatch dpms off
else  
    echo 1
fi
