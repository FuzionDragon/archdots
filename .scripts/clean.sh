#!/usr/bin/bash

cliphist wipe
rm -r ~/.local/share/Trash/info/*
rm -r ~/.local/share/Trash/files/*
notify-send "Clear Script" "Trash files and clip history cleared"
