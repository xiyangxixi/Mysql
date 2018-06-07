#! /bin/bash
#export PATH=/bin:$PATH
/usr/local/mysql/bin/mysqldump -uroot -p123456 -B palletpro --single-transaction --master-data=2 -R -F |gzip > /usr/local/mysql/data/palletpro_`date +%F`.sql.gz
