
USERID=$(id -u)
echo "the userid is :$USERID "

validating(){

    if [ $1 -ne 0 ]
then
    echo "there is no package with name git"
else
    echo "their is already a package no need to install again"
fi
}

if [ $USERID -ne 0 ]
then
    echo "please connect to root user and execute"
    exit 1
fi

dnf list installed gitu

validating $?