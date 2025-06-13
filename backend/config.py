from pydantic import BaseSettings

class Settings(BaseSettings):
    NEO4J_URI: str = "bolt://neo4j:7687"
    NEO4J_USER: str = "neo4j"
    NEO4J_PASSWORD: str = "password"
    
    class Config:
        env_file = ".env"

settings = Settings() 