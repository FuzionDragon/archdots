#!/usr/bin/bash
wallpaper="$(ls ~/Pictures/Wallpapers |sort -R |tail -1)"
dir=~/Pictures/Wallpapers/$wallpaper
waybar=~/.scripts/refreshwaybar.sh
mako=~/.scripts/update-theme.sh

awww-daemon
awww img $dir --transition-type random
wal -i $dir -n
$waybar
$mako
