#!/bin/bash

BINDIR=`dirname $0`

pushd $BINDIR/tpch-kit/dbgen
make
popd
