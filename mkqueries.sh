#!/bin/bash

BINDIR=`dirname $0`

pushd $BINDIR/tpch-kit/dbgen/queries/

for i in {1..22}
do
	../qgen $i > query-`printf %02d $i`.sql
done

popd
