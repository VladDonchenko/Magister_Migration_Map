# -*- coding: utf-8 -*-
from src.utils.big_data_generator import BigDataGenerator
import logging
from datetime import datetime
import os

# Создаем директорию для логов, если она не существует
os.makedirs('logs', exist_ok=True)

# Настройка логирования
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.StreamHandler()  # Логируем только в консоль
    ]
)

def main():
    try:
        logging.info("Запуск тестового генератора данных...")
        generator = BigDataGenerator()
        
        # Начальный тест: 10,000 записей, размер батча 1,000
        logging.info("Генерация начального набора данных (10,000 записей)...")
        generator.generate_large_dataset(total_records=10000, batch_size=1000)
        
        logging.info("Тестовая генерация данных завершена успешно")
        
    except Exception as e:
        logging.error(f"Ошибка при генерации данных: {str(e)}", exc_info=True)

if __name__ == "__main__":
    main() 