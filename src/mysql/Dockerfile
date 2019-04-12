FROM mysql:5.7
LABEL maintainer development@jetrails.com

COPY ./bin/entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY ./conf/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

RUN chmod +x /usr/local/bin/docker-entrypoint.sh
