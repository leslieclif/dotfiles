#!/bin/bash

# Up from scripts dir
mkdir -p $HOME/.ssh
chmod 0700 $HOME/.ssh

cp -r .config ${HOME}
cp -r .fonts ${HOME}
cp ssh/config "${HOME}/.ssh/"

echo "✔ Copying files done!"