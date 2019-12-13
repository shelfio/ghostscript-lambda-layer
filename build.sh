#!/bin/sh

docker build -t gs-lambda-layer .
docker run --rm gs-lambda-layer cat /tmp/gs.zip > ./ghostscript.zip
