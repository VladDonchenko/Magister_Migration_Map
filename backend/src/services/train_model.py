import pandas as pd
from migration_model import MigrationPatternModel
import logging
from datetime import datetime

# Налаштування логування
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler(f'logs/training_{datetime.now().strftime("%Y%m%d_%H%M%S")}.log'),
        logging.StreamHandler()
    ]
)

def main():
    try:
        # Завантаження даних
        logging.info("Завантаження даних...")
        df = pd.read_parquet("data/raw/migrations.parquet")
        logging.info(f"Завантажено {len(df)} записів")

        # Створення та навчання моделі
        logging.info("Створення моделі...")
        model = MigrationPatternModel()
        
        logging.info("Початок навчання...")
        history = model.train(
            data=df,
            epochs=50,
            batch_size=32
        )
        
        # Збереження моделі
        logging.info("Збереження моделі...")
        model.save_model()
        
        # Оцінка результату
        final_accuracy = history.history['val_accuracy'][-1]
        logging.info(f"Фінальна точність на валідаційній вибірці: {final_accuracy:.4f}")
        
        # Тестування на невеликій вибірці
        test_sample = df.sample(n=5)
        predictions = model.predict(test_sample)
        
        logging.info("\nТестові прогнози:")
        for i, (_, row) in enumerate(test_sample.iterrows()):
            logging.info(f"\nЗапис {i+1}:")
            logging.info(f"Від: {row['from_city']['name']} -> До: {row['to_city']['name']}")
            logging.info(f"Реальна причина: {row['reason']}")
            logging.info("Прогнозовані ймовірності:")
            for reason, prob in predictions[i].items():
                logging.info(f"  {reason}: {prob:.2%}")
        
    except Exception as e:
        logging.error(f"Помилка при навчанні моделі: {str(e)}", exc_info=True)
        raise

if __name__ == "__main__":
    main() 