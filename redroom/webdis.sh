#!/bin/sh

redis-server --loadmodule redroom/redroom.so &
cd webdis && ./webdis
