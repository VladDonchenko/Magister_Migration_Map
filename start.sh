#!/bin/bash

# Останавливаем и удаляем все контейнеры
docker-compose down

# Удаляем все тома
docker volume prune -f

# Запускаем все сервисы
docker-compose up -d

# Ждем, пока все сервисы запустятся
echo "Ожидание запуска сервисов..."
sleep 30

# Проверяем статус Flink job
echo "Проверка статуса Flink job..."
docker-compose logs flink-job

echo "Приложение запущено!"
echo "Neo4j доступен по адресу: http://localhost:7474"
echo "Flink UI доступен по адресу: http://localhost:8081"
echo "Backend API доступен по адресу: http://localhost:8000" 