FROM alpine:3.6
LABEL maintainer development@jetrails.com

RUN apk --update --no-cache add \
	redis

RUN touch /var/log/redis/redis.log

COPY bin/startup.sh /usr/local/bin/startup.sh
COPY conf/redis.conf /etc/redis.conf

EXPOSE 6379
WORKDIR /var/lib/redis
CMD [ "sh", "/usr/local/bin/startup.sh" ]
