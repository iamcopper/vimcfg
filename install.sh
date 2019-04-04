#!/bin/bash

### install new files
echo "Install new vim files..."

# copy new files
if [[ -d ~/.vim/bundle ]]; then
	plug_num=$(ls -l ~/.vim/bundle | wc -l)
else
	rm -rf ~/.vim
	plug_num=0
fi
if [[ $plug_num -le 2 ]]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ./vimfile/bundle/Vundle.vim
	cp -r ./vimfile ~/.vim
fi

cp ./vimrc ~/.vimrc

### finish install
echo "Done!"
exit 0
