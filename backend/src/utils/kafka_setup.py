from kafka import KafkaProducer, KafkaConsumer
import json
import pandas as pd
import time
from typing import Dict, Any
import os

class KafkaManager:
    def __init__(self, bootstrap_servers: str = "localhost:9092"):
        self.bootstrap_servers = bootstrap_servers
        self.producer = None
        self.consumer = None

    def setup_producer(self):
        """Налаштування Kafka Producer"""
        self.producer = KafkaProducer(
            bootstrap_servers=self.bootstrap_servers,
            value_serializer=lambda v: json.dumps(v).encode('utf-8'),
            acks='all'
        )

    def setup_consumer(self, topic: str, group_id: str):
        """Налаштування Kafka Consumer"""
        self.consumer = KafkaConsumer(
            topic,
            bootstrap_servers=self.bootstrap_servers,
            group_id=group_id,
            auto_offset_reset='earliest',
            value_deserializer=lambda x: json.loads(x.decode('utf-8'))
        )

    def send_migration(self, migration: Dict[str, Any]):
        """Відправка одного запису міграції"""
        if not self.producer:
            self.setup_producer()
        self.producer.send('migrations', value=migration)
        self.producer.flush()

    def load_data_from_parquet(self, file_path: str, batch_size: int = 1000):
        """Завантаження даних з Parquet файлу в Kafka"""
        print(f"Завантаження даних з {file_path}...")
        df = pd.read_parquet(file_path)
        
        total_records = len(df)
        for i in range(0, total_records, batch_size):
            batch = df.iloc[i:i+batch_size]
            for _, row in batch.iterrows():
                migration = row.to_dict()
                self.send_migration(migration)
            print(f"Оброблено {min(i+batch_size, total_records)}/{total_records} записів")
            time.sleep(0.1)  # Невелика затримка для контролю навантаження

    def close(self):
        """Закриття з'єднань"""
        if self.producer:
            self.producer.close()
        if self.consumer:
            self.consumer.close()

def main():
    kafka_manager = KafkaManager()
    try:
        kafka_manager.setup_producer()
        kafka_manager.load_data_from_parquet("data/raw/migrations.parquet")
    finally:
        kafka_manager.close()

if __name__ == "__main__":
    main() 