#!/usr/bin/bash
swayidle -w \
	timeout 120 '[ "$(cat /sys/class/power_supply/AC/online)" = "0" ] &&  swaylock ' \
resume ' hyprctl dispatch dpms on' \
	timeout 240 '[ "$(cat /sys/class/power_supply/AC/online)" = "1" ] &&  swaylock ' \
resume ' hyprctl dispatch dpms on' \
	timeout 300 '[ "$(cat /sys/class/power_supply/AC/online)" = "0" ] && hyprctl dispatch dpms off' \
resume ' hyprctl dispatch dpms on' \
	timeout 360 '[ "$(cat /sys/class/power_supply/AC/online)" = "1" ] && hyprctl dispatch dpms off' \
resume ' hyprctl dispatch dpms on' \
	timeout 360 '[ "$(cat /sys/class/power_supply/AC/online)" = "0" ] systemctl suspend' \
resume ' hyprctl dispatch dpms on' \
	timeout 480 '[ "$(cat /sys/class/power_supply/AC/online)" = "1" ] systemctl suspend' \
resume ' hyprctl dispatch dpms on' \
before-sleep 'swaylock'
