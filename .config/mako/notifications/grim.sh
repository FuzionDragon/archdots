#!/usr/bin/bash

grim -g "$(slurp)"
notify-send 'Screenshot Taken' 'Saved to ~/Pictures'
