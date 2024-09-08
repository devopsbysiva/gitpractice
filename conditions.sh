
USERID=$(id -u)
echo "the userid is :$USERID "

if [ $USERID -ne 0 ]
then
    echo "please connect to root user and execute"
#    exit 1
fi
ls -lrt