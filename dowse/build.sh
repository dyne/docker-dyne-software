#!/bin/sh

REPO=dyne/dowse
API=https://api.github.com/repos
SHA=$(curl -s '$API/$REPO/commits?sha=summer-cleanup' | awk '/sha/ { print $2; exit }')
docker build --build-arg SHA="$SHA" -t $REPO:latest . $*

