#!/bin/bash

# Do loadtest of TPC-H

BINDIR=`dirname $0`

pushd $BINDIR/tpch-kit/dbgen

USER=root
PASSWORD=password

if [ $# -eq 2 ]
then
	USER=$1
	PASSWORD=$2
fi

MYSQL_PATH=$(command -v mysql)

MYSQL="$MYSQL_PATH -u $USER"
if [ ! -z $PASSWORD ]
then
	MYSQL="$MYSQL --password=$PASSWORD"
fi

# Delete previous database
$MYSQL -e "DROP DATABASE tpch;"

# Create database
$MYSQL -e "create database tpch;"

TOTAL_SECS=0

SECONDS=0
$MYSQL tpch < ./dss.ddl
echo "Table-Creation: $SECONDS secs"
TOTAL_SECS=$(($TOTAL_SECS + $SECONDS))

$MYSQL -e "SET GLOBAL local_infile=1;"

MYSQL="$MYSQL --local-infile=1 tpch"

SECONDS=0
for table in customer lineitem nation orders partsupp part region supplier
do
	echo load $table
	$MYSQL -e "LOAD DATA LOCAL INFILE '$table.tbl' INTO TABLE $table FIELDS TERMINATED BY '|';"
done
echo "Load-Tables: $SECONDS secs"
TOTAL_SECS=$(($TOTAL_SECS + $SECONDS))

SECONDS=0
$MYSQL < ./dss.ri
echo "Create-Indexes-and-Constraints: $SECONDS secs"
TOTAL_SECS=$(($TOTAL_SECS + $SECONDS))

echo "Total: $TOTAL_SECS secs"

popd
