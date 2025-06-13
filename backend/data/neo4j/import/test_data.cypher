// Создание городов
MERGE (c1:City {name: 'Київ', latitude: 50.4501, longitude: 30.5234, population: 2967000, is_region_center: true})
MERGE (c2:City {name: 'Харків', latitude: 49.9935, longitude: 36.2304, population: 1441000, is_region_center: true})
MERGE (c3:City {name: 'Одеса', latitude: 46.4825, longitude: 30.7233, population: 1017000, is_region_center: true})
MERGE (c4:City {name: 'Дніпро', latitude: 48.4647, longitude: 35.0462, population: 990000, is_region_center: true})
MERGE (c5:City {name: 'Львів', latitude: 49.8397, longitude: 24.0297, population: 721000, is_region_center: true});

// Создание миграций
CREATE (p1:Person {id: 'mig_1', name: 'Іван Петренко', gender: 'Чоловіча', age: 25})
CREATE (p2:Person {id: 'mig_2', name: 'Марія Коваленко', gender: 'Жіноча', age: 30})
CREATE (p3:Person {id: 'mig_3', name: 'Олег Сидоренко', gender: 'Чоловіча', age: 35})
CREATE (p4:Person {id: 'mig_4', name: 'Анна Мельник', gender: 'Жіноча', age: 28})
CREATE (p5:Person {id: 'mig_5', name: 'Василь Іваненко', gender: 'Чоловіча', age: 42});

// Создание связей миграции
MATCH (p:Person {id: 'mig_1'})
MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Київ'})
CREATE (from)<-[r1:MIGRATED {
    date: '2024-01-15',
    reason: 'Покращення умов життя',
    distance_km: 480.5,
    has_children: false,
    transport_type: 'Потяг',
    monthly_income: 15000,
    time: '10:30',
    number_of_children: 0,
    housing_type: 'Оренда квартири',
    duration_of_stay: 90
}]-(p)
CREATE (p)-[r2:MIGRATED_TO]->(to);

MATCH (p:Person {id: 'mig_2'})
MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Львів'})
CREATE (from)<-[r1:MIGRATED {
    date: '2024-02-01',
    reason: 'Робота',
    distance_km: 320.8,
    has_children: true,
    transport_type: 'Автобус',
    monthly_income: 20000,
    time: '08:15',
    number_of_children: 2,
    housing_type: 'Власна квартира',
    duration_of_stay: 180
}]-(p)
CREATE (p)-[r2:MIGRATED_TO]->(to);

MATCH (p:Person {id: 'mig_3'})
MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Київ'})
CREATE (from)<-[r1:MIGRATED {
    date: '2024-02-15',
    reason: 'Навчання',
    distance_km: 150.3,
    has_children: false,
    transport_type: 'Автомобіль',
    monthly_income: 8000,
    time: '14:20',
    number_of_children: 0,
    housing_type: 'Гуртожиток',
    duration_of_stay: 365
}]-(p)
CREATE (p)-[r2:MIGRATED_TO]->(to);

// Создание связей планов возврата
MATCH (p:Person {id: 'mig_1'})
MATCH (from:City {name: 'Харків'})
CREATE (p)-[r:PLANS_RETURN {
    planned_date: '2024-12-15',
    reason: 'Сімейні обставини',
    probability: 0.8
}]->(from);

MATCH (p:Person {id: 'mig_2'})
MATCH (from:City {name: 'Одеса'})
CREATE (p)-[r:PLANS_RETURN {
    planned_date: '2024-10-01',
    reason: 'Робота',
    probability: 0.6
}]->(from); 