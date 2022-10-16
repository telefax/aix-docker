#!/bin/bash

docker rm -f AIX72
docker image rm $(docker image ls|grep "telefax/docker-qemu-aix72"|awk '{print $3}')
