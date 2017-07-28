#!/bin/bash

### install new files
echo "Install new vim files..."

# copy new files
flg=$(ls -l ~/.vim/bundle | wc -l)
if [[ $flg -le 2 ]]; then
	cp -r ./vimfile ~/.vim
fi

cp ./vimrc ~/.vimrc

### finish install
echo "Install finished!"
exit 0
