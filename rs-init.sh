#!/bin/bash
# Initialize Replica Set
mongosh <<EOF
var config = {
  _id: 'dbrs',
  version: 1,
  members: [
    { _id: 0, host: 'mongo1', priority: 3 },
    { _id: 1, host: 'mongo2', priority: 2 },
    { _id: 2, host: 'mongo3', priority: 1 }
  ]
}
rs.initiate(config);
quit();
EOF