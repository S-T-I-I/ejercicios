#!/bin/bash

echo "version 05"

if [ $(docker ps -a -q --filter "status=exited") ]; then
  echo "borrando containers $DOCKERSTOP"
  docker rm $(docker ps -a -q --filter "status=exited") > /dev/null
else
  echo "no hay imagenes para borrar"
fi

sleep 3

if [ "$(docker images -a -q)" ]; then
  echo "borrando imagenes"
  docker rmi $(docker images -a -q) > /dev/null
else
  echo "no hay imagenes para borrar"
fi

sleep 3

echo "purgando el sistema"
docker system prune -f > /dev/null
