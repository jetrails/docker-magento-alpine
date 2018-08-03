#!/usr/bin/env sh

if [ ! -f /var/lib/mysql/installed ]; then
	mysql_install_db --user=root > /dev/null && \
	touch /var/lib/mysql/installed

	MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-mysql}
	MYSQL_DATABASE=${MYSQL_DATABASE:-""}
	MYSQL_USER_NAME=${MYSQL_USER_NAME:-""}
	MYSQL_USER_PASSWORD=${MYSQL_USER_PASSWORD:-""}

	query=$(mktemp)

	echo -en \
		"FLUSH PRIVILEGES;\n" \
		"GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;\n" \
		"UPDATE mysql.user SET password=PASSWORD('') WHERE user='root' AND host='localhost';\n" \
	> $query

	if [ -n "$MYSQL_DATABASE" ]; then
		echo -en \
			"CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;\n" \
		>> $query
	fi

	if [ -n "$MYSQL_USER_NAME" ] && [ -n "$MYSQL_USER_PASSWORD" ]; then
		echo -en \
			"GRANT ALL ON *.* TO '$MYSQL_USER_NAME'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';\n" \
		>> $query
	fi

	mysqld --user=root --bootstrap < $query
	rm -f $query
fi

if [[ "$VERBOSE" == "true" ]]; then
	/var/log/mysql/*.log &
fi

exec mysqld --user=root --console
