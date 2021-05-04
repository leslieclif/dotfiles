#!/usr/bin/env bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/dotfiles
# And also installs Developer Tool Packages
# And installs VSCode Extentions
############################

if [ "$#" -ne 1 ]; then
    echo "Usage: ./install.sh <home_directory> eg: ./install.sh /home/leslie"
    exit 1
fi

homedir=$1

# Print working directory
echo "Dotfiles directory $(pwd)"

# copy static files and config
./copy.sh
echo "✔ Copy files"

# install apt packages
./aptInstall.sh
echo "✔ Apt packages are up to date"

#git pull
echo "✔ Dotfiles are up to date"

# Install packages/scripts from internet
./downloadFiles.sh
echo "✔ Scripts are up to date"

# list of files/folders to symlink in ${homedir}
./symlinks.sh
echo "✔ Symbolic links are up to date"

# Install Programs
./programs/programs.sh
echo "✔ Developer programs are up to date"

sudo apt-get autoremove -y && sudo apt-get clean -y
echo "✔ Removed packages no longer required"

# Get all upgrades
sudo apt upgrade -y
echo "✔ Applications are up to date"

# Backup settings to Github
echo "✔ Settings are backed up to Github"