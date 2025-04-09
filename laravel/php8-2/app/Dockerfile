FROM laravelsail/php82-composer

RUN apt-get update && apt-get install -y  \
        curl && \
        nano && \
        docker-php-ext-install exif && \
        pecl install redis && \
        docker-php-ext-enable redis && \
        apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

EXPOSE 80

ENTRYPOINT ["php", "artisan", "serve", "--host=0.0.0.0", "--port=80"]

