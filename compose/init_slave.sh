#!/bin/bash
 
set -e
 
# create replication user

MYSQL_ETL="mysql -hdb -P3306 -uroot -p${MYSQL_ROOT_PASSWORD} oj -s -e"
hive_table_sql="show master status;"
# File Position Binlog_Do_DB Bin_log_ignore_db
hive_table=$($MYSQL_ETL "${hive_table_sql}")

for param in $hive_table
do 
params[$cnt]=$param
((cnt+=1))
done
 
# 休眠 60s，等待主库启动完成，如果建立主从连接仍然失败，需进入容器手动执行该脚本

sleep 60s

mysql -u root -p${MYSQL_ROOT_PASSWORD} \
-e "CHANGE MASTER TO MASTER_HOST='db', \
MASTER_PORT=3306, \
MASTER_USER='${MYSQL_REPLICATION_USER}', \
MASTER_PASSWORD='${MYSQL_REPLICATION_PASSWORD}', \
MASTER_LOG_FILE='${params[0]}', \
MASTER_LOG_POS=${params[1]};"
 
# start slave and show slave status
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "START SLAVE;show slave status\G"
echo "slave"

 
