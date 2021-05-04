#!/usr/bin/env bash
############################
# This script creates symlinks of the dotfiles to the home directory
############################

dotfilesDir=$(pwd)
dotfilesBkpDir="${HOME}/dotfilesbkp/"
# List the files to create symlinks 
files="bashrc profile zshrc exports aliases functions private gitconfig gitignore tmux.conf p10k.zsh"

# Create dotfiles backup directory
mkdir -p ${dotfilesBkpDir}

# Removes existing symlinks, backs up dotfiles and creates new symlinks
function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink 
    #echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest} ${dotfilesBkpDir}/${1}.${dateStr}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi
  #echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

for file in ${files}; do
    linkDotfile .${file}
done
#echo "✔ symlinks update done!"

#rm -f ~/projects
#ln -sf /mnt/c/Users/Leslie/testprojects ~/projects
#rm -f ~/downloads
#ln -sf /mnt/c/Users/jieverson/Downloads ~/downloads
#rm -f ~/pictures
#ln -sf /mnt/c/Users/jieverson/Pictures ~/pictures
#echo "✔ alias for windows folders"

# Install NPM, Docker etc
#echo "✔ apt dev tools installed"