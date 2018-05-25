#!/bin/sh

set -e -x

wget --no-check-certificate https://github.com/concourse/concourse/releases/download/v3.13.0/fly_linux_amd64

chmod +x fly_linux_amd64

./fly_linux_amd64 --target concourse login --concourse-url http://54.209.196.185:8080/

for file in pipeline-config/*-config.yml; do
    filename="$(basename ${file%.*})"
    cutname="($filename | cut -f2 -d'-')"
    ./fly_linux_amd64 -t concourse set-pipeline -n -p sonic-eats-ms-$cutname -c pipeline-config/$(basename "$file")
done