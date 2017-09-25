#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: $0 <src tarball path>"
	exit 1
fi

unzip $1
mv 2.17.2 tpch-kit
