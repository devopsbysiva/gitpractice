# check user is root or not? --done
#if the user is root then proceed further else stop execution and send alert as please run with sudo privilges. --> done
#then check for the package if already exist or not.  --> done
#if already exist then show as this is already installed no need to install.
#if dosen't exist then install the package and show message as successfully installed.

USERID=$(id -u) # THE USER ID FOR ROOT IS ALWAYS '0'
if [ $USERID -ne 0 ]
then
    echo "please Execute the script with sudo privileges"
    exit 1
fi

PACKAGE_NAME=$1

dnf list installed $PACKAGE_NAME
if [ $? -ne 0 ]
then 
    dnf install $PACKAGE_NAME -y

    if [ $? -eq 0 ]
    then 
        echo "$PACKAGE_NAME successfully installed"
    fi
else
    echo "the $PACKAGE_NAME is already installed"
fi


    


