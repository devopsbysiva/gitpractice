#!/bin/bash

#task: To delete logs greater than 14 days.
#1.know the log folder
#2.find the logs greater then 14 days .
#3. remove the logs.

LOG_FOLDER=/var/log/shell_logs
RETENTION_TIME=14

LOGS=$(ls -l $LOG_FOLDER|find . -name "*.log" -mtime +$RETENTION_TIME)
echo "$LOGS"
