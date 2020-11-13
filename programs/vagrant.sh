#!/bin/bash

# Vagrant
#sudo apt install -qq -y vagrant=2.2.10 
# Install from Debian package if version is not in default repository
VAGRANT_VER="2.2.9"
tempVagrantVersion="Vagrant 2.2.9"
checkVersion=$(vagrant --version)
if [ ${checkVersion} = ${tempVagrantVersion} ]; then
    echo "Already installed Vagrant: ${VAGRANT_VER}"
else
    echo "Installing: Ansible $VAGRANT_VER..."
#    wget https://releases.hashicorp.com/vagrant/${VAGRANT_VER}/vagrant_${VAGRANT_VER}_x86_64.deb
#    sudo dpkg -i vagrant_${VAGRANT_VER}_x86_64.deb
#    sudo apt -f install
#    rm vagrant_${VAGRANT_VER}_x86_64.deb
fi
#Plugins
#sudo vagrant plugin install vagrant-libvirt vagrant-vbguest
sudo vagrant plugin uninstall vagrant-vbguest
vagrant plugin install vagrant-vbguest
sudo vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-vbguest