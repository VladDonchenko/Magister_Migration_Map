export interface City {
    name: string;
    latitude: number;
    longitude: number;
    country?: string;
    region?: string;
    population: number;
    incomingMigrations: number;
    outgoingMigrations: number;
}

export interface Migrant {
    firstName: string;
    lastName: string;
    age?: number;
    gender?: string;
    profession?: string;
    education?: string;
    familyStatus?: string;
    reason?: string;
    transportType?: string;
    housingType?: string;
}

export interface MigrationFlow {
    fromCity: City;
    toCity: City;
    count: number;
    migrants: Migrant[];
}

export interface MigrationMapResponse {
    cities: City[];
    migrations: MigrationFlow[];
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