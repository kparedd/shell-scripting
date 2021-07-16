#!/usr/bin/bash

echo -e "installing nginx\t\t ...\t\t\e[32mdone\e[0m"
yum install nginx -y >/tmp/roboshop.log

echo "enabling nginx"
systemctl enable nginx >/tmp/roboshop.log

echo "starting nginx"
systemctl start nginx >/tmp/roboshop.log