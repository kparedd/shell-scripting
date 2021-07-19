#!/usr/bin/bash

USER_ID=($id_u)
if [ $USER_ID -ne 0 ]; then
  echo -e you should be root user to run this script
  exit 2
fi

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