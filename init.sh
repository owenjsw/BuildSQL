#!/bin/bash

. ./base.sh

mysql -h $MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWD -D $MYSQL_DB < init.sql

sh check-version.sh
