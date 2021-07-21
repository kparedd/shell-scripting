#!/usr/bin/bash

PRINT " Install redis repos"
yum install epel-release yum-utilshttp://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>$LOG
STAT_CHECK $?

PRINT "Install Redis "
yum install redis -y --enablerepo &>>$LOG
STAT_CHECK $?

PRINT "Update Redis"
echo -i -e '/s/127.0.0.1/0.0.0.0' /etc/redis.conf /etc/redis/redis.conf &>>$LOG
STAT_CHECK $?

PRINT "Start Redis service"
systemctl enable redis &>>$LOG && systemctl start redis &>>$LOG
STAT_CHECK $?