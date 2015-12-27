#!/bin/bash

confirm() {
	read -r -p "$1 [Y/n] " response
	case $response in
		[yY][eE][sS]|[yY]|"")
			true
			;;
		*)
			false
			;;
	esac
}

INSTALL_DIR=~


# vimrc setup
echo "> Creating folders..."
mkdir $INSTALL_DIR/.vim/{bundle,backup,tmp,undo,sessions,spell} -p

echo
echo "> Downloading neobundle..."
git clone https://github.com/Shougo/neobundle.vim $INSTALL_DIR/.vim/bundle/neobundle.vim
if [ $? != 0 ]; then
	cd $INSTALL_DIR/.vim/bundle/neobundle.vim
	git pull origin master
	cd - > /dev/null
fi

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


# youcompleteme setup
echo
if confirm "Do you want to compile YouCompleteMe plugin now?"; then
	installcmd="./install.py"
	confirm "With C-family languages support?" && installcmd+=" --clang-completer"
	confirm "With C# support?"                 && installcmd+=" --omnisharp-completer"
	confirm "With Go support?"                 && installcmd+=" --gocode-completer"
	confirm "With JavaScript support?"         && installcmd+=" --tern-completer"
	confirm "To compile the plugin python, cmake, c++ compiler, various c++ build tools and python-dev package must be installed. And also depending on what you have chosen later mono, nodejs and npm must be installed too. Continue compiling YouCompleteMe?"

	echo
	echo "> Downloading YouCompleteMe..."
	git clone https://github.com/Valloric/YouCompleteMe $INSTALL_DIR/.vim/bundle/YouCompleteMe
	if [ $? != 0 ]; then
		cd $INSTALL_DIR/.vim/bundle/YouCompleteMe
		git pull origin master
	else
		cd $INSTALL_DIR/.vim/bundle/YouCompleteMe
	fi
	git submodule update --init --recursive

	echo
	echo "> Starting the build..."
	if eval $installcmd; then
		echo
		echo "> Successfully done!"
	else
		echo
		echo "The installation failed"
		echo "Fix errors and rerun this command: 'cd $INSTALL_DIR/.vim/bundle/YouCompleteMe; $installcmd'"
	fi
fi


# friendly farewell
echo
echo "Don't forget to edit ~/.vimrc.user.after."

echo
echo "To install all plugins launch vim."
echo "After plugins' install vim may freeze for some time because of the helptags generation"

echo
echo "~~~ Happy coding with vim! ~~~"
