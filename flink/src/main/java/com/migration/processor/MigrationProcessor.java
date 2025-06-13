package com.migration.processor;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.migration.processor.model.MigrationData;
import org.apache.flink.api.common.functions.MapFunction;
import org.apache.flink.api.common.serialization.SimpleStringSchema;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.connectors.kafka.FlinkKafkaConsumer;
import org.apache.flink.streaming.connectors.kafka.FlinkKafkaProducer;
import org.apache.flink.streaming.connectors.kafka.KafkaSerializationSchema;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Session;

import java.nio.charset.StandardCharsets;
import java.util.Properties;

public class MigrationProcessor {
    private static final ObjectMapper objectMapper = new ObjectMapper();

    public static void main(String[] args) throws Exception {
        // Створюємо середовище виконання Flink
        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        // Налаштування для Kafka
        Properties kafkaProps = new Properties();
        kafkaProps.setProperty("bootstrap.servers", "kafka:29092");
        kafkaProps.setProperty("group.id", "migration-processor");

        // Створюємо споживача Kafka для сирих даних
        FlinkKafkaConsumer<String> kafkaConsumer = new FlinkKafkaConsumer<>(
            "migration_raw",
            new SimpleStringSchema(),
            kafkaProps
        );

        // Створюємо виробника Kafka для оброблених даних
        FlinkKafkaProducer<String> kafkaProducer = new FlinkKafkaProducer<>(
            "migration_processed",
            new KafkaSerializationSchema<String>() {
                @Override
                public ProducerRecord<byte[], byte[]> serialize(String element, Long timestamp) {
                    return new ProducerRecord<>(
                        "migration_processed",
                        null,
                        element.getBytes(StandardCharsets.UTF_8)
                    );
                }
            },
            kafkaProps,
            FlinkKafkaProducer.Semantic.EXACTLY_ONCE
        );

        // Створюємо виробника Kafka для аналітики
        FlinkKafkaProducer<String> analyticsProducer = new FlinkKafkaProducer<>(
            "migration_analytics",
            new KafkaSerializationSchema<String>() {
                @Override
                public ProducerRecord<byte[], byte[]> serialize(String element, Long timestamp) {
                    return new ProducerRecord<>(
                        "migration_analytics",
                        null,
                        element.getBytes(StandardCharsets.UTF_8)
                    );
                }
            },
            kafkaProps,
            FlinkKafkaProducer.Semantic.EXACTLY_ONCE
        );

        // Отримуємо потік даних з Kafka
        DataStream<String> migrationStream = env.addSource(kafkaConsumer);

        // Обробляємо дані
        DataStream<MigrationData> processedStream = migrationStream
            .map(new MapFunction<String, MigrationData>() {
                @Override
                public MigrationData map(String value) throws Exception {
                    return objectMapper.readValue(value, MigrationData.class);
                }
            });

        // Зберігаємо оброблені дані в Neo4j
        processedStream.map(new MapFunction<MigrationData, Void>() {
            @Override
            public Void map(MigrationData data) throws Exception {
                try (Driver driver = GraphDatabase.driver("bolt://neo4j:7687", 
                        AuthTokens.basic("neo4j", "password"));
                     Session session = driver.session()) {
                    
                    // Створюємо вузли для країн, якщо вони ще не існують
                    session.run("MERGE (from:Country {name: $fromCountry})", 
                        org.neo4j.driver.Values.parameters("fromCountry", data.getFromCountry()));
                    session.run("MERGE (to:Country {name: $toCountry})", 
                        org.neo4j.driver.Values.parameters("toCountry", data.getToCountry()));
                    
                    // Створюємо зв'язок міграції
                    session.run(
                        "MATCH (from:Country {name: $fromCountry}), (to:Country {name: $toCountry}) " +
                        "CREATE (from)-[m:MIGRATES_TO { " +
                        "  year: $year, " +
                        "  count: $count, " +
                        "  reason: $reason, " +
                        "  ageGroup: $ageGroup, " +
                        "  gender: $gender " +
                        "}]->(to)",
                        org.neo4j.driver.Values.parameters(
                            "fromCountry", data.getFromCountry(),
                            "toCountry", data.getToCountry(),
                            "year", data.getYear(),
                            "count", data.getCount(),
                            "reason", data.getReason(),
                            "ageGroup", data.getAgeGroup(),
                            "gender", data.getGender()
                        )
                    );
                }
                return null;
            }
        });

        // Відправляємо оброблені дані в Kafka
        processedStream.map(new MapFunction<MigrationData, String>() {
            @Override
            public String map(MigrationData value) throws Exception {
                return objectMapper.writeValueAsString(value);
            }
        }).addSink(kafkaProducer);

        // Запускаємо job
        env.execute("Migration Processor");
    }
} 