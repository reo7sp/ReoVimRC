#!/bin/bash

# Reset color
Color_Off='\033[0m'
# Colors
Black='\033[0;90m'
Red='\033[0;91m'
Green='\033[0;92m'
Yellow='\033[0;93m'
Blue='\033[0;94m'
Purple='\033[0;95m'
Cyan='\033[0;96m'
White='\033[0;97m'
# Bold colors
BBlack='\033[1;30m'
BRed='\033[1;31m'
BGreen='\033[1;32m'
BYellow='\033[1;33m'
BBlue='\033[1;34m'
BPurple='\033[1;35m'
BCyan='\033[1;36m'
BWhite='\033[1;37m'

confirm() {
	echo -n -e $BWhite"$1$Color_Off [Y/n] "
	read response
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
echo -e $BWhite"Required dependencies:"$Color_Off
echo -n -e "    $BCyan""git""$Color_Off                                                             " ; hash git 2>/dev/null && echo -e $BGreen"OK"$Color_Off || { echo -e $BRed"NOT FOUND"$Color_Off; depok=0; }
echo -n -e "    $BCyan""g++""$Color_Off or "$BCyan"clang""$Color_Off                                                    " ; hash g++ 2>/dev/null && echo -e $BGreen"OK$Color_Off. Found g++" || { hash clang++ 2>/dev/null && echo -e $BGreen"OK$Color_Off. Found clang" || { echo -e $BRed"NOT FOUND"$Color_Off; depok=0; }; }
echo -n -e "    $BCyan""cmake""$Color_Off                                                           " ; hash cmake 2>/dev/null && echo -e $BGreen"OK"$Color_Off || { echo -e $BRed"NOT FOUND"$Color_Off; depok=0; }
echo -n -e "    $BCyan""python""$Color_Off                                                          " ; hash python 2>/dev/null && echo -e $BGreen"OK"$Color_Off || { echo -e $BRed"NOT FOUND"$Color_Off; depok=0; }
echo -n -e "    $BCyan""python-dev""$Color_Off                                                      " ; [ "$(find /usr/include /usr/local/include -name "Python.h")" != "" ] && echo -e $BGreen"OK"$Color_Off || { echo -e $BRed"NOT FOUND"$Color_Off; depok=0; }
echo -n -e "    $BCyan""ag""$Color_Off or "$BCyan"ack""$Color_Off if you want to search in files                        " ; hash ag 2>/dev/null && echo -e $BGreen"OK$Color_Off. Found ag" || { hash ack 2>/dev/null && echo -e $BGreen"OK$Color_Off. Found ack" || { echo -e $BYellow"NOT FOUND"$Color_Off; depok=1; }; }
echo -n -e "    $BCyan""exuberant-ctags""$Color_Off if you want to use ctags                        " ; { ctags --version | grep -i exuberant; [ "$?" == 0 ]; } 2>/dev/null 1>/dev/null && echo -e $BGreen"OK"$Color_Off || { echo -e $BYellow"NOT FOUND"$Color_Off; depok=1; }
echo -n -e "    $BCyan""mono""$Color_Off if you need c# completion support                          " ; hash mono 2>/dev/null && echo -e $BGreen"OK"$Color_Off || { echo -e $BYellow"NOT FOUND"$Color_Off; depok=1; }
echo -n -e "    $BCyan""golang""$Color_Off if you need go completion support                        " ; hash go 2>/dev/null && echo -e $BGreen"OK"$Color_Off || { echo -e $BYellow"NOT FOUND"$Color_Off; depok=1; }
echo -n -e "    $BCyan""nodejs""$Color_Off if you need javascript/typescript completion support     " ; hash node 2>/dev/null && echo -e $BGreen"OK"$Color_Off || { hash nodejs 2>/dev/null && { n=$(which nodejs); echo "$BRed""Found $n but not ${n%js}$Color_Off. Please make symlink"; depok=0; } || { echo -e $BYellow"NOT FOUND"$Color_Off; depok=1; }; }
echo -n -e "    $BCyan""npm""$Color_Off if you need javascript/typescript completion support        " ; hash npm 2>/dev/null && echo -e $BGreen"OK"$Color_Off || { echo -e $BYellow"NOT FOUND"$Color_Off; depok=1; }
echo -n -e "    $BCyan""rustc""$Color_Off if you need rust completion support                       " ; hash rustc 2>/dev/null && echo -e $BGreen"OK"$Color_Off || { echo -e $BYellow"NOT FOUND"$Color_Off; depok=1; }
echo -n -e "    $BCyan""cargo""$Color_Off if you need rust completion support                       " ; hash cargo 2>/dev/null && echo -e $BGreen"OK"$Color_Off || { echo -e $BYellow"NOT FOUND"$Color_Off; depok=1; }

echo
case $depok in
	2)
		echo -e $Green"All dependencies are met. Good job!"$Color_Off
		;;
	1)
		echo -e $Yellow"Some special dependencies have been not found. If you need features that depend on them, please install these dependencies."$Color_Off
		;;
	0)
		echo -e $Red"Some dependencies have been not found. Please fix these problems."$Color_Off
		;;
esac

echo
if ! confirm "Do you want to continue ReoVimRC install?"; then
	exit
fi

echo
echo -e $BWhite"> Creating folders..."$Color_Off
mkdir $INSTALL_DIR/.vim/{bundle,backup,tmp,undo,sessions,spell} -p

echo
echo -e $BWhite"> Downloading plugin manager..."$Color_Off
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo
echo -e $BWhite"> Copying configs..."$Color_Off
cp vimrc $INSTALL_DIR/.vimrc
if [ ! -f $INSTALL_DIR/.vimrc.user.before ]; then
	cp vimrc.user.before $INSTALL_DIR/.vimrc.user.before
fi
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

echo
if confirm "Use light version of config by default?"; then
	{ echo; echo "let g:reovimrc_light = 0"; } >> $INSTALL_DIR/.vimrc.user.before
elif confirm "Do you want to compile YouCompleteMe plugin now?"; then # youcompleteme setup
	installcmd="./install.py"
	confirm "With C-family languages support?" && installcmd+=" --clang-completer"
	confirm "With C# support?"                 && installcmd+=" --omnisharp-completer"
	confirm "With Go support?"                 && installcmd+=" --gocode-completer"
	confirm "With JavaScript support?"         && installcmd+=" --tern-completer"
	confirm "With Rust support?"               && installcmd+=" --racer-completer"

	echo
	echo -e $BWhite"> Downloading YouCompleteMe..."$Color_Off
	git clone https://github.com/Valloric/YouCompleteMe $INSTALL_DIR/.vim/bundle/YouCompleteMe
	if [ $? != 0 ]; then
		cd $INSTALL_DIR/.vim/bundle/YouCompleteMe
		git pull origin master
	else
		cd $INSTALL_DIR/.vim/bundle/YouCompleteMe
	fi
	git submodule update --init --recursive

	echo
	echo -e $BWhite"> Starting the build..."$Color_Off
	if eval $installcmd; then
		echo
		echo -e $BWhite"> Successfully done!"$Color_Off
	else
		echo
		echo -e $Red"The installation failed"$Color_Off
		echo -e $Red"Fix errors and rerun this command: 'cd $INSTALL_DIR/.vim/bundle/YouCompleteMe; $installcmd'"$Color_Off
	fi
fi

# install plugins
vim -c ":PlugInstall | :qa!"

# friendly farewell
echo
echo -e $Green"~~~ Happy coding with vim! ~~~"$Color_Off

