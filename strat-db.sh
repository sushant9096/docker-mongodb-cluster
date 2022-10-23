#!/bin/bash
openssl rand -base64 756 > security.key
chmod 400 security.key
docker compose up -d

sleep 5
var2="export DB_PASS=$DB_PASS && ./scripts/rs-init.sh"
echo ${var2}
docker exec mongo1 /bin/bash -c ${var2}