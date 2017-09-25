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
	echo "$q: \t$DURATION nsecs"
	TOTAL_NSECONDS=$(($TOTAL_NSECONDS + $DURATION))
done

echo "Total: $TOTAL_NSECONDS secs"
