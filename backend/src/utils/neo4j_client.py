from neo4j import GraphDatabase
from typing import List, Dict, Any
import os
from dotenv import load_dotenv
import json

load_dotenv()

class Neo4jClient:
    def __init__(self):
        self.uri = os.getenv("NEO4J_URI", "bolt://localhost:7687")
        self.user = os.getenv("NEO4J_USER", "neo4j")
        self.password = os.getenv("NEO4J_PASSWORD", "password")
        self.driver = None

    def connect(self):
        self.driver = GraphDatabase.driver(self.uri, auth=(self.user, self.password))

    def close(self):
        if self.driver:
            self.driver.close()

    def execute_query(self, query: str) -> List[Dict[str, Any]]:
        with self.driver.session() as session:
            result = session.run(query)
            return [dict(record) for record in result]

    def save_migration(self, migration_data: str) -> None:
        """Збереження міграції в Neo4j"""
        try:
            migration = json.loads(migration_data)
            query = f"""
            MATCH (from:City {{name: '{migration['from_city']['name']}'}})
            MATCH (to:City {{name: '{migration['to_city']['name']}'}})
            CREATE (m:Migration {{
                id: '{migration['id']}',
                person_name: '{migration['person_name']}',
                gender: '{migration['gender']}',
                age: {migration['age']},
                migration_date: '{migration['migration_date']}',
                reason: '{migration['reason']}',
                distance_km: {migration['distance_km']}
            }})
            CREATE (from)-[:MIGRATION_TO {{date: '{migration['migration_date']}'}}]->(m)
            CREATE (m)-[:MIGRATION_TO {{date: '{migration['migration_date']}'}}]->(to)
            """
            self.execute_query(query)
        except Exception as e:
            print(f"Помилка збереження міграції: {str(e)}")

    def get_city_stats(self, city_name: str) -> Dict[str, Any]:
        query = f"""
        MATCH (c:City {{name: '{city_name}'}})
        OPTIONAL MATCH (c)-[:MIGRATION_TO]->(m:Migration)
        WITH c, count(m) as emigrations
        OPTIONAL MATCH (m:Migration)-[:MIGRATION_TO]->(c)
        WITH c, emigrations, count(m) as immigrations
        OPTIONAL MATCH (c)-[:MIGRATION_TO]->(m:Migration)
        WITH c, emigrations, immigrations, m
        RETURN {{
            city_name: c.name,
            total_emigrations: emigrations,
            total_immigrations: immigrations,
            gender_distribution: collect(DISTINCT m.gender),
            age_distribution: collect(DISTINCT m.age)
        }} as stats
        """
        result = self.execute_query(query)
        return result[0] if result else {}

    def get_migration_routes(self, start_date: str = None, end_date: str = None) -> List[Dict[str, Any]]:
        date_filter = ""
        if start_date and end_date:
            date_filter = f"WHERE m.migration_date >= '{start_date}' AND m.migration_date <= '{end_date}'"
        
        query = f"""
        MATCH (from:City)-[:MIGRATION_TO]->(m:Migration)-[:MIGRATION_TO]->(to:City)
        {date_filter}
        RETURN {{
            from_city: from.name,
            to_city: to.name,
            count: count(m),
            dates: collect(m.migration_date)
        }} as route
        """
        return self.execute_query(query)

    def get_city_connections(self, city_name: str) -> List[Dict[str, Any]]:
        query = f"""
        MATCH (c:City {{name: '{city_name}'}})
        OPTIONAL MATCH (c)-[:MIGRATION_TO]->(m:Migration)-[:MIGRATION_TO]->(connected:City)
        RETURN {{
            connected_city: connected.name,
            migration_count: count(m),
            direction: 'outgoing'
        }} as connection
        UNION
        MATCH (c:City {{name: '{city_name}'}})
        OPTIONAL MATCH (connected:City)-[:MIGRATION_TO]->(m:Migration)-[:MIGRATION_TO]->(c)
        RETURN {{
            connected_city: connected.name,
            migration_count: count(m),
            direction: 'incoming'
        }} as connection
        """
        return self.execute_query(query)

    def get_migration_patterns(self) -> List[Dict[str, Any]]:
        query = """
        MATCH (m:Migration)
        WITH m.reason as reason, count(*) as count
        RETURN {
            reason: reason,
            count: count
        } as pattern
        ORDER BY count DESC
        """
        return self.execute_query(query) 