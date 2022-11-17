#!/bin/bash

docker kill $(docker ps -q)
pkill -f send_node
