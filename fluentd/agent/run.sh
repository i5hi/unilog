#!/bin/bash

docker run -it --rm \
 -v /home/ishi/logdumps/zulip.bitshala.org/dumps:/dumps \
 -v /home/ishi/logdumps/zulip.bitshala.org/fluentd/conf/:/fluentd/etc/ \
 --network=unilognet -itd --name=agent-fluentd
 agent-fluent