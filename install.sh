#!/bin/bash

INSTALL_DIR=~

echo "> Creating folders..."
mkdir $INSTALL_DIR/.vim/{bundle,backup,tmp,undo,sessions,spell} -p

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
if [ ! -f $INSTALL_DIR/.gtkrc-2.0.mine ]; then
	cp gtkrc-2.0.mine $INSTALL_DIR/.gtkrc-2.0.mine
fi

echo
echo "Don't forget to edit ~/.vimrc.user.after."

echo
echo "To activate eclim server follow this tutorial http://eclim.org/install.html."

echo
echo "To install all plugins launch vim."

echo
echo "~~~ Happy coding with vim! ~~~"
