FROM php:7.2-cli-alpine3.6
LABEL maintainer development@jetrails.com

RUN apk --update --no-cache add \
	curl \
	freetype-dev \
	g++ \
	icu \
	icu-dev \
	libjpeg-turbo-dev \
	libpng-dev \
	libxml2-dev \
	libxslt-dev \
	shadow \
	zlib-dev

RUN docker-php-ext-configure \
	gd --with-jpeg-dir=/usr/local/ --with-freetype-dir=/usr/include/
RUN docker-php-ext-install \
	gd \
	bcmath \
	intl \
	pdo_mysql \
	soap \
	xsl \
	zip \
	sockets

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

WORKDIR /var/www/html
CMD [ "sh", "/usr/local/bin/startup.sh" ]
