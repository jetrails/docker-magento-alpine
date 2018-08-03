#!/usr/bin/env sh

if [[ "$VERBOSE" == "true" ]]; then
	tail -f /var/log/php7/*.log &
fi

chown -R nobody:nobody /var/www
php-fpm7 -F
