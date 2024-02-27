# Dotfiles and System Setup

### Install Git and Aur Helper (paru)
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

### Reflector
pacman -S reflector
reflector --verbose --country 'United Kingdom' --sort rate -l 10 --save /etc/pacman.d/mirrorlist

### Clone dotfiles (and Wallpapers)
git clone https://github.com/FuzionDragon/archdots.git

### Install Packages using pkglist
pacman -S --needed - < pkglist.txt
paru -S --needed - < pkglist_aur.txt

