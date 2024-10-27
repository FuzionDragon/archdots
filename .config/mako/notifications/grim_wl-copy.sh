#!/usr/bin/bash

grim -g "$(slurp)" - | wl-copy
notify-send 'Screenshot Taken' 'Copied to clipboard'
