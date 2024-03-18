#!/bin/bash
######## LISTED IMP VAIRABLES ################
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=/root/logfolder/$0-$TIMESTAMP.log
echo "script stareted executing at $TIMESTAMP" &>> $LOGFILE
######################## PRE-VALIDATION CHECK BEFORE INSTALLATION #################
ID=$(id -u)
INPUT
<<c
PREVALIDATION(){
if [ $1 -ne 0 ]
then
echo -e "$R Your are not authorized user to install softwares in this PC $N"
exit 1
else
echo -e  "$G Your are a root user $N"
fi
}
c
#########################
INPUT(){
if [ $# -ne 1 ]
then "Invalid input"
exit 1
else "Checking if your root user or not for installing $1"
fi
}
#PREVALIDATION $1 "Installing $1"
#echo -e " $G YOUR PRE-VALIDATION FUNCTION IS PASSED SUCCESFULLY $N "
###################### COMMAND ############################
yum install $1 -y
#yum list installed $1
################# POST-VALIDATION CHECK AFTER INSTALLATION #####################
POSTVALIDATION(){
if [ $? -ne 0 ]
then echo -e " $R Installtion is not succesfull $N "
exit 1
else echo -e " $G installation is success $N "
fi
}
##################################
POSTVALIDATION
echo -e " $G YOUR POST-VALIDATION FUNCTION IS PASSED SUCCESFULLY;Your installation $1 is success $N "