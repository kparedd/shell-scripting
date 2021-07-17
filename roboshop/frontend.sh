#!/usr/bin/bash

LOG=/tmp/roboshop.log

rm -f $LOG

echo -e "installing nginx\t\ .."
yum install nginx -y &>>$LOG
if [ $? -eq 0]; then
  echo -e "\e[32m done\e[0m"
else
  echo -e "\e[31m fail\e[0m"
fi


echo "enabling nginx"
systemctl enable nginx &>>$LOG

echo "starting nginx"
systemctl start nginx &>>$LOG