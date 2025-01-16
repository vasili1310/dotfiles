#!/bin/bash

# cd ~

# git clone https://github.com/vasili1310/dotfiles.git

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

# Starship
curl -sS https://starship.rs/install.sh | sh
LINE_TO_ADD='eval "$(starship init bash)"'
echo "$LINE_TO_ADD" >> ~/.bashrc
