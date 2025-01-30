#!/bin/bash

kitty sh -c '
echo "Select an option for waybar style:"
echo "1) catppuccin"
echo "2) typecraft"
read -p "Enter your choice: " choice

case $choice in
    1)
        rm ~/.config/waybar/config.jsonc
        rm ~/.config/waybar/style.css
        cp ~/dotfiles/.config/waybar/catppuccin/config.jsonc ~/.config/waybar/config.jsonc
        cp ~/dotfiles/.config/waybar/catppuccin/style.css ~/.config/waybar/style.css
        ;;
    2)
        rm ~/.config/waybar/config.jsonc
        rm ~/.config/waybar/style.css
        cp ~/dotfiles/.config/waybar/typecraft/config.jsonc ~/.config/waybar/config.jsonc
        cp ~/dotfiles/.config/waybar/typecraft/style.css ~/.config/waybar/style.css
        ;;
    *)
        echo "Invalid choice"
        ;;
esac
'

pkill -USR1 waybar
waybar &
