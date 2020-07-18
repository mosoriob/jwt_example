#!/usr/bin/env bash
set -e
dir=${PWD}
SERVER_DIR=server
docker run -ti --rm -v ${PWD}:/local openapitools/openapi-generator-cli:v4.3.1 \
     generate  \
     -i /local/openapi.yaml\
     -g go-gin-server  \
     -o /local/ \
     --git-repo-id jwt_example \
     --git-user-id mosoriob \
