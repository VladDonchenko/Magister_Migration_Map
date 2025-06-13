#!/bin/bash
until curl -s http://flink:8081/overview > /dev/null; do
    echo "Waiting for JobManager..."
    sleep 5
done
echo "JobManager is ready, starting job..."
flink run -m flink:8081 -d /opt/flink/usrlib/migration-job.jar

# Ждем завершения задачи
while true; do
    sleep 60
done 