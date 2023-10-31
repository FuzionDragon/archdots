#!/usr/bin/bash

dotfiles="$HOME/dotfiles"

# Paru Install
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Reflector Mirrors
reflector --verbose --country 'United Kingdom' -l 10 rate --save /etc/pacman.d/mirrorlist

# Package Install
paru -Syu
paru -S alsa-utils amd-ucode appmenu-gtk-module armcord auto-cpufreq autojump-rs base base-devel bridge-utils brightnessctl btop cmake debtap dmidecode efibootmgr enchant etcher-bin firefox gimp git gparted grim git gparted grim grub htop hyprland imagemagick iptables-nft kitty krita lf libvips linux linux-firmware linux-lts lld mako man-db ncspot neovim networkmanager npm ntfs-3g obs-studio obsidian okular openbsd-netcat os-prober pfetch-rs polkit-gnome preload pywal-git qt6-wayland reflector rofi rust slurp sof-firmware spdlog steam swayidle swaylock-effects swww syncthing timeshift tree ttf-fira-sans ttf-firacode-nerd ttf-font-awesome ttf-meslo-nerd ufw unzip vlc waybar-hyprland webkit2gtk wget wireplumber xdg-desktop-portal-hyprland xorg-xhost zsh

# Clone Hypr Config
rm -r ~/.config/hypr
git clone https://github.com/FuzionDragon/hyprdots.git ~/.config

# Symlink Configs
cdir="$HOME/.config"
home="$HOME"

sudo ln -s auto-cpufreq ~/.config/auto-cpufreq
ln -sfn "$dotfiles/kitty" ~/.config/kitty
ln -sfn "$dotfiles/nvim" ~/.config/nvim
ln -sfn "$dotfiles/rofi" ~/.config/rofi
ln -sfn "$dotfiles/swaylock" ~/.config/swaylock
ln -sfn "$dotfiles/mako" ~/.config/mako
ln -sfn "$dotfiles/waybar" ~/.config/waybar
ln -sfn "$dotfiles/Wallpapers" ~/Wallpapers
ln -sfn "$dotfiles/oh-my-zsh" ~/.oh-my-zsh
ln -sfn "$dotfiles/zshrc" ~/.zshrc
ln -sfn "$dotfiles/ncspot" ~/.config
ln -sfn "$dotfiles/wal" ~/.config
ln -sfn "$cdir/hypr" hypr

