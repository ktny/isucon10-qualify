#!/bin/bash -x

echo "start deploy app ${USER}"

# 配置先
dest=/home/isucon/isuumo/webapp/go/isuumo

# GOOS=linux go build -o app src/isucon/app.go
cd webapp/go
make

for server in isu01; do
    ssh -tq $server "sudo systemctl stop isuumo.go.service"
    scp ./isuumo $server:$dest
    # templateは別途rsyncする必要がある
    # rsync -av ./src/isucon/views/ $server:/home/isucon/webapp/go/src/isucon/views/
    ssh -tq $server "sudo systemctl start isuumo.go.service"
done

echo "finish deploy app ${USER}"
