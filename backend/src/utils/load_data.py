from data_generator import MigrationDataGenerator
from neo4j import GraphDatabase

def load_data():
    # Инициализируем генератор данных
    generator = MigrationDataGenerator()
    
    # Подключаемся к Neo4j
    driver = GraphDatabase.driver(
        "bolt://localhost:7687",
        auth=("neo4j", "password")
    )
    
    try:
        with driver.session() as session:
            # Очищаем базу данных
            session.run("MATCH (n) DETACH DELETE n")
            
            # Генерируем и выполняем запросы для создания данных
            queries = generator.generate_neo4j_queries(0, 1000)  # Генерируем 1000 миграций
            
            for query in queries:
                session.run(query)
                
            print("Данные успешно загружены в Neo4j")
            
    except Exception as e:
        print(f"Ошибка при загрузке данных: {e}")
    finally:
        driver.close()

if __name__ == "__main__":
    load_data() 