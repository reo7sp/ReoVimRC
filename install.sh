#!/bin/bash

INSTALL_DIR=~

echo "Creating folders"
mkdir $INSTALL_DIR/.vim/{bundle,backup,tmp,sessions,spell} -p

echo
echo "Downloading neobundle"
git clone https://github.com/Shougo/neobundle.vim $INSTALL_DIR/.vim/bundle/neobundle.vim

echo
echo "Copying vimrc"
cp vimrc $INSTALL_DIR/.vimrc

echo
echo "To enable fast search in ctrlp, please install ag"
echo "On ubuntu you can do it with:"
echo "sudo apt-get install silverbullet-ag"
echo "If you can't install, comment the line in vimrc which mentions ag"

echo
echo "Don't forget to change name for vim-licenses plugin in vimrc, if you want to use this plugin"

echo
echo "Happy coding with vim!"
