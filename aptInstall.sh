#!/usr/bin/env bash
############################
# This script creates installs apt packages
############################

echo "apt update..."
sudo apt -qq update
echo "✔ update done!"

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -qq -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
install zsh 
install git
install curl
install virtualbox
install tmux
install dialog
install exfat-utils
install file
install htop
install nmap
install tree
install vim
install wget
install jq
install gnome-shell
install ubuntu-gnome-desktop
# Addon packages
echo "✔ base packages are installed"