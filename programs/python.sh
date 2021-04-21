#!/bin/bash

# Python
if type -p python3 > /dev/null; then
    echo "✔ 🐍 [Python] Installed!"
else
    echo "🐍 Installing Python"
    sudo apt install -qq -y python3-venv python3-pip python3-setuptools
    sudo pip3 install --upgrade pip
    sudo pip3 install python-vagrant mkdocs ansible docker-compose
fi
