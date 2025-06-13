# -*- coding: utf-8 -*-

from fastapi import FastAPI, HTTPException, Depends, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
import logging
from src.routes.migration import router as migration_router
from src.routes.cities import router as cities_router
from src.services.neo4j_service import Neo4jService
from src.dependencies import get_neo4j_service
from typing import List, Dict, Any
from src.routers import upload

# Настройка логирования
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Создаем приложение
app = FastAPI(
    title="Migratio Map API",
    description="API для визуализации и анализа внутренней миграции в Украине",
    version="1.0.0"
)

# Настройка CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Middleware для логирования запросов
@app.middleware("http")
async def log_requests(request: Request, call_next):
    logger.info(f"Request: {request.method} {request.url}")
    try:
        response = await call_next(request)
        logger.info(f"Response status: {response.status_code}")
        return response
    except Exception as e:
        logger.error(f"Request failed: {str(e)}")
        return JSONResponse(
            status_code=500,
            content={"detail": "Internal server error"}
        )

# Подключаем маршруты
app.include_router(migration_router, prefix="/api/migration", tags=["migration"])
app.include_router(cities_router, tags=["cities"])
app.include_router(upload.router, prefix="/api/upload", tags=["upload"])

@app.get("/api/health")
async def health_check():
    return {"status": "ok"}

@app.get("/health")
async def health_check_alt():
    return {"status": "ok"}

@app.get("/api/test")
async def test_connection(
    neo4j_service: Neo4jService = Depends(get_neo4j_service)
) -> List[Dict[str, Any]]:
    """Тестовый маршрут для проверки подключения к базе данных"""
    try:
        logger.info("Тестовый запрос к базе данных")
        
        query = """
        MATCH (p:Person)-[r:MIGRATES_TO]->(to:City)
        MATCH (p)-[r2:MIGRATES_FROM]->(from:City)
        RETURN p.first_name as first_name,
               p.last_name as last_name,
               from.name as from_city,
               to.name as to_city
        """
        
        result = neo4j_service.execute_query(query)
        logger.info(f"Получено результатов: {len(result)}")
        
        return result
        
    except Exception as e:
        logger.error(f"Ошибка при тестовом запросе: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

# Логируем доступные маршруты при запуске
@app.on_event("startup")
async def startup_event():
    logger.info("Available routes:")
    for route in app.routes:
        logger.info(f"{route.path} {route.methods}")

@app.on_event("shutdown")
async def shutdown_event():
    from src.dependencies import get_neo4j_service
    neo4j_service = get_neo4j_service()
    neo4j_service.close()

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(
        app,
        host="0.0.0.0",
        port=8000,
        timeout_keep_alive=30,
        access_log=True
    ) 