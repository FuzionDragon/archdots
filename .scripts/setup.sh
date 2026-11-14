#
# Configuration Setup
#

# Install required packages
echo "Installing required packages"
sudo pacman -S stow ttf-iosevka-nerd ttf-font-awesome ttf-meslo-nerd
cd ~/archdots

# Install specific amd or intel drivers
cpu_vendors=$(cat /proc/cpuinfo | grep vendor_id | awk -F ': ' '{print $2}')
amd="AuthenticAMD"
intel="GenuineIntel"

has_amd=$($cpu_vendors | grep -Fxq $amd && echo 1 || echo 0)
has_intel=$($cpu_vendors | grep -Fxq $intel && echo 1 || echo 0)

# multiple if statements in the case the machine has multiple setup
if [ $has_amd -eq 1 ]; then
    sudo pacman -S amd-ucode
fi
if [ $has_intel -eq 1 ];
    sudo pacman -S intel-ucode
fi
if [ $has_amd -eq 0 ] && [ $has_intel -eq 0 ];
    echo "CPU vendor not recognised, check online for the microcode required for your processor."
fi

#
# Stow
#
while true; do
    read -p "Is GNU Stow already setup? (Y/N): " answer
    case $answer in
        [Yy]* ) stow .; break;;
        [Nn]*) stow --adopt; git restore .; break;;
        * ) echo "Please answer Y or N.";;
    esac
done

# If you wish to use a different AUR Helper and uninstall Paru, you will have to do it manually after the script is done
cd ~/Downloads
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ~/Downloads
rm -rf paru
cd ~/archdots

#
# Reflector for faster downloads
#
sudo pacman -S reflector
echo "To ensure the fastest package download speeds, find your country from this list (use arrow keys to scroll) then quit out by pressing 'q'"
reflector --list-countries | less
while true; do
    read -p "Enter the country you are from (case sensitive): " answer
    while true; do
        found=$(reflector --list-countries | awk -F ' ' '{print $1}' | grep --Fxq $answer && echo 1 || echo 0)
        if [ $found -eq 1 ]; then
        fi
        case $answer in
            [1]* ) paru -S --needed - < ~/.pkglist.txt && paru -S --needed - < ~/.aurpkglist; break;;
            [3]*) paru -S --needed - < ~/.pkglist.txt; break;;
            [3]*) break;;
            * ) echo "Please answer with 1/2/3.";;
        esac
    done
    case $answer in
        [1]* ) paru -S --needed - < ~/.pkglist.txt && paru -S --needed - < ~/.aurpkglist; break;;
        [3]*) paru -S --needed - < ~/.pkglist.txt; break;;
        [3]*) break;;
        * ) echo "Please answer with 1/2/3.";;
    esac
done

sudo reflector --verbose --country 'United Kingdom' --sort rate -l 10 --save /etc/pacman.d/mirrorlist

while true; do
    read -p "Do you want to install all packages? (1: All | 2: No AUR | 3: No Packages): " answer
    case $answer in
        [1]* ) paru -S --needed - < ~/.pkglist.txt && paru -S --needed - < ~/.aurpkglist; break;;
        [3]*) paru -S --needed - < ~/.pkglist.txt; break;;
        [3]*) break;;
        * ) echo "Please answer with 1/2/3.";;
    esac
done

# Setup Kanata
while true; do
    read -p "Do you want to setup my Kanata bindings? (Y/N): " answer
    case $answer in
        [Yy]* ) sudo mkdir /etc/kanata; sudo cp ~/.config/kanata/config.kbd /etc/kanata; sudo systemctl enable kanata.service && sudo systemctl start kanata.service break;;
        [Nn]*) break;;
        * ) echo "Please answer Y or N.";;
    esac
done

# Setting up all Systemd services
