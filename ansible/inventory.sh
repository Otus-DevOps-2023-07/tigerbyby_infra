#!/bin/bash

#app_ip=$(yc compute instance get --name reddit-app | grep -A1 one_to_one_nat | awk '/address/ {print $2}')
#db_ip=$(yc compute instance get --name reddit-db | grep -A1 one_to_one_nat | awk '/address/ {print $2}')
app_ip=
db_ip=

if [ "$1" == "--list" ] ; then
cat<<EOF
{
    "_meta": {
        "hostvars": {}
    },
    "all": {
        "children": ["app", "db"]
    },
    "app": {
        "hosts": ["$app_ip"]
    },
    "db": {
        "hosts": ["$db_ip"]
    }
} 
EOF
elif [ "$1" == "--host" ]; then
  echo '{"_meta": {"hostvars": {}}}'
else
  echo "{ }"
fi
