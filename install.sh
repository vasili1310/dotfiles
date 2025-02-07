#!/bin/bash

install_packages() {
    sudo pacman -S --noconfirm git waybar zenity blueman zsh neovim discord
    yay -S --noconfirm kitty wofi hyprshot-git swaync nemo hyprpaper-git playerctl getnf rofi hyprlock-git wl-clipboard clipman zed visual-studio-code-bin pavucontrol easyeffects spotify orchis-theme-git nwg-look swaync hyprpolkitagent-git ranger zen-browser-bin hyprcursor-git rose-pine-hyprcursor breezex-cursor-theme
    yay -Syu --noconfirm # Update all packages
}

clear

echo "Installing the catppuccin mocha config for Hyprland..."
sleep 3

echo "Checking if yay is installed..."
sleep 3

if command -v yay &> /dev/null
then
    echo "yay is installed, skipping..."
else
    echo "yay is not installed, the script will install it now..."
    sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    echo "Done"
fi
sleep 3
clear


echo "Installing the required packages..."
sleep 3

install_packages
if [ $? -ne 0 ]; then
    echo "There were errors installing the packages."
    while true; do
        read -p "Do you want to retry? (y/n): " yn
        case $yn in
            [Yy]* ) install_packages; if [ $? -eq 0 ]; then break; fi;;
            [Nn]* ) echo "Installation aborted."; exit 1;;
            * ) echo "Please answer y or n.";;
        esac
    done
else
    echo "Done."
fi
sleep 3
clear

echo "Cloning the GitHub repository..."
sleep 3
cd $HOME
git clone https://github.com/vasili1310/dotfiles
cd dotfiles
echo "Done."
sleep 3
clear

echo "Downloading fonts..."
sleep 3
getnf -i JetBrainsMono
getnf -i Inconsolata
echo "Done."
sleep 3
clear

sudo chmod +x ~/dotfiles/scripts/config.sh
source $HOME/dotfiles/scripts/config.sh

sudo chmod +x ~/dotfiles/scripts/plugins.sh
source $HOME/dotfiles/scripts/plugins.sh

sudo chmod +x ~/dotfiles/scripts/setWallpaper.sh

echo "Adding wallpapers"
sleep 3
mkdir -p ~/Pictures/wallpapers
sudo cp -r ~/dotfiles/wallpapers/* ~/Pictures/wallpapers/
echo "Done."
clear

echo "Everything is done! You can now reboot your system."
printf "\n"
echo "Make sure to open 'nwg-look' ('GTK Settings') after rebooting (or right now) and selecting the 'Orchis-Purple-Dark' Theme."
printf "\n"
echo "After rebooting, you can use SUPER (Windows key) + F12 to open the cheatsheet."
echo "Thanks for installing! <3"
