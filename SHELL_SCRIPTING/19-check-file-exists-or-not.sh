#!/bin/bash

if [ -f /etc/passwd ]; then
	echo "Yes, the file exists"
else
	echo "No, file does not exist"
fi