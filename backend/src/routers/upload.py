from fastapi import APIRouter, UploadFile, File, HTTPException, Depends
from fastapi.responses import JSONResponse
import shutil
import os
from tempfile import NamedTemporaryFile
from ..services.excel_service import ExcelService
from ..services.neo4j_service import Neo4jService
from ..dependencies import get_neo4j_service
import logging
from datetime import datetime, timedelta
import random

logger = logging.getLogger(__name__)
router = APIRouter()
excel_service = ExcelService()

@router.post("/generate-test-data")
async def generate_test_data(neo4j_service: Neo4jService = Depends(get_neo4j_service)):
    try:
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

        # Очищаем базу данных
        neo4j_service.execute_query("MATCH (n) DETACH DELETE n")
        logger.info("База данных очищена")

        # Создаем города
        for city in cities:
            neo4j_service.execute_query(
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
        logger.info("Города созданы")

        # Создаем миграции
        for migration in migrations:
            # Создаем человека
            neo4j_service.execute_query(
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
            neo4j_service.execute_query(
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
        logger.info("Миграции созданы")

        return JSONResponse(
            status_code=200,
            content={"message": "Тестовые данные успешно сгенерированы"}
        )

    except Exception as e:
        logger.error(f"Ошибка при генерации тестовых данных: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@router.post("/upload/excel")
async def upload_excel(file: UploadFile = File(...)):
    try:
        # Проверяем расширение файла
        if not file.filename.endswith(('.xlsx', '.xls')):
            raise HTTPException(status_code=400, detail="Только Excel файлы (.xlsx, .xls) разрешены")

        # Создаем временный файл
        with NamedTemporaryFile(delete=False, suffix=os.path.splitext(file.filename)[1]) as tmp:
            shutil.copyfileobj(file.file, tmp)
            tmp_path = tmp.name

        try:
            # Обрабатываем файл
            result = await excel_service.process_excel_file(tmp_path)
            
            # Удаляем временный файл
            os.unlink(tmp_path)
            
            return JSONResponse(
                status_code=200,
                content=result
            )

        except Exception as e:
            # В случае ошибки тоже удаляем временный файл
            if os.path.exists(tmp_path):
                os.unlink(tmp_path)
            raise HTTPException(status_code=400, detail=str(e))

    except Exception as e:
        logger.error(f"Ошибка при загрузке файла: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e)) 