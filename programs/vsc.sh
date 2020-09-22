#!/bin/bash

function install {
  name="${1}"
  code --install-extension ${name} --force
}

install golang.go