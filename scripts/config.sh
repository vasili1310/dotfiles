#!/bin/bash

clear
echo "Installing the catppuccino mocha config for Hyprland..."
sleep 3

backup_dir="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"
echo "Creating a backup of the ~/.config directory at $backup_dir..."
sleep 3

while true; do
    cp -r ~/.config "$backup_dir"
    if [ $? -eq 0 ]; then
        echo "Backup successful."
        break
    else
        echo "Backup failed."
        read -p "Do you want to retry? (y/n): " yn
        case $yn in
            [Yy]* ) continue;;
            [Nn]* ) echo "Backup aborted."; exit 1;;
            * ) echo "Please answer y or n.";;
        esac
    fi
done

# Array of directories to check
directories=("hypr" "kitty" "waybar" "rofi" "nvim") 

for dir in "${directories[@]}"; do
    dir_path="$HOME/.config/$dir"
    if [ -d "$dir_path" ]; then
        if [ "$(ls -A "$dir_path")" ]; then
            echo "$dir_path is not empty, removing all contents..."
            while true; do
                rm -rf "${dir_path:?}"/*
                if [ $? -eq 0 ]; then
                    echo "Contents of $dir_path removed successfully."
                    break
                else
                    echo "Failed to remove contents of $dir_path."
                    read -p "Do you want to retry? (y/n): " yn
                    case $yn in
                        [Yy]* ) continue;;
                        [Nn]* ) echo "Operation aborted."; exit 1;;
                        * ) echo "Please answer y or n.";;
                    esac
                fi
            done
        else
            echo "$dir_path is empty, adding config files..."
            sleep 1
            if [ -d "$HOME/dotfiles/.config/$dir" ]; then
                cp -r ~/dotfiles/.config/$dir/* "$dir_path/"
                if [ $? -eq 0 ]; then
                    echo "Done adding the config files for $dir."
                else
                    echo "Failed to copy config files for $dir."
                    exit 1
                fi
            else
                echo "Source directory ~/dotfiles/.config/$dir does not exist."
                exit 1
            fi
        fi
    else
        echo "$dir_path does not exist, creating the directory and adding the config files..."
        sleep 1
        mkdir -p "$dir_path"
        if [ -d "$HOME/dotfiles/.config/$dir" ]; then
            cp -r ~/dotfiles/.config/$dir/* "$dir_path/"
            if [ $? -eq 0 ]; then
                echo "Done adding the config files for $dir."
            else
                echo "Failed to copy config files for $dir."
                exit 1
            fi
        else
            echo "Source directory ~/dotfiles/.config/$dir does not exist."
            exit 1
        fi
    fi
done
sleep 3

clear
echo "Config files installed successfully."