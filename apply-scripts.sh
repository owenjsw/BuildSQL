#!/bin/bash

. ./base.sh

OLD_VERSION=$(sh check-version.sh)

echo "LATEST VERSION $OLD_VERSION"

VLIST=()
for f in `ls *.sql`; do
    name=$(echo $f | awk -F '.sql' '{print $1}')
    version=$(echo $name | grep -oP "^(\d{14})")

    if [ "$version" != "" ]; then
        if [ $version -gt $OLD_VERSION ]; then
            VLIST+=($version)
        fi
    fi
done

#echo ${VLIST[*]}
VLIST=$(for a in "${VLIST[@]}"; do echo "$a"; done | sort -n)

for version in $VLIST; do
    echo ""
    echo ""
    file=$(ls "$version"*.sql)
    echo "---------- PARSE VERSION $version INTO MYSQL ----------"
    echo "Parse into mysql << $file"

    mysql -h $MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWD --default-character-set=utf8  -D $MYSQL_DB < "$file"

    echo "Update version $version"

    SQL="UPDATE meta_database SET latest_version=$version"
    echo $SQL | mysql -h $MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWD -D $MYSQL_DB 
    echo "---------- END OF VERSION $version ----------"
done


