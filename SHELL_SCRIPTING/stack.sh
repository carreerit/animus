#!/bin/bash

## Script should run as root user
ID=$(id -u)
if [ $ID -ne 0 ]; then
	echo "You should be a root user to execute this script"
	exit 1
fi


### Functions
PRINT_STAT() {
	if [ $2 -eq 0 ]; then 
		echo "$1 -- SUCCESS"
	else
		echo "$1 -- FAILURE"
		exit 1
	fi
}

### Variables
LOG=/tmp/stack.log
rm -f $LOG 
### DB SETUP
echo "Running DB Setup"
echo "-----------------"
yum install mariadb-server -y &>>$LOG 
PRINT_STAT "Installing DB Server" $?

systemctl enable mariadb &>>$LOG 
systemctl start mariadb &>>$LOG 
PRINT_STAT "Starting DB" $?

echo "create database if not exists studentapp;
grant all privileges on studentapp.* to 'student'@'localhost' identified by 'student@123';
flush privileges;
use studentapp;
CREATE TABLE if not exists Students(student_id INT NOT NULL AUTO_INCREMENT, student_name VARCHAR(100) NOT NULL, student_addr VARCHAR(100) NOT NULL, 	student_age VARCHAR(3) NOT NULL, student_qual VARCHAR(20) NOT NULL, student_percent VARCHAR(10) NOT NULL, student_year_passed VARCHAR(10) NOT NULL, PRIMARY KEY (student_id) );" >/tmp/student.sql 

mysql </tmp/student.sql &>>$LOG 
PRINT_STAT "Setting up DB -- SUCCESS" $?


echo -e "\n\nRunning APPLICATION Setup"
echo "-------------------------"

yum install java -y &>>$LOG 
PRINT_STAT "Installing Java" $?

wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.24/bin/apache-tomcat-8.5.24.tar.gz -O /root/apache-tomcat-8.5.24.tar.gz &>>$LOG 
PRINT_STAT "Downloading Tomcat" $?

cd /root ; tar xf apache-tomcat-8.5.24.tar.gz
PRINT_STAT "Extracting Tomcat" $?












