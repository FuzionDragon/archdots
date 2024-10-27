# Arch Dotfiles

My personal Arch dotfiles, scripts and packages.

These include my configs for:

- Hyprland
- Waybar
- Neovim
- Rofi
- Pywal
- Mako
- Ncspot
- Zsh
- Kitty
- Fastfetch
- Wireplumber
- Gammastep

This README will have all the necessary steps to replicate the essentials of my system as well as other optional configurations.

You can run the interactive setup script **Work in progress** which will go through all the steps needed to replicate this system. The only requirement needed is that this repo needs to be in your home directory.

Otherwise, the manual setup steps are down below.


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

Download the fonts using

```
$ pacman -S ttf-fira-sans ttf-iosevka-nerd ttf-font-awesome ttf-meslo-nerd 
```

Or install alongside the rest of the packages later


## Installation and Setup

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

### Zsh

Set Zsh as default shell

```
$ chsh -s /usr/bin/zsh
```

Restart the terminal emulator or source the config to apply config

### Pywal and Wallpapers 

Wallpapers are needed at $HOME/Wallpapers for Pywal to work

Check out wallpapers repo if you want to use my favourite wallpapers

```
$ cd $HOME
$ git clone https://github.com/FuzionDragon/Wallpapers.git
```


## Optional Steps

Steps for restoring my system outside of configs

### Configure Pacman

Edit the config file

```
$ nvim /etc/pacman.conf 
```

### Install Aur Helper (paru)

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

Install the essential packages

```
$ cd $HOME/archdots
$ paru -S --needed - < pkglist.txt
```

To install the option packages

```
$ cd $HOME/archdots
$ paru -S --needed - < optional_pkglist.txt
```

**Note: These pkglist files don't have Intel and Nvidia cpu and gpu drivers, so they will need to be installed seperately if needed**

### TLP

Install TLP

```
$ paru -S tlp
```

Configure

```
$ nvim /etc/tlp.conf
```

Then reboot or run

```
$ tlp start
```

You may need to add it as a systemd service before running the above command

### Grub Config

```
$ nvim /etc/default/grub
```

For dual-booting, change the line in grub config

```
GRUB_DISABLE_OS_PROBER=false
```

Then run the command

```
$ grub-mkconfig -o /boot/grub/grub.cfg
```

### Quickemu

There is a Hyprland binding for running a Windows 10 vm.

Of course this doesn't come preinstalled on Arch so this needs to be installed.

```
$ cd ~
$ quickget windows 10
```

If there isn't a need for this binding you can remove the binding in the Hyprland bindings config

```
$ nvim ~/.config/hypr/bindings.conf
```
