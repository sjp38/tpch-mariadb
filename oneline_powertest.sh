#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Usage: %s <scale factor> <data backup>"
	exit 1
fi

BINDIR=`dirname $0`
pushd $BINDIR > /dev/null

SF=$1
BACKUP=$2

LBPATH=/home/$USER/lazybox
MSQLPATH=$LBPATH/scripts/mysql

$MSQLPATH/restore.sh $BACKUP
$MSQLPATH/start_mysqld.sh

# Wait for server idle process
# TODO: Check process state
sleep 5

./mkqueries.sh $SF
./powertest.sh

$MSQLPATH/kill_mysqld.sh

# Wait for server exit process
# TODO: Check process state
sleep 5

popd > /dev/null
