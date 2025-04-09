#!/bin/bash

# Iniciar cron
service cron start

# Iniciar Supervisor em foreground (para manter o container ativo)
exec supervisord -n -c /etc/supervisor/supervisord.conf