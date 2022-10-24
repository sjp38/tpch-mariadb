Toolbox for TPC-H on MySQL
==============

Forked from https://github.com/sjp38/tpch-mariadb

Modification:
1. use `"SET GLOBAL local_infile=1;"` to load local data in file
2. set "password" as default password (insecure)


This repository is a toolbox for TPC-H benchmark[1] execution on MySQL.  The
tools help modifying, building, and running TPC-H kit source code for MySQL.


Pre-requisites
==============

1. You should get TPC-H kit source code before using the tools.  
2. You can download it from TPC website[2] as a tar ball after agree to their license.


Versions
========

This toolbox is tested for TPC-H V3.0.1 and MySQL 8.0.31, the latest
version as of this writing.


Quick Start
===========

This section describes simple steps for TPC-H test setup and execution.  Every
example assumes that your current working directory is this repository.


Get TPC-H kit
-------------

```
$ unzip xxx-tpc-h-tool.zip
$ mv TPC-H\ V3.0.1/ tpch-kit/
```


Modify TPC-H kit Code
---------------------

```
$ ./modify_src.sh
```


Build TPC-H Kit
---------------

```
$ ./build.sh
```


Generate Data
-------------

```
$ ./dbgen.sh <scale factor>
```


Execute Load Test
-----------------

Before next command, you should start mysqld daemon.  Next command assumes that
your mysqld has user `root` without password.  In other words, it should be
able to use `$ mysql -u root` to connect to MariaDB prompt.
```
$ ./loadtest.sh [user] [password]
```


Execute Power Test
------------------

```
$ ./mkqueries.sh <scale factor>
$ ./powertest.sh [user] [password]
```


Execute Query 2 Only
--------------------

```
$ ./mkqueries.sh <scale factor>
$ ./runquery.sh 2 [user] [password]
```


Author
======

Pei Mu <ds1231h@gmail.com>


References
==========

[1] http://www.tpc.org/tpch/  
[2] https://www.tpc.org/tpc_documents_current_versions/current_specifications5.asp
