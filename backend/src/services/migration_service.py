from typing import List, Dict, Any
from services.neo4j_service import Neo4jService

class MigrationService:
    def __init__(self):
        self.neo4j_service = Neo4jService()

    async def get_migration_stats(self) -> Dict[str, Any]:
        """Получение общей статистики миграции"""
        stats = self.neo4j_service.get_migration_stats()
        return {
            "totalMigrations": stats["totalMigrations"],
            "averageAge": stats["averageAge"],
            "maleCount": stats["maleCount"],
            "femaleCount": stats["femaleCount"]
        }

    async def get_migration_flows(self) -> List[Dict[str, Any]]:
        """Получение потоков миграции"""
        return self.neo4j_service.get_migration_flows()

    async def get_migration_reasons(self) -> List[Dict[str, Any]]:
        """Получение причин миграции"""
        # TODO: Реализовать получение причин миграции из Neo4j
        return [] 