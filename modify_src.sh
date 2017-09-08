#!/bin/bash

BINDIR=`dirname $0`

pushd $BINDIR

if [ -z "$TPCHKIT" ]
then
	TPCHKIT=./tpch-kit
fi

if [ ! -d $TPCHKIT ]
then
	echo "tpch kit source code not found under $TPCHKIT/."
	exit 1
fi

pushd $TPCHKIT
patch -p1 < ../0001-Modify-for-MariaDB.patch
popd

popd
