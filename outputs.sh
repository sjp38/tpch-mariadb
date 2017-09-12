#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Usage: $0 <files>"
	exit 1
fi

printf "TPCH\n\n\n"
for f in "$@"
do
	echo $f
	cat $f
	printf "\n\n"
done
