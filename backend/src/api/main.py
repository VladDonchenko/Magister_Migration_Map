from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from typing import List, Dict, Any, Optional
from datetime import datetime
import sys
import os

# Додаємо шлях до кореневої директорії проекту
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from utils.neo4j_client import Neo4jClient

app = FastAPI(title="Migration Map API")

# Налаштування CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # В продакшені замінити на конкретні домени
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Ініціалізація Neo4j клієнта
neo4j_client = Neo4jClient()

@app.on_event("startup")
async def startup_event():
    neo4j_client.connect()

@app.on_event("shutdown")
async def shutdown_event():
    neo4j_client.close()

@app.get("/")
async def root():
    return {"message": "Migration Map API"}

@app.get("/cities/{city_name}/stats")
async def get_city_stats(city_name: str):
    try:
        stats = neo4j_client.get_city_stats(city_name)
        if not stats:
            raise HTTPException(status_code=404, detail="Місто не знайдено")
        return stats
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/migrations/routes")
async def get_migration_routes(
    start_date: Optional[str] = None,
    end_date: Optional[str] = None
):
    try:
        routes = neo4j_client.get_migration_routes(start_date, end_date)
        return routes
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/cities/{city_name}/connections")
async def get_city_connections(city_name: str):
    try:
        connections = neo4j_client.get_city_connections(city_name)
        return connections
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/migrations/patterns")
async def get_migration_patterns():
    try:
        patterns = neo4j_client.get_migration_patterns()
        return patterns
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/migrations/route/{route_id}")
async def get_route_details(route_id: int):
    try:
        # Отримуємо всі міграції для даного маршруту
        query = """
        MATCH (from:City)-[m:MIGRATION]->(to:City)
        WHERE m.id = $route_id
        RETURN from, m, to
        """
        result = neo4j_client.run(query, route_id=route_id)
        
        if not result:
            raise HTTPException(status_code=404, detail="Маршрут не знайдено")
            
        # Формуємо відповідь
        route_data = {
            "id": route_id,
            "from_city": {
                "name": result[0]["from"]["name"],
                "lat": result[0]["from"]["lat"],
                "lng": result[0]["from"]["lng"],
                "population": result[0]["from"]["population"]
            },
            "to_city": {
                "name": result[0]["to"]["name"],
                "lat": result[0]["to"]["lat"],
                "lng": result[0]["to"]["lng"],
                "population": result[0]["to"]["population"]
            },
            "distance_km": result[0]["m"]["distance_km"],
            "migrations": []
        }
        
        # Отримуємо всі міграції для цього маршруту
        query = """
        MATCH (from:City)-[m:MIGRATION]->(to:City)
        WHERE from.name = $from_city AND to.name = $to_city
        RETURN m
        ORDER BY m.migration_date DESC
        """
        migrations = neo4j_client.run(query, 
            from_city=route_data["from_city"]["name"],
            to_city=route_data["to_city"]["name"]
        )
        
        for migration in migrations:
            route_data["migrations"].append({
                "id": migration["m"]["id"],
                "migration_date": migration["m"]["migration_date"],
                "reason": migration["m"]["reason"],
                "age": migration["m"]["age"],
                "gender": migration["m"]["gender"]
            })
            
        # Отримуємо прогнозовані причини міграції
        query = """
        MATCH (from:City)-[m:MIGRATION]->(to:City)
        WHERE from.name = $from_city AND to.name = $to_city
        WITH m.reason as reason, count(*) as count
        RETURN reason, toFloat(count) / toFloat($total) as probability
        ORDER BY probability DESC
        LIMIT 5
        """
        predictions = neo4j_client.run(query,
            from_city=route_data["from_city"]["name"],
            to_city=route_data["to_city"]["name"],
            total=len(route_data["migrations"])
        )
        
        route_data["predicted_reasons"] = {
            pred["reason"]: pred["probability"]
            for pred in predictions
        }
        
        return route_data
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e)) 