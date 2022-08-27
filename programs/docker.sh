#!/bin/bash
DOCKER_VER="20.10.17"
# Splitting 'docker --version' output with space as delimiter and putting the version in 'checkVersion' variable
checkVersion="$(docker -v | cut -d ' ' -f3 | cut -d ',' -f1)"
if [ ${checkVersion} = ${DOCKER_VER} ]; then
    echo "Already installed Docker: ${DOCKER_VER}"
else
  echo "🐋 Removing Docker older versions"
  sudo apt-get remove docker docker-engine docker.io containerd runc -y
  sudo rm -f /usr/share/keyrings/docker-archive-keyring.gpg
  echo "🐋 Installing Docker"
  sudo apt-get update -y

  sudo apt-get install -y \
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

  sudo apt-get install docker-ce docker-ce-cli containerd.io -y
  #sudo docker run hello-world
fi
# Adding kubectl
echo "⚓️ Installing Kubectl"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y kubectl
# Adding helm
echo "⚓️ Installing Helm"
sudo snap install helm --classic