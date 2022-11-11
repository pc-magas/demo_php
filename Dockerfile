FROM  php:7.4-fpm

VOLUME "/var/www/html"
EXPOSE 9000

ARG INIT_DB_USER="mitsos"
ARG INIT_DB_NAME="mitsos_db"

ENV DB_HOST=""\
    DB_USER=$INIT_DB_USER\
    DB_PASSWD=$INIT_DB_NAME\
    DB_PORT=3306


RUN apt-get update && \
    docker-php-ext-install pdo mysqli pdo_mysql &&\
    mkdir /usr/src/app &&\
    apt-get autopurge -y &&\
	apt-get autoremove -y &&\
	apt-get autoclean &&\
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* cache/* /var/lib/log/*

COPY ./app/index.php /usr/src/app/index.php
COPY ./config/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chown root:root /usr/local/bin/entrypoint.sh &&\
	chmod +x /usr/local/bin/entrypoint.sh


ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["php-fpm"]