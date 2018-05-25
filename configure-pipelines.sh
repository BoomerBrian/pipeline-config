#!/bin/sh

set -e -x

for file in pipeline-config/*; do
    fly -t concourse -p $(basename "$file") -c file
done
