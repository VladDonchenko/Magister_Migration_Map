"""Скрипт для заповнення бази даних Neo4j"""

import logging
from typing import List
from neo4j import GraphDatabase
from .generator import generate_migration_data, generate_cypher_queries

# Налаштування логування
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def execute_queries_in_batches(session, queries: List[str], batch_size: int = 10):
    """Виконує запити порціями"""
    for i in range(0, len(queries), batch_size):
        batch = queries[i:i + batch_size]
        for j, query in enumerate(batch, 1):
            try:
                session.run(query)
            except Exception as e:
                logger.error(f"Помилка при виконанні запиту {i + j}: {str(e)}")
                logger.error(f"Запит: {query}")
                raise
        logger.info(f"Виконано {min(i + batch_size, len(queries))} запитів з {len(queries)}")

def fill_database(uri: str = "bolt://localhost:7687", username: str = "neo4j", password: str = "password"):
    """Заповнює базу даних Neo4j згенерованими даними"""
    try:
        # Підключаємося до бази даних
        driver = GraphDatabase.driver(uri, auth=(username, password))
        logger.info("Підключено до бази даних Neo4j")
        
        # Генеруємо дані
        logger.info("Генеруємо дані...")
        cities, persons, migrations = generate_migration_data(num_migrations=10000)  # Збільшуємо кількість міграцій
        logger.info(f"Згенеровано {len(cities)} міст, {len(persons)} осіб та {len(migrations)} міграцій")
        
        # Генеруємо та виконуємо запити
        logger.info("Генеруємо Cypher-запити...")
        queries = generate_cypher_queries(cities, persons, migrations)
        logger.info(f"Згенеровано {len(queries)} запитів")
        
        # Виконуємо запити порціями
        logger.info("Виконуємо запити...")
        with driver.session() as session:
            # Спочатку видаляємо всі дані
            session.run("MATCH (n) DETACH DELETE n;")
            logger.info("Видалено всі існуючі дані")
            
            # Створюємо міста
            city_queries = [q for q in queries if "CREATE (c:City" in q]
            logger.info("Створюємо міста...")
            execute_queries_in_batches(session, city_queries)
            
            # Створюємо індекс
            session.run("CREATE INDEX city_name IF NOT EXISTS FOR (c:City) ON (c.name);")
            logger.info("Створено індекс для міст")
            
            # Створюємо осіб
            person_queries = [q for q in queries if "CREATE (p:Person" in q]
            logger.info("Створюємо осіб...")
            execute_queries_in_batches(session, person_queries)
            
            # Створюємо міграції
            migration_queries = [q for q in queries if "MATCH (p:Person" in q]
            logger.info("Створюємо міграції...")
            execute_queries_in_batches(session, migration_queries)
        
        logger.info("База даних успішно заповнена")
        
    except Exception as e:
        logger.error(f"Помилка при заповненні бази даних: {str(e)}")
        raise
    finally:
        if 'driver' in locals():
            driver.close()

if __name__ == "__main__":
    fill_database() 