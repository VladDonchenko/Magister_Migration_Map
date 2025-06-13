import pandas as pd
from typing import List, Dict, Any
import logging
from datetime import datetime
from .neo4j_service import Neo4jService

logger = logging.getLogger(__name__)

class ExcelService:
    def __init__(self):
        self.neo4j_service = Neo4jService()

    async def process_excel_file(self, file_path: str) -> Dict[str, Any]:
        try:
            # Читаем Excel файл
            df = pd.read_excel(file_path)
            
            # Проверяем необходимые колонки
            required_columns = ['first_name', 'last_name', 'from_city', 'to_city', 'migration_date']
            missing_columns = [col for col in required_columns if col not in df.columns]
            
            if missing_columns:
                raise ValueError(f"Отсутствуют обязательные колонки: {', '.join(missing_columns)}")

            # Преобразуем DataFrame в список словарей
            migrations = df.to_dict('records')
            
            # Создаем узлы и связи в Neo4j
            for migration in migrations:
                # Форматируем дату
                if 'migration_date' in migration:
                    migration['migration_date'] = pd.to_datetime(migration['migration_date']).strftime('%Y-%m-%d')
                
                # Создаем узлы городов и человека, и связь миграции
                query = """
                MERGE (from:City {name: $from_city})
                MERGE (to:City {name: $to_city})
                CREATE (p:Person {
                    first_name: $first_name,
                    last_name: $last_name
                })
                CREATE (p)-[:MIGRATED {date: $migration_date}]->(to)
                CREATE (p)-[:LIVED_IN]->(from)
                """
                
                with self.neo4j_service.driver.session() as session:
                    session.run(query, migration)

            return {
                "status": "success",
                "message": f"Обработано {len(migrations)} записей",
                "processed_records": len(migrations)
            }

        except Exception as e:
            logger.error(f"Ошибка при обработке Excel файла: {str(e)}")
            raise Exception(f"Ошибка при обработке файла: {str(e)}")

    def validate_excel_structure(self, df: pd.DataFrame) -> bool:
        """Проверяет структуру Excel файла"""
        required_columns = ['first_name', 'last_name', 'from_city', 'to_city', 'migration_date']
        return all(col in df.columns for col in required_columns) 