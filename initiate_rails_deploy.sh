#!/bin/bash

if [ -z ${DOCKER_APP_DEPLOYER_SSH_HOST} ]; then
  echo 'You must set the DOCKER_APP_DEPLOYER_SSH_HOST env var. Exiting.'
  exit 1
fi

app_name=${PWD##*/}
ssh -A $DOCKER_APP_DEPLOYER_SSH_HOST "./docker_app_deployer/execute_rails_deploy.sh ${app_name}"
