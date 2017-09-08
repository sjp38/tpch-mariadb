#!/bin/bash

BINDIR=`dirname $0`

pushd $BINDIR/tpch-kit/dbgen

USER=root

if [ $# -lt 1 ]
then
	echo "Usage: $0 <query number> [username [password]]"
	exit 1
fi

NUM_Q=$1

if [ $# -gt 1 ]
then
	USER=$2
	PASSWORD=$3
fi

MYSQL="/usr/local/mysql/bin/mysql -u $USER"
if [ ! -z $PASSWORD ]
then
	MYSQL="$MYSQL -p $PASSWORD"
fi

$MYSQL tpch < ./queries/query-`printf %02d $NUM_Q`.sql
