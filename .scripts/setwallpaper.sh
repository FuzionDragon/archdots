#!/usr/bin/bash
dir=~/Wallpapers/$1
waybar=~/scripts/refreshwaybar.sh
mako=~/scripts/update-theme.sh

awww-daemon
awww img $dir --transition-type random
$waybar
$mako
