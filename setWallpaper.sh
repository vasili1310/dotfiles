#!/bin/bash

# Path to hyprpaper.conf
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

# Select a new wallpaper using zenity
NEW_WALLPAPER=$(zenity --file-selection --title="Select Wallpaper")

# Check if the user selected a file
if [ -z "$NEW_WALLPAPER" ]; then
  echo "No file selected. Exiting."
  exit 1
fi

# Update the hyprpaper.conf file
if [[ -f "$CONFIG_FILE" ]]; then
  # Replace or add the preload and wallpaper lines
  sed -i "/^preload = /c\preload = $NEW_WALLPAPER" "$CONFIG_FILE"
  sed -i "/^wallpaper = /c\wallpaper = , $NEW_WALLPAPER" "$CONFIG_FILE"
else
  echo "Config file not found. Creating a new one."
  echo "preload = $NEW_WALLPAPER" > "$CONFIG_FILE"
  echo "wallpaper = , $NEW_WALLPAPER" >> "$CONFIG_FILE"
fi

# Reload hyprpaper
pkill -USR1 hyprpaper

echo "Wallpaper updated successfully."

hyprpaper &

