from fastapi import APIRouter, HTTPException
from typing import List, Dict, Any
from ..services.neo4j_service import Neo4jService

router = APIRouter()
neo4j_service = Neo4jService()

@router.get("/cities", response_model=List[Dict[str, Any]])
async def get_cities():
    """
    Получить список всех городов с их координатами и населением
    """
    try:
        return neo4j_service.get_cities()
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/migration/flows", response_model=List[Dict[str, Any]])
async def get_migration_flows():
    """
    Получить потоки миграции между городами с агрегированной статистикой
    """
    try:
        return neo4j_service.get_migration_flows()
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/migration/stats", response_model=Dict[str, Any])
async def get_migration_stats():
    """
    Получить общую статистику по миграциям
    """
    try:
        return neo4j_service.get_migration_stats()
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/cities/{city_name}/stats")
async def get_city_stats(city_name: str):
    """
    Получить статистику миграции для конкретного города
    """
    try:
        return neo4j_service.get_city_stats(city_name)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e)) 