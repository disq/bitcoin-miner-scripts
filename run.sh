#!/bin/bash

function resolve {
local p=$1
local f=`readlink -f $p`
local r=`basename $f`
if [ "$p" == "$r" ]; then
    echo "Reading $p"
else
    echo "Reading $p ($r)"
fi
}

declare -a PARAMS
PMODE=0
for i in $*; do
	if [ $PMODE == 1 ]; then
		echo "new param: $i"
		PARAMS[${#PARAMS[*]}]=$i
	else
		if [ "$i" == "-P" ]; then
			PMODE=1
		elif [ -e $i ]; then
			resolve $i
			source $i
		elif [ -e "./$i" ]; then
			resolve "./$i"
			source ./$i
		else
			echo "Not understood: $i"
			exit 1
		fi
	fi
done

if [ "$MINER" == "" ]; then
    echo \$MINER not set, exiting
    echo Usage: $0 one.device one.pool one.miner [extra file] [-P extra params [extra params [ ... ]]]
    exit 1
fi
while true; do
	echo $MINER ${PARAMS[@]}
	eval $MINER ${PARAMS[@]}
	echo ""
	echo -n miner quit, restarting in 5
	sleep 1
	echo -n " 4"
	sleep 1
	echo -n " 3"
	sleep 1
	echo -n " 2"
	sleep 1
	echo -n " 1"
	sleep 1
	echo " now"
done
