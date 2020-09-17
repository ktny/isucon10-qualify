#!/bin/bash -x

# 事前に/etc, /logディレクトリの権限を緩めておく

echo "start deploy db ${USER}"

for server in isu02; do
    ssh -tq $server "sudo systemctl stop mysql"
    scp isu02/my.cnf $server:/etc/mysql/my.cnf
    ssh -tq $server "sudo rm -f /var/log/mysql/*"
    ssh -tq $server "sudo mysql -uisucon -pisucon -e'flush logs;' isuumo"
    ssh -tq $server "sudo systemctl start mysql"
done

echo "finish deploy db ${USER}"
