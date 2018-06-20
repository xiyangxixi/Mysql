# mysql 

#安装包 www.ymdhyl.com/static/mysql-5.6.21-linux-glibc2.5-x86_64.tar.gz


mkdir -p /usr/local/log/mysql
mkdir -p /usr/local/server/mysql
#下载完成解压
tar -zxvf mysql-5.6.21-linux-glibc2.5-x86_64.tar.gz
mv mysql-5.6.21-linux-glibc2.5-x86_64/* /usr/local/server/mysql
groupadd mysql
useradd -g mysql -s /sbin/nologin mysql
/usr/local/server/mysql/scripts/mysql_install_db --datadir=/usr/local/server/mysql/data/ --basedir=/usr/local/server/mysql --user=mysql
chown -R mysql:mysql /usr/local/server/mysql/
chown -R mysql:mysql /usr/local/server/mysql/data/
chown -R mysql:mysql /usr/local/log/mysql
\cp -f /usr/local/server/mysql/support-files/mysql.server /etc/init.d/mysqld
sed -i 's#^basedir=$#basedir=/usr/local/server/mysql#' /etc/init.d/mysqld
sed -i 's#^datadir=$#datadir=/usr/local/server/mysql/data#' /etc/init.d/mysqld
cat > /etc/my.cnf <<END
[client]
port            = 3306
socket          = /tmp/mysql.sock
[mysqld]
port            = 3306
socket          = /tmp/mysql.sock
skip-external-locking
key_buffer_size = 16M
max_allowed_packet = 1M
table_open_cache = 64
sort_buffer_size = 512K
net_buffer_length = 8K
read_buffer_size = 256K
read_rnd_buffer_size = 512K
myisam_sort_buffer_size = 8M

log-bin=mysql-bin
binlog_format=mixed
server-id       = 1

sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES

[mysqldump]
quick
max_allowed_packet = 16M

[mysql]
no-auto-rehash

[myisamchk]
key_buffer_size = 20M
sort_buffer_size = 20M
read_buffer = 2M
write_buffer = 2M

[mysqlhotcopy]
interactive-timeout
END

chmod 755 /etc/init.d/mysqld
/etc/init.d/mysqld start

#修改密码
/usr/local/server/mysql/bin/mysqladmin -uroot password 123456
#找到mysql的安装主目录，使用find / -name mysql找到带有bin目录的mysql

ln -s /usr/local/server/mysql/bin/mysql /usr/bin

mysql -uroot -p123456
use mysql; 
select 'host' from user where user='root';  
update user set host = '%' where user ='root';  
flush privileges;  

