from neo4j import GraphDatabase
import os
import json

class Neo4jChecker:
    def __init__(self):
        self.uri = "bolt://localhost:7687"
        self.user = "neo4j"
        self.password = "test"
        self.driver = GraphDatabase.driver(self.uri, auth=(self.user, self.password))

    def close(self):
        self.driver.close()

    def check_database(self):
        with self.driver.session() as session:
            # Перевірка кількості вузлів
            nodes_count = session.run("MATCH (n) RETURN count(n) as count").single()["count"]
            print(f"\nЗагальна кількість вузлів: {nodes_count}")

            # Перевірка кількості міст
            cities_count = session.run("MATCH (c:City) RETURN count(c) as count").single()["count"]
            print(f"\nКількість міст: {cities_count}")
            
            # Отримання списку міст
            cities = session.run("MATCH (c:City) RETURN c.name as name, c.population as population, c.region as region")
            print("\nСписок міст:")
            for city in cities:
                print(f"- {city['name']} (Населення: {city['population']}, Регіон: {city['region']})")

            # Перевірка кількості людей
            persons_count = session.run("MATCH (p:Person) RETURN count(p) as count").single()["count"]
            print(f"\nКількість людей: {persons_count}")

            # Перевірка кількості міграцій
            migrations_count = session.run("""
                MATCH (p:Person)-[r:MIGRATES_TO]->(c:City)
                RETURN count(r) as count
            """).single()["count"]
            print(f"\nКількість міграцій: {migrations_count}")

            # Перевірка зв'язків міграції
            print("\nПриклади міграцій:")
            migrations = session.run("""
                MATCH (p:Person)-[r:MIGRATES_TO]->(to:City)
                MATCH (p)-[:MIGRATES_FROM]->(from:City)
                RETURN p.name as person_name, 
                       from.name as from_city, 
                       to.name as to_city,
                       r.reason as reason,
                       r.date as date
                LIMIT 5
            """)
            for migration in migrations:
                print(f"- {migration['person_name']}: {migration['from_city']} -> {migration['to_city']}")
                print(f"  Причина: {migration['reason']}, Дата: {migration['date']}")

if __name__ == "__main__":
    checker = Neo4jChecker()
    try:
        checker.check_database()
    finally:
        checker.close() 