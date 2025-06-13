package org.migration;

import org.apache.flink.api.common.serialization.SimpleStringSchema;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.connectors.kafka.FlinkKafkaConsumer;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.Properties;

public class MigrationJob {
    public static void main(String[] args) throws Exception {
        // Создаем окружение выполнения
        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        // Настраиваем свойства Kafka
        Properties kafkaProps = new Properties();
        kafkaProps.setProperty("bootstrap.servers", "kafka:29092");
        kafkaProps.setProperty("group.id", "migration-group");
        kafkaProps.setProperty("auto.offset.reset", "earliest");
        kafkaProps.setProperty("enable.auto.commit", "true");
        kafkaProps.setProperty("auto.commit.interval.ms", "1000");
        kafkaProps.setProperty("session.timeout.ms", "30000");
        kafkaProps.setProperty("request.timeout.ms", "40000");
        kafkaProps.setProperty("security.protocol", "PLAINTEXT");
        kafkaProps.setProperty("client.id", "flink-consumer");
        kafkaProps.setProperty("max.poll.records", "500");
        kafkaProps.setProperty("fetch.max.wait.ms", "500");
        kafkaProps.setProperty("fetch.min.bytes", "1");
        kafkaProps.setProperty("heartbeat.interval.ms", "3000");
        kafkaProps.setProperty("connections.max.idle.ms", "540000");
        kafkaProps.setProperty("reconnect.backoff.ms", "50");
        kafkaProps.setProperty("reconnect.backoff.max.ms", "1000");
        kafkaProps.setProperty("flink.partition-discovery.interval-millis", "5000");
        kafkaProps.setProperty("internal.leave.group.on.close", "true");
        kafkaProps.setProperty("isolation.level", "read_uncommitted");
        kafkaProps.setProperty("flink.starting-position", "earliest");

        // Создаем источник данных из Kafka
        FlinkKafkaConsumer<String> kafkaSource = new FlinkKafkaConsumer<>(
                "migration_raw",
                new SimpleStringSchema(),
                kafkaProps
        );

        // Добавляем источник в поток
        DataStream<String> stream = env.addSource(kafkaSource);

        // Преобразуем JSON в объекты MigrationData
        ObjectMapper mapper = new ObjectMapper();
        DataStream<MigrationData> migrationStream = stream.map(value -> {
            try {
                return mapper.readValue(value, MigrationData.class);
            } catch (Exception e) {
                System.err.println("Ошибка при десериализации JSON: " + e.getMessage());
                return null;
            }
        }).filter(value -> value != null);

        // Добавляем Neo4j sink
        migrationStream.addSink(new Neo4jSink(
                "bolt://neo4j:7687",
                "neo4j",
                "password"
        ));

        // Запускаем задачу
        env.execute("Migration Processing Job");
    }
} 