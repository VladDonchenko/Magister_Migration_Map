import random
from datetime import datetime, timedelta
import json
from typing import List, Dict
from geopy.distance import geodesic
import pandas as pd
import numpy as np
from concurrent.futures import ThreadPoolExecutor
import os
from neo4j import GraphDatabase
import logging
from kafka import KafkaProducer
import time

class BigDataGenerator:
    def __init__(self):
        self.cities = [
            {"name": "Київ", "lat": 50.4501, "lng": 30.5234, "population": 2967000},
            {"name": "Харків", "lat": 49.9935, "lng": 36.2304, "population": 1441000},
            {"name": "Одеса", "lat": 46.4825, "lng": 30.7233, "population": 1017000},
            {"name": "Дніпро", "lat": 48.4647, "lng": 35.0462, "population": 990000},
            {"name": "Донецьк", "lat": 48.0159, "lng": 37.8028, "population": 905000},
            {"name": "Запоріжжя", "lat": 47.8388, "lng": 35.1396, "population": 722000},
            {"name": "Львів", "lat": 49.8397, "lng": 24.0297, "population": 721000},
            {"name": "Суми", "lat": 50.9077, "lng": 34.7981, "population": 259000},
            {"name": "Полтава", "lat": 49.5883, "lng": 34.5514, "population": 288000},
            {"name": "Вінниця", "lat": 49.2331, "lng": 28.4682, "population": 370000}
        ]
        
        self.reasons = [
            "Робота",
            "Навчання",
            "Сімейні обставини",
            "Покращення житлових умов",
            "Бізнес",
            "Відновлення після війни",
            "Екологічні причини",
            "Особисті причини"
        ]

        # Ваги для різних причин міграції
        self.reason_weights = {
            "Робота": 0.3,
            "Навчання": 0.2,
            "Сімейні обставини": 0.15,
            "Покращення житлових умов": 0.15,
            "Бізнес": 0.1,
            "Відновлення після війни": 0.05,
            "Екологічні причини": 0.03,
            "Особисті причини": 0.02
        }
        
        # Подключение к Neo4j
        self.driver = GraphDatabase.driver("neo4j://localhost:7687", auth=("neo4j", "password"))
        
        # Подключение к Kafka
        self.kafka_producer = KafkaProducer(
            bootstrap_servers='localhost:9092',
            value_serializer=lambda v: json.dumps(v).encode('utf-8')
        )

    def close(self):
        """Закрытие соединений"""
        if self.driver:
            self.driver.close()
        if self.kafka_producer:
            self.kafka_producer.close()

    def init_neo4j_schema(self):
        """Инициализация схемы данных в Neo4j"""
        with self.driver.session() as session:
            # Создаем узлы для городов
            for city in self.cities:
                session.run("""
                    MERGE (c:City {name: $name})
                    SET c.latitude = $lat,
                        c.longitude = $lng,
                        c.population = $population
                """, city)
            
            # Создаем узлы для причин миграции
            for reason in self.reasons:
                session.run("""
                    MERGE (r:Reason {name: $reason})
                """, {"reason": reason})

    def stream_to_kafka(self, records_per_second: int = 10, total_records: int = None):
        """Потоковая отправка данных в Kafka"""
        print(f"Начинаем потоковую отправку данных в Kafka ({records_per_second} записей в секунду)...")
        records_sent = 0
        
        try:
            while True:
                if total_records and records_sent >= total_records:
                    break
                    
                migration = self.generate_migration(random.choice(self.cities)["population"])
                self.kafka_producer.send('migrations', value=migration)
                records_sent += 1
                
                if records_sent % 100 == 0:
                    print(f"Отправлено записей: {records_sent}")
                
                time.sleep(1.0 / records_per_second)
                
        except KeyboardInterrupt:
            print("\nОстановка отправки данных...")
        finally:
            print(f"Всего отправлено записей: {records_sent}")

    def save_to_neo4j(self, migrations: List[Dict]):
        """Сохранение данных в Neo4j"""
        print("Сохранение данных в Neo4j...")
        
        # Инициализируем схему
        self.init_neo4j_schema()
        
        # Сохраняем данные батчами
        batch_size = 1000
        total_batches = len(migrations) // batch_size + (1 if len(migrations) % batch_size > 0 else 0)
        
        with self.driver.session() as session:
            for i in range(0, len(migrations), batch_size):
                batch = migrations[i:i+batch_size]
                
                # Создаем узлы Person и отношения
                for migration in batch:
                    session.run("""
                        MERGE (p:Person {id: $id})
                        SET p.name = $person_name,
                            p.gender = $gender,
                            p.age = $age
                        
                        WITH p
                        MATCH (from_city:City {name: $from_city})
                        MATCH (to_city:City {name: $to_city})
                        MATCH (reason:Reason {name: $reason})
                        
                        CREATE (p)-[:MIGRATED {
                            date: date($migration_date),
                            distance_km: $distance_km
                        }]->(to_city)
                        
                        CREATE (p)-[:FROM]->(from_city)
                        CREATE (p)-[:FOR_REASON]->(reason)
                    """, migration)
                
                print(f"Прогресс: {min((i+batch_size)//batch_size, total_batches)}/{total_batches} батчей")
        
        print("Данные успешно сохранены в Neo4j")

    def generate_migration(self, city_population: int) -> Dict:
        """Генерація одного запису міграції з урахуванням населення міста"""
        from_city = random.choice(self.cities)
        to_city = random.choice([city for city in self.cities if city != from_city])
        
        # Генерація дати за останні 5 років
        days_ago = random.randint(0, 365 * 5)
        migration_date = datetime.now() - timedelta(days=days_ago)
        
        # Розрахунок відстані
        distance = geodesic(
            (from_city["lat"], from_city["lng"]),
            (to_city["lat"], to_city["lng"])
        ).kilometers

        # Генерація віку з нормальним розподілом
        age = int(np.random.normal(35, 15))
        age = max(18, min(70, age))  # Обмеження віку

        # Генерація причини з урахуванням ваг
        reason = random.choices(
            list(self.reason_weights.keys()),
            weights=list(self.reason_weights.values())
        )[0]

        return {
            "id": f"mig_{random.randint(1000000, 9999999)}",
            "person_name": f"Person_{random.randint(1, 1000000)}",
            "gender": random.choice(["Чоловік", "Жінка"]),
            "age": age,
            "migration_date": migration_date.strftime("%Y-%m-%d"),
            "from_city": from_city["name"],
            "to_city": to_city["name"],
            "reason": reason,
            "distance_km": round(distance, 2)
        }

    def generate_batch(self, batch_size: int) -> List[Dict]:
        """Генерація партії даних"""
        return [self.generate_migration(random.choice(self.cities)["population"]) for _ in range(batch_size)]

    def generate_large_dataset(self, total_records: int = 1000000, batch_size: int = 10000, save_to_neo4j: bool = True):
        """Генерація великого набору даних з використанням багатопотоковості"""
        os.makedirs('data', exist_ok=True)
        
        batches = []
        num_batches = total_records // batch_size
        
        print(f"Генерация {total_records} записей...")
        with ThreadPoolExecutor(max_workers=4) as executor:
            futures = [executor.submit(self.generate_batch, batch_size) for _ in range(num_batches)]
            for i, future in enumerate(futures):
                batch = future.result()
                batches.extend(batch)
                print(f"Прогресс: {(i+1)*batch_size}/{total_records} записей")
        
        # Сохраняем данные в разных форматах
        df = pd.DataFrame(batches)
        
        # Сохранение в CSV
        csv_path = 'data/migrations.csv'
        df.to_csv(csv_path, index=False, encoding='utf-8')
        print(f"Данные сохранены в CSV: {csv_path}")
        
        # Сохранение в JSON
        json_path = 'data/migrations.json'
        with open(json_path, 'w', encoding='utf-8') as f:
            json.dump(batches, f, ensure_ascii=False, indent=2)
        print(f"Данные сохранены в JSON: {json_path}")
        
        # Сохранение в Neo4j
        if save_to_neo4j:
            self.save_to_neo4j(batches)
        
        return batches

def main():
    generator = BigDataGenerator()
    try:
        # Запускаем потоковую отправку данных в Kafka
        print("Запуск потоковой отправки данных...")
        generator.stream_to_kafka(records_per_second=5, total_records=100)
    finally:
        generator.close()

if __name__ == "__main__":
    main() 