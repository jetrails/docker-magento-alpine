FROM alpine:3.6
LABEL maintainer development@jetrails.com

RUN apk --update --no-cache add \
	shadow \
	php5 \
	php5-bcmath \
	php5-ctype \
	php5-curl \
	php5-dom \
	php5-fpm \
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
	php5-zlib  \
	php5-sockets

RUN usermod -u 1000 nobody && \
	groupmod -g 1000 nobody

COPY ./bin/startup.sh /usr/local/bin/startup.sh
COPY ./conf/php.ini /etc/php5/php.ini
COPY ./conf/www.conf /etc/php5/php-fpm.conf

EXPOSE 9000
WORKDIR /var/www/html
CMD [ "sh", "/usr/local/bin/startup.sh" ]
