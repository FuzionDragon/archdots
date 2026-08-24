#!/usr/bin/bash
dir=~/Pictures/Wallpapers/$1
#mako=~/.scripts/update-theme.sh

uwsm app -- awww-daemon
awww img $dir --transition-type random
uwsm app -- waybar
#$mako
