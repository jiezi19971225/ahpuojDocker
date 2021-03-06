#!/bin/bash
set -e
 
mysql -u root -p${MYSQL_ROOT_PASSWORD} \
-e "CREATE USER '${MYSQL_REPLICATION_USER}'@'%' IDENTIFIED BY '${MYSQL_REPLICATION_PASSWORD}'; \
GRANT REPLICATION SLAVE ON *.* TO '${MYSQL_REPLICATION_USER}'@'%';\
flush privileges;"