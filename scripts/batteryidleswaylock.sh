#!/usr/bin/bash
DISCHARGING=$(acpi -b | grep "Battery 0" | grep -c "Discharging")

if [[ ($DISCHARGING == '0') && ($1 == 'L')]]; then
    swaylock
elif [[ ($DISCHARGING == '0') && ($1 == 'D')]]; then
    hyprctl dispatch dpms off
else  
    echo 1
fi
