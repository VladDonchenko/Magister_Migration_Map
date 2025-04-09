# -*- coding: utf-8 -*-

from fastapi import APIRouter, HTTPException
from typing import List, Dict, Any
from src.services.neo4j_service import Neo4jService

router = APIRouter()
neo4j_service = Neo4jService()

@router.get("/migration/stats")
async def get_general_migration_stats() -> Dict[str, Any]:
    """
    Получение общей статистики миграции
    """
    try:
        return await neo4j_service.get_general_stats()
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/migration/flows")
async def get_migration_flows():
    """
    Получить потоки миграции между городами
    """
    return await neo4j_service.get_migration_flows()

@router.get("/migration/stats/{city_name}")
async def get_city_migration_stats(city_name: str):
    """
    Получить статистику миграции для конкретного города
    """
    return await neo4j_service.get_city_stats(city_name) 