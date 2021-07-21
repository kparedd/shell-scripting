#!/usr/bin/bash

source common.sh

PRINT "Setting the Repository"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
STAT_CHECK $?

PRINT "Installing Mongo"
yum install -y mongodb-org &>>$LOG
STAT_CHECK $?

PRINT "UPDATE Mongod IP address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
STAT_CHECK $?

PRINT "Start MongoDB service"
systemctl enable mongod &>>$LOG && systemctl start mongod &>>$LOG
STAT_CHECK $?

PRINT "Download MongoDB Schema"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip" &>>$LOG
STAT_CHECK $?

PRINT "Load schema"
cd /tmp && unzip mongodb.zip && cd mongodb-main && mongo < catalogue.js && mongo < users.js &>>$LOG
STAT_CHECK $?