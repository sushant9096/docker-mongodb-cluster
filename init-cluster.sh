#!/bin/bash
sudo openssl rand -base64 756 > security.key
sudo chmod 0400 ./security.key
docker compose up -d

sleep 5
var2="export DB_PASS=$DB_PASS && ./scripts/rs-init.sh"
echo ${var2}
var3="export SYSTEM_PASS=$SYSTEM_PASS && ./scripts/db-user-init.sh"
docker exec mongo1 /bin/bash -c ${var2}
#docker exec -it mongo1 /bin/bash
