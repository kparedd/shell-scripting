#!/usr/bin/bash

#declare the function
sample(){
  echo welcome i am sample function
  echo cost of A drink = ${a}
  echo first agrument in function = $1
}

#main program
#call the command
a=100
sample ABC
echo first agrument in main program = $1

