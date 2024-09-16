#!/bin/bash

#task 
#1. CHECK  destination folder
#2. CHECK  source folder.
#3. no of days by default 14 if ntg provided
#4. zip the file.
#5.check the zip file exist or not.
#6. then remove the files form source folder.

SOU_DIR=$1
DES_DIR=$2
NO_OF_DAYS={$3:-14}
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)

if [ ! -d $SOU_DIR ]
then
    echo "there is no such directory: $SOU_DIR"
fi

if [ ! -d DES_DIR ]
then    
    echo "there is no such directory: $DES_DIR"
fi


ZIP_FILE=$DES_DIR/app_log-$TIMESTAMP.zip

FILES=$(find $SOU_DIR -name "*.log" -mtime $NO_OF_DAYS)

if [ ! -z $FILES ]
then
  find ${SOURCE_DIR} -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@

  if [ -f $ZIP_FILE ] 
  then
    echo "files are zipped successfully"
    while IFS= read -r file
    do
        echo "deleting file: $file"
        rm -rf $file
    done <<< $FILES
  else
    echo "zipping is failed"
    exit 1 
  fi
else
    echo " no files older than $NO_OF_DAYS"
fi
