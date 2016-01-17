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
depok=2
echo "Required dependencies:"
echo -n "    git                                                             " ; hash git 2>/dev/null && echo "OK" || { echo "NOT FOUND"; depok=0; }
echo -n "    ag or ack if you want to search in files                        " ; hash ag 2>/dev/null && echo "OK. Found ag" || { hash ack 2>/dev/null && echo "OK. Found ack" || { echo "NOT FOUND"; depok=1; }; }
echo -n "    exhuberant ctags if you want to use ctags                       " ; { ctags --version | grep -i exuberant; [ "$?" == 0 ]; } 2>/dev/null 1>/dev/null && echo "OK" || { echo "NOT FOUND"; depok=1; }
echo -n "    g++ or clang                                                    " ; hash g++ 2>/dev/null && echo "OK. Found g++" || { hash clang++ 2>/dev/null && echo "OK. Found clang" || { echo "NOT FOUND"; depok=0; }; }
echo -n "    cmake                                                           " ; hash cmake 2>/dev/null && echo "OK" || { echo "NOT FOUND"; depok=0; }
echo -n "    python                                                          " ; hash python 2>/dev/null && echo "OK" || { echo "NOT FOUND"; depok=0; }
echo -n "    python-dev                                                      " ; [ "$(find /usr/include /usr/local/include -name "Python.h")" != "" ] && echo "OK" || { echo "NOT FOUND"; depok=0; }
echo -n "    mono if you need c# completion support                          " ; hash mono 2>/dev/null && echo "OK" || { echo "NOT FOUND"; depok=1; }
echo -n "    golang if you need go completion support                        " ; hash go 2>/dev/null && echo "OK" || { echo "NOT FOUND"; depok=1; }
echo -n "    nodejs if you need javascript/typescript completion support     " ; hash node 2>/dev/null && echo "OK" || { hash nodejs 2>/dev/null && { n=$(which nodejs); echo "Found $n but not ${n%js}. Please make symlink"; depok=0; } || { echo "NOT FOUND"; depok=1; }; }
echo -n "    npm if you need javascript/typescript completion support        " ; hash npm 2>/dev/null && echo "OK" || { echo "NOT FOUND"; depok=1; }
echo -n "    rustc if you need rust completion support                       " ; hash rustc 2>/dev/null && echo "OK" || { echo "NOT FOUND"; depok=1; }
echo -n "    cargo if you need rust completion support                       " ; hash cargo 2>/dev/null && echo "OK" || { echo "NOT FOUND"; depok=1; }

echo
case $depok in
	2)
		echo "All dependencies are met. Good job!"
		;;
	1)
		echo "Some special dependencies have been not found. If you need features that depend on them, please install these dependencies."
		;;
	0)
		echo "Some dependencies have been not found. Please fix these problems."
		;;
esac

echo
if ! confirm "Do you want to continue ReoVimRC install?"; then
	exit
fi

echo
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
if [ ! -f $INSTALL_DIR/.gtkrc-2.0 ]; then
	cp gtkrc-2.0.mine $INSTALL_DIR/.gtkrc-2.0
fi
if [ ! -f $INSTALL_DIR/.gtkrc-2.0.mine ]; then
	cp gtkrc-2.0.mine $INSTALL_DIR/.gtkrc-2.0.mine
fi
if [ ! -f $INSTALL_DIR/.ycm_extra_conf.py ]; then
	cp ycm_extra_conf.py $INSTALL_DIR/.ycm_extra_conf.py
fi


# youcompleteme setup
echo
if confirm "Do you want to compile YouCompleteMe plugin now?"; then
	installcmd="./install.py"
	confirm "With C-family languages support?" && installcmd+=" --clang-completer"
	confirm "With C# support?"                 && installcmd+=" --omnisharp-completer"
	confirm "With Go support?"                 && installcmd+=" --gocode-completer"
	confirm "With JavaScript support?"         && installcmd+=" --tern-completer"
	confirm "With Rust support?"               && installcmd+=" --racer-completer"

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

