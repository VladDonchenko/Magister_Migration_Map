from neo4j import GraphDatabase
import os
from dotenv import load_dotenv

# Загрузка переменных окружения
load_dotenv()

# Подключение к Neo4j
uri = os.getenv("NEO4J_URI", "bolt://localhost:7687")
user = os.getenv("NEO4J_USER", "neo4j")
password = os.getenv("NEO4J_PASSWORD", "password")

driver = GraphDatabase.driver(uri, auth=(user, password))

def test_queries():
    with driver.session() as session:
        # Тест 1: Подсчет общего количества городов
        result = session.run("MATCH (c:City) RETURN count(c) as city_count")
        city_count = result.single()["city_count"]
        print(f"\n1. Общее количество городов: {city_count}")

        # Тест 2: Подсчет общего количества миграций
        result = session.run("MATCH (m:Migration) RETURN count(m) as migration_count")
        migration_count = result.single()["migration_count"]
        print(f"2. Общее количество миграций: {migration_count}")

        # Тест 3: Топ-5 городов по количеству выезжающих
        result = session.run("""
            MATCH (c:City)<-[:MIGRATION_FROM]-(m:Migration)
            RETURN c.name as city, count(m) as outgoing_count
            ORDER BY outgoing_count DESC
            LIMIT 5
        """)
        print("\n3. Топ-5 городов по количеству выезжающих:")
        for record in result:
            print(f"   {record['city']}: {record['outgoing_count']} миграций")

        # Тест 4: Топ-5 городов по количеству приезжающих
        result = session.run("""
            MATCH (c:City)<-[:MIGRATION_TO]-(m:Migration)
            RETURN c.name as city, count(m) as incoming_count
            ORDER BY incoming_count DESC
            LIMIT 5
        """)
        print("\n4. Топ-5 городов по количеству приезжающих:")
        for record in result:
            print(f"   {record['city']}: {record['incoming_count']} миграций")

        # Тест 5: Распределение причин миграции
        result = session.run("""
            MATCH (m:Migration)
            RETURN m.reason as reason, count(m) as count
            ORDER BY count DESC
        """)
        print("\n5. Распределение причин миграции:")
        for record in result:
            print(f"   {record['reason']}: {record['count']} случаев")

if __name__ == "__main__":
    print("Запуск тестовых запросов...")
    test_queries()
    print("\nТесты завершены")
    driver.close() 