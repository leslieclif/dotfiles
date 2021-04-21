#!/bin/bash
DOCKER_VER="20.10.6"
# Splitting 'docker --version' output with space as delimiter and putting the version in 'checkVersion' variable
checkVersion="$(docker -v | cut -d ' ' -f3 | cut -d ',' -f1)"
if [ ${checkVersion} = ${DOCKER_VER} ]; then
    echo "Already installed Docker: ${DOCKER_VER}"
else
  echo "🐋 Removing Docker older versions"
  sudo apt-get remove docker docker-engine docker.io containerd runc
  echo "🐋 Installing Docker"
  sudo apt-get update -y

  sudo apt-get install \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg \
      lsb-release
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

  echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update -y

  sudo apt-get install docker-ce docker-ce-cli containerd.io
  #sudo docker run hello-world
fi