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
paru -S alsa-utils amd-ucode android-sdk-platform-tools android-tools appmenu-gtk-module auto-cpufreq autofs autojump-rs base base-devel bridge-utils brightnessctl btop clamav cliphist cmake debtap discord dmidecode dnsmasq efibootmgr enchant firefox geekbench gimp git go godot gparted grim grub hyprland imagemagick iptables-nft kitty krita lf libvips linux linux-firmware linux-headers linux-lts lld lshw mako man-db mpv ncdu ncspot neovim networkmanager noto-fonts-cjk noto-fonts-emoji npm ntfs-3g obs-studio obsidian okular ollama openbsd-netcat os-prober pacman-contrib pfetch-rs piper polkit-gnome preload pywal-git qemu-base qt6-wayland reflector rofi rust slurp sof-firmware spdlog steam swayidle swaylock-effects-git swtpm swww syncthing tcpdump timeshift ttf-fira-sans ttf-firacode-nerd ttf-font-awesome ttf-meslo-nerd ufw unzip virt-manager vlc vulkan-radeon waybar webkit2gtk weylus wget wireplumber xdg-desktop-portal-hyprland xdg-desktop-portal-wlr xorg-xhost zip zsh

# Symlink Configs
cdir="$HOME/.config"
home="$HOME"

# Clone Hypr Config
rm -r ~/.config/hypr
git clone https://github.com/FuzionDragon/hyprdots.git ~/.config
mv "$cdir/hypr" hypr

# Symlink Configs
sudo ln -s auto-cpufreq ~/.config/auto-cpufreq
ln -sfn "$dotfiles/kitty" ~/.config/kitty
ln -sfn "$dotfiles/nvim" ~/.config/nvim
ln -sfn "$dotfiles/rofi" ~/.config/rofi
ln -sfn "$dotfiles/swaylock" ~/.config/swaylock
ln -sfn "$dotfiles/mako" ~/.config/mako
ln -sfn "$dotfiles/waybar" ~/.config/waybar
ln -sfn "$dotfiles/ncspot" ~/.config/ncspot
ln -sfn "$dotfiles/wal" ~/.config/wal
ln -sfn "$dotfiles/lf" ~/.config/lf
ln -sfn "$dotfiles/Wallpapers" ~/Wallpapers
ln -sfn "$dotfiles/oh-my-zsh" ~/.oh-my-zsh
ln -sfn "$dotfiles/zshrc" ~/.zshrc

# Setting Zsh as default shell
sudo chsh -s /usr/bin/zsh
source $HOME/.zshrc

# Setup complete
echo "Setup complete"
