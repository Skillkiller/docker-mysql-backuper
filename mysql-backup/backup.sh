#!/bin/bash
echo "Starting dump of all databases except of Database|information_schema|performance_schema|sys|mysql"
dateinfo=$(date '+%Y-%m-%d %H:%M:%S')
echo "Collecting all MySql dumps... This process can take up a while..."

databases=$(mysql -h $MYSQL_HOST -u $MYSQL_USERNAME --password=$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema|sys|mysql)")

for database in ${databases}; do
	mkdir -p "/backup/${database}/"
	echo "Dumping database ${database}..."
	mysqldump -h $MYSQL_HOST -u $MYSQL_USERNAME \
		--password=$MYSQL_PASSWORD $database > "/backup/${database}/${dateinfo}.sql"
done
