#!/usr/bin/bash

. "${HOME}/.cache/wal/colors.sh"

conffile="${HOME}/.config/mako/config"
wallpaper="$(swww query | awk '{print $8}')"

# Associative array, color name -> color code.
declare -A colors
colors=(
    ["text-color"]="$foreground"
    ["border-color"]="$color3"
)

for color_name in "${!colors[@]}"; do
  # replace first occurance of each color in config file
  sed -i "0,/^$color_name.*/{s//$color_name=${colors[$color_name]}/}" $conffile
done

makoctl reload
# additionally here you can add some notify-send test notification
notify-send "Wallpaper Changed" "Wallpaper = $wallpaper"
