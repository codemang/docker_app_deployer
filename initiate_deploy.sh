#!/bin/bash

app_name=${PWD##*/}
ssh -A nate@natemango.com "./docker_app_deployer/execute_deploy.sh ${app_name}"
