#!/usr/bin/bash
dir=~/Wallpapers/$1
mako=~/scripts/update-theme.sh

uwsm app -- swww-daemon
swww img $dir --transition-type random
uwsm app -- waybar
$mako
