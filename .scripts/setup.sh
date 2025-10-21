#!/usr/bin/bash

# Install required packages
echo "Installing required packages"
sudo pacman -S stow ttf-iosevka-nerd ttf-font-awesome ttf-meslo-nerd
cd ~/archdots

# Stow
while true; do
    read -p "Is this a fresh install? (Y/N): " answer
    case $answer in
        [Yy]* ) stow .; break;;
        [Nn]*) stow --adopt; git restore .; break;;
        * ) echo "Please answer Y or N.";;
    esac
done

# This assumes the system doesn't have an AUR Helper, so it sets up Paru since it's the helper of my choice
# If you wish to use a different AUR Helper and uninstall Paru, you will have to do it manually after the script is done
cd ~/Downloads
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ~/Downloads
rm -rf paru
cd ~/archdots
paru -S reflector
sudo reflector --verbose --country 'United Kingdom' --sort rate -l 10 --save /etc/pacman.d/mirrorlist

while true; do
    read -p "Do you want to install all packages? (Y/N): " answer
    case $answer in
        [Yy]* ) paru -S --neeeded - < ~/pkglist.txt; break;;
        [Nn]*) break;;
        * ) echo "Please answer Y or N.";;
    esac
done

# Setup Kanata
while true; do
    read -p "Do you want to install all packages? (Y/N): " answer
    case $answer in
        [Yy]* ) sudo cp ~/.config/kanata/config.kbd; break;;
        [Nn]*) break;;
        * ) echo "Please answer Y or N.";;
    esac
done

# Setting up all Systemd services
