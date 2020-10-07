#!/bin/bash

echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin
docker build -t imzihad21/n00b-dev-tests/evox-ten .
docker push imzihad21/n00b-dev-tests