#!/bin/bash
rsVar="./scripts/rs-init.sh"
echo ${rsVar}
docker exec mongo1 ${rsVar}
sleep 10
./init-cluster2.sh
sleep 5
./init-cluster3.sh