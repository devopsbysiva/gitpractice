#!/bin/bash
LOG_FOLDER="/var/log/shell_script"
SCRIPT_NAME= $(echo $0 |cut -d "." -f1)
DATE=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="/$LOG_FOLDER/$SCRIPT_NAME-$DATE.log"
mkdir -p $LOG_FOLDER

R="\e[31m"
N="\e[0m"

syntax(){
    echo -e "$R promt :: $0 packagename"  &>>$LOG_FILE
    exit 1
}

VALIDATE(){
if [ $1 -ne 0 ]
then 
    echo "$2 is FAILED" &>>$LOG_FILE
else
    echo "$2 is SUCCESS" &>>$LOG_FILE
fi
}

USERID=$(id -u) # THE USER ID FOR ROOT IS ALWAYS '0'
if [ $USERID -ne 0 ]
then
    echo "please Execute the script with sudo privileges" &>>$LOG_FILE
    exit 1
fi

if [ $# -eq 0 ]
then 
    syntax
fi

for PACKAGE_NAME in $@ 
do
    dnf list installed $PACKAGE_NAME
    if [ $? -ne 0 ]
    then 
        echo " $PACKAGE_NAME is preparing to install " &>>$LOG_FILE
        dnf install $PACKAGE_NAME -y
        VALIDATE $? $PACKAGE_NAME
    else
        echo " $PACKAGE_NAME is already available" &>>$LOG_FILE
    fi
done
    


