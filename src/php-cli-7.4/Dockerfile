FROM php:7.4-fpm-alpine3.12
LABEL maintainer development@jetrails.com

RUN apk --update --no-cache add \
	curl \
	tree \
	vim

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
	adduser -D -S -G magento -u 1000 -s /bin/sh magento

RUN curl --silent --show-error https://getcomposer.org/installer | php && \
	mv composer.phar /usr/bin/composer

COPY ./conf/php.ini /usr/local/etc/php/php.ini
COPY ./conf/aliases.sh /etc/profile.d/aliases.sh

RUN apk del build-deps

USER magento
WORKDIR /var/www/html
ENTRYPOINT [ "sh", "-l" ]
