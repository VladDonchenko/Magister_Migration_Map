"""Генератор даних для бази даних Neo4j"""

import random
import uuid
from datetime import datetime, timedelta
from typing import Dict, List, Tuple, Any
import numpy as np
from .cities import (
    CITIES,
    MIGRATION_REASONS as REASONS,
    TRANSPORT_TYPES,
    HOUSING_TYPES,
    EDUCATION_LEVELS,
    OCCUPATIONS as PROFESSIONS,
    MARITAL_STATUSES as FAMILY_STATUSES
)

# Списки для генерації даних
FIRST_NAMES = [
    "Андрій", "Олександр", "Максим", "Дмитро", "Іван", "Сергій", "Володимир",
    "Анна", "Марія", "Олена", "Юлія", "Наталія", "Катерина", "Ірина"
]

LAST_NAMES = [
    "Шевченко", "Мельник", "Коваленко", "Бондаренко", "Ткаченко", "Кравченко",
    "Олійник", "Шевчук", "Поліщук", "Петренко", "Ковальчук", "Кравчук"
]

GENDERS = ["Чоловіча", "Жіноча"]

def weighted_choice(choices: Dict[str, float]) -> str:
    """Вибір випадкового елемента з урахуванням ваг"""
    items = list(choices.keys())
    weights = list(choices.values())
    return random.choices(items, weights=weights, k=1)[0]

def generate_ukrainian_name(gender: str) -> str:
    """Генерує українське ім'я та прізвище"""
    male_names = ["Олександр", "Михайло", "Андрій", "Дмитро", "Максим", "Данило", "Олег", "Ігор", "Віталій", "Сергій"]
    female_names = ["Ольга", "Марія", "Анна", "Юлія", "Тетяна", "Наталія", "Ірина", "Катерина", "Вікторія", "Людмила"]
    
    surnames = ["Шевченко", "Коваленко", "Бондаренко", "Ткаченко", "Мельник", "Кравченко", "Поліщук", "Петренко", "Савченко", "Іваненко"]
    
    if gender == "Чоловіча":
        name = random.choice(male_names)
        surname = random.choice(surnames)
    else:
        name = random.choice(female_names)
        surname = random.choice(surnames)
        if not surname.endswith("о"):
            surname += "а"
    
    return f"{name} {surname}"

def generate_passport_data() -> Tuple[str, str]:
    """Генерує серію та номер паспорта"""
    series = random.choice(["АА", "АБ", "АВ", "АГ", "АД", "АЕ", "АЖ", "АИ", "АК", "АМ"])
    number = str(random.randint(100000, 999999))
    return series, number

def generate_registration_address(city: str) -> str:
    """Генерує адресу реєстрації"""
    streets = ["Центральна", "Шевченка", "Франка", "Лесі Українки", "Грушевського", "Сагайдачного", "Хмельницького", "Мазепи", "Незалежності", "Соборна"]
    street = random.choice(streets)
    building = random.randint(1, 100)
    apartment = random.randint(1, 100)
    # Екрануємо апострофи в назві міста
    city = city.replace("'", "\\'")
    return f"м. {city}, вул. {street}, {building}, кв. {apartment}"

def generate_age_based_income(age: int, occupation: str) -> int:
    """Генерує реалістичний дохід на основі віку та професії"""
    base_income = {
        "IT-спеціаліст": (25000, 70000),
        "Менеджер": (15000, 40000),
        "Вчитель": (10000, 20000),
        "Медичний працівник": (12000, 35000),
        "Інженер": (15000, 45000),
        "Продавець": (8000, 15000),
        "Студент": (3000, 8000),
        "Робітник": (10000, 20000),
        "Підприємець": (20000, 60000),
        "Водій": (12000, 25000),
        "Бухгалтер": (15000, 35000),
        "Юрист": (18000, 50000),
        "Військовослужбовець": (14000, 30000),
        "Державний службовець": (12000, 35000),
        "Пенсіонер": (3000, 8000),
        "Безробітний": (0, 5000)
    }
    
    min_income, max_income = base_income.get(occupation, (8000, 20000))
    
    # Коригування на основі віку
    if 25 <= age <= 45:
        max_income *= 1.2
    elif age > 45:
        max_income *= 0.9
    
    return int(random.uniform(min_income, max_income))

def generate_person() -> Dict[str, Any]:
    """Генерує дані про людину"""
    gender = random.choice(GENDERS)
    first_name = random.choice(FIRST_NAMES)
    last_name = random.choice(LAST_NAMES)
    
    return {
        "first_name": first_name,
        "last_name": last_name,
        "age": random.randint(18, 65),
        "gender": gender,
        "profession": random.choice(PROFESSIONS),
        "family_status": random.choice(FAMILY_STATUSES),
        "education": random.choice(EDUCATION_LEVELS)
    }

def generate_migration_data(size: int = 10000) -> Tuple[List[Dict[str, Any]], List[Dict[str, Any]], List[Dict[str, Any]]]:
    """Генерує дані про міграції"""
    if size < 1:
        raise ValueError("Розмір має бути більше 0")
        
    cities = CITIES.copy()
    if len(cities) < 2:
        raise ValueError("Потрібно мінімум 2 міста для генерації міграцій")
        
    persons = []
    migrations = []
    
    try:
        for _ in range(size):
            person = generate_person()
            persons.append(person)
            
            from_city = random.choice(cities)
            available_cities = [c for c in cities if c["name"] != from_city["name"]]
            if not available_cities:
                raise ValueError("Недостатньо міст для генерації міграції")
                
            to_city = random.choice(available_cities)
            
            migration = {
                "from_city": from_city["name"],
                "to_city": to_city["name"],
                "transport_type": random.choice(TRANSPORT_TYPES),
                "reason": random.choice(REASONS),
                "housing_type": random.choice(HOUSING_TYPES),
                "date": datetime.now() + timedelta(days=random.randint(1, 365))
            }
            migrations.append(migration)
        
        return cities, persons, migrations
    except Exception as e:
        raise ValueError(f"Помилка при генерації даних: {str(e)}")

def generate_cypher_queries(cities: List[Dict[str, Any]], persons: List[Dict[str, Any]], migrations: List[Dict[str, Any]]) -> List[str]:
    """Генерує Cypher запити для створення даних в Neo4j"""
    queries = []
    
    # Створення міст
    for city in cities:
        query = f"""
        MERGE (c:City {{name: '{city["name"].replace("'", "\\'")}'}})
        SET c.country = 'Україна',
            c.region = '{city["region"].replace("'", "\\'")}',
            c.population = {city["population"]},
            c.latitude = {city["latitude"]},
            c.longitude = {city["longitude"]}
        """
        queries.append(query)
    
    # Створення людей та міграцій
    for i, (person, migration) in enumerate(zip(persons, migrations)):
        # Створення людини
        query = f"""
        CREATE (p:Person {{
            first_name: '{person["first_name"].replace("'", "\\'")}',
            last_name: '{person["last_name"].replace("'", "\\'")}',
            age: {person["age"]},
            gender: '{person["gender"].replace("'", "\\'")}',
            profession: '{person["profession"].replace("'", "\\'")}',
            family_status: '{person["family_status"].replace("'", "\\'")}',
            education: '{person["education"].replace("'", "\\'")}'
        }})
        WITH p
        MATCH (from:City {{name: '{migration["from_city"].replace("'", "\\'")}'}})
        MATCH (to:City {{name: '{migration["to_city"].replace("'", "\\'")}'}})
        CREATE (p)-[:MIGRATES_FROM {
            transport_type: '{migration["transport_type"].replace("'", "\\'")}',
            reason: '{migration["reason"].replace("'", "\\'")}',
            housing_type: '{migration["housing_type"].replace("'", "\\'")}',
            date: datetime('{migration["date"].isoformat()}')
        }]->(from)
        CREATE (p)-[:MIGRATES_TO {
            transport_type: '{migration["transport_type"].replace("'", "\\'")}',
            reason: '{migration["reason"].replace("'", "\\'")}',
            housing_type: '{migration["housing_type"].replace("'", "\\'")}',
            date: datetime('{migration["date"].isoformat()}'),
            distance_km: point.distance(
                point({longitude: from.longitude, latitude: from.latitude}),
                point({longitude: to.longitude, latitude: to.latitude})
            ) / 1000
        }]->(to)
        """
        queries.append(query)
    
    return queries 