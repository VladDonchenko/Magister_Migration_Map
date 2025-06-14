# -*- coding: utf-8 -*-

from fastapi import APIRouter, HTTPException, Depends
from typing import List, Dict, Any
from src.services.neo4j_service import Neo4jService
from src.dependencies import get_neo4j_service
from urllib.parse import unquote, quote
import logging

logger = logging.getLogger(__name__)

router = APIRouter(prefix="/api/cities", tags=["cities"])

@router.get("/")
async def get_cities(
    neo4j_service: Neo4jService = Depends(get_neo4j_service)
) -> List[Dict[str, Any]]:
    """Получить список всех городов"""
    try:
        return neo4j_service.get_cities()
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/{city_name}")
async def get_city(
    city_name: str,
    neo4j_service: Neo4jService = Depends(get_neo4j_service)
):
    """
    Получить информацию о конкретном городе
    """
    try:
        decoded_city_name = unquote(city_name)
        return neo4j_service.get_city(decoded_city_name)
    except ValueError as e:
        raise HTTPException(status_code=404, detail=str(e))
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/{city_name}/stats")
async def get_city_stats(city_name: str):
    """Отримати статистику міграції для конкретного міста"""
    logger.info(f"Отримання статистики для міста: {city_name}")
    try:
        stats = get_neo4j_service().get_city_stats(city_name)
        logger.info(f"Отримано статистику для міста {city_name}: {stats}")
        
        if not stats:
            logger.warning(f"Статистика для міста {city_name} не знайдена")
            return {
                "outgoingCount": 0,
                "incomingCount": 0,
                "averageDistance": 0
            }
            
        return stats
        
    except Exception as e:
        logger.error(f"Помилка при отриманні статистики для міста {city_name}: {str(e)}")
        raise HTTPException(
            status_code=500,
            detail=f"Помилка при отриманні статистики для міста {city_name}: {str(e)}"
        )

@router.get("/{city_name}/debug")
async def get_city_debug(
    city_name: str,
    neo4j_service: Neo4jService = Depends(get_neo4j_service)
) -> Dict[str, Any]:
    """
    Отримання детальної інформації про місто для налагодження
    """
    try:
        # Декодуємо назву міста з URL
        decoded_city_name = unquote(city_name)
        logger.info(f"Запит debug інформації для міста: {decoded_city_name}")
        
        # Отримуємо всю інформацію про місто
        query = """
        MATCH (c:City)
        WHERE c.name = $city_name OR c.name = '"' + $city_name + '"'
        RETURN c
        """
        
        result = neo4j_service.execute_query(query, {"city_name": decoded_city_name})
        logger.info(f"Результат запиту: {result}")
        
        if not result:
            raise HTTPException(
                status_code=404,
                detail=f"Місто {decoded_city_name} не знайдено"
            )
            
        return result[0]
        
    except Exception as e:
        logger.error(f"Помилка при отриманні debug інформації міста: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/{city_name}/migrations")
async def get_city_migrations(city_name: str):
    try:
        migrations = get_neo4j_service().get_city_migrations(city_name)
        if not migrations:
            raise HTTPException(status_code=404, detail="City not found")
        return migrations
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/{city_name}/migrants")
async def get_city_migrants(city_name: str):
    """Отримати інформацію про мігрантів для конкретного міста"""
    logger.info(f"Отримання інформації про мігрантів для міста: {city_name}")
    try:
        return get_neo4j_service().get_city_migrants(city_name)
    except Exception as e:
        logger.error(f"Помилка при отриманні інформації про мігрантів: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e)) 