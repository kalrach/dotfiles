#!/bin/bash

# Detect Distro
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    echo "Could not detect Linux Distribution"
    exit 1
fi

echo "Detected: $DISTRO"

# Install packages
case $DISTRO in
    ubuntu|debian|linuxmint)
        sudo apt update && sudo apt install -y zsh tmux neovim git curl
        ;;
    arch|archlinux|manjaro)
        sudo pacman -Sy --noconfirm zsh tmux neovim git curl
        ;;
    fedora|rhel|centos)
        sudo dnf install -y zsh tmux neovim git curl || sudo yum install -y zsh tmux neovim git curl
        ;;
    freebsd)
        sudo pkg install -y zsh tmux neovim git curl
        ;;
    *)
        echo "Unsupported distribution: $DISTRO"
        exit 1
        ;;
esac

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Set Zsh as default shell
if ! grep -q "$(which zsh)" /etc/shells; then
    echo "$(which zsh)" | sudo tee -a /etc/shells
fi
chsh -s "$(which zsh)" "$(whoami)"

# Install TPM
TPM_DIR="$HOME/.config/tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

echo "zsh and tmux setup complete"

