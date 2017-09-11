#!/bin/bash

BINDIR=`dirname $0`

pushd $BINDIR

TPCHKIT=./tpch-kit

if [ ! -d $TPCHKIT ]
then
	echo "tpch kit source code not found under $TPCHKIT/."
	exit 1
fi

pushd $TPCHKIT
patch -p1 < ../modification.patch
cp ./dbgen/dists.dss ./dbgen/queries/
popd

popd
