import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import requests
import json
from datetime import datetime

# Получение данных из API
def fetch_data():
    try:
        # Получаем данные о миграции
        response = requests.get('http://localhost:8000/api/v1/migration/flows')
        migrations = response.json()
        
        # Получаем данные о городах
        response = requests.get('http://localhost:8000/api/v1/cities')
        cities = response.json()
        
        return migrations, cities
    except Exception as e:
        print(f"Ошибка при получении данных: {e}")
        return None, None

def create_visualizations():
    migrations, cities = fetch_data()
    if not migrations or not cities:
        return
    
    # Преобразуем данные в DataFrame
    df_migrations = pd.DataFrame(migrations)
    df_cities = pd.DataFrame(cities)
    
    # 1. График количества миграций по месяцам
    plt.figure(figsize=(12, 6))
    df_migrations['migration_date'] = pd.to_datetime(df_migrations['migration_date'])
    monthly_migrations = df_migrations.groupby(df_migrations['migration_date'].dt.to_period('M')).size()
    monthly_migrations.plot(kind='bar')
    plt.title('Количество миграций по месяцам')
    plt.xlabel('Месяц')
    plt.ylabel('Количество миграций')
    plt.xticks(rotation=45)
    plt.tight_layout()
    plt.savefig('migrations_by_month.png')
    plt.close()
    
    # 2. Круговая диаграмма причин миграции
    plt.figure(figsize=(10, 10))
    reasons_count = df_migrations['reason'].value_counts()
    plt.pie(reasons_count.values, labels=reasons_count.index, autopct='%1.1f%%')
    plt.title('Распределение причин миграции')
    plt.savefig('migration_reasons.png')
    plt.close()
    
    # 3. Гистограмма возрастов мигрантов
    plt.figure(figsize=(10, 6))
    sns.histplot(data=df_migrations, x='age', bins=30)
    plt.title('Распределение возраста мигрантов')
    plt.xlabel('Возраст')
    plt.ylabel('Количество')
    plt.savefig('age_distribution.png')
    plt.close()
    
    # 4. График соотношения полов
    plt.figure(figsize=(8, 6))
    gender_count = df_migrations['gender'].value_counts()
    gender_count.plot(kind='bar')
    plt.title('Соотношение полов мигрантов')
    plt.xlabel('Пол')
    plt.ylabel('Количество')
    plt.tight_layout()
    plt.savefig('gender_distribution.png')
    plt.close()
    
    print("Визуализации созданы успешно!")

if __name__ == "__main__":
    create_visualizations() 