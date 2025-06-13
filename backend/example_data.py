import pandas as pd
import random
from datetime import datetime, timedelta

# Списки для генерации данных
first_names = ['Іван', 'Марія', 'Олександр', 'Олена', 'Петро', 'Анна', 'Михайло', 'Наталія']
last_names = ['Петренко', 'Коваленко', 'Бондаренко', 'Шевченко', 'Мельник', 'Ткаченко']
cities = ['Київ', 'Львів', 'Харків', 'Одеса', 'Дніпро', 'Запоріжжя', 'Вінниця', 'Тернопіль']

# Генерация данных
data = []
for _ in range(50):  # Генерируем 50 записей
    from_city = random.choice(cities)
    to_city = random.choice([city for city in cities if city != from_city])
    
    # Генерация случайной даты за последний год
    date = datetime.now() - timedelta(days=random.randint(0, 365))
    
    data.append({
        'first_name': random.choice(first_names),
        'last_name': random.choice(last_names),
        'from_city': from_city,
        'to_city': to_city,
        'migration_date': date.strftime('%Y-%m-%d')
    })

# Создание DataFrame и сохранение в Excel
df = pd.DataFrame(data)
df.to_excel('example_migration_data.xlsx', index=False)
print("Файл example_migration_data.xlsx создан успешно!") 