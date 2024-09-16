#!/bin/bash

#find the Hard drive memory utilization if above 75 send alert.

#find out the disk utilization .
#compare if above 75% or not. if yes then send alert as "This disk is utilized above thershold value please check."

#df -hT #this displays all the disk utilization.
# Need to filter out of Type xfs. 

#df -hT|grep xfs #this displays only with xfs.

#need to find the utilization.

#df -hT|grep xfs|awk -F " " '{print $6F}' # this gives only the percentage utilization of disk space.

#we only want number to be displayed.

#df -hT| grep xfs| awk -F " " '{print $6F}'| cut -d "%" -f1
# this will display only utilzation without any disk name. this each individual to be compared if greater than 75 or not.

#TAKING THE OUTPUT INTO A VARIABLE. and assign 75 to variable for comparision.
DISK_USAGE=$(df -hT| grep xfs)
THRESHOLD=75

while IFS= read -r line
do
   USAGE=$(echo $line | awk -F " " '{print $6F}'| cut -d "%" -f1)
   PRATITION=$(echo $line | awk -F " " '{print $NF}')
   if [ $USAGE -ge $THRESHOLD ]
   then
    echo "$PRATITION is above the threshold : $THRESHOLD , CURRENT USAGE IS: $USAGE"
   fi

done <<< $DISK_USAGE






