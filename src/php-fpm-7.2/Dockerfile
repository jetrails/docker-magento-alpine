FROM php:7.2-fpm-alpine3.6
LABEL maintainer development@jetrails.com

RUN apk --update --no-cache add \
	curl \
	g++ \
	freetype-dev \
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

RUN usermod -u 1000 nobody && \
	groupmod -g 1000 nobody

COPY ./bin/startup.sh /usr/local/bin/startup.sh
COPY ./conf/php.ini /usr/local/etc/php/php.ini
COPY ./conf/www.conf /usr/local/etc/php-fpm.d/www.conf

EXPOSE 9000
WORKDIR /var/www/html
CMD [ "sh", "/usr/local/bin/startup.sh" ]
