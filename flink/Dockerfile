FROM maven:3.8.4-openjdk-11-slim AS build

WORKDIR /app

# Копируем исходный код
COPY src ./src
COPY pom.xml .

# Собираем проект
RUN mvn clean package -DskipTests

# Используем официальный образ Flink
FROM flink:1.15.0-scala_2.12-java11

# Устанавливаем curl для проверки доступности JobManager
RUN apt-get update && apt-get install -y curl

# Копируем собранный JAR файл
COPY --from=build /app/target/migration-job-1.0-SNAPSHOT.jar /opt/flink/usrlib/migration-job.jar

# Копируем и делаем исполняемым скрипт запуска
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Запускаем скрипт
CMD ["/start.sh"] 