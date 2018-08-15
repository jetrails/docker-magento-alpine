#!/usr/bin/env sh

chown -R magento:magento /var/www/html

if [[ "$VERBOSE" == "true" ]]; then
	mkdir -p /var/www/html/var/log
	tail -f /var/www/html/var/log/*.cron.log &
fi

crond -f
