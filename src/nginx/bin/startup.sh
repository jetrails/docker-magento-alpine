#!/usr/bin/env sh

if [[ "$MAGENTO_VERSION" != "1" ]] && [[ "$MAGENTO_VERSION" != "2" ]]; then
	echo "Valid value for MAGENTO_VERSION is not found ... using default value 2"
	MAGENTO_VERSION="2"
fi

if [[ "$VERBOSE" == "true" ]]; then
	mkdir -p /var/log/nginx
	touch /var/log/nginx/error.log /var/log/nginx/access.log
	tail -f /var/log/nginx/*.log &
fi

cp "/etc/nginx/available.d/magento-$MAGENTO_VERSION.conf" "/etc/nginx/conf.d/http.conf"
chown -R nginx:nginx /var/www /var/tmp/nginx
nginx -g 'daemon off;'
