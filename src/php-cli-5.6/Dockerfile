FROM alpine:3.6
LABEL maintainer development@jetrails.com

RUN apk --update --no-cache add \
	shadow \
	curl \
	vim \
	git \
	tree \
	php5 \
	php5-bcmath \
	php5-cli \
	php5-ctype \
	php5-curl \
	php5-dom \
	php5-gd \
	php5-iconv \
	php5-intl \
	php5-json \
	php5-mcrypt \
	php5-mysql \
	php5-openssl \
	php5-pdo \
	php5-pdo_mysql \
	php5-phar \
	php5-soap \
	php5-xml \
	php5-xsl \
	php5-zip \
	php5-zlib

RUN addgroup -g 1000 magento && \
	adduser -D -S -G magento -u 1000 -s /bin/sh magento

RUN ln -s "$(which php5)" "$(dirname $(which php5))/php" && \
	curl --silent --show-error https://getcomposer.org/installer | php && \
	mv composer.phar /usr/bin/composer

COPY ./conf/php.ini /etc/php5/php.ini
COPY ./conf/aliases.sh /etc/profile.d/aliases.sh

USER magento
WORKDIR /var/www/html
ENTRYPOINT [ "sh", "-l" ]
