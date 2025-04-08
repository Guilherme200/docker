#!/bin/bash

# Iniciar PHP-FPM
php-fpm &

# Iniciar nginx (foreground)
nginx -g "daemon off;"
