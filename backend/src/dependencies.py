from functools import lru_cache
from fastapi import Depends
from src.services.neo4j_service import Neo4jService

@lru_cache()
def get_neo4j_service() -> Neo4jService:
    """
    Dependency для получения экземпляра Neo4jService
    """
    return Neo4jService() 