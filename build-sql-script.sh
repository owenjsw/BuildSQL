#!/bin/bash

FILE=`echo $1`
if [ "$FILE" == "" ]; then
    FILE=pending.sql
fi

echo "Build $FILE into database upgrade sql file format"

echo "Comment please:"
read COMMENT

NEW_FILE="$(date +"%Y%m%d%H%M%S")_$COMMENT.sql"

mv "$FILE" "$NEW_FILE"

echo "Move $FILE => $NEW_FILE"
