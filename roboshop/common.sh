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
  echo -e "#########\t$1\t########"
  echo -n -e "$1\t\t.."
}