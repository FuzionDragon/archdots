#!/usr/bin/bash
wallpaper=$(ls ~/Wallpapers | rofi -dmenu)
dir=~/Wallpapers/$wallpaper
waybar=~/scripts/refreshwaybar.sh
mako=~/scripts/update-theme.sh

awww-daemon
awww img $dir --transition-type random
$waybar
$mako
