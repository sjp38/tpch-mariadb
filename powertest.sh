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

TOTAL_SECONDS=0
for q in {1..22}
do
	SECONDS=0
	./runquery.sh $q > /dev/null
	echo "$q: $SECONDS secs"
	TOTAL_SECONDS=$(($TOTAL_SECONDS + $SECONDS))
done

echo "Total: $TOTAL_SECONDS secs"
