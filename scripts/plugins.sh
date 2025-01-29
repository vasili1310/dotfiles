#!/bin/bash

# Zsh and plugins
clear
echo "Installing zsh and plugins..."
sleep 3

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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



# Starship.rs
echo "Installing Starship.rs Prompt..."
sleep 3
if ! command -v starship &> /dev/null; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
else
  echo "Starship is already installed, skipping..."
  sleep 3
fi

# Add Starship configuration to ~/.zshrc
if ! grep -q "eval \"\$(starship init zsh)\"" "$ZSHRC"; then
  echo "" >> "$ZSHRC"
  echo "# Load Starship Prompt" >> "$ZSHRC"
  echo "eval \"\$(starship init zsh)\"" >> "$ZSHRC"
fi

# Reload .zshrc
echo "Reloading ~/.zshrc..."
sleep 1
source $HOME/.zshrc

clear
echo "Zsh plugin setup complete!"
sleep 3

# Neovim clipboard
clear
echo "Setting up Neovim clipboard..."
sleep 3

nvim_config="$HOME/.config/nvim/init.vim"
if [ ! -f "$nvim_config" ]; then
  echo "init.vim does not exist, creating it..."
  sleep 1
  mkdir -p "$(dirname "$nvim_config")"
  touch "$nvim_config"
fi

if ! grep -q "set clipboard+=unnamedplus" "$nvim_config"; then
  echo "set clipboard+=unnamedplus" >> "$nvim_config"
fi

clear
echo "Neovim clipboard setup complete!"