#!/bin/bash

# Vagrant
#sudo apt install -qq -y vagrant=2.2.10 
# Install from Debian package if version is not in default repository
VAGRANT_VER="2.2.14"
tempVagrantVersion=$(vagrant --version)
# Splitting 'Vagrant 2.2.9' output with space as delimiter and putting the version in 'checkVersion' variable
checkVersion=$(echo $tempVagrantVersion | sed -E 's/(.*) {1}(.*)/\2/')
if [ ${checkVersion} = ${VAGRANT_VER} ]; then
    echo "Already installed Vagrant: ${VAGRANT_VER}"
else
    echo "Installing: Ansible $VAGRANT_VER..."
    wget https://releases.hashicorp.com/vagrant/${VAGRANT_VER}/vagrant_${VAGRANT_VER}_x86_64.deb
    sudo dpkg -i vagrant_${VAGRANT_VER}_x86_64.deb
    sudo apt -f install
    rm vagrant_${VAGRANT_VER}_x86_64.deb
fi
#Plugins
sudo vagrant plugin list &> /dev/null
if [ $? -ne 0 ]; then
echo "Installing Vagrant Plugins..."
    #sudo vagrant plugin install vagrant-libvirt vagrant-vbguest
    vagrant plugin install vagrant-vbguest
else
    echo "Vagrant Plugins already installed, updating to latest version"
    vagrant plugin update vagrant-vbguest
fi
