#! /bin/bash
/usr/local/mysql/bin/mysqldump -uroot -p123456 -B zabbix >>/data/zabbix-`date +%F`.sql
