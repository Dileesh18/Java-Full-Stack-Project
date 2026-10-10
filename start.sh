#!/bin/bash
mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld
mysqld_safe --bind-address=127.0.0.1 &
until mysqladmin ping --silent; do sleep 1; done

mysql <<'SQL'
CREATE DATABASE IF NOT EXISTS coodle;
ALTER USER 'root'@'localhost' IDENTIFIED VIA unix_socket OR mysql_native_password USING PASSWORD('<v5w(M<u55=`5RkU');
FLUSH PRIVILEGES;
SQL

exec java -Xmx256m -Dserver.port=${PORT:-8080} -jar /app/app.war