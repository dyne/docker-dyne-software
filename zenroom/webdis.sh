#!/bin/sh

redis-server --loadmodule zenroom/src/redis_zenroom.so-x86_64-0.9.so &
cd webdis && ./webdis
