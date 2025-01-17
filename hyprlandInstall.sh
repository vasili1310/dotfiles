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

yay -S --noconfirm pfetch brave-bin zed vscode wps-office pavucontrol easyeffects obs-studio v4l2loopback-dkms whatsie spotify jetbrains-toolbox wakeonlan orchis-theme-git nwg-look github-desktop
sudo pacman -S --noconfirm blueman zsh

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
echo "Updating..."
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

# Wallpapers
mkdir -p ~/Pictures/wallpapers/
sudo cp -r ~/dotfiles/wallpapers/* ~/Pictures/wallpapers/

# Source files
mkdir -p ~/.config/hypr/
sudo rm -rf ~/.config/hypr/*
sudo cp -r ~/dotfiles/.config/hypr/* ~/.config/hypr/

# Kitty config
mkdir -p ~/.config/kitty/
sudo rm -rf ~/.config/kitty/*
sudo cp -r ~/dotfiles/.config/kitty/* ~/.config/kitty/

# getnf Inconsolata + JetBrainsMono
getnf -i JetBrainsMono
getnf -i Inconsolata

# waybar config
mkdir -p ~/.config/waybar/
sudo rm -rf ~/.config/waybar/*
sudo cp -r ~/dotfiles/.config/waybar/* ~/.config/waybar/

# rofi config
mkdir -p ~/.config/rofi/
sudo rm -rf ~/.config/rofi/*
sudo cp -r ~/dotfiles/.config/rofi/* ~/.config/rofi/

# nvim
mkdir -p ~/.config/nvim/
sudo rm -rf ~/.config/nvim/*
sudo cp -r ~/dotfiles/.config/nvim/* ~/.config/nvim/

clear

# Zsh
echo "Installing zsh and plugins..."
sleepyFunc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Plugins
# Define plugin repositories and their destination paths
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
PLUGINS=(
  "https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
  "https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
)

# Function to clone plugins
echo "Cloning Zsh plugins..."
for PLUGIN in "${PLUGINS[@]}"; do
  REPO=$(echo "$PLUGIN" | awk '{print $1}')
  DEST=$(echo "$PLUGIN" | awk '{print $2}')
  
  if [ -d "$DEST" ]; then
    echo "Plugin already exists: $DEST. Skipping..."
  else
    git clone "$REPO" "$DEST" && echo "Cloned $REPO to $DEST"
  fi
done

# Update ~/.zshrc to include plugins
echo "Updating ~/.zshrc..."
ZSHRC=~/.zshrc
if ! grep -q "plugins=(" "$ZSHRC"; then
  echo "plugins=()" >> "$ZSHRC"
fi

# Ensure plugins are added to ~/.zshrc
sed -i '/^plugins=/c\plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' "$ZSHRC"

# Add sourcing lines if not already present
if ! grep -q "zsh-autosuggestions/zsh-autosuggestions.zsh" "$ZSHRC"; then
  echo "source ${ZSH_CUSTOM}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> "$ZSHRC"
fi

if ! grep -q "zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" "$ZSHRC"; then
  echo "source ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$ZSHRC"
fi

# Install Starship Prompt
echo "Installing Starship Prompt..."
if ! command -v starship &> /dev/null; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
else
  echo "Starship is already installed."
fi

# Add Starship configuration to ~/.zshrc
if ! grep -q "eval \"\$(starship init zsh)\"" "$ZSHRC"; then
  echo "" >> "$ZSHRC"
  echo "# Load Starship Prompt" >> "$ZSHRC"
  echo "eval \"\$(starship init zsh)\"" >> "$ZSHRC"
fi

# Reload .zshrc
echo "Reloading ~/.zshrc..."
source "$ZSHRC"

echo "Zsh plugin setup complete!"

#####

echo "Configuration successfully installed!"

#####
chmod +x setWallpaper.sh
#####

sleepyFunc

clear

# echo "Make sure to add 'exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP' in your '~/.config/hypr/hyprland.conf' (after rebooting into Hyprland) for Screen Sharing!"

# sleepyFunc

echo "Everything is done! You can now reboot your system."
