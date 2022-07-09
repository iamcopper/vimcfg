#!/bin/bash

echo ">>> Install vim and config dependency packages:"
sudo apt install -y cmake \
	python3-pip
pip3 install pynvim \
	neovim

echo -e "\n>>> Install vim config and color files:"
if [[ ! -f ~/.vimrc ]]; then
	cp ./vimrc ~/.vimrc
fi
if [[ ! -d ~/.vim ]]; then
	cp -r ./vimfile ~/.vim
fi

echo -e "\n>>> Install vim plugin manager: Vundle.vimfiles:"
if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo -e "\n>>> Install vim plugins defined in vimrc"
vim -c PluginInstall -c qa

echo -e "\n>>> Done!"
