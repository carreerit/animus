#!/bin/bash


read -p 'Enter your name: ' name
if [ -z "$name" ]; then 
	echo "Invalid Input! Try again"
	exit 1
fi

read -p 'Enter your password: ' pass 
if [ -z "$pass" ]; then 
	echo "Invalid Input! Try again"
	exit 1
fi

echo "Hello $name, Your Password is $pass"
