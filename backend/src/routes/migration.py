from fastapi import APIRouter, Depends, HTTPException, Path, Query, Body, Request
from fastapi.responses import JSONResponse
from src.services.neo4j_service import Neo4jService
from src.dependencies import get_neo4j_service
from typing import List, Dict, Any
import logging
from datetime import datetime, timedelta
import random
from pydantic import BaseModel, Field

logger = logging.getLogger(__name__)
router = APIRouter()

class GenerateDataRequest(BaseModel):
    size: int = Field(default=100, ge=1, le=100000)

@router.post("/clear")
async def clear_data(neo4j_service: Neo4jService = Depends(get_neo4j_service)):
    try:
        query = "MATCH (n) DETACH DELETE n"
        neo4j_service.execute_query(query)
        return {"message": "Дані успішно очищено"}
    except Exception as e:
        logger.error(f"Помилка при очищенні даних: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@router.post("/generate")
async def generate_test_data(data: GenerateDataRequest):
    try:
        logger.info(f"Отримано параметри моделі: {data}")
        
        neo4j_service = Neo4jService()
        
        # Список міст
        cities = [
            {"name": "Київ", "population": 2967360, "region": "Київська область"},
            {"name": "Харків", "population": 1443207, "region": "Харківська область"},
            {"name": "Одеса", "population": 1017699, "region": "Одеська область"},
            {"name": "Дніпро", "population": 980948, "region": "Дніпропетровська область"},
            {"name": "Львів", "population": 721510, "region": "Львівська область"},
            {"name": "Запоріжжя", "population": 731922, "region": "Запорізька область"},
            {"name": "Кривий Ріг", "population": 619278, "region": "Дніпропетровська область"},
            {"name": "Миколаїв", "population": 476101, "region": "Миколаївська область"},
            {"name": "Маріуполь", "population": 431859, "region": "Донецька область"},
            {"name": "Вінниця", "population": 370707, "region": "Вінницька область"}
        ]
        
        # Очищаємо базу даних
        neo4j_service.clear_database()
        
        # Створюємо міста
        for city in cities:
            neo4j_service.create_city(city["name"], city["population"], city["region"])
        
        # Генеруємо випадкові дані про міграцію
        first_names = ["Олександр", "Максим", "Артем", "Дмитро", "Іван", "Андрій", "Олексій", "Владислав", "Єгор", "Михайло"]
        last_names = ["Мельник", "Шевченко", "Коваленко", "Бондаренко", "Ткаченко", "Кравченко", "Ковальчук", "Кравчук", "Бондар", "Ткачук"]
        reasons = ["Робота", "Навчання", "Сімейні обставини", "Покращення умов життя", "Близькість до родини"]
        transport_types = ["Автомобіль", "Потяг", "Автобус", "Літак"]
        housing_types = ["Оренда", "Власне житло", "Гуртожиток", "Тимчасове житло"]
        education_types = ["Середня", "Бакалавр", "Магістр", "Доктор наук"]
        professions = ["Інженер", "Лікар", "Вчитель", "Програміст", "Менеджер", "Юрист", "Архітектор", "Дизайнер"]
        family_statuses = ["Одружений/заміжня", "Неодружений/незаміжня", "Розлучений/розлучена", "Вдівець/вдова"]
        
        migrations = []
        for _ in range(data.size):
            from_city = random.choice(cities)
            to_city = random.choice([c for c in cities if c["name"] != from_city["name"]])
            
            migration_date = datetime.now() - timedelta(days=random.randint(0, 365))
            
            migration = {
                "from_city": from_city["name"],
                "to_city": to_city["name"],
                "person": {
                    "first_name": random.choice(first_names),
                    "last_name": random.choice(last_names),
                    "age": random.randint(18, 65),
                    "education": random.choice(education_types),
                    "profession": random.choice(professions),
                    "family_status": random.choice(family_statuses)
                },
                "reason": random.choice(reasons),
                "transport_type": random.choice(transport_types),
                "housing_type": random.choice(housing_types),
                "migration_date": migration_date.strftime("%Y-%m-%d")
            }
            
            neo4j_service.create_migration(
                migration["from_city"],
                migration["to_city"],
                migration["person"],
                migration["reason"],
                migration["transport_type"],
                migration["housing_type"],
                migration["migration_date"]
            )
            
            migrations.append(migration)
        
        logger.info(f"Згенеровано {len(migrations)} записів про міграцію")
        return {"message": f"Успішно згенеровано {len(migrations)} записів про міграцію"}
        
    except Exception as e:
        logger.error(f"Помилка при генерації тестових даних: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/map")
async def get_migration_map(neo4j_service: Neo4jService = Depends(get_neo4j_service)):
    try:
        logger.info("Отримуємо дані для карти міграції")
        data = neo4j_service.get_migration_map_data()
        logger.info(f"DEBUG_RETURN_TO_CLIENT: {data}")
        return data
    except Exception as e:
        logger.error(f"Помилка при отриманні даних карти: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/migration/city/{city_name}/stats")
async def get_city_stats(city_name: str):
    """
    Отримання статистики міста
    """
    try:
        query = """
        MATCH (c:City {name: $city_name})
        OPTIONAL MATCH (p:Person)-[r:MIGRATES_TO]->(c)
        WITH c, count(r) as incoming
        OPTIONAL MATCH (p2:Person)-[r2:MIGRATES_FROM]->(c)
        WITH c, incoming, count(r2) as outgoing
        OPTIONAL MATCH (p3:Person)-[r3:MIGRATES_FROM]->(c)-[r4:MIGRATES_TO]->(other:City)
        WITH c, incoming, outgoing, avg(r3.distance_km) as avg_distance
        RETURN {
            outgoingCount: outgoing,
            incomingCount: incoming,
            averageDistance: avg_distance
        } as stats
        """
        
        result = neo4j_service.execute_query(query, {"city_name": city_name})
        if not result:
            raise HTTPException(status_code=404, detail=f"Місто {city_name} не знайдено")
        return result[0]
    except Exception as e:
        logger.error(f"Error getting city stats: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/flow")
async def get_flow_details(
    from_city: str = Query(..., description="Місто відправлення"),
    to_city: str = Query(..., description="Місто призначення"),
    neo4j_service: Neo4jService = Depends(get_neo4j_service)
):
    try:
        logger.info(f"Отримуємо деталі міграційного потоку з {from_city} до {to_city}")
        
        # Перевіряємо наявність міст
        cities = neo4j_service.execute_query("""
            MATCH (c:City)
            WHERE c.name IN [$from_city, $to_city]
            RETURN c.name as name
        """, {"from_city": from_city, "to_city": to_city})
        
        if len(cities) < 2:
            raise HTTPException(
                status_code=404,
                detail=f"Одне або обидва міста не знайдено: {from_city}, {to_city}"
            )
        
        # Отримуємо деталі міграції
        flow_details = neo4j_service.execute_query("""
            MATCH (from:City {name: $from_city})-[r:MIGRATED_TO]->(to:City {name: $to_city})
            WITH r, from, to
            MATCH (p:Person)-[:MADE_MIGRATION]->(r)
            RETURN {
                from_city: from.name,
                to_city: to.name,
                total_migrations: count(r),
                average_age: avg(p.age),
                reasons: collect(distinct r.reason),
                transport_types: collect(distinct r.transport_type),
                housing_types: collect(distinct r.housing_type)
            } as details
        """, {"from_city": from_city, "to_city": to_city})
        
        if not flow_details:
            raise HTTPException(
                status_code=404,
                detail=f"Міграційний потік між містами {from_city} та {to_city} не знайдено"
            )
            
        return flow_details[0]
        
    except HTTPException as e:
        raise e
    except Exception as e:
        logger.error(f"Помилка при отриманні деталей міграційного потоку: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/migrants")
async def get_migrants(
    from_city: str = Query(..., description="Місто відправлення"),
    to_city: str = Query(..., description="Місто призначення"),
    neo4j_service: Neo4jService = Depends(get_neo4j_service)
):
    try:
        logger.info(f"Отримуємо список мігрантів з {from_city} до {to_city}")
        
        # Перевіряємо наявність міст
        cities = neo4j_service.execute_query("""
            MATCH (c:City)
            WHERE c.name IN [$from_city, $to_city]
            RETURN c.name as name
        """, {"from_city": from_city, "to_city": to_city})
        
        if len(cities) < 2:
            raise HTTPException(
                status_code=404,
                detail=f"Одне або обидва міста не знайдено: {from_city}, {to_city}"
            )
        
        # Отримуємо список мігрантів
        migrants = neo4j_service.execute_query("""
            MATCH (from:City {name: $from_city})-[r:MIGRATED_TO]->(to:City {name: $to_city})
            WITH r, from, to
            MATCH (p:Person)-[:MADE_MIGRATION]->(r)
            RETURN {
                id: p.id,
                first_name: p.first_name,
                last_name: p.last_name,
                age: p.age,
                education: p.education,
                profession: p.profession,
                family_status: p.family_status,
                migration_date: r.migration_date,
                reason: r.reason,
                transport_type: r.transport_type,
                housing_type: r.housing_type
            } as migrant
            ORDER BY r.migration_date DESC
        """, {"from_city": from_city, "to_city": to_city})
        
        return migrants
        
    except HTTPException as e:
        raise e
    except Exception as e:
        logger.error(f"Помилка при отриманні списку мігрантів: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))
