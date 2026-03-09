#!/usr/bin/bash

grim -g "$(slurp)" "$HOME/Pictures/Screenshots"/"$(date +%Y%m%d-%Hh%Mm%Ss)_grim".png
notify-send 'Screenshot Taken' 'Saved to ~/Pictures/Screenshots'
