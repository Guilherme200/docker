#!/bin/bash

# Criar imagem
docker build -t matoso30/laravel-app:8.2-arm .
#
## Criar tag
docker tag matoso30/laravel-app:8.2-arm matoso30/laravel-app:8.2-arm
#
## Subir imagem para docker hub
docker push matoso30/laravel-app:8.2-arm
