// Создание городов
CREATE (c1:City {name: 'Київ', latitude: 50.4501, longitude: 30.5234, population: 2962180})
CREATE (c2:City {name: 'Харків', latitude: 49.9935, longitude: 36.2304, population: 1431126})
CREATE (c3:City {name: 'Одеса', latitude: 46.4825, longitude: 30.7233, population: 1017699})
CREATE (c4:City {name: 'Дніпро', latitude: 48.4647, longitude: 35.0462, population: 980948})
CREATE (c5:City {name: 'Львів', latitude: 49.8397, longitude: 24.0297, population: 717273});

// Создание миграций
CREATE (p1:Person {name: 'Іван Петренко', gender: 'Чоловіча', age: 25})
CREATE (p2:Person {name: 'Марія Коваленко', gender: 'Жіноча', age: 30})
CREATE (p3:Person {name: 'Олег Сидоренко', gender: 'Чоловіча', age: 35})
CREATE (p4:Person {name: 'Анна Мельник', gender: 'Жіноча', age: 28})
CREATE (p5:Person {name: 'Василь Іваненко', gender: 'Чоловіча', age: 42});

// Создание связей миграции
CREATE (p1)-[:MIGRATED {
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
}]->(c1)

CREATE (p2)-[:MIGRATED {
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
}]->(c2)

CREATE (p3)-[:MIGRATED {
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
}]->(c3)

CREATE (p4)-[:MIGRATED {
    date: '2024-03-01',
    reason: 'Сімейні обставини',
    distance_km: 280.6,
    has_children: true,
    transport_type: 'Потяг',
    monthly_income: 12000,
    time: '09:45',
    number_of_children: 1,
    housing_type: 'Оренда квартири',
    duration_of_stay: 120
}]->(c4)

CREATE (p5)-[:MIGRATED {
    date: '2024-03-15',
    reason: 'Медичні причини',
    distance_km: 420.9,
    has_children: false,
    transport_type: 'Літак',
    monthly_income: 25000,
    time: '11:30',
    number_of_children: 0,
    housing_type: 'Оренда квартири',
    duration_of_stay: 60
}]->(c5);

// Создание связей планов возврата
CREATE (p1)-[:PLANS_RETURN {
    planned_date: '2024-12-15',
    reason: 'Сімейні обставини',
    probability: 0.8
}]->(c2)

CREATE (p2)-[:PLANS_RETURN {
    planned_date: '2024-10-01',
    reason: 'Робота',
    probability: 0.6
}]->(c3)

CREATE (p3)-[:PLANS_RETURN {
    planned_date: '2025-06-15',
    reason: 'Навчання',
    probability: 0.9
}]->(c1)

CREATE (p4)-[:PLANS_RETURN {
    planned_date: '2024-09-01',
    reason: 'Сімейні обставини',
    probability: 0.7
}]->(c5)

CREATE (p5)-[:PLANS_RETURN {
    planned_date: '2024-11-15',
    reason: 'Медичні причини',
    probability: 0.5
}]->(c4); 