#!/usr/bin/env sh

if [[ "$VERBOSE" == "true" ]]; then
	tail -f /var/log/redis/*.log &
fi

redis-server /etc/redis.conf
