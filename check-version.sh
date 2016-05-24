#!/bin/sh

. ./base.sh


SQL="SELECT latest_version FROM meta_database ORDER BY id LIMIT 1"
VERSION=$(echo $SQL | mysql -h $MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWD -D $MYSQL_DB)

if [ "$VERSION" = "" ] ;
then
    VERSION=0
else
    VERSION=$(echo $VERSION | awk '{print $2}')
fi

echo $VERSION



