#!/bin/bash

#start zk in background
./opt/zookeeper/bin/zkServer.sh start

#start nifi in foreground
./opt/nifi/bin/nifi.sh run