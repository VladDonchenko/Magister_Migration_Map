import sys
import os
from pathlib import Path

# Добавляем путь к корню проекта
project_root = str(Path(__file__).parent.parent.parent)
sys.path.append(project_root)

from pyflink.datastream import StreamExecutionEnvironment
from pyflink.common.typeinfo import Types
from pyflink.datastream.connectors import FlinkKafkaConsumer
from pyflink.common.serialization import SimpleStringSchema
from typing import Dict, Any
import json
import pandas as pd
from src.utils.neo4j_client import Neo4jClient
from src.services.migration_model import MigrationPatternModel
import logging
from datetime import datetime
import os
from dotenv import load_dotenv

# Загрузка переменных окружения
load_dotenv()

# Настройка логурования
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler(f'logs/flink_{datetime.now().strftime("%Y%m%d_%H%M%S")}.log'),
        logging.StreamHandler()
    ]
)

class MigrationStreamProcessor:
    def __init__(self):
        self.neo4j_client = Neo4jClient(
            os.getenv("NEO4J_URI", "bolt://localhost:7687"),
            os.getenv("NEO4J_USER", "neo4j"),
            os.getenv("NEO4J_PASSWORD", "password")
        )
        self.model = MigrationPatternModel()
        self.model.load_model()  # Загрузка обученной модели
        self.env = StreamExecutionEnvironment.get_execution_environment()
        
        logging.info("Инициализация процессора миграций завершена")

    def process_migration(self, migration_data: str) -> Dict[str, Any]:
        """Обработка одного записи миграции"""
        try:
            migration = json.loads(migration_data)
            
            # Создание DataFrame для прогнозирования
            df = pd.DataFrame([migration])
            
            # Получение прогноза от модели
            predictions = self.model.predict(df)
            migration['predicted_reasons'] = predictions[0]
            
            # Сохранение в Neo4j
            self.neo4j_client.save_migration(migration)
            
            return migration
        except Exception as e:
            logging.error(f"Ошибка при обработке миграции: {str(e)}")
            return None

    def create_kafka_source(self, topic: str, bootstrap_servers: str):
        """Создание источника данных из Kafka"""
        properties = {
            'bootstrap.servers': bootstrap_servers,
            'group.id': 'migration_processor',
            'auto.offset.reset': 'earliest'
        }
        
        return FlinkKafkaConsumer(
            topic,
            SimpleStringSchema(),
            properties
        )

    def run(self, kafka_topic: str = "migration_data", bootstrap_servers: str = "localhost:9092"):
        """Запуск обработки потока данных"""
        try:
            # Создание источника данных
            kafka_source = self.create_kafka_source(kafka_topic, bootstrap_servers)
            
            # Добавление источника в окружение
            stream = self.env.add_source(kafka_source)
            
            # Обработка данных
            processed_stream = stream.map(
                self.process_migration,
                output_type=Types.PICKLED_BYTE_ARRAY()
            )
            
            # Запуск job
            self.env.execute("Migration Stream Processing")
            
        except Exception as e:
            logging.error(f"Ошибка при запуске обработки: {str(e)}")
            raise

def main():
    processor = MigrationStreamProcessor()
    processor.run()

if __name__ == "__main__":
    main() 