#!/bin/bash

### install new files
echo "Install new vim files..."

# copy new files
cp -r ./vimfile ~/.vim
cp ./vimrc ~/.vimrc

### finish install
echo "Install finished!"
exit 0
