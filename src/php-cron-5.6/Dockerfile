FROM alpine:3.6
LABEL maintainer development@jetrails.com

RUN apk --update --no-cache add \
	shadow \
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
	adduser -D -S -H -G magento -u 1000 -s /bin/sh magento && \
	usermod -G root -a magento

RUN ln -s "$(which php5)" "$(dirname $(which php5))/php" && \
	mkdir -p /etc/periodic/magento && \
	mkdir -p /var/www/html/var/log && \
	chown -R magento:magento /var/www/html/var/log

COPY ./conf/crontab /etc/periodic/magento/cron
COPY ./bin/startup.sh /usr/local/bin/startup.sh
COPY ./conf/php.ini /etc/php5/php.ini

RUN crontab -u magento /etc/periodic/magento/cron

WORKDIR /var/www/html
CMD [ "sh", "/usr/local/bin/startup.sh" ]
