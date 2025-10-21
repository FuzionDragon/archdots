#!/usr/bin/bash
wallpaper="$(ls ~/Wallpapers |sort -R |tail -1)"
dir=~/Wallpapers/$wallpaper
waybar=~/scripts/refreshwaybar.sh
mako=~/scripts/update-theme.sh

swww-daemon
swww img $dir --transition-type random
wal -i $dir -n
$waybar
$mako
