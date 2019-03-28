#!/bin/bash

set -e

echo "Downloading master..."
git fetch origin
git reset --hard origin/master

echo "\nBuilding new image"
docker-compose build

# Needed when we added haml to the gemfile
# Do we still need this?
echo "\nRestarting service so that we precompile new assets"
docker-compose down
docker-compose up -d website

echo "\nPrecompiling assets..."
docker-compose run website rails assets:precompile

echo "\nRunning migrations"
docker-compose run website rake db:create
docker-compose run website rake db:migrate

echo "\nShutting down all services..."
docker-compose down

echo "\nStarting all services..."
docker-compose up -d website
