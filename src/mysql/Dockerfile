FROM alpine:3.6
LABEL maintainer development@jetrails.com

RUN apk --update --no-cache add \
	shadow \
	mysql \
	mysql-client

RUN mkdir -p /var/log/mysql && \
	touch /var/log/mysql/mysql_error.log

COPY ./bin/startup.sh /usr/local/bin/startup.sh
COPY ./conf/my.cnf /etc/mysql/my.cnf

EXPOSE 3306
WORKDIR var/lib/mysql
CMD [ "sh", "/usr/local/bin/startup.sh" ]
