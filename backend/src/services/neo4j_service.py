import os
import logging
from typing import List, Dict, Any
from neo4j import GraphDatabase
from neo4j.exceptions import ServiceUnavailable
from fastapi import HTTPException
import random

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

class Neo4jService:
    def __init__(self):
        self.uri = os.getenv("NEO4J_URI", "bolt://neo4j:7687")
        self.user = os.getenv("NEO4J_USER", "neo4j")
        self.password = os.getenv("NEO4J_PASSWORD", "test")
        self.auth_enabled = os.getenv("NEO4J_AUTH_ENABLED", "true").lower() == "true"
        
        logger.info(f"Підключення до Neo4j з параметрами:")
        logger.info(f"URI: {self.uri}")
        logger.info(f"Auth enabled: {self.auth_enabled}")
        if self.auth_enabled:
            logger.info(f"User: {self.user}")
        
        try:
            logger.info("Створюємо драйвер Neo4j...")
            if self.auth_enabled:
                self.driver = GraphDatabase.driver(
                    self.uri,
                    auth=(self.user, self.password),
                    max_connection_lifetime=3600,
                    connection_timeout=30
                )
            else:
                self.driver = GraphDatabase.driver(
                    self.uri,
                    max_connection_lifetime=3600,
                    connection_timeout=30
                )
            logger.info("Драйвер Neo4j створено")
            
            # Test connection
            logger.info("Тестуємо підключення до Neo4j...")
            with self.driver.session() as session:
                logger.info("Сесія створена, виконуємо тестовий запит...")
                result = session.run("RETURN 1 as test")
                logger.info("Тестовий запит виконано")
                test_value = result.single()["test"]
                logger.info(f"Тестове значення: {test_value}")
                
                # Test migration data
                logger.info("Перевіряємо дані міграції...")
                result = session.run("MATCH (from:City)-[r:MIGRATES_TO]->(to:City) RETURN count(r) as count")
                count = result.single()["count"]
                logger.info(f"Знайдено {count} зв'язків міграції в Neo4j")
        except Exception as e:
            logger.error(f"Помилка підключення до Neo4j: {str(e)}")
            raise HTTPException(status_code=503, detail=f"Database connection failed: {str(e)}")
    
    def close(self):
        if self.driver:
            logger.info("Закриваємо підключення до Neo4j...")
            self.driver.close()
            logger.info("Підключення до Neo4j закрито")
    
    def execute_query(self, query: str, params: Dict[str, Any] = None) -> List[Dict[str, Any]]:
        """Виконання запиту до Neo4j"""
        try:
            logger.info("===================================")
            logger.info("ВИКОНАННЯ ЗАПИТУ ДО NEO4J")
            logger.info(f"Запит: {query}")
            logger.info(f"Параметри: {params}")
            logger.info("-----------------------------------")
            
            with self.driver.session() as session:
                logger.info("Сесія створена, виконуємо запит...")
                result = session.run(query, params or {})
                logger.info("Запит виконано, отримуємо результати...")
                
                records = []
                for record in result:
                    logger.info(f"Обробка запису: {record}")
                    record_dict = {}
                    for key in record.keys():
                        value = record[key]
                        logger.info(f"Обробка поля {key}: {value} (тип: {type(value)})")
                        record_dict[key] = value
                    logger.info(f"Преобразованная запись: {record_dict}")
                    records.append(record_dict)
                
                logger.info("-----------------------------------")
                logger.info(f"Всего обработано записей: {len(records)}")
                if records:
                    logger.info("Первая запись для примера:")
                    logger.info(records[0])
                logger.info("===================================")
                
                return records
        except Exception as e:
            logger.error(f"Помилка виконання запиту: {str(e)}")
            raise HTTPException(status_code=500, detail=f"Database query failed: {str(e)}")

    def get_migration_map_data(self) -> Dict[str, Any]:
        """Отримання даних для карти міграції"""
        try:
            logger.info("=== DEBUG: Виконується get_migration_map_data з актуального коду ===")
            # Отримуємо всі міста
            cities_query = """
            MATCH (c:City)
            RETURN c.name as name, c.latitude as latitude, c.longitude as longitude
            """
            cities = self.execute_query(cities_query)
            logger.info(f"Отримано міст: {len(cities)}")

            # Отримуємо всі міграції
            migrations_query = """
            MATCH (from:City)<-[:MIGRATES_FROM]-(p:Person)-[:MIGRATES_TO]->(to:City)
            RETURN from.name as fromCity, to.name as toCity, count(*) as count
            """
            migrations = self.execute_query(migrations_query)
            logger.info(f"Отримано міграцій: {len(migrations)}")

            # Перетворюємо дані у формат, який очікує фронтенд
            nodes = []
            edges = []

            # Додаємо міста як nodes
            for city in cities:
                nodes.append({
                    'id': city['name'],
                    'name': city['name'],
                    'lat': city['latitude'],
                    'lon': city['longitude']
                })

            # Додаємо міграції як edges
            for migration in migrations:
                edges.append({
                    'source': migration['fromCity'],
                    'target': migration['toCity'],
                    'weight': migration['count']
                })

            logger.info(f"Сформовано nodes: {len(nodes)}, edges: {len(edges)}")
            logger.info(f"DEBUG_NODES_EDGES: nodes={nodes}, edges={edges}")
            return {
                "nodes": nodes,
                "edges": edges
            }
        except Exception as e:
            logger.error(f"Error getting migration map data: {str(e)}")
            raise HTTPException(status_code=500, detail=f"Failed to get migration data: {str(e)}")

    def clear_database(self):
        """Очищення бази даних"""
        try:
            query = "MATCH (n) DETACH DELETE n"
            self.execute_query(query)
            logger.info("База даних очищена")
        except Exception as e:
            logger.error(f"Помилка очищення бази даних: {str(e)}")
            raise HTTPException(status_code=500, detail=str(e))

    def create_city(self, name: str, population: int, region: str):
        """Створення міста"""
        try:
            query = """
            CREATE (c:City {
                name: $name,
                population: $population,
                region: $region,
                country: 'Україна',
                latitude: $latitude,
                longitude: $longitude
            })
            """
            # Тимчасові координати для міст (потім можна додати реальні)
            coordinates = {
                "Київ": (50.45466, 30.5238),
                "Харків": (49.98081, 36.25272),
                "Одеса": (46.47747, 30.73262),
                "Дніпро": (48.46664, 35.04066),
                "Львів": (49.83826, 24.02324),
                "Запоріжжя": (47.82289, 35.19031),
                "Кривий Ріг": (47.90966, 33.38044),
                "Миколаїв": (46.96591, 31.99740),
                "Маріуполь": (47.09514, 37.54131),
                "Вінниця": (49.23278, 28.48097)
            }
            
            lat, lon = coordinates.get(name, (0, 0))
            
            self.execute_query(query, {
                "name": name,
                "population": population,
                "region": region,
                "latitude": lat,
                "longitude": lon
            })
            logger.info(f"Створено місто: {name}")
        except Exception as e:
            logger.error(f"Помилка створення міста: {str(e)}")
            raise HTTPException(status_code=500, detail=str(e))

    def create_migration(self, from_city: str, to_city: str, person: dict, reason: str, transport_type: str, housing_type: str, migration_date: str):
        """Створення міграції"""
        try:
            # Додаємо випадкову стать
            gender = "Чоловік" if random.random() > 0.5 else "Жінка"
            
            # Формуємо повне ім'я
            full_name = f"{person['first_name']} {person['last_name']}"
            
            # Створюємо особу та зв'язки в одній транзакції
            query = """
            CREATE (p:Person {
                first_name: $first_name,
                last_name: $last_name,
                name: $name,
                age: $age,
                education: $education,
                profession: $profession,
                family_status: $family_status,
                gender: $gender
            })
            WITH p
            MATCH (from:City {name: $from_city})
            MATCH (to:City {name: $to_city})
            CREATE (p)-[r1:MIGRATES_FROM {
                reason: $reason,
                transport_type: $transport_type,
                housing_type: $housing_type,
                date: datetime($migration_date),
                distance_km: $distance_km
            }]->(from)
            CREATE (p)-[r2:MIGRATES_TO {
                reason: $reason,
                transport_type: $transport_type,
                housing_type: $housing_type,
                date: datetime($migration_date),
                distance_km: $distance_km
            }]->(to)
            """
            
            # Розраховуємо відстань між містами
            from_coords = self.execute_query(
                "MATCH (c:City {name: $name}) RETURN c.latitude as lat, c.longitude as lon",
                {"name": from_city}
            )[0]
            to_coords = self.execute_query(
                "MATCH (c:City {name: $name}) RETURN c.latitude as lat, c.longitude as lon",
                {"name": to_city}
            )[0]
            
            # Простий розрахунок відстані (можна замінити на більш точний)
            distance_km = int(((from_coords["lat"] - to_coords["lat"])**2 + 
                             (from_coords["lon"] - to_coords["lon"])**2)**0.5 * 111)

            # Виконуємо запит з усіма параметрами
            params = {
                "first_name": person["first_name"],
                "last_name": person["last_name"],
                "name": full_name,
                "age": person["age"],
                "education": person["education"],
                "profession": person["profession"],
                "family_status": person["family_status"],
                "gender": gender,
                "from_city": from_city,
                "to_city": to_city,
                "reason": reason,
                "transport_type": transport_type,
                "housing_type": housing_type,
                "migration_date": migration_date,
                "distance_km": distance_km
            }
            
            self.execute_query(query, params)
            logger.info(f"Створено міграцію для {full_name}")
            
        except Exception as e:
            logger.error(f"Помилка створення міграції: {str(e)}")
            raise HTTPException(status_code=500, detail=str(e))

    def get_city_stats(self, city_name: str) -> dict:
        """Отримати статистику міграції для міста"""
        logger.info("===================================")
        logger.info("ВИКОНАННЯ ЗАПИТУ ДО NEO4J")
        
        query = """
            MATCH (c:City {name: $city_name})
            OPTIONAL MATCH (p:Person)-[r:MIGRATES_TO]->(c)
            WITH c, count(r) as incoming
            OPTIONAL MATCH (p2:Person)-[r2:MIGRATES_FROM]->(c)
            RETURN {
                name: c.name,
                population: c.population,
                region: c.region,
                country: c.country,
                latitude: c.latitude,
                longitude: c.longitude,
                incoming_migrations: incoming,
                outgoing_migrations: count(r2)
            } as city
        """
        
        params = {"city_name": city_name}
        logger.info(f"Запит: {query}")
        logger.info(f"Параметри: {params}")
        logger.info("-----------------------------------")
        
        try:
            result = self.execute_query(query, params)
            if not result:
                return None
                
            city_data = result[0].get('city')
            if not city_data:
                return None
                
            return {
                "outgoingCount": city_data.get('outgoing_migrations', 0),
                "incomingCount": city_data.get('incoming_migrations', 0),
                "averageDistance": 0  # TODO: Додати розрахунок середньої відстані
            }
            
        except Exception as e:
            logger.error(f"Помилка при отриманні статистики міста {city_name}: {str(e)}")
            raise

    def get_cities(self) -> List[Dict[str, Any]]:
        """Отримання списку всіх міст"""
        try:
            query = """
            MATCH (c:City)
            RETURN 
                c.name as name,
                c.latitude as latitude,
                c.longitude as longitude,
                c.country as country,
                c.region as region,
                c.population as population
            """
            cities = self.execute_query(query)
            logger.info(f"Отримано список міст: {len(cities)}")
            return cities
        except Exception as e:
            logger.error(f"Помилка отримання списку міст: {str(e)}")
            raise HTTPException(status_code=500, detail=str(e))

    def get_city(self, city_name: str) -> Dict[str, Any]:
        """Отримання інформації про місто"""
        try:
            query = """
            MATCH (c:City {name: $city_name})
            OPTIONAL MATCH (p:Person)-[r:MIGRATES_TO]->(c)
            WITH c, count(r) as incoming
            OPTIONAL MATCH (p2:Person)-[r2:MIGRATES_FROM]->(c)
            RETURN {
                name: c.name,
                population: c.population,
                region: c.region,
                country: c.country,
                latitude: c.latitude,
                longitude: c.longitude,
                incoming_migrations: incoming,
                outgoing_migrations: count(r2)
            } as city
            """
            result = self.execute_query(query, {"city_name": city_name})
            if not result:
                raise ValueError(f"Місто {city_name} не знайдено")
            return result[0]["city"]
        except Exception as e:
            logger.error(f"Помилка отримання інформації про місто: {str(e)}")
            raise HTTPException(status_code=500, detail=str(e))
