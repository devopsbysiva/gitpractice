#!/bin/bash

#task: To delete logs greater than 14 days.
#1.know the log folder
#2.find the logs greater then 14 days .
#3. remove the logs.

LOG_FOLDER_PATH="/var/log/shell_logs"

REMOVABLE_LOGS=$(find . -name "*.log" -mtime +14)

while IFS= read -r line
do
  echo $line
done <<< $REMOVABLE_LOGS
