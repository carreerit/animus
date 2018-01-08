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
# wget https://github.com/carreerit/animus/raw/master/STACK-CONFIG/mysql-connector-java-5.1.40.jar
# cd ../webapps
# rm -rf *
# wget https://github.com/carreerit/animus/raw/master/STACK-CONFIG/student.war
# vim ../context.xml
  ### Add this line Just before last line
  <Resource name="jdbc/TestDB" auth="Container" type="javax.sql.DataSource" username="student" password="student@123" driverClassName="com.mysql.jdbc.Driver" url="jdbc:mysql://<IP-address-of-DB-Server>:3306/student" maxActive="15" maxIdle="3"/>
# cd ../bin
# sh startup.sh
```
### 3) Web Server Config

```
# yum install httpd httpd-devel gcc -y
# cd /root
# wget http://www-eu.apache.org/dist/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.42-src.tar.gz
# tar xf tomcat-connectors-1.2.42-src.tar.gz
# cd tomcat-connectors-1.2.42-src/native
# ./configure --with-apxs=/bin/apxs
# make
# make install
# vim /etc/httpd/conf.d/workers.properties
```
```
worker.list=tomcat1
worker.tomcat1.type=ajp13
worker.tomcat1.port=8009
worker.tomcat1.host=10.142.0.5 ### Here is the IP address of tomcat
```

```
# vim /etc/httpd/conf.d/mod_jk.conf
```
```
LoadModule    jk_module  modules/mod_jk.so
JkWorkersFile conf.d/workers.properties
JkLogFile     logs/mod_jk.log
JkLogLevel    emerg
JkLogStampFormat "[%a %b %d %H:%M:%S %Y] "
JkOptions     +ForwardKeySize +ForwardURICompat -ForwardDirectories
JkRequestLogFormat     "%w %V %T"
JkMount  /student	tomcat1
JkMount	/student/* 	tomcat1
```
```
# systemctl restart httpd
```

