#!/bin/bash

# Iniciar cron
service cron start

# Iniciar Supervisor
supervisord -c /etc/supervisor/supervisord.conf