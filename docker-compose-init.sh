#!/bin/bash
sudo openssl rand -base64 756 > security.key
sudo chmod 0400 ./security.key
docker compose up -d
sleep 5
./init-cluster.sh