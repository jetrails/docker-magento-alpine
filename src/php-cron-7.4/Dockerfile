FROM php:7.4-cli-alpine3.12
LABEL maintainer development@jetrails.com

RUN apk --update --no-cache add \
	freetype-dev \
	libjpeg-turbo-dev \
	icu-dev \
	libxslt-dev \
	libzip-dev

RUN apk --update --no-cache --virtual build-deps add \
	g++ \
	shadow \
	curl-dev \
	oniguruma-dev \
	libpng-dev \
	libxml2-dev \
	zlib-dev

RUN docker-php-ext-configure gd --with-jpeg=/usr/include/ --with-freetype=/usr/include/

RUN docker-php-ext-install \
	bcmath \
	gd \
	intl \
	pdo_mysql \
	soap \
	sockets \
	xsl \
	zip

RUN addgroup -g 1000 magento && \
	adduser -D -S -H -G magento -u 1000 -s /bin/sh magento && \
	usermod -G root -a magento

RUN mkdir -p /etc/periodic/magento && \
	mkdir -p /var/www/html/var/log && \
	chown -R magento:magento /var/www/html/var/log

COPY ./conf/crontab /etc/periodic/magento/cron
COPY ./bin/startup.sh /usr/local/bin/startup.sh
COPY ./conf/php.ini /usr/local/etc/php/php.ini

RUN crontab -u magento /etc/periodic/magento/cron

RUN apk del build-deps

WORKDIR /var/www/html
CMD [ "sh", "/usr/local/bin/startup.sh" ]
