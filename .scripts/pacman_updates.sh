#!/usr/bin/bash

packages=checkupdates | wc -l

if [[ $packages -lt 75 ]]; then
  desc="Currently ${packages} packages have updates"
  notify-send "Update Packages" $desc -t 2
fi
