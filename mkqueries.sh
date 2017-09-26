#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: $0 <scale factor>"
	exit 1
fi

SF=$1

BINDIR=`dirname $0`

pushd $BINDIR/tpch-kit/dbgen/queries/

for i in {1..22}
do
	../qgen -s $SF $i > query-`printf %02d $i`.sql
done

popd
