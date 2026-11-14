#!/usr/bin/bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

cliphist wipe

if [ $(ls -A $HOME/.local/share/Trash/info | wc -l) -ne 0 ]; then
  rm -r $HOME/.local/share/Trash/info/*
fi
if [ $(ls -A $HOME/.local/share/Trash/files | wc -l) -ne 0 ]; then
  rm -r $HOME/.local/share/Trash/files/* 
fi

if [[ $EUID -eq 0 && $(ls -A /var/cache/pacman/pkg | wc -l) -ne 0  ]]; then
  rm -r /var/cache/pacman/pkg/* 
fi

fd Cargo.toml ~ --exec cargo clean --manifest-path

if [ $(ls -A /var/cache/pacman/pkg | wc -l) -ne 0 ]; then
  notify-send "Pacman Cache Not Empty" "Run pacman / paru -Scc and then manually clear /var/cache/pacman/pkg, or you could run this clean.sh script with root permissions"
else
  notify-send "Clear Script Completed" "Trash files, clip history, Rust project cache, and pacman cache cleaned"
fi

