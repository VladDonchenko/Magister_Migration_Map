package org.migration;

import org.apache.flink.api.common.functions.RuntimeContext;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.functions.sink.RichSinkFunction;
import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Session;
import org.neo4j.driver.Transaction;
import org.neo4j.driver.TransactionWork;

import java.util.Map;
import java.util.HashMap;

public class Neo4jSink extends RichSinkFunction<MigrationData> {
    private final String uri;
    private final String username;
    private final String password;
    private transient Driver driver;

    public Neo4jSink(String uri, String username, String password) {
        this.uri = uri;
        this.username = username;
        this.password = password;
    }

    @Override
    public void open(Configuration parameters) throws Exception {
        driver = GraphDatabase.driver(uri, AuthTokens.basic(username, password));
    }

    @Override
    public void invoke(MigrationData value, Context context) throws Exception {
        try (Session session = driver.session()) {
            session.writeTransaction(new TransactionWork<Void>() {
                @Override
                public Void execute(Transaction tx) {
                    // Создаем узлы для человека
                    String createPersonQuery = "MERGE (p:Person {first_name: $first_name, last_name: $last_name}) " +
                            "SET p.age = $age, p.gender = $gender, p.education = $education, " +
                            "p.profession = $profession, p.family_status = $family_status";
                    
                    Map<String, Object> personParams = new HashMap<>();
                    personParams.put("first_name", value.getFirstName());
                    personParams.put("last_name", value.getLastName());
                    personParams.put("age", value.getAge());
                    personParams.put("gender", value.getGender());
                    personParams.put("education", value.getEducation());
                    personParams.put("profession", value.getProfession());
                    personParams.put("family_status", value.getFamilyStatus());
                    
                    tx.run(createPersonQuery, personParams);

                    // Создаем узлы для локаций
                    String createFromLocationQuery = "MERGE (from:Location {country: $from_country, region: $from_region, city: $from_city})";
                    Map<String, Object> fromLocationParams = new HashMap<>();
                    fromLocationParams.put("from_country", value.getFromCountry());
                    fromLocationParams.put("from_region", value.getFromRegion());
                    fromLocationParams.put("from_city", value.getFromCity());
                    tx.run(createFromLocationQuery, fromLocationParams);

                    String createToLocationQuery = "MERGE (to:Location {country: $to_country, region: $to_region, city: $to_city})";
                    Map<String, Object> toLocationParams = new HashMap<>();
                    toLocationParams.put("to_country", value.getToCountry());
                    toLocationParams.put("to_region", value.getToRegion());
                    toLocationParams.put("to_city", value.getToCity());
                    tx.run(createToLocationQuery, toLocationParams);

                    // Создаем связи миграции
                    String createMigrationQuery = "MATCH (p:Person {first_name: $first_name, last_name: $last_name}), " +
                            "(from:Location {country: $from_country, region: $from_region, city: $from_city}), " +
                            "(to:Location {country: $to_country, region: $to_region, city: $to_city}) " +
                            "MERGE (p)-[:MIGRATED_FROM {date: $date, reason: $reason, duration: $duration, type: $type}]->(from) " +
                            "MERGE (p)-[:MIGRATED_TO {date: $date, reason: $reason, duration: $duration, type: $type}]->(to)";
                    
                    Map<String, Object> migrationParams = new HashMap<>();
                    migrationParams.put("first_name", value.getFirstName());
                    migrationParams.put("last_name", value.getLastName());
                    migrationParams.put("from_country", value.getFromCountry());
                    migrationParams.put("from_region", value.getFromRegion());
                    migrationParams.put("from_city", value.getFromCity());
                    migrationParams.put("to_country", value.getToCountry());
                    migrationParams.put("to_region", value.getToRegion());
                    migrationParams.put("to_city", value.getToCity());
                    migrationParams.put("date", value.getDate());
                    migrationParams.put("reason", value.getReason());
                    migrationParams.put("duration", value.getDuration());
                    migrationParams.put("type", value.getMigrationType());
                    
                    tx.run(createMigrationQuery, migrationParams);
                    return null;
                }
            });
        }
    }

    @Override
    public void close() throws Exception {
        if (driver != null) {
            driver.close();
        }
    }
} 