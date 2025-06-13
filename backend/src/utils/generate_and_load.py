# -*- coding: utf-8 -*-
import os
from data_generator import MigrationDataGenerator
from neo4j_loader import Neo4jLoader

def generate_and_load_data(total_records=10000, batch_size=1000):
    """
    Генерує та завантажує дані в Neo4j
    
    Args:
        total_records (int): Загальна кількість записів для генерації
        batch_size (int): Розмір пакету для завантаження
    """
    # Створюємо директорії, якщо вони не існують
    os.makedirs("data/processed", exist_ok=True)
    
    # Ініціалізуємо генератор та завантажувач
    generator = MigrationDataGenerator()
    loader = Neo4jLoader()
    
    try:
        # Очищаємо базу даних
        print("Очищення бази даних...")
        loader.clear_database()
        
        # Генеруємо та завантажуємо дані пакетами
        for batch_start in range(0, total_records, batch_size):
            batch_end = min(batch_start + batch_size, total_records)
            print(f"\nГенерація та завантаження записів {batch_start} - {batch_end}...")
            
            # Генеруємо запити для поточного пакету
            queries = generator.generate_neo4j_queries(batch_start, batch_end - batch_start)
            
            # Зберігаємо запити у тимчасовий файл
            temp_file = "data/processed/temp_queries.cypher"
            with open(temp_file, 'w', encoding='utf-8') as f:
                f.write("\n".join(queries))
            
            # Завантажуємо запити в Neo4j
            loader.load_queries(temp_file)
            
            # Видаляємо тимчасовий файл
            os.remove(temp_file)
            
            print(f"Завантажено {batch_end - batch_start} записів")
    
    finally:
        loader.close()

if __name__ == "__main__":
    generate_and_load_data() 