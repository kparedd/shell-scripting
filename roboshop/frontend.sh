#!/usr/bin/bash

LOG=/tmp/roboshop.log
rm -f $LOG

STAT_CHECK() {
  if [ $? -eq 0 ]; then
  echo -e "\e[32m done\e[0m"
else
  echo -e "\e[31m fail\e[0m"
fi
}

echo -e "installing nginx\t\ .."
yum install nginx -y &>>$LOG
STAT_CHECK $?

echo -n -e "enabling nginx\t\t"
systemctl enable nginx &>>$LOG
STAT_CHECK $?

echo -n -e "starting nginx\t\t"
systemctl start nginx &>>$LOG
STAT_CHECK $?