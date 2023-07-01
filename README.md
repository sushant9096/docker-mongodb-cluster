# Mongo DB Docker Compose Cluster
This is a docker compose project to create a mongo db cluster with 3 nodes.

#### Note: 
- This project is for development purpose only. Do not use it in production.
- Use LF line ending in your editor to avoid errors.

## Instructions
1. Clone this repository
2. openssl must be installed on your machine
3. Run the following command to generate cluster security key
```bash
openssl rand -base64 756 > security.key
```
4. export the following environment variable
```bash
export DB_PASS=your_db_admin_password
export SYSTEM_PASS=your_system_admin_password
```
5. Run the following command to create mongo cluster containers
```bash
docker-compose up -d
```
6. Run the following command to finish cluster configuration
```bash
./init-cluster.sh
```