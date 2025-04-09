from pyflink.datastream import StreamExecutionEnvironment
from pyflink.common.typeinfo import Types
from pyflink.datastream.connectors import FlinkKafkaConsumer
from pyflink.common.serialization import SimpleStringSchema
from typing import Dict, Any
import json
import pandas as pd
from ..utils.neo4j_client import Neo4jClient
from .migration_model import MigrationPatternModel
import logging
from datetime import datetime

# Налаштування логування
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
        self.neo4j_client = Neo4jClient()
        self.model = MigrationPatternModel()
        self.model.load_model()  # Завантаження навченої моделі
        self.env = StreamExecutionEnvironment.get_execution_environment()
        logging.info("Ініціалізація процесора міграцій завершена")

    def process_migration(self, migration_data: str) -> Dict[str, Any]:
        """Обробка одного запису міграції"""
        try:
            migration = json.loads(migration_data)
            
            # Створення DataFrame для прогнозування
            df = pd.DataFrame([migration])
            
            # Отримання прогнозу від моделі
            predictions = self.model.predict(df)
            migration['predicted_reasons'] = predictions[0]
            
            # Додавання метаданих
            migration['processed_at'] = datetime.now().isoformat()
            migration['model_version'] = '1.0'
            
            logging.info(f"Оброблено міграцію {migration['id']}")
            logging.info(f"Прогнозовані причини: {predictions[0]}")
            
            return migration
        except Exception as e:
            logging.error(f"Помилка обробки міграції: {str(e)}", exc_info=True)
            return None

    def create_kafka_source(self, topic: str, bootstrap_servers: str):
        """Створення джерела даних з Kafka"""
        return FlinkKafkaConsumer(
            topic,
            SimpleStringSchema(),
            properties={
                "bootstrap.servers": bootstrap_servers,
                "group.id": "migration_processor",
                "auto.offset.reset": "latest"
            }
        )

    def run(self, kafka_topic: str, bootstrap_servers: str):
        """Запуск обробки потоку даних"""
        try:
            logging.info("Налаштування джерела даних...")
            source = self.create_kafka_source(kafka_topic, bootstrap_servers)
            
            logging.info("Додавання джерела до середовища виконання...")
            stream = self.env.add_source(source)
            
            logging.info("Налаштування обробки потоку...")
            processed_stream = stream.map(
                self.process_migration,
                output_type=Types.STRING()
            )
            
            logging.info("Налаштування стоку даних...")
            processed_stream.add_sink(self.neo4j_client.save_migration)
            
            logging.info("Запуск обробки...")
            self.env.execute("Migration Stream Processing")
            
        except Exception as e:
            logging.error(f"Помилка при запуску обробки: {str(e)}", exc_info=True)
            raise

def main():
    processor = MigrationStreamProcessor()
    processor.run(
        kafka_topic="migrations",
        bootstrap_servers="localhost:9092"
    )

if __name__ == "__main__":
    main() 