#!/bin/sh

docker run -p 7379:7379 -it dyne/zenroom-redis:latest ./webdis.sh
