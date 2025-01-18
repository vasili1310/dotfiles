# dotfiles 🗂️
Minimalistic dotfiles for [Hyprland](https://github.com/hyprwm/Hyprland), based on the [Catppuccin](https://github.com/catppuccin/catppuccin) mocha theme.

## Features 🤩
1. **Custom keybindings**:Intuitive shortcuts for efficient navigation and window management.
2. **Theme and Appearance**: A modern, minimalistic aesthetic based on the pastel purple colors of Catppuccin mocha.
3. **Performance Tweaks**: Optimized settings for smooth animations and low system resource usage.
4. **Integration**: Seamless compatibility with popular Wayland applications and tools.
5. **Modules**:
  - **Bar/Panel**: Configuration for [Waybar](https://github.com/Alexays/Waybar) based on [Typecraft](https://github.com/typecraft-dev/dotfiles/tree/master/waybar/.config/waybar)'s waybar.
  - **Launchers**: Configuration for [Rofi](https://github.com/davatorium/rofi) application launcher.

## Screenshots 📸
![Screenshot 1](screenshots/screenshot1.png)
![Screenshot 2](screenshots/screenshot2.png)
![Screenshot 3](screenshots/screenshot3.png)

## Warning ⚠️

Please read the following before proceeding with the installation:

1. **Backup your files in ~/.config, as the script will delete files to add the new ones.**
2. **The script was designed for Arch / Arch-based Linux distros, it will not work on any non-Arch distro.**
3. **This script is still a work in progress, you might encounter errors / bugs / glitches.**

With that out of the way, let's continue.

## Installation 🛠️
Follow these steps to install and apply this Hyprland configuration.

### 1. Auto install with one command
```
sudo pacman -S --noconfirm git && cd ~ && git clone https://github.com/vasili1310/dotfiles && cd dotfiles && sudo chmod +x hyprlandInstall.sh && bash hyprlandInstall.sh
```

### 2. Auto install with multiple commands
```
cd ~
git clone https://github.com/vasili1310/dotfiles
cd dotfiles
sudo chmod +x hyprlandInstall.sh
bash hyprlandInstall.sh
```

### 3. Manual install
Download the appropriate folders from .config and manually place them in your ~/.config/ directory.
