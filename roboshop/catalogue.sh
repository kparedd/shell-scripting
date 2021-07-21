#!/usr/bin//bash

source common.sh

PRINT "Install Nodejs\t\t"
yum install nodejs make gcc-c++ -y &>>$LOG
STAT_CHECK $?

PRINT "Add RoboShop Application user"
id roboshop &>>$LOG
if [ $? -ne 0 ]; then
  useradd roboshop &>>$LOG
fi
STAT_CHECK $?

PRINT "Download Application Code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG
STAT_CHECK $?

PRINT " Extract Downloaded Code"
cd /home/roboshop && unzip /tmp/catalogue.zip &>>$LOG && rm -rf catalogue && mv catalogue-main catalogue &>>$LOG
STAT_CHECK $?

PRINT "Install NodeJS Dependencies"
cd /home/roboshop/catalogue && npm install --unsafe-perm &>>$LOG
STAT_CHECK $?

PRINT "Fix application user"
chown roboshop:roboshop /home/roboshop -R &>>$LOG
STAT_CHECK $?

# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue