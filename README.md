# My Arch Dotfiles

My personal Arch dotfiles and packages.

This includes personal configs and scripts for:
- Hyprland
- Waybar
- Neovim
- Rofi
- Pywal
- Mako
- Zsh
- Kitty
- Lf
- Ncspot

This also acts as my system backup so less relavent setup instructions are included.

## Requirements

Ensure you have the following on your system

### Git

```
pacman -S --needed base-devel git
```

### Stow

```
pacman -S stow
```

## Installation

Check out archdots repo in $HOME directory using git

```
$ git clone https://github.com/FuzionDragon/archdots.git
$ cd archdots
```

### Use GNU stow to create symlinks

```
$Kit stow .
```

**If there are any existing dotfiles on the system**

```
$ stow --adopt .
$ git restore .
```

### Pywal and Wallpapers 

Wallpapers are needed at $HOME/Wallpapers for Pywal to work

Check out wallpapers repo if you want to use my favourite wallpapers

```
$ cd $HOME
$ git clone https://github.com/FuzionDragon/Wallpapers.git
```

## Personal Steps (optional)

Setup for restoring my setup outside of configs

### Aur Helper (paru)

Check out paru repo in $HOME directory using git

```
$ cd $HOME
$ git clone https://aur.archlinux.org/paru.git
$ cd paru
$ makepkg -si
```

### Install Packages using pkglist in the archdots repo 

For faster package downloads

```
pacman -S reflector
reflector --verbose --country 'United Kingdom' --sort rate -l 10 --save /etc/pacman.d/mirrorlist
```

```
$ pacman -S --needed - < pkglist.txt
```

### Zsh

Set Zsh as default shell

```
$ sudo chsh -s /usr/bin/zsh
$ source $HOME/.zshrc
```

### Auto-cpufreq

Install Auto-cpufreq

```
$ pacman -S auto-cpufreq
```

Configure

```
$ sudo nvim /etc/auto-cpufreq.conf
```
