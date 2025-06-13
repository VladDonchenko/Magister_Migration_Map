import sys
import os
from pathlib import Path

# Добавляем путь к корню проекта
project_root = str(Path(__file__).parent)
sys.path.append(project_root)

from src.services.flink_job import MigrationStreamProcessor
from src.utils.neo4j_client import Neo4jClient
import logging
from datetime import datetime

# Настройка логирования
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler(f'logs/flink_{datetime.now().strftime("%Y%m%d_%H%M%S")}.log'),
        logging.StreamHandler()
    ]
)

def main():
    try:
        logging.info("Запуск Flink job...")
        processor = MigrationStreamProcessor()
        processor.run(
            kafka_topic="migrations",
            bootstrap_servers="kafka:29092"
        )
    except Exception as e:
        logging.error(f"Ошибка при запуске Flink job: {str(e)}", exc_info=True)
        raise

if __name__ == "__main__":
    main() 