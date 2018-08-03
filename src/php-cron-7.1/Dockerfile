FROM alpine:3.6
LABEL maintainer development@jetrails.com

RUN apk --update --no-cache add \
	shadow \
	php7 \
	php7-bcmath \
	php7-cli \
	php7-ctype \
	php7-curl \
	php7-dom \
	php7-gd \
	php7-iconv \
	php7-intl \
	php7-json \
	php7-mbstring \
	php7-mcrypt \
	php7-openssl \
	php7-pdo_mysql \
	php7-phar \
	php7-session \
	php7-simplexml \
	php7-soap \
	php7-tokenizer \
	php7-xml \
	php7-xmlwriter \
	php7-xsl \
	php7-zip \
	php7-zlib

RUN addgroup -g 1000 magento && \
	adduser -D -S -H -G magento -u 1000 -s /bin/sh magento && \
	usermod -G root -a magento

RUN mkdir -p /etc/periodic/magento && \
	mkdir -p /var/www/html/var/log && \
	chown -R magento:magento /var/www/html/var/log

COPY ./conf/crontab /etc/periodic/magento/cron
COPY ./bin/startup.sh /usr/local/bin/startup.sh
COPY ./conf/php.ini /etc/php7/php.ini

RUN crontab -u magento /etc/periodic/magento/cron

WORKDIR /var/www/html
CMD [ "sh", "/usr/local/bin/startup.sh" ]
