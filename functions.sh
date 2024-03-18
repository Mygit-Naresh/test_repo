#!/bin/bash

ID=$(id -u)
COMPUTER=$(hostname)
if [ $ID -ne 0 ]
then
echo "your not priviledged user to install softwares on this computer $COMPUTER"
exit 1
else
echo "your a root user hence proceeding with installtion"
fi

#This fucntion runs post installation of software
VALIDATE(){
if [ $? -eq 0 ]
then
echo -e "\e[32m install is success \e[0m"
else 
echo -e "\e[31m install is failure \e[0m"
fi
}
yum install mysql -y
VALIDATE

yum install git -y
VALIDATE
<<comment
yum install wget -y
VALIDATE
yum install vim -y
VALIDATE
comment
