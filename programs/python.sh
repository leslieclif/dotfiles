#!/bin/bash

# Python
echo "🐍 Installing Python"
sudo apt install -qq -y python3-venv python3-pip python3-setuptools
sudo pip3 install --upgrade pip
sudo pip3 install python-vagrant mkdocs ansible docker-compose