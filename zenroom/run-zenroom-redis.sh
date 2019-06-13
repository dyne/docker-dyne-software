#!/bin/sh

docker run -p 6379:6379 -it dyne/zenroom-redis:latest $*
