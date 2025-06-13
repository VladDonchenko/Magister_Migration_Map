# -*- coding: utf-8 -*-
from src.utils.big_data_generator import BigDataGenerator
import logging

# Настройка логирования
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.StreamHandler()
    ]
)

def main():
    try:
        logging.info("Запуск потокового генератора данных...")
        generator = BigDataGenerator()
        
        # Отправляем 5 записей в секунду, всего 100 записей
        generator.stream_to_kafka(records_per_second=5, total_records=100)
        
    except Exception as e:
        logging.error(f"Ошибка при генерации данных: {str(e)}", exc_info=True)
    finally:
        generator.close()

if __name__ == "__main__":
    main() 