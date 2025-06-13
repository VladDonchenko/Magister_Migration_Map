from neo4j import GraphDatabase
import os

def clear_database():
    uri = os.getenv("NEO4J_URI", "bolt://localhost:7687")
    user = os.getenv("NEO4J_USER", "neo4j")
    password = os.getenv("NEO4J_PASSWORD", "password")

    driver = GraphDatabase.driver(uri, auth=(user, password))

    with driver.session() as session:
        # Удаляем все узлы и связи
        session.run("MATCH (n) DETACH DELETE n")
        print("База данных очищена")

    driver.close()

if __name__ == "__main__":
    clear_database() 