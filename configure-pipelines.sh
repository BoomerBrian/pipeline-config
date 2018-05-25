#!/bin/sh

set -e -x

wget --no-check-certificate https://github.com/concourse/concourse/releases/download/v3.13.0/fly_linux_amd64

chmod +x fly_linux_amd64

./fly_linux_amd64 fly --target concourse login --concourse-url http://54.209.196.185:8080/

for file in pipeline-config/*; do
    ./fly_linux_amd64 -t concourse -p $(basename "$file") -c file
done