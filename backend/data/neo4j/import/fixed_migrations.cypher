// Создание городов
CREATE (city0:City {name: 'Київ', latitude: 50.4501, longitude: 30.5234, population: 2962180, region: 'Київська область'})
CREATE (city1:City {name: 'Харків', latitude: 49.9935, longitude: 36.2304, population: 1441072, region: 'Харківська область'})
CREATE (city2:City {name: 'Одеса', latitude: 46.4825, longitude: 30.7233, population: 1017699, region: 'Одеська область'})
CREATE (city3:City {name: 'Дніпро', latitude: 48.4647, longitude: 35.0462, population: 980948, region: 'Дніпропетровська область'})
CREATE (city4:City {name: 'Донецьк', latitude: 48.0159, longitude: 37.8028, population: 905364, region: 'Донецька область'})
CREATE (city5:City {name: 'Запоріжжя', latitude: 47.8388, longitude: 35.1396, population: 722713, region: 'Запорізька область'})
CREATE (city6:City {name: 'Львів', latitude: 49.8397, longitude: 24.0297, population: 717273, region: 'Львівська область'})
CREATE (city7:City {name: 'Суми', latitude: 50.9077, longitude: 34.7981, population: 259660, region: 'Сумська область'})
CREATE (city8:City {name: 'Полтава', latitude: 49.5883, longitude: 34.5514, population: 286649, region: 'Полтавська область'})
CREATE (city9:City {name: 'Вінниця', latitude: 49.2331, longitude: 28.4682, population: 370601, region: 'Вінницька область'});

// Создание миграций с правильными связями
MATCH (origin:City {name: 'Київ'}), (destination:City {name: 'Одеса'})
CREATE (p:Person {
    name: 'Іван Петренко',
    gender: 'Чоловік',
    age: 35,
    education: 'Вища',
    occupation: 'Інженер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 25000,
    housing_type: 'Квартира'
})
CREATE (p)-[r1:MIGRATED {
    date: '2024-03-15',
    time: '10:30',
    reason: 'Робота',
    distance_km: 471.5,
    transport_type: 'Літак',
    duration_of_stay: 365,
    return_planned: true
}]->(origin)
CREATE (p)-[r2:MIGRATED {
    date: '2024-03-15',
    time: '10:30',
    reason: 'Робота',
    distance_km: 471.5,
    transport_type: 'Літак',
    duration_of_stay: 365,
    return_planned: true
}]->(destination);

MATCH (origin:City {name: 'Львів'}), (destination:City {name: 'Київ'})
CREATE (p:Person {
    name: 'Марія Коваленко',
    gender: 'Жінка',
    age: 28,
    education: 'Вища',
    occupation: 'Дизайнер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 20000,
    housing_type: 'Квартира'
})
CREATE (p)-[r1:MIGRATED {
    date: '2024-03-10',
    time: '15:45',
    reason: 'Навчання',
    distance_km: 467.5,
    transport_type: 'Потяг',
    duration_of_stay: 730,
    return_planned: false
}]->(origin)
CREATE (p)-[r2:MIGRATED {
    date: '2024-03-10',
    time: '15:45',
    reason: 'Навчання',
    distance_km: 467.5,
    transport_type: 'Потяг',
    duration_of_stay: 730,
    return_planned: false
}]->(destination);

MATCH (origin:City {name: 'Харків'}), (destination:City {name: 'Дніпро'})
CREATE (p:Person {
    name: 'Олег Сидоренко',
    gender: 'Чоловік',
    age: 42,
    education: 'Середня спеціальна',
    occupation: 'Водій',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 18000,
    housing_type: 'Будинок'
})
CREATE (p)-[r1:MIGRATED {
    date: '2024-03-01',
    time: '08:15',
    reason: 'Сімейні обставини',
    distance_km: 215.3,
    transport_type: 'Автобус',
    duration_of_stay: 180,
    return_planned: true
}]->(origin)
CREATE (p)-[r2:MIGRATED {
    date: '2024-03-01',
    time: '08:15',
    reason: 'Сімейні обставини',
    distance_km: 215.3,
    transport_type: 'Автобус',
    duration_of_stay: 180,
    return_planned: true
}]->(destination); 