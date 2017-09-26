Toolbox for TPC-H on MariaDB
============================

This repository is a toolbox for TPC-H benchmark[1] execution on MariaDB.  The
tools help modifying, building, and running TPC-H kit source code for MariaDB.


Pre-requisites
==============

You should get TPC-H kit source code before using the tools.  You can
download it from TPC website[2] as a tar ball after agree to their license.


Versions
========

This toolbox is tested for TPC-H tools v2.17.2 and MariaDB 10.2.8, the latest
version as of this writing.


Quick Start
===========

This section describes simple steps for TPC-H test setup and execution.  Every
example assumes that your current working directory is this repository.


Get TPC-H kit
-------------

```
$ unzip xxx-tpch-tool.zip
$ mv 2.17.2/ tpch-kit/
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
$ ./loadtest.sh
```


Execute Power Test
------------------

```
$ ./mkqueries.sh <scale factor>
$ ./powertest.sh
```


Execute Query 2 Only
--------------------

```
$ ./mkqueries.sh <scale factor>
$ ./runquery.sh 2
```


Author
======

SeongJae Park <sj38.park@gmail.com>


References
==========

[1] http://www.tpc.org/tpch/  
[2] http://www.tpc.org/tpc_documents_current_versions/download_programs/tools-download-request.asp?bm_type=TPC-H&bm_vers=2.17.2&mode=CURRENT-ONLY
