#!/usr/bin/bash

LOG=/tmp/roboshop.log

echo -e "installing nginx\t\t ...\t\t\e[32mdone\e[0m"
yum install nginx -y >LOG

echo "enabling nginx"
systemctl enable nginx >LOG

echo "starting nginx"
systemctl start nginx >LOG