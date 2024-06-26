#!/usr/bin/bash

#!/usr/bin/env bash

if grep open /proc/acpi/button/lid/LID/state; then
    hyprctl keyword monitor "eDP-1, 2560x1440@165, 0x0, 1"
else
    if [[ `hyprctl monitors | grep "Monitor" | wc -l` != 1 ]]; then
        hyprctl keyword monitor "eDP-1, disable"
        echo "Disable"
    fi
fi
