FROM arm64v8/php:8.2-fpm

WORKDIR /app

RUN apt-get update && apt-get install -y \
    cron \
    supervisor \
    git \
    nano \
    unzip \
    curl \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libicu-dev \
    libpq-dev \
    zip \
    libexif-dev \
    libssl-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        pdo \
        pdo_pgsql \
        mbstring \
        bcmath \
        zip \
        intl \
        xml \
        gd \
        exif \
        pcntl \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN mkdir -p /app/storage/logs

COPY horizon.conf /etc/supervisor/conf.d/horizon.conf

RUN echo "* * * * * php /app/artisan schedule:run >> /dev/null 2>&1" >> /etc/crontab

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["php-fpm"]

EXPOSE 9000