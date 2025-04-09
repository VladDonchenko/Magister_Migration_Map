from typing import List, Dict, Any
from neo4j import GraphDatabase
import logging
import asyncio
from neo4j.exceptions import ServiceUnavailable

# Настройка логирования
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class Neo4jService:
    def __init__(self, uri: str = "bolt://localhost:7687", user: str = "neo4j", password: str = "password"):
        self.driver = GraphDatabase.driver(uri, auth=(user, password))
        logger.info(f"Подключение к Neo4j: {uri}")

    async def get_cities(self) -> List[Dict[str, Any]]:
        try:
            logger.info("Начало выполнения запроса get_cities")
            with self.driver.session() as session:
                result = session.run("""
                    MATCH (c:City)
                    RETURN {
                        id: id(c),
                        name: c.name,
                        region: c.region,
                        latitude: c.latitude,
                        longitude: c.longitude,
                        population: c.population
                    } as city
                    ORDER BY c.name
                """)
                cities = [record["city"] for record in result]
                logger.info(f"Получено {len(cities)} городов")
                return cities
        except Exception as e:
            logger.error(f"Ошибка при получении городов: {str(e)}")
            raise

    async def get_migration_flows(self) -> List[Dict[str, Any]]:
        with self.driver.session() as session:
            result = session.run("""
                MATCH (from:City)<-[r1:MIGRATED]-(p:Person)-[r2:MIGRATED]->(to:City)
                WITH from, to, count(*) as flow, collect(r1) as migrations
                RETURN {
                    fromCity: from.name,
                    toCity: to.name,
                    count: flow,
                    distance: migrations[0].distance_km
                } as flow
                ORDER BY flow.count DESC
                LIMIT 100
            """)
            return [record["flow"] for record in result]

    async def get_migration_stats(self) -> Dict[str, Any]:
        with self.driver.session() as session:
            result = session.run("""
                MATCH (p:Person)-[r:MIGRATED]->()
                WITH count(*) as totalMigrations,
                     avg(p.age) as averageAge,
                     count(CASE WHEN p.gender = 'Чоловіча' THEN 1 END) as maleCount,
                     count(CASE WHEN p.gender = 'Жіноча' THEN 1 END) as femaleCount
                RETURN {
                    totalMigrations: totalMigrations,
                    averageAge: averageAge,
                    maleCount: maleCount,
                    femaleCount: femaleCount
                } as stats
            """)
            return result.single()["stats"]

    async def get_city_stats(self, city_name: str) -> Dict[str, Any]:
        """Получение статистики по городу"""
        query = """
        MATCH (c:City {name: $city_name})
        OPTIONAL MATCH (p:Person)-[r:MIGRATED]->(c)
        WITH c,
             count(r) as incoming_migrations,
             avg(r.distance_km) as avg_distance,
             collect(DISTINCT r.reason) as reasons
        OPTIONAL MATCH (c)<-[r2:MIGRATED]-(p2:Person)
        WITH c, incoming_migrations, avg_distance, reasons,
             count(r2) as outgoing_migrations
        RETURN {
            city: c.name,
            region: c.region,
            population: c.population,
            incoming_migrations: incoming_migrations,
            outgoing_migrations: outgoing_migrations,
            avg_distance: round(avg_distance, 2),
            reasons: reasons
        } as stats
        """
        with self.driver.session() as session:
            result = session.run(query, city_name=city_name)
            record = result.single()
            return dict(record["stats"]) if record else {}

    async def get_general_stats(self) -> Dict[str, Any]:
        """Получение общей статистики миграции"""
        try:
            with self.driver.session() as session:
                query = """
                MATCH (c:City)
                WITH count(c) as total_cities
                MATCH (p:Person)-[r:MIGRATED]->()
                WITH total_cities,
                     count(DISTINCT p) as total_people,
                     count(r) as total_migrations,
                     avg(toFloat(r.distance_km)) as avg_distance,
                     collect(DISTINCT r.reason) as reasons
                RETURN {
                    total_cities: total_cities,
                    total_people: total_people,
                    total_migrations: total_migrations,
                    avg_distance: avg_distance,
                    reasons: reasons
                } as stats
                """
                result = session.run(query)
                record = result.single()
                return record["stats"] if record else {}
        except Exception as e:
            logger.error(f"Ошибка при получении общей статистики: {str(e)}")
            raise

    def close(self):
        self.driver.close() 