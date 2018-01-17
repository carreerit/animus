#!/bin/bash

FRUIT=ORANGE

case $FRUIT in 
	BANANA) 
		echo "Yes, it is available"
		exit 0
		;;
	*) 
		echo "No, it is not avaiable"
		exit 1
		;;
esac