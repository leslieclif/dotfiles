#!/bin/bash

# Up from scripts dir

cp -r .config ${HOME}
cp -r .fonts ${HOME}
cp ssh/config "${HOME}/.ssh/"

echo "✔ Copying files done!"