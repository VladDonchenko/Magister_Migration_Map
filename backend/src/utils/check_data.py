# -*- coding: utf-8 -*-
from neo4j import GraphDatabase

def check_data():
    uri = "bolt://localhost:7687"
    user = "neo4j"
    password = "test"
    
    driver = GraphDatabase.driver(uri, auth=(user, password))
    
    try:
        with driver.session() as session:
            # Перевіряємо кількість міст
            result = session.run("MATCH (c:City) RETURN count(c) as city_count")
            city_count = result.single()["city_count"]
            print(f"Кількість міст: {city_count}")
            
            # Перевіряємо кількість міграцій
            result = session.run("MATCH (m:Migration) RETURN count(m) as migration_count")
            migration_count = result.single()["migration_count"]
            print(f"Кількість міграцій: {migration_count}")
            
            # Перевіряємо кількість зв'язків
            result = session.run("MATCH ()-[r:MIGRATION_TO]->() RETURN count(r) as relation_count")
            relation_count = result.single()["relation_count"]
            print(f"Кількість зв'язків: {relation_count}")
            
    finally:
        driver.close()

if __name__ == "__main__":
    check_data() 