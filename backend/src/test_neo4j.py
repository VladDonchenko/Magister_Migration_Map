from neo4j import GraphDatabase
import logging

# Настройка логирования
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def test_connection():
    uri = "bolt://neo4j:7687"
    user = "neo4j"
    password = "password"
    
    try:
        driver = GraphDatabase.driver(uri, auth=(user, password))
        logger.info("Successfully connected to Neo4j")
        
        with driver.session() as session:
            query = """
            MATCH (p:Person)
            MATCH (p)-[:MIGRATED_TO]->(to:Location)
            MATCH (p)-[:MIGRATED_FROM]->(from:Location)
            WHERE from <> to
            RETURN from.country as from_country,
                   from.region as from_region,
                   from.city as from_city, 
                   from.latitude as from_latitude, 
                   from.longitude as from_longitude,
                   to.country as to_country,
                   to.region as to_region,
                   to.city as to_city,
                   to.latitude as to_latitude,
                   to.longitude as to_longitude,
                   count(*) as count
            """
            result = session.run(query)
            records = [dict(record) for record in result]
            logger.info(f"Query executed successfully, got {len(records)} records")
            logger.info(f"Records: {records}")
            
            # Создаем словарь для хранения уникальных городов
            cities = {}
            migrations = []
            
            for record in records:
                logger.info(f"Processing record: {record}")
                # Создаем объекты городов
                from_city = {
                    "name": record["from_city"],
                    "country": record.get("from_country", ""),
                    "region": record.get("from_region", ""),
                    "latitude": float(record["from_latitude"]),
                    "longitude": float(record["from_longitude"])
                }
                
                to_city = {
                    "name": record["to_city"],
                    "country": record.get("to_country", ""),
                    "region": record.get("to_region", ""),
                    "latitude": float(record["to_latitude"]),
                    "longitude": float(record["to_longitude"])
                }
                
                # Добавляем города в словарь
                cities[from_city["name"]] = from_city
                cities[to_city["name"]] = to_city
                
                # Создаем объект миграции
                migration = {
                    "fromCity": from_city["name"],
                    "toCity": to_city["name"],
                    "count": int(record["count"]),
                    "migrants": []  # Пока оставляем пустым, так как эта информация не требуется для карты
                }
                migrations.append(migration)
            
            logger.info(f"Processed {len(cities)} cities and {len(migrations)} migrations")
            result = {
                "cities": list(cities.values()),
                "migrations": migrations
            }
            logger.info(f"Final result: {result}")
            
    except Exception as e:
        logger.error(f"Error: {str(e)}")
        raise
    finally:
        if 'driver' in locals():
            driver.close()
            logger.info("Neo4j connection closed")

if __name__ == "__main__":
    test_connection() 