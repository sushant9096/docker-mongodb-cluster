#!/bin/bash
SYSTEM_PASS=$SYSTEM_PASS
echo $SYSTEM_PASS
mongosh <<EOF
use admin
var config = {
    user: "system",
    pwd: $SYSTEM_PASS, // or cleartext password
    roles: [
      { role: "userAdminAnyDatabase", db: "admin" },
      { role: "readWriteAnyDatabase", db: "admin" },
      { role: "dbAdminAnyDatabase", db: "admin" },
      { role: "clusterAdmin", db: "admin" },
      { role: "backup", db: "admin" }
    ]
};

db.createUser(config);

EOF

mongosh -u "system" -p $SYSTEM_PASS --authenticationDatabase "admin" <<EOF
var config = {
    "_id": "dbrs",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "mongo1:27017",
            "priority": 3
        },
        {
            "_id": 2,
            "host": "mongo2:27017",
            "priority": 2
        },
        {
            "_id": 3,
            "host": "mongo3:27017",
            "priority": 1
        }
    ]
};
rs.initiate(config, { force: true });
rs.status();
EOF

#mongosh -u "root" -p DB_PASS --authenticationDatabase "admin" <<EOF
#var config = {
#    "_id": "dbrs",
#    "version": 1,
#    "members": [
#        {
#            "_id": 1,
#            "host": "mongo1:27017",
#            "priority": 3
#        },
#        {
#            "_id": 2,
#            "host": "mongo2:27017",
#            "priority": 2
#        },
#        {
#            "_id": 3,
#            "host": "mongo3:27017",
#            "priority": 1
#        }
#    ]
#};
#rs.initiate(config, { force: true });
#rs.status();
#EOF
