#!/bin/bash

ssh root@147.75.32.163 << EOF
function create_service {
    docker service create \
      --name test101 \
      -p 80:8080 \
      --update-parallelism 2 \
      --update-delay 5s \
      --replicas 2 \
      wesleycharlesblake/test101:latest
}

function update_service {
    docker service update \
      --update-parallelism 2 \
      --update-delay 1s \
      --update-failure-action rollback \
      --replicas 8 \
      --image wesleycharlesblake/test101:0.1.20 \
      test101
}

function check_service {
    docker service inspect test101
}

check_service

container_test=$?

if [ $container_test -eq 1 ]
  then
    create_service
  else
    update_service
fi
EOF