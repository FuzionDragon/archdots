#!/usr/bin/bash
dir=~/Wallpapers/$1
waybar=~/scripts/refreshwaybar.sh
mako=~/scripts/update-theme.sh

swww-daemon
swww img $dir --transition-type random
wal -i $dir -n
$waybar
$mako
