#!/usr/bin/bash
echo "installing nginx\t\t ...\t\t\e[32mdone\e[0m"
yum install nginx -y

echo "enabling nginx"
systemctl enable nginx

echo "starting nginx"
systemctl start nginx