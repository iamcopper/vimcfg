#!/bin/bash

### install new files
echo "Install new vim files..."

# remove old files
rm -rf ~/.vim ~/.vimrc

# copy new files
cp -r ./vimfile ~/.vim
cp ./vimrc ~/.vimrc

### finish install
echo "Install finished!"
exit 0
