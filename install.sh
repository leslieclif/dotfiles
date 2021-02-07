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
echo "✔ copy files"

# install apt packages
./aptInstall.sh
echo "✔ apt packages are up to date"

#git pull
echo "✔ dotfiles are up to date"

# Install packages/scripts from internet
./downloadFiles.sh
echo "✔ scripts are up to date"

# list of files/folders to symlink in ${homedir}
./symlinks.sh
echo "✔ symbolic links are up to date"

# Install Programs
./programs/programs.sh
echo "✔ develper programs are up to date"

sudo apt autoremove -y
echo "✔ Removed packages no longer required"

# Get all upgrades
sudo apt upgrade -y
echo "✔ Applications are up to date"

# Backup settings to Github
echo "✔ Settings are backed up to Github"