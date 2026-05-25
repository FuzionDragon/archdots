#!/usr/bin/bash
wallpaper=$(ls ~/Pictures/Wallpapers | rofi -dmenu)
dir=~/Pictures/Wallpapers/$wallpaper
waybar=~/scripts/refreshwaybar.sh
mako=~/scripts/update-theme.sh

awww-daemon
awww img $dir --transition-type random
$waybar
$mako
