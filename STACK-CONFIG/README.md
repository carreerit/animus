## Student App Stack Configuration ( WEB + APP + DB )

### 1) Setup DB
```
# yum install mariadb-server -y
# systemctl enable mariadb 
# systemctl start mariadb

# mariadb
> create database studentapp;
> grant all privileges on studentapp.* to 'student'@'``` `<tomcat-server-ip-address>` ```'
```
