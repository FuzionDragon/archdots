#!/usr/bin/bash

dotfiles="$HOME/dotfiles"

# Paru Install
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Package Install
paru -S rust lld gparted grim git gimp alsa-utils amd-ucode auto-cpufreq autojump-rs base base obsidian npm networkmanager ntfs-3g pfetch-rs polkit-gnome preload rofi timeshift vlc waybar-hyprland xdg-desktop-portal-hyprland xorg-xhost zsh reflector syncthing ttf-fira-sans ttf-firacode-nerd ttf-font-awesome ttf-meslo-nerd ufw openbsd-netcat obs-studio neovim man-db ncspot mako linux-lts linux-firmware linux grub lf dmidecode cmake efibootmgr btop hyprland gimp krita firefox iptables-nft brightnessctl bridge-utils armcord kitty spdlog sof-firmware wireplumber steam qt6-wayland swayidle swaylock-effects swww os-prober 

# Clone Hypr Config
rm -r ~/.config/hypr
git clone https://github.com/FuzionDragon/hyprdots.git ~/.config

# Symlink Configs
cdir="$HOME/.config"
home="$HOME"

sudo ln -s auto-cpufreq ~/.config/auto-cpufreq
ln -s "$dotfiles/kitty" ~/.config/kitty
ln -s "$dotfiles/nvim" ~/.config/nvim
ln -s "$dotfiles/rofi" ~/.config/rofi
ln -s "$dotfiles/swaylock" ~/.config/swaylock
ln -s "$dotfiles/mako" ~/.config/mako
ln -s "$dotfiles/waybar" ~/.config/waybar
ln -s "$dotfiles/Wallpapers" ~/Wallpapers
ln -s "$dotfiles/oh-my-zsh" ~/.oh-my-zsh
ln -s "$dotfiles/zshrc" ~/.zshrc
ln -s "$dotfiles/ncspot" ~/.config
ln -s "$dotfiles/wal" ~/.config
ln -s "$cdir/hypr" hypr

# Reflector Mirrors
reflector --verbose --country 'United Kingdom' -l 10 rate --save /etc/pacman.d/mirrorlist
