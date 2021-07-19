#!/usr/bin/bash

LOG=/tmp/roboshop.log
rm -f $LOG

source common.sh

PRINT "installing nginx"
yum install nginx -y &>>$LOG
STAT_CHECK $?

PRINT "Enabling nginx"
systemctl enable nginx &>>$LOG
STAT_CHECK $?

PRINT  "Starting nginx"
systemctl start nginx &>>$LOG
STAT_CHECK $?