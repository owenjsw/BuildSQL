#!/bin/sh

parse_db_arg() {
    MYSQL_HOST=$(awk -F "=" '/host/ {print $2}' db.conf)
    MYSQL_USER=$(awk -F "=" '/user/ {print $2}' db.conf)
    MYSQL_PASSWD=$(awk -F "=" '/password/ {print $2}' db.conf)
    MYSQL_DB=$(awk -F "=" '/db/ {print $2}' db.conf)
}

parse_db_arg
