#!/bin/bash

set -e

cd $1

git fetch origin
git reset --hard origin/master

docker-compose run --rm web bundle i
docker-compose run --rm web rake db:migrate
docker-compose restart web
