import random
from datetime import datetime, timedelta
import json
from typing import List, Dict
from geopy.distance import geodesic
import pandas as pd
import numpy as np
from concurrent.futures import ThreadPoolExecutor
import os

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

    def generate_migration(self, city_population: int) -> Dict:
        """Генерація одного запису міграції з урахуванням населення міста"""
        from_city = random.choice(self.cities)
        to_city = random.choice([city for city in self.cities if city != from_city])
        
        # Генерація дати за останні 3 місяці
        days_ago = random.randint(0, 90)
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
            "from_city": from_city,
            "to_city": to_city,
            "reason": reason,
            "distance_km": round(distance, 2),
            "additional_info": f"Додаткова інформація для міграції {random.randint(1, 1000)}"
        }

    def generate_batch(self, batch_size: int) -> List[Dict]:
        """Генерація партії даних"""
        return [self.generate_migration(city["population"]) for _ in range(batch_size)]

    def generate_large_dataset(self, total_records: int = 1000000, batch_size: int = 10000):
        """Генерація великого набору даних з використанням багатопотоковості"""
        batches = []
        num_batches = total_records // batch_size

        with ThreadPoolExecutor(max_workers=4) as executor:
            futures = [executor.submit(self.generate_batch, batch_size) for _ in range(num_batches)]
            for future in futures:
                batches.extend(future.result())

        return batches

    def save_to_files(self, migrations: List[Dict], output_dir: str = "data/raw"):
        """Збереження даних у різних форматах"""
        os.makedirs(output_dir, exist_ok=True)
        
        # Збереження в JSON
        with open(f"{output_dir}/migrations.json", 'w', encoding='utf-8') as f:
            json.dump(migrations, f, ensure_ascii=False, indent=2)
        
        # Збереження в CSV
        df = pd.DataFrame(migrations)
        df.to_csv(f"{output_dir}/migrations.csv", index=False, encoding='utf-8')
        
        # Збереження в Parquet (оптимізований формат для Big Data)
        df.to_parquet(f"{output_dir}/migrations.parquet")

def main():
    generator = BigDataGenerator()
    print("Генерація даних...")
    migrations = generator.generate_large_dataset(1000000)  # 1 млн записів
    print(f"Згенеровано {len(migrations)} записів")
    
    print("Збереження даних...")
    generator.save_to_files(migrations)
    print("Готово!")

if __name__ == "__main__":
    main() 