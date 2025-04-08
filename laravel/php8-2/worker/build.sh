#!/bin/bash

# Criar imagem
docker build -t matoso30/laravel-worker:8.2 .

# Criar tag
docker tag matoso30/laravel-worker:8.2 matoso30/laravel-worker:8.2

# Subir imagem para docker hub
docker push matoso30/laravel-worker:8.2
