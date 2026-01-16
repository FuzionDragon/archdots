#!/usr/bin/bash
dir=~/Wallpapers/$1
mako=~/scripts/update-theme.sh

uwsm app -- awww-daemon
awww img $dir --transition-type random
uwsm app -- waybar
$mako
