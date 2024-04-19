# My Arch Dotfiles

My personal Arch dotfiles and packages.

This includes personal configs and scripts for:
- Hyprland
- Waybar
- Neovim
- Rofi
- Pywal
- Mako
- Ncspot
- Zsh
- Kitty
- Weylus

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

### Fonts

Certain configs require specific fonts


```
$ pacman -S ttf-fira-sans ttf-firacode-nerd ttf-font-awesome ttf-meslo-nerd
```

## Installation

Check out archdots repo in $HOME directory using git

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
$ paru -S reflector
$ reflector --verbose --country 'United Kingdom' --sort rate -l 10 --save /etc/pacman.d/mirrorlist
```

Install the pkglist

```
$ paru -S --needed - < pkglist.txt
```

### Zsh

Set Zsh as default shell

```
$ chsh -s /usr/bin/zsh
$ source $HOME/.zshrc
```

Install Oh-my-zsh

```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Restart terminal emulator to start setup 

### Auto-cpufreq

Install Auto-cpufreq

```
$ pacman -S auto-cpufreq
```

Configure

```
$ sudo nvim /etc/auto-cpufreq.conf
```
