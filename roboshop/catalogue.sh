#!/usr/bin//bash

source common.sh

PRINT "Installing Nodejs"
yum install nodejs make gcc-c++ -y
STAT_CHECK $?

PRINT "Add RoboShop Application user"
useradd roboshop &>>$LOG
STAT_CHECK $?

$ curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
$ cd /home/roboshop
$ unzip /tmp/catalogue.zip
$ mv catalogue-main catalogue
$ cd /home/roboshop/catalogue
$ npm install
NOTE: We need to update the IP address of MONGODB Server in systemd.service file. Replace MONGO_DNSNAME with IP address.
Now, lets set up the service with systemctl.

# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue