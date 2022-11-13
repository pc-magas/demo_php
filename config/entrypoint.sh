#!/bin/bash

function pingdb {
    OK=0
    for count in {1..100}; do
      echo "Pinging database attempt ${count} into ${DB_HOST}:${DB_PORT}" 
      if  $(nc -z ${DB_HOST} ${DB_PORT}) ; then
        echo "Can connect into database"
        OK=1
        break
      fi
      sleep 5
    done

    echo "Is ok? "$OK

    if [ $OK -eq 1 ]; then
      echo "Connected"
   else
      echo >&2 "Can't connect into database"
      exit 1
    fi
}

pingdb

cp /usr/src/app/index.php /var/www/html/
chown www-data:www-data /var/www/html/index.php

exec "$@"