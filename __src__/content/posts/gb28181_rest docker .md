---
title: "gb28181_rest docker "
date: 2019-08-25T11:24:00+08:00
draft: false
---
启动mysql服务
sudo docker run -p 3306:3306 --name gb28181_mysql -v /home/z/docker/etc/mysql/my.cnf:/etc/mysql/my.cnf -d mariadb

sudo docker run -d -p 3306:3306 -v /home/z/docker/mysql/data:/var/lib/mysql -v /home/z/docker/etc/mysql/my.cnf:/etc/mysql/my.cnf  -e MYSQL_PASS="root" tutum/mysql


docker run \
--detach \
--publish=33006:3306 \
--restart=always \
--privileged=true \
--env=MYSQL_ROOT_PASSWORD=root \
--name=mysql \
tutum/mysql \
--character-set-server=utf8 \
--collation-server=utf8_general_ci \
--default-authentication-plugin=mysql_native_password
--lower_case_table_names=1
 ———————————————— 
版权声明：本文为CSDN博主「fengzi-fengzi」的原创文章，遵循CC 4.0 by-sa版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_31864653/article/details/90769142

/usr/sbin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mysql/plugin --user=mysql --log-error=/var/log/mysql/error.log --pid-file=/var/run/mysqld/mysqld.pid --socket=/var/run/mysqld/mysqld.sock --port=3306
#########################################################################################
mkdir -p /root/docker/etc/mysql
sudo docker run --name gb28181_mysql -d -p 33006:3306 --privileged=true -v /home/docker/root/etc/mysql:/etc/mysql -v /home/docker/root/var/lib/mysql:/var/lib/mysql  -e MYSQL_PASS="root" tutum/mysql
docker exec -ti 7b3b /bin/bash
# /etc/mysql/my.cnf #lower_case_table_names=1

mysql
grant all privileges on *.* to root@"%" identified by "root" with grant option; 
flush privileges; 
mysql -h 127.0.0.1 -uroot -proot -P 33006