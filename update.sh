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

echo -e $BWhite"> Updating..."$Color_Off
if git pull --rebase --stat origin master; then
	echo
	./install.sh
else
  echo -e $BRed"There was an error updating. Try again later?"$Color_Off
fi
