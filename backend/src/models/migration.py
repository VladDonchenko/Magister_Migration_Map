from pydantic import BaseModel
from typing import Optional, List
from datetime import datetime

class CityBase(BaseModel):
    name: str
    latitude: float
    longitude: float

class MigrationBase(BaseModel):
    id: str
    person_name: str
    gender: str
    age: int
    migration_date: datetime
    reason: str
    distance_km: float
    education_level: str
    occupation: str
    family_status: str
    has_children: bool
    number_of_children: int
    monthly_income: int
    housing_type: str
    transport_type: str
    duration_of_stay: int
    return_planned: bool
    return_date: Optional[datetime] = None

class MigrationFlow(BaseModel):
    fromCity: str
    toCity: str
    count: int
    distance: float

class MigrationStats(BaseModel):
    totalMigrations: int
    averageAge: float
    maleCount: int
    femaleCount: int

class CityStats(BaseModel):
    outgoingCount: int
    incomingCount: int
    averageDistance: float 