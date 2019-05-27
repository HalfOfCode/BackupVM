#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

FNAME=`date +%d-%m-%Y_%H:%M`
mysqldump -u root -p'password123!' mediawiki --add-drop-table -B > /var/www/html/${FNAME}.sql
zip -r /var/www/html/backup/${FNAME}.zip /var/www/html/images/ /var/www/html/${FNAME}.sql /var/www/html/LocalSettings.php /var/www/html/extensions/
rm /var/www/html/${FNAME}.sql
gdrive upload -r /var/www/html/backup/${FNAME}.zip

