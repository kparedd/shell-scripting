#!/usr/bin/bash

source common.sh

PRINT "installing nginx"
yum install nginx -y &>>$LOG
STAT_CHECK $?

PRINT "Enabling nginx\t"
systemctl enable nginx &>>$LOG
STAT_CHECK $?

PRINT  "Starting nginx\t"
systemctl start nginx &>>$LOG
STAT_CHECK $?