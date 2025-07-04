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
                "Вінниця": (49.23278, 28.48097),
                "Полтава": (49.58827, 34.55142),
                "Черкаси": (49.44443, 32.05977),
                "Хмельницький": (49.42161, 26.99653),
                "Чернівці": (48.29149, 25.94034),
                "Житомир": (50.26487, 28.67669),
                "Суми": (50.9216, 34.80029),
                "Рівне": (50.6199, 26.25162),
                "Івано-Франківськ": (48.9215, 24.70972),
                "Кам'янець-Подільський": (48.6845, 26.58559),
                "Біла Церква": (49.80939, 30.11209),
                "Кропивницький": (48.5132, 32.2597),
                "Тернопіль": (49.55352, 25.59477),
                "Луцьк": (50.75932, 25.34244),
                "Кременчук": (49.0685, 33.42041),
                "Мелитополь": (46.84888, 35.36533),
                "Нікополь": (47.57119, 34.39637),
                "Бердянськ": (46.76644, 36.79872),
                "Слов'янськ": (48.86667, 37.61667),
                "Ужгород": (48.61667, 22.3),
                "Алчевськ": (48.47731, 38.79608),
                "Павлоград": (48.53426, 35.87098),
                "Сєвєродонецьк": (48.94832, 38.49166),
                "Євпаторія": (45.20091, 33.36655),
                "Лисичанськ": (48.90485, 38.44207),
                "Кам'янське": (48.51134, 34.6021),
                "Херсон": (46.63542, 32.61687),
                "Чернігів": (51.50551, 31.28487),
                "Горлівка": (48.29167, 38.05)
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

    def get_city_stats(self, city_name: str) -> Dict[str, Any]:
        """Отримати статистику міграції для конкретного міста"""
        try:
            # Загальна статистика
            total_stats = self.execute_query("""
                MATCH (c:City {name: $city_name})
                OPTIONAL MATCH (p:Person)-[r:MIGRATES_FROM]->(c)
                WITH c, count(r) as outgoing_count
                OPTIONAL MATCH (p:Person)-[r:MIGRATES_TO]->(c)
                WITH c, outgoing_count, count(r) as incoming_count
                OPTIONAL MATCH (p:Person)-[r:MIGRATES_FROM|MIGRATES_TO]->(c)
                WITH c, outgoing_count, incoming_count, avg(r.distance_km) as avg_distance
                RETURN {
                    name: c.name,
                    population: c.population,
                    region: c.region,
                    country: c.country,
                    lat: c.lat,
                    lon: c.lon,
                    outgoingCount: outgoing_count,
                    incomingCount: incoming_count,
                    averageDistance: avg_distance
                } as stats
            """, {"city_name": city_name})

            if not total_stats:
                return None

            stats = total_stats[0]["stats"]

            # Статистика за статтю
            gender_stats = self.execute_query("""
                MATCH (p:Person)-[r:MIGRATES_FROM|MIGRATES_TO]->(c:City {name: $city_name})
                WITH p.gender as gender, count(*) as count
                RETURN gender, count
                ORDER BY count DESC
            """, {"city_name": city_name})

            # Статистика за типом житла
            housing_stats = self.execute_query("""
                MATCH (p:Person)-[r:MIGRATES_FROM|MIGRATES_TO]->(c:City {name: $city_name})
                WITH r.housing_type as type, count(*) as count
                RETURN type, count
                ORDER BY count DESC
            """, {"city_name": city_name})

            # Статистика за типом транспорту
            transport_stats = self.execute_query("""
                MATCH (p:Person)-[r:MIGRATES_FROM|MIGRATES_TO]->(c:City {name: $city_name})
                WITH r.transport_type as type, count(*) as count
                RETURN type, count
                ORDER BY count DESC
            """, {"city_name": city_name})

            # Статистика за сімейним станом
            family_status_stats = self.execute_query("""
                MATCH (p:Person)-[r:MIGRATES_FROM|MIGRATES_TO]->(c:City {name: $city_name})
                WITH p.family_status as status, count(*) as count
                RETURN status, count
                ORDER BY count DESC
            """, {"city_name": city_name})

            # Статистика за рівнем освіти
            education_stats = self.execute_query("""
                MATCH (p:Person)-[r:MIGRATES_FROM|MIGRATES_TO]->(c:City {name: $city_name})
                WITH p.education as level, count(*) as count
                RETURN level, count
                ORDER BY count DESC
            """, {"city_name": city_name})

            # Статистика за віком
            age_stats = self.execute_query("""
                MATCH (p:Person)-[r:MIGRATES_FROM|MIGRATES_TO]->(c:City {name: $city_name})
                WITH p.age as age, count(*) as count
                RETURN age, count
                ORDER BY age
            """, {"city_name": city_name})

            # Додаємо нові статистики до загальної статистики
            stats.update({
                "gender_stats": gender_stats,
                "housing_stats": housing_stats,
                "transport_stats": transport_stats,
                "family_status_stats": family_status_stats,
                "education_stats": education_stats,
                "age_stats": {str(stat["age"]): stat["count"] for stat in age_stats}
            })

            return stats

        except Exception as e:
            logger.error(f"Помилка при отриманні статистики міста: {str(e)}")
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

    def get_city_migrations(self, city_name: str) -> Dict:
        """Отримання інформації про міграції для конкретного міста"""
        try:
            # Отримуємо вхідні міграції
            incoming_query = """
            MATCH (from:City)<-[:MIGRATES_FROM]-(p:Person)-[:MIGRATES_TO]->(to:City {name: $city_name})
            RETURN from.name as source, count(*) as weight
            """
            incoming = self.execute_query(incoming_query, {"city_name": city_name})

            # Отримуємо вихідні міграції
            outgoing_query = """
            MATCH (from:City {name: $city_name})<-[:MIGRATES_FROM]-(p:Person)-[:MIGRATES_TO]->(to:City)
            RETURN to.name as target, count(*) as weight
            """
            outgoing = self.execute_query(outgoing_query, {"city_name": city_name})

            return {
                "incoming": incoming,
                "outgoing": outgoing
            }
        except Exception as e:
            logger.error(f"Помилка отримання міграцій: {str(e)}")
            raise HTTPException(status_code=500, detail=str(e))

    def get_city_migrants(self, city_name: str) -> Dict:
        """Отримання інформації про мігрантів для конкретного міста"""
        try:
            # Отримуємо вхідних мігрантів
            incoming_query = """
            MATCH (from:City)<-[r:MIGRATES_FROM]-(p:Person)-[:MIGRATES_TO]->(to:City {name: $city_name})
            RETURN 
                p.name as name,
                p.age as age,
                p.gender as gender,
                p.education as education,
                p.profession as profession,
                p.family_status as family_status,
                r.reason as reason,
                r.transport_type as transport_type,
                r.housing_type as housing_type,
                r.date as date,
                r.distance_km as distance_km,
                from.name as from_city
            ORDER BY r.date DESC
            """
            incoming = self.execute_query(incoming_query, {"city_name": city_name})

            # Отримуємо вихідних мігрантів
            outgoing_query = """
            MATCH (from:City {name: $city_name})<-[r:MIGRATES_FROM]-(p:Person)-[:MIGRATES_TO]->(to:City)
            RETURN 
                p.name as name,
                p.age as age,
                p.gender as gender,
                p.education as education,
                p.profession as profession,
                p.family_status as family_status,
                r.reason as reason,
                r.transport_type as transport_type,
                r.housing_type as housing_type,
                r.date as date,
                r.distance_km as distance_km,
                to.name as to_city
            ORDER BY r.date DESC
            """
            outgoing = self.execute_query(outgoing_query, {"city_name": city_name})

            return {
                "incoming": incoming,
                "outgoing": outgoing
            }
        except Exception as e:
            logger.error(f"Помилка отримання інформації про мігрантів: {str(e)}")
            raise HTTPException(status_code=500, detail=str(e))

    def get_migration_flow_details(self, from_city: str, to_city: str) -> Dict:
        """Отримання деталей міграційного потоку між містами"""
        try:
            # Перевірка існування міст
            cities_query = """
            MATCH (c:City)
            WHERE c.name IN [$from_city, $to_city]
            RETURN c.name as name
            """
            cities_result = self.execute_query(cities_query, {"from_city": from_city, "to_city": to_city})
            if len(cities_result) != 2:
                raise ValueError(f"Один або обидва міста не знайдено: {from_city}, {to_city}")

            # Коректний запит для міграцій
            details_query = """
            MATCH (from:City {name: $from_city})<-[:MIGRATES_FROM]-(p:Person)-[r:MIGRATES_TO]->(to:City {name: $to_city})
            WITH from, to, p, r
            RETURN {
                fromCity: from.name,
                toCity: to.name,
                totalCount: count(p),
                averageAge: avg(p.age),
                reasons: collect(DISTINCT r.reason),
                transportTypes: collect(DISTINCT r.transport_type),
                housingTypes: collect(DISTINCT r.housing_type),
                educationLevels: collect(DISTINCT p.education),
                familyStatuses: collect(DISTINCT p.family_status),
                migrants: collect({
                    id: p.id,
                    name: p.first_name + ' ' + p.last_name,
                    age: p.age,
                    gender: p.gender,
                    education: p.education,
                    profession: p.profession,
                    family_status: p.family_status,
                    reason: r.reason,
                    transport_type: r.transport_type,
                    housing_type: r.housing_type,
                    migration_date: r.date
                })
            } as details
            """
            result = self.execute_query(details_query, {"from_city": from_city, "to_city": to_city})
            if not result:
                return {
                    "fromCity": from_city,
                    "toCity": to_city,
                    "totalCount": 0,
                    "averageAge": 0,
                    "reasons": [],
                    "transportTypes": [],
                    "housingTypes": [],
                    "educationLevels": [],
                    "familyStatuses": [],
                    "migrants": []
                }
            return result[0]
        except Exception as e:
            logger.error(f"Помилка отримання деталей міграційного потоку: {str(e)}")
            raise HTTPException(status_code=500, detail=str(e))