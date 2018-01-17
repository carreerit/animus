#! /bin/bash

# 1. Using USER variable

if [ $USER = root ]; then
	echo "Yes, You are are root user"
else
	echo "No, You are not a root user"
fi

# 2. Using id command.

ID=$(id -u)

if [ $ID -eq 0 ]; then 
	echo "Yes, You are are root user"
else
	echo "No, You are not a root user"
fi