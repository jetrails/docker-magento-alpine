#!/usr/bin/env sh

if [[ "$VERBOSE" == "true" ]]; then
	tail -f /var/log/nginx/*.log &
fi

chown -R nginx:nginx /var/www
nginx -g 'daemon off;'
