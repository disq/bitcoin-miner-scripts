#!/bin/bash
for i in $*; do
	if [ -e $i ]; then
		echo "Reading $i"
		source $i
	elif [ -e [ "./$i" ]; then
		echo "Reading ./$i"
		source ./$i
	else
		echo "Not understood: $i"
		exit 1
	fi
done
if [ "$MINER" == "" ]; then
    echo \$MINER not set, exiting
    echo Usage: $0 one.device one.pool one.miner
    exit 1
fi
while true; do
	echo $MINER
	eval $MINER
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
