from neo4j import AsyncGraphDatabase
from typing import List, Dict, Any
import os

# Отримуємо параметри підключення з змінних середовища
NEO4J_URI = os.getenv("NEO4J_URI", "bolt://neo4j:7687")
NEO4J_USER = os.getenv("NEO4J_USER", "neo4j")
NEO4J_PASSWORD = os.getenv("NEO4J_PASSWORD", "password")

# Створюємо драйвер для підключення до Neo4j
driver = AsyncGraphDatabase.driver(NEO4J_URI, auth=(NEO4J_USER, NEO4J_PASSWORD))

async def execute_queries(queries: List[str]) -> List[List[Dict[str, Any]]]:
    """Виконує список Cypher запитів та повертає результати"""
    results = []
    
    async with driver.session() as session:
        for query in queries:
            result = await session.run(query)
            records = await result.data()
            results.append(records)
    
    return results

async def close():
    """Закриває з'єднання з базою даних"""
    await driver.close() 