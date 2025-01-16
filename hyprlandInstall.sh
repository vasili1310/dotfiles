#!/bin/bash

sleepyFunc() {
	printf "\n"
	sleep 3
}

clear

echo "Starting Hyprland download!"

# Hyprland Install + Config
# bash <(curl -s "https://end-4.github.io/dots-hyprland-wiki/setup.sh")

# Installing yay
echo "Installing yay..."
sleepyFunc

#####

sudo pacman -S --needed  --noconfirm git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

#####

printf "\n"
echo "yay successfully installed!"
sleepyFunc

clear

# Packages
echo "Installing useful packages..."
sleepyFunc

#####

yay -S --noconfirm pfetch brave-bin zed vscode wps-office pavucontrol easyeffects obs-studio v4l2loopback-dkms whatsie spotify jetbrains-toolbox wakeonlan orchis-theme-git

#####

printf "\n"
echo "Packages successfully installed!"
sleepyFunc

clear

# Screen Sharing
echo "Installing tools for screen sharing..."
sleepyFunc

#####

sudo pacman -S pipewire wireplumber
yay -S xdg-desktop-portal-hyprland-git

#####

printf "\n"
echo "Tools for screen sharing successfully installed!"
sleepyFunc

clear

# Gaming
echo "Installing gaming packages..."
sleepyFunc

#####

sudo pacman -S --noconfirm steam discord

#####

printf "\n"
echo "Gaming packages successfully installed!"
sleepyFunc

clear

# Quick Update
echo "Updating the system before installing BlackArch..."
sleepyFunc

#####

yay -Syu --noconfirm

#####

printf "\n"
echo "Update complete!"
sleepyFunc

clear

# BlackArch
echo "Installing BlackArch..."
sleepyFunc

#####

curl -O https://blackarch.org/strap.sh
echo bbf0a0b838aed0ec05fff2d375dd17591cbdf8aa strap.sh | sha1sum -c
chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syu --noconfirm

#####

printf "\n"
echo "BlackArch successfully installed!"
sleepyFunc

clear

#BlackArch Packages
echo "Installing BlackArch packages for pentesting..."
sleepyFunc

#####

sudo pacman -S --noconfirm blackarch-decompiler blackarch-debugger blackarch-reversing blackarch-networking blackarch-disassembler blackarch-webapp

#####

printf "\n"
echo "Blackarch packages successfully installed!"
sleepyFunc

clear

# JetBrains
# mkdir JetBrains
# cd JetBrains
# wget https://www.jetbrains.com/toolbox-app/download/download-thanks.html?platform=linux
# cd ..

# Hyprland
echo "Installing Hyprland and tools..."
sleepyFunc

#####

sudo pacman -S --noconfirm hyprland waybar zenity 
yay -S --noconfirm kitty wofi hyprshot swaync nemo hyprpaper playerctl getnf rofi

#####

printf "\n"
echo "Hyprland and tools successfully installed!"
sleepyFunc

clear

# Final Update
echo "Performing a final update..."
sleepyFunc

#####

yay -Syu --noconfirm

#####

printf "\n"
echo "Update complete!"
sleepyFunc

clear

echo "Installing the catppuccin config for Hyprland..."
sleepyFunc

#####

sudo chmod +x hyprlandCatppuccin.sh
./hyprlandCatppuccin.sh

#####

echo "Configuration successfully installed!"

sleepyFunc

clear

# echo "Make sure to add 'exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP' in your '~/.config/hypr/hyprland.conf' (after rebooting into Hyprland) for Screen Sharing!"

# sleepyFunc

echo "Everything is done! You can now reboot your system."
