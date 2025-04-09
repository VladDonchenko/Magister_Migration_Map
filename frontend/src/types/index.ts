export interface City {
    id: string;
    name: string;
    latitude: number;
    longitude: number;
}

export interface MigrationFlow {
    fromCity: string;
    toCity: string;
    count: number;
    distance: number;
}

export interface MigrationStats {
    totalMigrations: number;
    averageAge: number;
    maleCount: number;
    femaleCount: number;
}

export interface CityStats {
    outgoingCount: number;
    incomingCount: number;
    averageDistance: number;
} 