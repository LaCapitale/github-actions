#!/bin/bash

set -e

: ${GCP_PROJECT_NAME:=''}
: ${SERVICE_TYPE:=''}
: ${REGISTRY_TYPE:=''}
: ${IMAGE_NAME:=''}
: ${CONFIG_URL:=''}
: ${RUN_DIR:=''}
: ${ARGS:=''}
: ${CLUSTER:='DEV'}
: ${GATEKEEPER_URL:='http://127.0.0.1:8080'}

echo "pwd="
pwd
ls -la

if [ -n "${GCP_PROJECT_NAME}" ]; then
  echo "downloading client..."
  curl http://wordpress.org/latest.tar.gz | tar xvz
  echo "starting client..."
  ./cloudInfra-golang-gatekeeper-client -serverURL=${GATEKEEPER_URL}
else
  echo "GCP_PROJECT_NAME was empty, we cannot call gatekeeper" 1>&2
fi
