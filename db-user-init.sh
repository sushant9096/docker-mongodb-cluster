#!/bin/bash

mongosh -u "system" -p "$SYSTEM_PASS" --authenticationDatabase "admin" <<EOF
echo $DB_PASS
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
