#!/bin/sh


cd /project/petition-tp-python
hypercorn -b 0.0.0.0:9009 src.tp.server.main:app
