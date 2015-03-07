#!/bin/bash

echo "> Updating..."
if git pull --rebase --stat origin master
then
	echo
	./install.sh
else
  echo "There was an error updating. Try again later?"
fi
