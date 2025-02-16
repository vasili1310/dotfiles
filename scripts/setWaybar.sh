#!/bin/bash

kitty sh -c '
echo "Select an option for waybar style:"
echo "1) catppuccin w/o theme"
echo "2) catpuccin w/ theme"
echo "3) typecraft"
echo "4) black and white w/o theme"
echo "5) black and white w/ theme"
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
        cp ~/dotfiles/.config/waybar/catppuccin/config.jsonc ~/.config/waybar/config.jsonc
        cp ~/dotfiles/.config/waybar/catppuccin/style.css ~/.config/waybar/style.css
	rm ~/.config/kitty/kitty.conf
	cp ~/dotfiles/.config/kitty/catppuccinConfig/kitty.conf ~/.config/kitty/kitty.conf
	rm ~/.config/hypr/hyprland/general.conf
	cp ~/dotfiles/.config/hypr/catppuccinTheme/general.conf ~/.config/hypr/hyprland/
	hyprctl reload
        ;;
    3)
        rm ~/.config/waybar/config.jsonc
        rm ~/.config/waybar/style.css
        cp ~/dotfiles/.config/waybar/typecraft/config.jsonc ~/.config/waybar/config.jsonc
        cp ~/dotfiles/.config/waybar/typecraft/style.css ~/.config/waybar/style.css
        ;;
    4)
	rm ~/.config/waybar/config.jsonc
	rm ~/.config/waybar/style.css
	cp ~/dotfiles/.config/waybar/blackNwhite/config.jsonc ~/.config/waybar/
	cp ~/dotfiles/.config/waybar/blackNwhite/style.css ~/.config/waybar/
	;;
    5)
	rm ~/.config/waybar/config.jsonc
	rm ~/.config/waybar/style.css
	cp ~/.config/waybar/blackNwhite/config.jsonc ~/.config/waybar/
	cp ~/.config/waybar/blackNwhite/style.css ~/.config/waybar/
	rm ~/.config/kitty/kitty.conf
	cp ~/dotfiles/.config/kitty/blackNwhiteConfig/kitty.conf ~/.config/kitty/kitty.conf
	rm ~/.config/hypr/hyprland/general.conf
	cp ~/dotfiles/.config/hypr/blackNwhiteTheme/general.conf ~/.config/hypr/hyprland/
	hyprctl reload
	;;
    *)
        echo "Invalid choice"
        ;;
esac
'

pkill waybar
sleep 1
waybar &
