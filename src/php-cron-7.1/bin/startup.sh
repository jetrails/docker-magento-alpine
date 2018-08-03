#!/usr/bin/env sh

chown -R magento:magento /var/www/html

if [[ "$VERBOSE" == "true" ]]; then
	/var/www/html/var/log/*.cron.log &
fi

crond -f
