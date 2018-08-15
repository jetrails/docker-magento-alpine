#!/usr/bin/env sh

if [[ "$VERBOSE" == "true" ]]; then
	touch var/log/php-fpm.log
	tail -f /var/log/php-fpm.log &
fi

chown -R nobody:nobody /var/www
php-fpm5 -F
