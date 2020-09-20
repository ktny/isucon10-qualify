#!/bin/bash
set -xe
set -o pipefail

CURRENT_DIR=$(cd $(dirname $0);pwd)
# export MYSQL_HOST=${MYSQL_HOST:-10.161.97.102}
export MYSQL_PORT=${MYSQL_PORT:-3306}
export MYSQL_USER=${MYSQL_USER:-isucon}
export MYSQL_DBNAME=${MYSQL_DBNAME:-isuumo}
export MYSQL_PWD=${MYSQL_PASS:-isucon}
export LANG="C.UTF-8"
cd $CURRENT_DIR

cat 0_Schema_estate.sql 1_DummyEstateData.sql | mysql --defaults-file=/dev/null -h 10.161.97.102 -P $MYSQL_PORT -u $MYSQL_USER $MYSQL_DBNAME
cat 0_Schema_chair.sql 2_DummyChairData.sql | mysql --defaults-file=/dev/null -h 10.161.97.103 -P $MYSQL_PORT -u $MYSQL_USER $MYSQL_DBNAME
