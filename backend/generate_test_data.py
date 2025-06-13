from neo4j import GraphDatabase
import os
from datetime import datetime, timedelta
import random

def generate_test_data():
    uri = os.getenv("NEO4J_URI", "bolt://neo4j:7687")
    user = os.getenv("NEO4J_USER", "neo4j")
    password = os.getenv("NEO4J_PASSWORD", "test")

    driver = GraphDatabase.driver(uri, auth=(user, password))

    # Список городов с координатами
    cities = [
        {
            "name": "Київ",
            "country": "Україна",
            "region": "Київська область",
            "population": 2967000,
            "latitude": 50.45466,
            "longitude": 30.5238
        },
        {
            "name": "Львів",
            "country": "Україна",
            "region": "Львівська область",
            "population": 724000,
            "latitude": 49.83826,
            "longitude": 24.02324
        },
        {
            "name": "Харків",
            "country": "Україна",
            "region": "Харківська область",
            "population": 1441000,
            "latitude": 49.98081,
            "longitude": 36.25272
        },
        {
            "name": "Одеса",
            "country": "Україна",
            "region": "Одеська область",
            "population": 1015000,
            "latitude": 46.47747,
            "longitude": 30.73262
        },
        {
            "name": "Дніпро",
            "country": "Україна",
            "region": "Дніпропетровська область",
            "population": 980000,
            "latitude": 48.46472,
            "longitude": 35.04618
        }
    ]

    # Тестовые миграции
    migrations = [
        {
            "person": {
                "first_name": "Іван",
                "last_name": "Петренко",
                "age": 28,
                "gender": "Чоловіча",
                "education": "Вища",
                "profession": "Інженер-програміст",
                "family_status": "Одружений"
            },
            "from_city": "Харків",
            "to_city": "Київ",
            "reason": "Робота",
            "transport_type": "Потяг",
            "housing_type": "Оренда квартири",
            "date": datetime.now() - timedelta(days=30)
        },
        {
            "person": {
                "first_name": "Марія",
                "last_name": "Коваленко",
                "age": 22,
                "gender": "Жіноча",
                "education": "Студентка",
                "profession": "Студентка",
                "family_status": "Неодружена"
            },
            "from_city": "Одеса",
            "to_city": "Львів",
            "reason": "Навчання",
            "transport_type": "Автобус",
            "housing_type": "Гуртожиток",
            "date": datetime.now() - timedelta(days=60)
        },
        {
            "person": {
                "first_name": "Олександр",
                "last_name": "Мельник",
                "age": 35,
                "gender": "Чоловіча",
                "education": "Вища",
                "profession": "Менеджер",
                "family_status": "Одружений"
            },
            "from_city": "Дніпро",
            "to_city": "Одеса",
            "reason": "Сімейні обставини",
            "transport_type": "Автомобіль",
            "housing_type": "Власна квартира",
            "date": datetime.now() - timedelta(days=15)
        }
    ]

    try:
        with driver.session() as session:
            # Очищаем базу данных
            session.run("MATCH (n) DETACH DELETE n")
            print("База данных очищена")

            # Создаем города
            for city in cities:
                session.run(
                    """
                    CREATE (c:City {
                        name: $name,
                        country: $country,
                        region: $region,
                        population: $population,
                        latitude: $latitude,
                        longitude: $longitude
                    })
                    """,
                    city
                )
            print("Города созданы")

            # Создаем миграции
            for migration in migrations:
                # Создаем человека
                session.run(
                    """
                    CREATE (p:Person {
                        first_name: $first_name,
                        last_name: $last_name,
                        age: $age,
                        gender: $gender,
                        education: $education,
                        profession: $profession,
                        family_status: $family_status
                    })
                    """,
                    migration["person"]
                )

                # Создаем связи миграции
                session.run(
                    """
                    MATCH (p:Person {first_name: $first_name, last_name: $last_name})
                    MATCH (from:City {name: $from_city})
                    MATCH (to:City {name: $to_city})
                    CREATE (p)-[r1:MIGRATES_FROM {
                        reason: $reason,
                        transport_type: $transport_type,
                        housing_type: $housing_type,
                        date: $date
                    }]->(from)
                    CREATE (p)-[r2:MIGRATES_TO {
                        reason: $reason,
                        transport_type: $transport_type,
                        housing_type: $housing_type,
                        date: $date
                    }]->(to)
                    """,
                    {
                        "first_name": migration["person"]["first_name"],
                        "last_name": migration["person"]["last_name"],
                        "from_city": migration["from_city"],
                        "to_city": migration["to_city"],
                        "reason": migration["reason"],
                        "transport_type": migration["transport_type"],
                        "housing_type": migration["housing_type"],
                        "date": migration["date"].isoformat()
                    }
                )
            print("Миграции созданы")

    except Exception as e:
        print(f"Ошибка при создании тестовых данных: {str(e)}")
        raise
    finally:
        driver.close()

if __name__ == "__main__":
    generate_test_data() 