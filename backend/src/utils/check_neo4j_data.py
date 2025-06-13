from neo4j import GraphDatabase

def check_data():
    driver = GraphDatabase.driver("bolt://localhost:7687", auth=("neo4j", "test"))
    
    with driver.session() as session:
        # Перевіряємо кількість міграцій
        result = session.run("MATCH (m:Migration) RETURN count(m) as count")
        migration_count = result.single()["count"]
        print(f"Кількість міграцій: {migration_count}")
        
        # Перевіряємо кількість міст
        result = session.run("MATCH (c:City) RETURN count(c) as count")
        city_count = result.single()["count"]
        print(f"Кількість міст: {city_count}")
        
        # Перевіряємо кількість зв'язків
        result = session.run("MATCH ()-[r:MIGRATED_TO]->() RETURN count(r) as count")
        relationship_count = result.single()["count"]
        print(f"Кількість зв'язків міграції: {relationship_count}")

if __name__ == "__main__":
    check_data() 