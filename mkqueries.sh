#!/bin/bash

BINDIR=`dirname $0`

pushd $BINDIR/tpch-kit/dbgen/queries/

SF=1

if [ $# -eq 1 ]
then
	SF=$1
fi

for i in {1..22}
do
	../qgen -s $SF $i > query-`printf %02d $i`.sql
done

popd
