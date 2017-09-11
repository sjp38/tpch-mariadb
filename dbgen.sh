#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: $0 <scale factor>"
	exit 1
fi

SF=$1

pushd tpch-kit/dbgen
rm -fr *.tbl
./dbgen -s $SF
popd
