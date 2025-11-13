#!/bin/sh

set -a
source .env
set +a

export UID=$(id -u)
export GID=$(id -g)
docker-compose up