#!/bin/bash
suVar="./scripts/system-user-init.sh"
echo ${suVar}
docker exec mongo1 ${suVar}
