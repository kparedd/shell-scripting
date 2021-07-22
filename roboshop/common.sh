#!/usr/bin/bash


LOG=/tmp/roboshop.log
rm -f $LOG

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
  echo -e "\e[31mYou should be root user / sudo user to run this script\e[0m"
  exit 2
fi

STAT_CHECK() {
  if [ $1 -eq 0 ]; then
  echo -e "\e[32m done\e[0m"
else
  echo -e "\e[31m fail\e[0m"
  echo -e "\e[33m check log file for more details, log file - $LOG\e[0m"
  exit 1
fi
}

PRINT() {
  echo -n -e "$1\t\t.."
}

NODEJS() {
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
  curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/roboshop-devops-project/${COMPONENT}/archive/main.zip" &>>$LOG
  STAT_CHECK $?

  PRINT " Extract Downloaded Code"
  cd /home/roboshop && unzip -o /tmp/${COMPONENT}.zip &>>$LOG && rm -rf ${COMPONENT} && mv ${COMPONENT}-main ${COMPONENT}
  STAT_CHECK $?

  PRINT "Install NodeJS Dependencies"
  cd /home/roboshop/${COMPONENT} && npm install --unsafe-perm &>>$LOG
  STAT_CHECK $?

  PRINT "Fix application user\t"
  chown roboshop:roboshop /home/roboshop -R &>>$LOG
  STAT_CHECK $?

  PRINT "Setup SystemD file\t"
  sed -i -e "s/MONGO_DNSNAME/mongodb.roboshop.internal/" -e "s/REDIS_ENDPOINT/redis.roboshop.internal/" -e "s/MONGO_ENDPOINT/mongodb.roboshop.internal/"
  /home/roboshop/${COMPONENT}/systemd.service && mv /home/roboshop/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service &>>$LOG
  STAT_CHECK $?

  PRINT "Start ${COMPONENT} Service\t"
  systemctl daemon-reload &>>$LOG && systemctl start ${COMPONENT} &>>$LOG  && systemctl enable ${COMPONENT} &>>$LOG
  STAT_CHECK $?
}