# -*- coding: utf-8 -*-

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from src.routes import cities, migration
from src.services.neo4j_service import Neo4jService

app = FastAPI(title="Migration Map API")

# Настройка CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],  # Разрешаем запросы с React приложения
    allow_credentials=True,
    allow_methods=["*"],  # Разрешаем все HTTP методы
    allow_headers=["*"],  # Разрешаем все заголовки
)

# Инициализация сервиса Neo4j
neo4j_service = Neo4jService()

# Подключаем роуты
app.include_router(cities.router, prefix="/api/v1")
app.include_router(migration.router, prefix="/api/v1")

@app.on_event("shutdown")
async def shutdown_event():
    neo4j_service.close()

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000) 