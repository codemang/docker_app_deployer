#!/bin/bash

set -e

cd $1

echo "Downloading master..."
git fetch origin
git reset --hard origin/master

echo "\nBuilding new image"
docker-compose build

echo "\nBundling gems"
docker-compose run web bundle install

echo "\nStarting all services..."
docker-compose up -d web
