#!/bin/bash

INSTALL_DIR=~

echo "> Creating folders..."
mkdir $INSTALL_DIR/.vim/{bundle,backup,tmp,sessions,spell} -p

echo
echo "> Downloading neobundle..."
git clone https://github.com/Shougo/neobundle.vim $INSTALL_DIR/.vim/bundle/neobundle.vim

echo
echo "> Copying configs..."
cp vimrc $INSTALL_DIR/.vimrc
if [ ! -f $INSTALL_DIR/.vimrc.user.install ]; then
	cp vimrc.user.install $INSTALL_DIR/.vimrc.user.install
fi
if [ ! -f $INSTALL_DIR/.vimrc.user.after ]; then
	cp vimrc.user.after $INSTALL_DIR/.vimrc.user.after
fi
cp gtkrc-2.0.mine $INSTALL_DIR/.gtkrc-2.0.mine

echo
echo "To enable fast search in ctrlp, please install ag"
echo "On ubuntu you can do it with:"
echo "sudo apt-get install silverbullet-ag"
echo "If you can't install, comment or delete the line in ~/.vimrc.user.after which mentions ag"

echo
echo "Don't forget to change name for vim-licenses plugin in ~/.vimrc.user.after, if you want to use this plugin"

echo
echo "~~~ Happy coding with vim! ~~~"
