# -*- coding: utf-8 -*-
import os
from neo4j import GraphDatabase
import time

class Neo4jLoader:
    def __init__(self, uri="bolt://localhost:7687", user="neo4j", password="password"):
        self.driver = GraphDatabase.driver(uri, auth=(user, password))

    def close(self):
        self.driver.close()

    def clear_database(self):
        with self.driver.session() as session:
            session.run("MATCH (n) DETACH DELETE n")
            print("База даних очищена")

    def load_data_from_file(self, file_path):
        """Завантажує дані з файлу в Neo4j"""
        with self.driver.session() as session:
            with open(file_path, 'r', encoding='utf-8') as f:
                queries = []
                current_query = []
                
                for line in f:
                    line = line.strip()
                    if line:
                        current_query.append(line)
                    elif current_query:
                        queries.append(' '.join(current_query))
                        current_query = []
                
                if current_query:
                    queries.append(' '.join(current_query))
                
            successful_queries = 0
            total_queries = len(queries)
            errors = 0
            
            for i, query in enumerate(queries, 1):
                if not query.strip():  # Пропускаємо порожні запити
                    continue
                    
                try:
                    session.run(query)
                    successful_queries += 1
                except Exception as e:
                    print("\nПомилка на запиті " + str(i) + ":")
                    print("Запит: " + query)
                    print("Помилка: " + str(e) + "\n")
                    errors += 1
            
            return successful_queries, errors, total_queries

def main():
    loader = Neo4jLoader()
    try:
        # Очищаємо базу даних перед завантаженням
        loader.clear_database()
        
        # Завантажуємо дані
        queries_file = "data/processed/neo4j_queries.cypher"
        successful_queries, errors, total_queries = loader.load_data_from_file(queries_file)
        print("\n--------------------------------------------------------------------------------")
        print("\nЗавантаження завершено:")
        print("Успішно завантажено: " + str(successful_queries) + " запитів")
        print("Помилок: " + str(errors))
        print("Всього оброблено запитів: " + str(total_queries))
    finally:
        loader.close()

if __name__ == "__main__":
    main() 