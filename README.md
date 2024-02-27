# My Arch Dotfiles

## Requirements

Ensure you have the following on your system

### Git

'''
pacman -S --needed base-devel git
'''

### Stow

'''
pacman -S stow
'''

### Aur Helper (paru)

Check out paru repo in $HOME directory using git

'''
$ cd $HOME
$ git clone https://aur.archlinux.org/paru.git
$ cd paru
$ makepkg -si
'''

## Installation

First, check out the dotfiles repo in $HOME directory using git

```
$ git clone https://github.com/FuzionDragon/archdots.git
$ cd archdots
```

### Use GNU stow to create symlinks

```
$ stow .
```

**If there are any existing dotfiles on the system**

```
$ stow --adopt .
$ git restore .
```

### Install Packages using pkglist in the archdots repo

If you want faster package downloads

```
pacman -S reflector
reflector --verbose --country 'United Kingdom' --sort rate -l 10 --save /etc/pacman.d/mirrorlist
```

```
$ pacman -S --needed - < pkglist.txt
```

If you are using Aur Packages

```
$ paru -S --needed - < pkglist_aur.txt
```

