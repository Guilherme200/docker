FROM laravelsail/php82-composer

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    nano \
    cron \
    supervisor \
    && docker-php-ext-install exif \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app/storage/logs

COPY ./horizon.conf /etc/supervisor/conf.d/horizon.conf

RUN echo "* * * * * php /app/artisan schedule:run >> /dev/null 2>&1" >> /etc/crontab

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]