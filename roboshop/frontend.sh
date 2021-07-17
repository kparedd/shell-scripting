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


echo -n -e "enabling nginx\t\t"
systemctl enable nginx &>>$LOG
if [ $? -eq 0]; then
  echo -e "\e[32m done\e[0m"
else
  echo -e "\e[31m fail\e[0m"
fi
echo -n -e "starting nginx\t\t"
systemctl start nginx &>>$LOG
if [ $? -eq 0]; then
  echo -e "\e[32m done\e[0m"
else
  echo -e "\e[31m fail\e[0m"
fi