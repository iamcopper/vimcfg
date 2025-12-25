#!/bin/bash

if [[ $(id -u) -eq 0 ]]; then
    echo -e "\n[ERROR] Can not run as root\n"
    exit 1
fi

echo ">>> Install vim and config dependency packages:"
ubuntu_ver_major=$(lsb_release -rs 2>/dev/null | awk -F . '{print $1}')
echo "ubuntu_ver_major=${ubuntu_ver_major}"
if [[ ${ubuntu_ver_major} -le 22 ]]; then
	sudo add-apt-repository ppa:jonathonf/vim
fi
sudo apt update
sudo apt install -y vim \
	neovim \
	exuberant-ctags \
	cmake \
	git \
	python3 \
	python-is-python3 \
	python3-pip

echo -e "\n>>> Install vim config and color files:"
if [[ ! -f ~/.vimrc ]]; then
	cp ./vimrc ~/.vimrc
fi
if [[ ! -d ~/.vim ]]; then
	cp -r ./vimfile ~/.vim
fi

echo -e "\n>>> Install vim plugin manager: Vundle.vimfiles:"
if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
	git clone https://github.com/iamcopper/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo -e "\n>>> Install vim plugins defined in vimrc"
vim -c PluginInstall -c qa

echo -e "\n>>> Done!"
