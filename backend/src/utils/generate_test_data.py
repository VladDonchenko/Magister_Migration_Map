from kafka import KafkaProducer
import json
import random
from datetime import datetime
import time
import logging

# Настройка логирования
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler(f'logs/generator_test_{datetime.now().strftime("%Y%m%d_%H%M%S")}.log'),
        logging.StreamHandler()
    ]
)

def generate_migration_data():
    cities = ['Київ', 'Львів', 'Одеса', 'Харків', 'Дніпро', 'Запоріжжя', 'Івано-Франківськ']
    reasons = ['робота', 'навчання', 'сім\'я', 'житло', 'економіка', 'безпека']
    
    return {
        'id': str(random.randint(1000, 9999)),
        'from_city': random.choice(cities),
        'to_city': random.choice([c for c in cities if c != 'from_city']),
        'age': random.randint(18, 65),
        'gender': random.choice(['чоловік', 'жінка']),
        'reason': random.choice(reasons),
        'timestamp': datetime.now().isoformat()
    }

def main(total_records=10000, batch_size=1000, delay=0.1):
    producer = KafkaProducer(
        bootstrap_servers='kafka:29092',
        value_serializer=lambda v: json.dumps(v).encode('utf-8')
    )
    
    logging.info(f"Починаємо відправку тестових даних. Всього записів: {total_records}, розмір батча: {batch_size}")
    
    try:
        for i in range(0, total_records, batch_size):
            current_batch = min(batch_size, total_records - i)
            logging.info(f"Відправка батча {i//batch_size + 1}, записів: {current_batch}")
            
            for _ in range(current_batch):
                data = generate_migration_data()
                producer.send('migrations', value=data)
                logging.debug(f"Відправлено: {data}")
                time.sleep(delay)
            
            logging.info(f"Батч {i//batch_size + 1} успішно відправлено")
            
    except Exception as e:
        logging.error(f"Помилка при відправці даних: {str(e)}", exc_info=True)
    finally:
        producer.close()
        logging.info("Генерація даних завершена")

if __name__ == "__main__":
    # Начальный тест: 10,000 записей, размер батча 1,000
    main(total_records=10000, batch_size=1000, delay=0.1) 