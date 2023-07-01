#!/bin/bash
echo DB_PASS="$DB_PASS"
mongosh -u "system" -p "$SYSTEM_PASS" --authenticationDatabase "admin" <<EOF
use admin
db.createUser(
  {
    user: "root",
    pwd: "$DB_PASS", // or cleartext password
    roles: [
      { role: "userAdminAnyDatabase", db: "admin" },
      { role: "readWriteAnyDatabase", db: "admin" }
    ]
  }
)
quit();
EOF
