#!/usr/bin/bash

LOG=/tmp/roboshop.log
rm -f $LOG

STAT_CHECK() {
  if [ $1 -eq 0 ]; then
  echo -e "\e[32m done\e[0m"
else
  echo -e "\e[31m fail\e[0m"
  exit 1
fi
}

PRINT() {
  echo -n -e "$1\t\t.."
}

PRINT "installing nginx"
yum install nginx -y &>>$LOG
STAT_CHECK $?

PRINT "Enabling nginx"
systemctl enable nginx &>>$LOG
STAT_CHECK $?

PRINT  "Starting nginx"
systemctl start nginx &>>$LOG
STAT_CHECK $?