#!/usr/bin/bash

grim "$HOME/Pictures/Screenshots"/"$(date +%Y%m%d-%Hh%Mm%Ss)_grim".png
notify-send 'Full Screenshot Taken' 'Saved to ~/Pictures/Screenshots'
