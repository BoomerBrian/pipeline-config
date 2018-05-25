#!/bin/sh

set -e -x

wget --no-check-certificate https://github.com/concourse/concourse/releases/download/v3.13.0/concourse_linux_amd64

wget --no-check-certificate https://github.com/concourse/concourse/releases/download/v3.13.0/fly_linux_amd64

for file in pipeline-config/*; do
    ./fly_linux_amd64 -t concourse -p $(basename "$file") -c file
done