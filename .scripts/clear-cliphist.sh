#!/usr/bin/bash

cliphist list | cliphist delete

notify-send "Clipboard History Cleared" "Clipboard history from past hour cleared."
