// Создание городов
CREATE (kyiv:City {
                name: 'Київ',
    latitude: 50.4501,
    longitude: 30.5234,
    population: 2967000
});

CREATE (kharkiv:City {
                name: 'Харків',
    latitude: 49.9935,
    longitude: 36.2304,
    population: 1441000
});

CREATE (odesa:City {
                name: 'Одеса',
    latitude: 46.4825,
    longitude: 30.7233,
    population: 1017000
});

CREATE (dnipro:City {
                name: 'Дніпро',
    latitude: 48.4647,
    longitude: 35.0462,
    population: 990000
});

CREATE (donetsk:City {
                name: 'Донецьк',
    latitude: 48.0159,
    longitude: 37.8028,
    population: 905000
});

CREATE (zaporizhzhia:City {
                name: 'Запоріжжя',
    latitude: 47.8388,
    longitude: 35.1396,
    population: 722000
});

CREATE (lviv:City {
                name: 'Львів',
    latitude: 49.8397,
    longitude: 24.0297,
    population: 721000
});

CREATE (sumy:City {
                name: 'Суми',
    latitude: 50.9077,
    longitude: 34.7981,
    population: 259000
});

CREATE (poltava:City {
                name: 'Полтава',
    latitude: 49.5883,
    longitude: 34.5514,
    population: 288000
});

CREATE (vinnytsia:City {
                name: 'Вінниця',
    latitude: 49.2331,
    longitude: 28.4682,
    population: 370000
});

// Создание людей и миграций
CREATE (p1:Person {
    id: 'person_1',
    name: 'Іван Петренко',
    gender: 'Чоловік',
    age: 29
});

            MATCH (from:City {name: 'Суми'})
            MATCH (to:City {name: 'Одеса'})
CREATE (p1)-[:MIGRATED {
    date: '2024-02-25',
                reason: 'Сімейні обставини',
    distance_km: 576.11,
    has_children: false,
    transport_type: 'Потяг',
    monthly_income: 15000,
    time: '13:46',
    number_of_children: 0,
    housing_type: 'Тимчасове житло',
    duration_of_stay: 180
}]->(to);

CREATE (p2:Person {
    id: 'person_2',
    name: 'Марія Коваленко',
    gender: 'Жінка',
    age: 19
});

            MATCH (from:City {name: 'Київ'})
            MATCH (to:City {name: 'Харків'})
CREATE (p2)-[:MIGRATED {
    date: '2024-02-23',
                reason: 'Екологічні причини',
    distance_km: 410.33,
    has_children: false,
    transport_type: 'Автобус',
    monthly_income: 12000,
    time: '09:30',
    number_of_children: 0,
    housing_type: 'Квартира',
    duration_of_stay: 365
}]->(to)
CREATE (p2)-[:PLANS_RETURN {
    return_date: '2025-02-23'
}]->(from);

            MATCH (from:City {name: 'Вінниця'})
            MATCH (to:City {name: 'Донецьк'})
CREATE (m11:Migration {
                id: 'mig_2135',
                person_name: 'Person_57',
                gender: 'Чоловік',
                age: 49,
                migration_date: '2025-02-26',
                reason: 'Покращення житлових умов',
                distance_km: 700.85
            })
CREATE (from)-[:MIGRATION_TO {date: '2025-02-26'}]->(m11)
CREATE (m11)-[:MIGRATION_TO {date: '2025-02-26'}]->(to)

            MATCH (from:City {name: 'Київ'})
            MATCH (to:City {name: 'Полтава'})
CREATE (m12:Migration {
                id: 'mig_5070',
                person_name: 'Person_279',
                gender: 'Чоловік',
                age: 51,
                migration_date: '2025-01-14',
                reason: 'Навчання',
                distance_km: 304.13
            })
CREATE (from)-[:MIGRATION_TO {date: '2025-01-14'}]->(m12)
CREATE (m12)-[:MIGRATION_TO {date: '2025-01-14'}]->(to)

            MATCH (from:City {name: 'Львів'})
            MATCH (to:City {name: 'Дніпро'})
CREATE (m13:Migration {
                id: 'mig_5716',
                person_name: 'Person_449',
                gender: 'Чоловік',
                age: 48,
                migration_date: '2025-02-23',
                reason: 'Бізнес',
                distance_km: 817.27
            })
CREATE (from)-[:MIGRATION_TO {date: '2025-02-23'}]->(m13)
CREATE (m13)-[:MIGRATION_TO {date: '2025-02-23'}]->(to)

            MATCH (from:City {name: 'Київ'})
            MATCH (to:City {name: 'Дніпро'})
CREATE (m14:Migration {
                id: 'mig_5227',
                person_name: 'Person_976',
                gender: 'Жінка',
                age: 39,
                migration_date: '2025-01-07',
                reason: 'Сімейні обставини',
    distance_km: 480.0
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-07'}]->(m14)
CREATE (m14)-[:MIGRATION_TO {date: '2025-01-07'}]->(to)

// ... добавьте больше записей по аналогии ...
            