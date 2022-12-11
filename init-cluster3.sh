#!/bin/bash
dbVar="./scripts/db-user-init.sh"
echo ${dbVar}
docker exec mongo1 ${dbVar}
