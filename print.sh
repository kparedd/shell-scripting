#!/usr/bin/bash

A=abhikp
echo a=$A
Date=2021-07-14
echo hey bro you know today is $Date

#commands
NO_OF_USERS=$(ls)
echo number of users=$NO_OF_USERS

#Date with command substitution
Date=$(date +%F)
echo hey bro you know today is $Date

#scalar property accesses by array

c=(108 109)
echo C=${c[*]}

a=${array_a}