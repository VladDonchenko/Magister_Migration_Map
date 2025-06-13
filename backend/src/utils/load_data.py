import os
from src.utils.big_data_generator import BigDataGenerator
from src.services.neo4j_service import Neo4jService

def load_data_to_neo4j():
    # Створюємо генератор даних
    generator = BigDataGenerator()
    
    # Створюємо Neo4j сервіс
    neo4j_service = Neo4jService()
    
    try:
        # Генеруємо дані
        print("Генерація даних...")
        migrations = generator.generate_large_dataset(total_records=1000, batch_size=100)
        
        # Завантажуємо міста
        print("Завантаження міст...")
        for city in generator.cities:
            query = """
            MERGE (c:City {name: $name})
            SET c.latitude = $latitude,
                c.longitude = $longitude,
                c.population = $population
            """
            neo4j_service._execute_query(query, {
                "name": city["name"],
                "latitude": city["lat"],
                "longitude": city["lng"],
                "population": city["population"]
            })
        
        # Завантажуємо міграції
        print("Завантаження міграцій...")
        for migration in migrations:
            query = """
            MATCH (from:City {name: $from_city})
            MATCH (to:City {name: $to_city})
            MERGE (from)-[r:MIGRATES_TO]->(to)
            SET r.count = $count,
                r.reasons = $reasons,
                r.year = $year
            """
            neo4j_service._execute_query(query, {
                "from_city": migration["from_city"],
                "to_city": migration["to_city"],
                "count": migration["count"],
                "reasons": migration["reasons"],
                "year": migration["year"]
            })
        
        print("Дані успішно завантажено в Neo4j")
    
    finally:
        neo4j_service.close()

if __name__ == "__main__":
    load_data_to_neo4j() 