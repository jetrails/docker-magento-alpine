FROM php:7.2-cli-alpine3.6
LABEL maintainer development@jetrails.com

RUN apk --update --no-cache add \
	curl \
	freetype-dev \
	g++ \
	git \
	icu \
	icu-dev \
	libjpeg-turbo-dev \
	libpng-dev \
	libxml2-dev \
	libxslt-dev \
	shadow \
	tree \
	vim \
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
	zip

RUN addgroup -g 1000 magento && \
	adduser -D -S -G magento -u 1000 -s /bin/sh magento

RUN curl --silent --show-error https://getcomposer.org/installer | php && \
	mv composer.phar /usr/bin/composer

COPY ./conf/php.ini /usr/local/etc/php/php.ini
COPY ./conf/aliases.sh /etc/profile.d/aliases.sh

USER magento
WORKDIR /var/www/html
ENTRYPOINT [ "sh", "-l" ]
