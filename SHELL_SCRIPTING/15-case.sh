#!/bin/bash

ACTION=$1
case $ACTION in 
	start) 
		echo "Starting Tomcat"
		exit 
		;;
	stop) 
		echo "Stopping TOmcat"
		exit 
		;;
	*) 	echo "Usage: $0 start|stop"
		exit 1
		;;
esac
