from pyflink.datastream import StreamExecutionEnvironment
from pyflink.table import StreamTableEnvironment, EnvironmentSettings
from pyflink.table.descriptors import Schema, Kafka, Json
from pyflink.table.udf import udf
import json
import numpy as np
from typing import Dict, List, Tuple

class MigrationProcessor:
    def __init__(self):
        self.env = StreamExecutionEnvironment.get_execution_environment()
        self.settings = EnvironmentSettings.new_instance().in_streaming_mode().build()
        self.t_env = StreamTableEnvironment.create(self.env, environment_settings=self.settings)
        
    def setup_kafka_source(self, topic: str, bootstrap_servers: str):
        """Настройка источника данных из Kafka"""
        self.t_env.connect(
            Kafka()
            .version("universal")
            .topic(topic)
            .start_from_earliest()
            .property("bootstrap.servers", bootstrap_servers)
        ).with_format(
            Json()
            .fail_on_missing_field(True)
        ).with_schema(
            Schema()
            .field("timestamp", "TIMESTAMP(3)")
            .field("from_city", "STRING")
            .field("to_city", "STRING")
            .field("migrant_data", "STRING")
        ).create_temporary_table("migration_source")

    @udf(input_types=[str], result_type=str)
    def process_migrant_data(self, data: str) -> str:
        """Обработка данных о мигранте"""
        migrant = json.loads(data)
        # Добавление дополнительной обработки данных
        return json.dumps(migrant)

    def process_migration_stream(self):
        """Основной метод обработки потока миграционных данных"""
        # Регистрация UDF
        self.t_env.register_function("process_migrant_data", self.process_migrant_data)
        
        # Создание таблицы для обработки
        self.t_env.sql_query("""
            SELECT 
                timestamp,
                from_city,
                to_city,
                process_migrant_data(migrant_data) as processed_data
            FROM migration_source
        """).execute_insert("migration_sink")

    def analyze_migration_patterns(self, window_size: str = "1 hour"):
        """Анализ паттернов миграции"""
        self.t_env.sql_query(f"""
            SELECT 
                window_start,
                window_end,
                from_city,
                to_city,
                COUNT(*) as migration_count,
                AVG(JSON_VALUE(processed_data, '$.age')) as avg_age,
                LISTAGG(DISTINCT JSON_VALUE(processed_data, '$.reason')) as reasons
            FROM TABLE(
                TUMBLE(TABLE migration_source, DESCRIPTOR(timestamp), INTERVAL '{window_size}')
            )
            GROUP BY window_start, window_end, from_city, to_city
        """).execute_insert("migration_patterns_sink")

    def start_processing(self):
        """Запуск обработки данных"""
        self.env.execute("Migration Data Processing") 