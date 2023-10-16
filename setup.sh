#!/usr/bin/bash

dotfiles="$HOME/dotfiles"

# Paru Install
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Package Install
paru -S rust lld gparted grim git gimp alsa-utils amd-ucode auto-cpufreq autojump-rs base base obsidian npm networkmanager ntfs-3g pfetch-rs polkit-gnome preload rofi timeshift vlc waybar-hyprland xdg-desktop-portal-hyprland xorg-xhost zsh reflector syncthing ttf-firacode-nerd ttf-font-awesome ttf-meslo-nerd ufw openbsd-netcat obs-studio neovim man-db ncspot mako linux-lts linux-firmware linux libreoffice-fresh grub dolphin dmidecode cmake efibootmgr htop hyprland gimp krita firefox iptables-nft brightnessctl bridge-utils armcord kitty spdlog sof-firmware wireplumber steam qt6-wayland swayidle swaylock-effects swww 

# Symlink Configs
sudo ln -sr auto-cpufreq ~/.config/auto-cpufreq
ln -sr kitty ~/.config/kitty
ln -sr nvim ~/.config/nvim
ln -sr rofi ~/.config/rofi
ln -sr swaylock ~/.config/swaylock
ln -sr mako ~/.config/mako
ln -sr waybar ~/.config/waybar
ln -sr Wallpapers ~/Wallpapers
ln -s oh-my-zsh ~/.oh-my-zsh
ln -s zshrc ~/.zshrc
ln -sr ncspot ~/.config/ncspot
ln -sr hypr ~/.config/hypr
rm -r ~/.mozilla/firefox && ln -s firefox ~/.mozilla/firefox

# Reflector Mirrors
reflector --verbose --country 'United Kingdom' -l 10 rate --save /etc/pacman.d/mirrorlist
sudo systemctl enable reflector.timer
sudo systemctl start reflector.timer

