#!/usr/bin/bash

LOG=/tmp/roboshop.log
rm -f $LOG

STAT_CHECK() {
  if [ $1 -eq 0 ]; then
  echo -e "\e[32m done\e[0m"
else
  echo -e "\e[31m fail\e[0m"
fi
}

echo -n -e "installing nginx\t\t\.."
yum install nginx -y &>>$LOG
STAT_CHECK $?

echo -n -e "Enabling nginx\t\t\.."
systemctl enable nginx &>>$LOG
STAT_CHECK $?

echo -n -e "Starting nginx\t\t\.."
systemctl start nginx &>>$LOG
STAT_CHECK $?