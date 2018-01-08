## Student App Stack Configuration ( WEB + APP + DB )

### 1) Setup DB
```
# yum install mariadb-server -y
# systemctl enable mariadb 
# systemctl start mariadb

# mariadb
> create database studentapp;
> grant all privileges on studentapp.* to 'student'@'<tomcat-server-ip-address>' identified by 'student@123';
> flush privileges;
> use studentapp;
> CREATE TABLE Students(student_id INT NOT NULL AUTO_INCREMENT, student_name VARCHAR(100) NOT NULL, student_addr VARCHAR(100) NOT NULL, 	student_age VARCHAR(3) NOT NULL, student_qual VARCHAR(20) NOT NULL, student_percent VARCHAR(10) NOT NULL, student_year_passed VARCHAR(10) NOT NULL, PRIMARY KEY (student_id) );
> exit

```

### 2) Setup Tomcat
```
# cd /root
# yum install java -y
# wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.24/bin/apache-tomcat-8.5.24.tar.gz
# tar xf apache-tomcat-8.5.24.tar.gz
# cd apache-tomcat-8.5.24
# cd lib
# wget <>
# cd ../webapps
# rm -rf *
# wget <>
# vim ../context.xml
  ### Add this line Just before last line
  <Resource name="jdbc/TestDB" auth="Container" type="javax.sql.DataSource" username="student" password="student@123" driverClassName="com.mysql.jdbc.Driver" url="jdbc:mysql://<IP-address-of-DB-Server>:3306/student" maxActive="15" maxIdle="3"/>
# cd ../bin
# sh startup.sh
```


