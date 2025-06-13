import pandas as pd
from neo4j import GraphDatabase
import os
from tqdm import tqdm

class Neo4jImporter:
    def __init__(self, uri="bolt://localhost:7687", user="neo4j", password="password"):
        self.driver = GraphDatabase.driver(uri, auth=(user, password))

    def close(self):
        self.driver.close()

    def import_migrations(self, parquet_file):
        # Читаємо Parquet файл
        df = pd.read_parquet(parquet_file)
        
        with self.driver.session() as session:
            # Створюємо індекси для оптимізації
            session.run("CREATE INDEX city_name IF NOT EXISTS FOR (c:City) ON (c.name)")
            session.run("CREATE INDEX migration_id IF NOT EXISTS FOR (m:Migration) ON (m.id)")
            
            # Імпортуємо дані батчами
            batch_size = 1000
            for i in tqdm(range(0, len(df), batch_size)):
                batch = df.iloc[i:i+batch_size]
                
                # Створюємо запити для кожного запису в батчі
                for _, row in batch.iterrows():
                    # Створюємо міста, якщо вони ще не існують
                    session.run("""
                        MERGE (from:City {name: $from_city_name})
                        SET from.latitude = $from_lat,
                            from.longitude = $from_lng,
                            from.population = $from_pop
                        
                        MERGE (to:City {name: $to_city_name})
                        SET to.latitude = $to_lat,
                            to.longitude = $to_lng,
                            to.population = $to_pop
                        
                        CREATE (m:Migration {
                            id: $id,
                            person_name: $person_name,
                            gender: $gender,
                            age: $age,
                            migration_date: $migration_date,
                            reason: $reason,
                            distance_km: $distance_km
                        })
                        
                        CREATE (from)-[:MIGRATED_TO {date: $migration_date}]->(to)
                        CREATE (m)-[:FROM]->(from)
                        CREATE (m)-[:TO]->(to)
                    """, {
                        'from_city_name': row['from_city']['name'],
                        'from_lat': row['from_city']['lat'],
                        'from_lng': row['from_city']['lng'],
                        'from_pop': row['from_city']['population'],
                        'to_city_name': row['to_city']['name'],
                        'to_lat': row['to_city']['lat'],
                        'to_lng': row['to_city']['lng'],
                        'to_pop': row['to_city']['population'],
                        'id': row['id'],
                        'person_name': row['person_name'],
                        'gender': row['gender'],
                        'age': row['age'],
                        'migration_date': row['migration_date'],
                        'reason': row['reason'],
                        'distance_km': row['distance_km']
                    })

def main():
    importer = Neo4jImporter()
    try:
        print("Починаємо імпорт даних в Neo4j...")
        importer.import_migrations("data/raw/migrations.parquet")
        print("Імпорт завершено успішно!")
    finally:
        importer.close()

if __name__ == "__main__":
    main() 