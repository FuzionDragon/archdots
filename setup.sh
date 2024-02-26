#!/usr/bin/bash

dotfiles="$HOME/dotfiles"

# Paru Install
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Reflector Mirrors
reflector --verbose --country 'United Kingdom' -l 10 rate --save /etc/pacman.d/mirrorlist

# Installing Packages
paru -Syu
paru -S alsa-utils amd-ucode android-sdk-platform-tools android-tools appmenu-gtk-module auto-cpufreq autofs autojump-rs base base-devel bridge-utils brightnessctl btop clamav cliphist cmake debtap discord dmidecode dnsmasq efibootmgr enchant firefox gimp go godot gparted grim grub hyprland imagemagick iptables-nft kitty krita lf libvips linux linux-firmware linux-headers linux-lts lld lshw mako man-db mpv ncdu ncspot neovim networkmanager noto-fonts-cjk noto-fonts-emoji npm ntfs-3g obs-studio obsidian okular ollama openbsd-netcat os-prober pacman-contrib pfetch-rs piper polkit-gnome preload pywal-git qemu-base qt6-wayland reflector rofi rust slurp sof-firmware spdlog steam swayidle swaylock-effects-git swtpm swww syncthing tcpdump timeshift ttf-fira-sans ttf-firacode-nerd ttf-font-awesome ttf-meslo-nerd ufw unzip virt-manager vlc vulkan-radeon waybar webkit2gtk weylus wget wireplumber xdg-desktop-portal-hyprland xdg-desktop-portal-wlr xorg-xhost zip zsh

# Symlink Configs using Stow
paru -S stow
stow --adopt .

# Setting Zsh as default shell
sudo chsh -s /usr/bin/zsh
source $HOME/.zshrc

# Setup complete
echo "Setup complete"
