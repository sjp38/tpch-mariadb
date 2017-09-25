#!/bin/bash

# Do Power Test of TPC-H

BINDIR=`dirname $0`

USER=root

if [ $# -eq 2 ]
then
	USER=$1
	PASSWORD=$2
fi

MYSQL="/usr/local/mysql/bin/mysql -u $USER"
if [ ! -z $PASSWORD ]
then
	MYSQL="$MYSQL -p $PASSWORD"
fi

MYSQL="$MYSQL tpch"

TOTAL_NSECONDS=0
for q in {1..22}
do
	START=`date +%s%N`
	./runquery.sh $q > /dev/null
	END=`date +%s%N`
	DURATION=$(( $END - $START))
	printf "%d: \t%16d nsecs\n" $q $DURATION
	TOTAL_NSECONDS=$(($TOTAL_NSECONDS + $DURATION))
done

printf "Total: \t%16d nsecs\n" $TOTAL_NSECONDS
