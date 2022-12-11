#!/bin/bash

mongosh <<EOF
use admin
var config = {
    user: "system",
    pwd: "$SYSTEM_PASS", // or cleartext password
    roles: [
      { role: "userAdminAnyDatabase", db: "admin" },
      { role: "readWriteAnyDatabase", db: "admin" },
      { role: "dbAdminAnyDatabase", db: "admin" },
      { role: "clusterAdmin", db: "admin" },
      { role: "backup", db: "admin" }
    ]
};
db.createUser(config);
quit();
EOF