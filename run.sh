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
while true; do
	echo $MINER
	eval $MINER
	sleep 3
done
