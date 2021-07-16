#!/usr/bin/bash
echo "installing nginx"
yum install nginx -y

echo"enabling nginx"
systemctl enable nginx

echo "starting nginx"
systemctl start nginx