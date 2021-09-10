#!/bin/bash

# Install from Debian package if version is not in default repository
VAGRANT_VER="2.2.18"
# Splitting 'Vagrant 2.2.9' output with space as delimiter and putting the version in 'checkVersion' variable
checkVersion="$(vagrant --version | cut -d ' ' -f2)"
if [ ${checkVersion} = ${VAGRANT_VER} ]; then
    echo "✔ [Vagrant] Installed!"
else
    echo "Installing Vagrant: $VAGRANT_VER..."
    wget https://releases.hashicorp.com/vagrant/${VAGRANT_VER}/vagrant_${VAGRANT_VER}_x86_64.deb
    sudo dpkg -i vagrant_${VAGRANT_VER}_x86_64.deb
    sudo apt -f install
    rm vagrant_${VAGRANT_VER}_x86_64.deb
fi
#Plugins
sudo vagrant plugin list &> /dev/null
if [ $? -ne 0 ]; then
    echo "[Vagrant][Plugins] Configure"
    #sudo vagrant plugin install vagrant-libvirt vagrant-vbguest
    vagrant plugin install vagrant-vbguest
else
    vagrant plugin update vagrant-vbguest
    echo "✔ [Vagrant][Plugins] Configured"
fi
