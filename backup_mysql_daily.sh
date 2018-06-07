#! /bin/bash
#备份单库palletpro
/usr/local/mysql/bin/mysqldump -uroot -p123456 -B palletpro --single-transaction --master-data=2 -R -F \
|gzip > /usr/local/mysql/data/palletpro_`date +%F`.sql.gz
#备份所有数据库
/usr/local/mysql/bin/mysqldump -uroot -p123456 --all-databases[-A] --single-transaction --master-data=2 -R -F >>/data/all_databases_`date +%F`.sql


#!/bin/bash
# auther:AM
# time:2018-01-09 PM
# 作用:用于本机的mysql数据备份
#db_user="root"
#db_password="123456"
db_name=(EOS WG_DM WG_ETL WG_N WG_TMP WG_YW WG_ZY)
backup_dir="/opt/daily_mysql_backup"
time="$(date +"%Y%m%d%H%M%S")"
#mysqldump -u$db_user -p$db_password ${db_name[0]} > "$backup_dir/${db_name[0]}_$time.sql"
#mysqldump -u$db_user -p$db_password ${db_name[1]} > "$backup_dir/${db_name[1]}_$time.sql"
#mysqldump -u$db_user -p$db_password ${db_name[2]} > "$backup_dir/${db_name[2]}_$time.sql"
#mysqldump -u$db_user -p$db_password ${db_name[3]} > "$backup_dir/${db_name[3]}_$time.sql"
#mysqldump -u$db_user -p$db_password ${db_name[4]} > "$backup_dir/${db_name[4]}_$time.sql"
mysqldump --defaults-extra-file=/etc/my.cnf ${db_name[0]} > "$backup_dir/${db_name[0]}_$time.sql"
mysqldump --defaults-extra-file=/etc/my.cnf ${db_name[1]} > "$backup_dir/${db_name[1]}_$time.sql"
mysqldump --defaults-extra-file=/etc/my.cnf ${db_name[2]} > "$backup_dir/${db_name[2]}_$time.sql"
mysqldump --defaults-extra-file=/etc/my.cnf ${db_name[3]} > "$backup_dir/${db_name[3]}_$time.sql"
mysqldump --defaults-extra-file=/etc/my.cnf ${db_name[4]} > "$backup_dir/${db_name[4]}_$time.sql"
