CREATE (city0:City {
    name: 'Київ',
    lat: 50.4501,
    lng: 30.5234,
    population: 2962180,
    region: 'Київська область'
})
CREATE (city1:City {
    name: 'Харків',
    lat: 49.9935,
    lng: 36.2304,
    population: 1441072,
    region: 'Харківська область'
})
CREATE (city2:City {
    name: 'Одеса',
    lat: 46.4825,
    lng: 30.7233,
    population: 1017699,
    region: 'Одеська область'
})
CREATE (city3:City {
    name: 'Дніпро',
    lat: 48.4647,
    lng: 35.0462,
    population: 980948,
    region: 'Дніпропетровська область'
})
CREATE (city4:City {
    name: 'Донецьк',
    lat: 48.0159,
    lng: 37.8028,
    population: 905364,
    region: 'Донецька область'
})
CREATE (city5:City {
    name: 'Запоріжжя',
    lat: 47.8388,
    lng: 35.1396,
    population: 722713,
    region: 'Запорізька область'
})
CREATE (city6:City {
    name: 'Львів',
    lat: 49.8397,
    lng: 24.0297,
    population: 717273,
    region: 'Львівська область'
})
CREATE (city7:City {
    name: 'Суми',
    lat: 50.9077,
    lng: 34.7981,
    population: 259660,
    region: 'Сумська область'
})
CREATE (city8:City {
    name: 'Полтава',
    lat: 49.5883,
    lng: 34.5514,
    population: 286649,
    region: 'Полтавська область'
})
CREATE (city9:City {
    name: 'Вінниця',
    lat: 49.2331,
    lng: 28.4682,
    population: 370601,
    region: 'Вінницька область'
})
CREATE (city10:City {
    name: 'Черкаси',
    lat: 49.4444,
    lng: 32.0598,
    population: 274762,
    region: 'Черкаська область'
})
CREATE (city11:City {
    name: 'Чернівці',
    lat: 48.2917,
    lng: 25.9354,
    population: 267060,
    region: 'Чернівецька область'
})
CREATE (city12:City {
    name: 'Тернопіль',
    lat: 49.5535,
    lng: 25.5948,
    population: 223462,
    region: 'Тернопільська область'
})
CREATE (city13:City {
    name: 'Рівне',
    lat: 50.6199,
    lng: 26.2516,
    population: 245289,
    region: 'Рівненська область'
})
CREATE (city14:City {
    name: 'Кропивницький',
    lat: 48.5132,
    lng: 32.2597,
    population: 227413,
    region: 'Кіровоградська область'
})
WITH *
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Одеса'})
CREATE (m0:Migration {
    id: 'mig_0',
    person_name: 'Поліна Калиненко',
    gender: 'Жінка',
    age: 68,
    migration_date: '2023-08-11',
    migration_time: '11:49',
    reason: 'Політичні причини',
    distance_km: 565.45,
    education_level: 'Вища',
    occupation: 'Менеджер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 21360,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 2306,
    return_planned: true, return_date: '2024-05-07'
})-[:MIGRATION_FROM]->(from)
CREATE (m0)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Львів'})
CREATE (m1:Migration {
    id: 'mig_1',
    person_name: 'Валентина Мельник',
    gender: 'Жінка',
    age: 28,
    migration_date: '2021-12-16',
    migration_time: '03:47',
    reason: 'Сімейні обставини',
    distance_km: 327.26,
    education_level: 'Магістр',
    occupation: 'Підприємець',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 33017,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 715,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m1)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Дніпро'})
CREATE (m2:Migration {
    id: 'mig_2',
    person_name: 'Ганна Ковальчук',
    gender: 'Жінка',
    age: 58,
    migration_date: '2021-08-03',
    migration_time: '03:01',
    reason: 'Освітні причини',
    distance_km: 205.41,
    education_level: 'Середня спеціальна',
    occupation: 'Перекладач',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 4,
    monthly_income: 40651,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 394,
    return_planned: true, return_date: '2023-05-25'
})-[:MIGRATION_FROM]->(from)
CREATE (m2)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Донецьк'})
CREATE (m3:Migration {
    id: 'mig_3',
    person_name: 'Олена Петриченко',
    gender: 'Жінка',
    age: 22,
    migration_date: '2023-06-04',
    migration_time: '23:24',
    reason: 'Економічні причини',
    distance_km: 698.82,
    education_level: 'Доктор наук',
    occupation: 'Дизайнер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 24109,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1686,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m3)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Кропивницький'})
CREATE (m4:Migration {
    id: 'mig_4',
    person_name: 'Світлана Сидоренко',
    gender: 'Жінка',
    age: 35,
    migration_date: '2022-02-04',
    migration_time: '13:46',
    reason: 'Сімейні обставини',
    distance_km: 205.37,
    education_level: 'Вища',
    occupation: 'Вчитель',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 15484,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 2673,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m4)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Запоріжжя'})
CREATE (m5:Migration {
    id: 'mig_5',
    person_name: 'Юлія Грищенко',
    gender: 'Жінка',
    age: 20,
    migration_date: '2023-11-30',
    migration_time: '08:22',
    reason: 'Політичні причини',
    distance_km: 69.94,
    education_level: 'Середня',
    occupation: 'Дизайнер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 26343,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 2942,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m5)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Одеса'})
CREATE (m6:Migration {
    id: 'mig_6',
    person_name: 'Христина Сидоренко',
    gender: 'Жінка',
    age: 51,
    migration_date: '2022-12-19',
    migration_time: '16:05',
    reason: 'Екологічні причини',
    distance_km: 575.61,
    education_level: 'Середня',
    occupation: 'Менеджер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 0,
    monthly_income: 8276,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1384,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m6)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Одеса'})
CREATE (m7:Migration {
    id: 'mig_7',
    person_name: 'Євген Левченко',
    gender: 'Чоловік',
    age: 37,
    migration_date: '2023-12-03',
    migration_time: '10:30',
    reason: 'Культурні причини',
    distance_km: 253.58,
    education_level: 'Магістр',
    occupation: 'Науковець',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 43011,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2147,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m7)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Вінниця'})
CREATE (m8:Migration {
    id: 'mig_8',
    person_name: 'Поліна Лисенко',
    gender: 'Жінка',
    age: 68,
    migration_date: '2024-02-03',
    migration_time: '01:02',
    reason: 'Екологічні причини',
    distance_km: 514.88,
    education_level: 'Вища',
    occupation: 'Лікар',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 5,
    monthly_income: 29860,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 816,
    return_planned: true, return_date: '2024-10-10'
})-[:MIGRATION_FROM]->(from)
CREATE (m8)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Харків'})
CREATE (m9:Migration {
    id: 'mig_9',
    person_name: 'Християн Попов',
    gender: 'Чоловік',
    age: 46,
    migration_date: '2021-05-07',
    migration_time: '10:47',
    reason: 'Бізнес',
    distance_km: 252.50,
    education_level: 'Магістр',
    occupation: 'Програміст',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 49053,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 35,
    return_planned: true, return_date: '2021-06-12'
})-[:MIGRATION_FROM]->(from)
CREATE (m9)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Запоріжжя'})
CREATE (m10:Migration {
    id: 'mig_10',
    person_name: 'Денис Гончар',
    gender: 'Чоловік',
    age: 43,
    migration_date: '2022-01-24',
    migration_time: '23:21',
    reason: 'Економічні причини',
    distance_km: 443.76,
    education_level: 'Доктор наук',
    occupation: 'Юрист',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 17809,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 878,
    return_planned: true, return_date: '2022-11-21'
})-[:MIGRATION_FROM]->(from)
CREATE (m10)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Кропивницький'})
CREATE (m11:Migration {
    id: 'mig_11',
    person_name: 'Ніна Пономарчук',
    gender: 'Жінка',
    age: 50,
    migration_date: '2023-10-17',
    migration_time: '14:39',
    reason: 'Культурні причини',
    distance_km: 253.58,
    education_level: 'Доктор наук',
    occupation: 'Менеджер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 5,
    monthly_income: 8822,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 2415,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m11)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Київ'})
CREATE (m12:Migration {
    id: 'mig_12',
    person_name: 'Валентин Олійник',
    gender: 'Чоловік',
    age: 49,
    migration_date: '2022-01-27',
    migration_time: '14:54',
    reason: 'Освітні причини',
    distance_km: 366.01,
    education_level: 'Вища',
    occupation: 'Науковець',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 3,
    monthly_income: 12693,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2112,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m12)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Запоріжжя'})
CREATE (m13:Migration {
    id: 'mig_13',
    person_name: 'Галина Гончар',
    gender: 'Жінка',
    age: 48,
    migration_date: '2021-07-07',
    migration_time: '22:34',
    reason: 'Навчання',
    distance_km: 725.45,
    education_level: 'Доктор наук',
    occupation: 'Пенсіонер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 48309,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1381,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m13)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Черкаси'})
CREATE (m14:Migration {
    id: 'mig_14',
    person_name: 'Артем Петриченко',
    gender: 'Чоловік',
    age: 51,
    migration_date: '2023-08-12',
    migration_time: '20:54',
    reason: 'Відновлення після війни',
    distance_km: 344.04,
    education_level: 'Магістр',
    occupation: 'Студент',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 8475,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 2389,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m14)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Тернопіль'})
CREATE (m15:Migration {
    id: 'mig_15',
    person_name: 'Борис Калиненко',
    gender: 'Чоловік',
    age: 69,
    migration_date: '2023-07-23',
    migration_time: '09:07',
    reason: 'Економічні причини',
    distance_km: 671.25,
    education_level: 'Доктор наук',
    occupation: 'Лікар',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 0,
    monthly_income: 27468,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 616,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m15)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Львів'})
CREATE (m16:Migration {
    id: 'mig_16',
    person_name: 'Роман Пономарчук',
    gender: 'Чоловік',
    age: 51,
    migration_date: '2022-11-12',
    migration_time: '08:54',
    reason: 'Культурні причини',
    distance_km: 467.53,
    education_level: 'Магістр',
    occupation: 'Бухгалтер',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 1,
    monthly_income: 23906,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 2550,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m16)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Чернівці'})
CREATE (m17:Migration {
    id: 'mig_17',
    person_name: 'Жанна Грищук',
    gender: 'Жінка',
    age: 39,
    migration_date: '2023-09-21',
    migration_time: '01:15',
    reason: 'Сімейні обставини',
    distance_km: 409.70,
    education_level: 'Магістр',
    occupation: 'Менеджер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 37645,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 2380,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m17)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Вінниця'})
CREATE (m18:Migration {
    id: 'mig_18',
    person_name: 'Роман Калиниченко',
    gender: 'Чоловік',
    age: 34,
    migration_date: '2022-08-27',
    migration_time: '06:58',
    reason: 'Покращення житлових умов',
    distance_km: 213.11,
    education_level: 'Вища',
    occupation: 'Вчитель',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 13640,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 536,
    return_planned: true, return_date: '2023-02-09'
})-[:MIGRATION_FROM]->(from)
CREATE (m18)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Дніпро'})
CREATE (m19:Migration {
    id: 'mig_19',
    person_name: 'Ігор Петриченко',
    gender: 'Чоловік',
    age: 38,
    migration_date: '2021-04-28',
    migration_time: '03:29',
    reason: 'Особисті причини',
    distance_km: 69.94,
    education_level: 'Доктор наук',
    occupation: 'Менеджер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 45408,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 1471,
    return_planned: true, return_date: '2022-04-10'
})-[:MIGRATION_FROM]->(from)
CREATE (m19)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Львів'})
CREATE (m20:Migration {
    id: 'mig_20',
    person_name: 'Тарас Калиненко',
    gender: 'Чоловік',
    age: 59,
    migration_date: '2023-05-25',
    migration_time: '06:48',
    reason: 'Політичні причини',
    distance_km: 180.28,
    education_level: 'Середня спеціальна',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 27354,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 294,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m20)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Одеса'})
CREATE (m21:Migration {
    id: 'mig_21',
    person_name: 'Назар Петренко',
    gender: 'Чоловік',
    age: 40,
    migration_date: '2023-03-31',
    migration_time: '00:05',
    reason: 'Сімейні обставини',
    distance_km: 620.77,
    education_level: 'Середня',
    occupation: 'Юрист',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 8626,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 1298,
    return_planned: true, return_date: '2024-10-23'
})-[:MIGRATION_FROM]->(from)
CREATE (m21)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Черкаси'})
CREATE (m22:Migration {
    id: 'mig_22',
    person_name: 'Ксенія Мельник',
    gender: 'Жінка',
    age: 21,
    migration_date: '2023-10-06',
    migration_time: '21:36',
    reason: 'Відновлення після війни',
    distance_km: 261.26,
    education_level: 'Магістр',
    occupation: 'Менеджер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 45871,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 3138,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m22)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Одеса'})
CREATE (m23:Migration {
    id: 'mig_23',
    person_name: 'Павло Пономарчук',
    gender: 'Чоловік',
    age: 43,
    migration_date: '2022-10-09',
    migration_time: '02:51',
    reason: 'Екологічні причини',
    distance_km: 560.66,
    education_level: 'Вища',
    occupation: 'Лікар',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 0,
    monthly_income: 41755,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 1418,
    return_planned: true, return_date: '2024-01-06'
})-[:MIGRATION_FROM]->(from)
CREATE (m23)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Одеса'})
CREATE (m24:Migration {
    id: 'mig_24',
    person_name: 'Денис Пономарчук',
    gender: 'Чоловік',
    age: 69,
    migration_date: '2021-12-12',
    migration_time: '14:38',
    reason: 'Економічні причини',
    distance_km: 511.75,
    education_level: 'Магістр',
    occupation: 'Вчитель',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 43752,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 3577,
    return_planned: true, return_date: '2022-02-28'
})-[:MIGRATION_FROM]->(from)
CREATE (m24)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Чернівці'})
CREATE (m25:Migration {
    id: 'mig_25',
    person_name: 'Назар Марченко',
    gender: 'Чоловік',
    age: 27,
    migration_date: '2021-09-06',
    migration_time: '15:54',
    reason: 'Кліматичні причини',
    distance_km: 213.11,
    education_level: 'Вища',
    occupation: 'Інженер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 39884,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 579,
    return_planned: true, return_date: '2022-12-21'
})-[:MIGRATION_FROM]->(from)
CREATE (m25)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Львів'})
CREATE (m26:Migration {
    id: 'mig_26',
    person_name: 'Єгор Пономаренко',
    gender: 'Чоловік',
    age: 67,
    migration_date: '2022-07-16',
    migration_time: '22:52',
    reason: 'Відновлення після війни',
    distance_km: 180.28,
    education_level: 'Середня',
    occupation: 'Пенсіонер',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 1,
    monthly_income: 5759,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 2859,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m26)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Суми'})
CREATE (m27:Migration {
    id: 'mig_27',
    person_name: 'Олександр Бондаренко',
    gender: 'Чоловік',
    age: 50,
    migration_date: '2021-08-15',
    migration_time: '06:20',
    reason: 'Екологічні причини',
    distance_km: 772.13,
    education_level: 'Вища',
    occupation: 'Студент',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 42792,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 583,
    return_planned: true, return_date: '2022-06-13'
})-[:MIGRATION_FROM]->(from)
CREATE (m27)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Чернівці'})
CREATE (m28:Migration {
    id: 'mig_28',
    person_name: 'Данило Мельник',
    gender: 'Чоловік',
    age: 60,
    migration_date: '2021-12-26',
    migration_time: '00:03',
    reason: 'Політичні причини',
    distance_km: 213.11,
    education_level: 'Доктор наук',
    occupation: 'Науковець',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 28236,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 646,
    return_planned: true, return_date: '2022-12-30'
})-[:MIGRATION_FROM]->(from)
CREATE (m28)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Полтава'})
CREATE (m29:Migration {
    id: 'mig_29',
    person_name: 'Світлана Шевчук',
    gender: 'Жінка',
    age: 54,
    migration_date: '2021-10-05',
    migration_time: '21:11',
    reason: 'Сімейні обставини',
    distance_km: 295.38,
    education_level: 'Вища',
    occupation: 'Архітектор',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 49101,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 1848,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m29)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Донецьк'})
CREATE (m30:Migration {
    id: 'mig_30',
    person_name: 'Жанна Шевченко',
    gender: 'Жінка',
    age: 66,
    migration_date: '2021-12-16',
    migration_time: '09:48',
    reason: 'Особисті причини',
    distance_km: 210.14,
    education_level: 'Середня спеціальна',
    occupation: 'Юрист',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 40014,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1683,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m30)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Черкаси'})
CREATE (m31:Migration {
    id: 'mig_31',
    person_name: 'Олександр Лисенко',
    gender: 'Чоловік',
    age: 67,
    migration_date: '2021-08-15',
    migration_time: '01:16',
    reason: 'Соціальні причини',
    distance_km: 305.94,
    education_level: 'Доктор наук',
    occupation: 'Робітник',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 43340,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 3258,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m31)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Черкаси'})
CREATE (m32:Migration {
    id: 'mig_32',
    person_name: 'Роман Олійник',
    gender: 'Чоловік',
    age: 67,
    migration_date: '2021-12-11',
    migration_time: '00:20',
    reason: 'Культурні причини',
    distance_km: 253.94,
    education_level: 'Вища',
    occupation: 'Вчитель',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 34861,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 2435,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m32)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Київ'})
CREATE (m33:Migration {
    id: 'mig_33',
    person_name: 'Вікторія Ткаченко',
    gender: 'Жінка',
    age: 21,
    migration_date: '2021-11-04',
    migration_time: '13:40',
    reason: 'Покращення житлових умов',
    distance_km: 441.42,
    education_level: 'Вища',
    occupation: 'Робітник',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 29092,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 2257,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m33)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Запоріжжя'})
CREATE (m34:Migration {
    id: 'mig_34',
    person_name: 'Богдана Шевченко',
    gender: 'Жінка',
    age: 59,
    migration_date: '2023-06-04',
    migration_time: '04:23',
    reason: 'Покращення житлових умов',
    distance_km: 69.94,
    education_level: 'Доктор наук',
    occupation: 'Науковець',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 5290,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 263,
    return_planned: true, return_date: '2023-09-19'
})-[:MIGRATION_FROM]->(from)
CREATE (m34)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Тернопіль'})
CREATE (m35:Migration {
    id: 'mig_35',
    person_name: 'Віталій Марчук',
    gender: 'Чоловік',
    age: 34,
    migration_date: '2022-10-21',
    migration_time: '11:45',
    reason: 'Культурні причини',
    distance_km: 764.67,
    education_level: 'Середня',
    occupation: 'Менеджер',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 5,
    monthly_income: 6962,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 1686,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m35)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Вінниця'})
CREATE (m36:Migration {
    id: 'mig_36',
    person_name: 'Єгор Василенко',
    gender: 'Чоловік',
    age: 25,
    migration_date: '2022-01-07',
    migration_time: '04:53',
    reason: 'Бізнес',
    distance_km: 488.43,
    education_level: 'Середня спеціальна',
    occupation: 'Дизайнер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 24570,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 998,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m36)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Кропивницький'})
CREATE (m37:Migration {
    id: 'mig_37',
    person_name: 'Дарія Петренко',
    gender: 'Жінка',
    age: 64,
    migration_date: '2022-01-16',
    migration_time: '04:50',
    reason: 'Політичні причини',
    distance_km: 253.58,
    education_level: 'Вища',
    occupation: 'Вчитель',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 27848,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2966,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m37)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Полтава'})
CREATE (m38:Migration {
    id: 'mig_38',
    person_name: 'Петро Іваненко',
    gender: 'Чоловік',
    age: 40,
    migration_date: '2022-03-04',
    migration_time: '10:12',
    reason: 'Екологічні причини',
    distance_km: 447.40,
    education_level: 'Доктор наук',
    occupation: 'Інженер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 12050,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 3528,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m38)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Полтава'})
CREATE (m39:Migration {
    id: 'mig_39',
    person_name: 'Раїса Попов',
    gender: 'Жінка',
    age: 64,
    migration_date: '2021-08-31',
    migration_time: '23:52',
    reason: 'Культурні причини',
    distance_km: 441.75,
    education_level: 'Вища',
    occupation: 'Студент',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 29017,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2042,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m39)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Запоріжжя'})
CREATE (m40:Migration {
    id: 'mig_40',
    person_name: 'Сергій Калиниченко',
    gender: 'Чоловік',
    age: 35,
    migration_date: '2021-12-05',
    migration_time: '22:00',
    reason: 'Соціальні причини',
    distance_km: 226.31,
    education_level: 'Доктор наук',
    occupation: 'Підприємець',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 20585,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 841,
    return_planned: true, return_date: '2022-04-06'
})-[:MIGRATION_FROM]->(from)
CREATE (m40)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Кропивницький'})
CREATE (m41:Migration {
    id: 'mig_41',
    person_name: 'Олег Кравчук',
    gender: 'Чоловік',
    age: 52,
    migration_date: '2022-11-22',
    migration_time: '16:26',
    reason: 'Сімейні обставини',
    distance_km: 205.37,
    education_level: 'Вища',
    occupation: 'Пенсіонер',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 0,
    monthly_income: 42165,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 2715,
    return_planned: true, return_date: '2024-06-29'
})-[:MIGRATION_FROM]->(from)
CREATE (m41)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Кропивницький'})
CREATE (m42:Migration {
    id: 'mig_42',
    person_name: 'Геннадій Шевчук',
    gender: 'Чоловік',
    age: 65,
    migration_date: '2023-04-27',
    migration_time: '01:46',
    reason: 'Кліматичні причини',
    distance_km: 499.28,
    education_level: 'Вища',
    occupation: 'Інженер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 2,
    monthly_income: 18118,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 1046,
    return_planned: true, return_date: '2024-09-25'
})-[:MIGRATION_FROM]->(from)
CREATE (m42)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Рівне'})
CREATE (m43:Migration {
    id: 'mig_43',
    person_name: 'Микола Грищенко',
    gender: 'Чоловік',
    age: 47,
    migration_date: '2022-03-18',
    migration_time: '20:00',
    reason: 'Освітні причини',
    distance_km: 127.50,
    education_level: 'Середня',
    occupation: 'Пенсіонер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 42982,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1572,
    return_planned: true, return_date: '2023-06-17'
})-[:MIGRATION_FROM]->(from)
CREATE (m43)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Рівне'})
CREATE (m44:Migration {
    id: 'mig_44',
    person_name: 'Ярослав Гончар',
    gender: 'Чоловік',
    age: 62,
    migration_date: '2024-01-09',
    migration_time: '19:22',
    reason: 'Бізнес',
    distance_km: 601.61,
    education_level: 'Доктор наук',
    occupation: 'Перекладач',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 30403,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1412,
    return_planned: true, return_date: '2025-07-30'
})-[:MIGRATION_FROM]->(from)
CREATE (m44)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Київ'})
CREATE (m45:Migration {
    id: 'mig_45',
    person_name: 'Святослав Грищук',
    gender: 'Чоловік',
    age: 50,
    migration_date: '2022-10-15',
    migration_time: '02:34',
    reason: 'Культурні причини',
    distance_km: 302.46,
    education_level: 'Середня',
    occupation: 'Бухгалтер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 0,
    monthly_income: 27892,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 1732,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m45)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Львів'})
CREATE (m46:Migration {
    id: 'mig_46',
    person_name: 'Лариса Іваненко',
    gender: 'Жінка',
    age: 30,
    migration_date: '2021-05-25',
    migration_time: '06:31',
    reason: 'Освітні причини',
    distance_km: 221.13,
    education_level: 'Вища',
    occupation: 'Програміст',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 2,
    monthly_income: 39168,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 1634,
    return_planned: true, return_date: '2021-07-18'
})-[:MIGRATION_FROM]->(from)
CREATE (m46)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Кропивницький'})
CREATE (m47:Migration {
    id: 'mig_47',
    person_name: 'Іван Кравчук',
    gender: 'Чоловік',
    age: 34,
    migration_date: '2021-04-12',
    migration_time: '03:22',
    reason: 'Політичні причини',
    distance_km: 615.82,
    education_level: 'Середня',
    occupation: 'Дизайнер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 25496,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 891,
    return_planned: true, return_date: '2022-03-19'
})-[:MIGRATION_FROM]->(from)
CREATE (m47)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Одеса'})
CREATE (m48:Migration {
    id: 'mig_48',
    person_name: 'Сергій Павленко',
    gender: 'Чоловік',
    age: 51,
    migration_date: '2021-08-23',
    migration_time: '23:28',
    reason: 'Освітні причини',
    distance_km: 441.42,
    education_level: 'Вища',
    occupation: 'Програміст',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 4,
    monthly_income: 8571,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 981,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m48)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Суми'})
CREATE (m49:Migration {
    id: 'mig_49',
    person_name: 'Данило Калиниченко',
    gender: 'Чоловік',
    age: 31,
    migration_date: '2022-06-09',
    migration_time: '15:50',
    reason: 'Соціальні причини',
    distance_km: 575.61,
    education_level: 'Середня спеціальна',
    occupation: 'Перекладач',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 34840,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 851,
    return_planned: true, return_date: '2023-11-28'
})-[:MIGRATION_FROM]->(from)
CREATE (m49)-[:MIGRATION_TO]->(to)
WITH *
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Чернівці'})
CREATE (m50:Migration {
    id: 'mig_50',
    person_name: 'Зоя Кравчук',
    gender: 'Жінка',
    age: 67,
    migration_date: '2023-10-14',
    migration_time: '05:38',
    reason: 'Робота',
    distance_km: 142.50,
    education_level: 'Магістр',
    occupation: 'Робітник',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 1,
    monthly_income: 25332,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 629,
    return_planned: true, return_date: '2025-03-06'
})-[:MIGRATION_FROM]->(from)
CREATE (m50)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Суми'})
CREATE (m51:Migration {
    id: 'mig_51',
    person_name: 'Уляна Левченко',
    gender: 'Жінка',
    age: 40,
    migration_date: '2021-09-06',
    migration_time: '23:41',
    reason: 'Бізнес',
    distance_km: 671.25,
    education_level: 'Вища',
    occupation: 'Лікар',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 11447,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 2172,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m51)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Львів'})
CREATE (m52:Migration {
    id: 'mig_52',
    person_name: 'Юлія Грищенко',
    gender: 'Жінка',
    age: 58,
    migration_date: '2022-05-22',
    migration_time: '01:03',
    reason: 'Економічні причини',
    distance_km: 1024.88,
    education_level: 'Магістр',
    occupation: 'Менеджер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 27216,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 1719,
    return_planned: true, return_date: '2024-02-18'
})-[:MIGRATION_FROM]->(from)
CREATE (m52)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Рівне'})
CREATE (m53:Migration {
    id: 'mig_53',
    person_name: 'Тетяна Савчук',
    gender: 'Жінка',
    age: 61,
    migration_date: '2022-10-09',
    migration_time: '16:50',
    reason: 'Кліматичні причини',
    distance_km: 711.54,
    education_level: 'Доктор наук',
    occupation: 'Дизайнер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 26479,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 379,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m53)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Запоріжжя'})
CREATE (m54:Migration {
    id: 'mig_54',
    person_name: 'Микола Олійник',
    gender: 'Чоловік',
    age: 57,
    migration_date: '2022-06-05',
    migration_time: '13:55',
    reason: 'Бізнес',
    distance_km: 252.50,
    education_level: 'Доктор наук',
    occupation: 'Студент',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 7696,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 3166,
    return_planned: true, return_date: '2023-03-17'
})-[:MIGRATION_FROM]->(from)
CREATE (m54)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Львів'})
CREATE (m55:Migration {
    id: 'mig_55',
    person_name: 'Андрій Іванчук',
    gender: 'Чоловік',
    age: 65,
    migration_date: '2021-09-18',
    migration_time: '08:09',
    reason: 'Соціальні причини',
    distance_km: 116.98,
    education_level: 'Середня',
    occupation: 'Інженер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 5954,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1186,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m55)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Тернопіль'})
CREATE (m56:Migration {
    id: 'mig_56',
    person_name: 'Максим Савенко',
    gender: 'Чоловік',
    age: 49,
    migration_date: '2022-04-02',
    migration_time: '08:45',
    reason: 'Бізнес',
    distance_km: 142.50,
    education_level: 'Магістр',
    occupation: 'Вчитель',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 39352,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2874,
    return_planned: true, return_date: '2022-08-07'
})-[:MIGRATION_FROM]->(from)
CREATE (m56)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Вінниця'})
CREATE (m57:Migration {
    id: 'mig_57',
    person_name: 'Марія Мельник',
    gender: 'Жінка',
    age: 61,
    migration_date: '2021-05-30',
    migration_time: '12:33',
    reason: 'Робота',
    distance_km: 514.88,
    education_level: 'Середня спеціальна',
    occupation: 'Менеджер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 27622,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 845,
    return_planned: true, return_date: '2022-04-06'
})-[:MIGRATION_FROM]->(from)
CREATE (m57)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Київ'})
CREATE (m58:Migration {
    id: 'mig_58',
    person_name: 'Зінаїда Попов',
    gender: 'Жінка',
    age: 34,
    migration_date: '2021-12-28',
    migration_time: '16:11',
    reason: 'Освітні причини',
    distance_km: 366.01,
    education_level: 'Середня',
    occupation: 'Підприємець',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 18001,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 1484,
    return_planned: true, return_date: '2023-03-31'
})-[:MIGRATION_FROM]->(from)
CREATE (m58)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Суми'})
CREATE (m59:Migration {
    id: 'mig_59',
    person_name: 'Наталія Іванчук',
    gender: 'Жінка',
    age: 34,
    migration_date: '2023-09-11',
    migration_time: '09:43',
    reason: 'Навчання',
    distance_km: 253.94,
    education_level: 'Доктор наук',
    occupation: 'Менеджер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 13413,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 1178,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m59)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Кропивницький'})
CREATE (m60:Migration {
    id: 'mig_60',
    person_name: 'Євген Шевченко',
    gender: 'Чоловік',
    age: 41,
    migration_date: '2023-06-10',
    migration_time: '18:29',
    reason: 'Навчання',
    distance_km: 249.22,
    education_level: 'Вища',
    occupation: 'Пенсіонер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 39175,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 715,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m60)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Суми'})
CREATE (m61:Migration {
    id: 'mig_61',
    person_name: 'Леонід Петренко',
    gender: 'Чоловік',
    age: 30,
    migration_date: '2023-09-19',
    migration_time: '02:29',
    reason: 'Соціальні причини',
    distance_km: 305.42,
    education_level: 'Доктор наук',
    occupation: 'Робітник',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 28856,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 2289,
    return_planned: true, return_date: '2025-03-05'
})-[:MIGRATION_FROM]->(from)
CREATE (m61)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Чернівці'})
CREATE (m62:Migration {
    id: 'mig_62',
    person_name: 'Світлана Пономаренко',
    gender: 'Жінка',
    age: 68,
    migration_date: '2024-03-14',
    migration_time: '03:46',
    reason: 'Соціальні причини',
    distance_km: 701.24,
    education_level: 'Доктор наук',
    occupation: 'Студент',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 43264,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 2134,
    return_planned: true, return_date: '2025-07-09'
})-[:MIGRATION_FROM]->(from)
CREATE (m62)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Донецьк'})
CREATE (m63:Migration {
    id: 'mig_63',
    person_name: 'Ілля Левченко',
    gender: 'Чоловік',
    age: 44,
    migration_date: '2023-11-07',
    migration_time: '12:29',
    reason: 'Кліматичні причини',
    distance_km: 593.46,
    education_level: 'Магістр',
    occupation: 'Пенсіонер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 14897,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 302,
    return_planned: true, return_date: '2025-07-02'
})-[:MIGRATION_FROM]->(from)
CREATE (m63)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Кропивницький'})
CREATE (m64:Migration {
    id: 'mig_64',
    person_name: 'Захар Гончаренко',
    gender: 'Чоловік',
    age: 32,
    migration_date: '2023-08-09',
    migration_time: '21:09',
    reason: 'Політичні причини',
    distance_km: 253.58,
    education_level: 'Середня',
    occupation: 'Лікар',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 14688,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 41,
    return_planned: true, return_date: '2024-10-18'
})-[:MIGRATION_FROM]->(from)
CREATE (m64)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Полтава'})
CREATE (m65:Migration {
    id: 'mig_65',
    person_name: 'Олена Калиниченко',
    gender: 'Жінка',
    age: 47,
    migration_date: '2022-06-01',
    migration_time: '15:26',
    reason: 'Медичні причини',
    distance_km: 147.76,
    education_level: 'Магістр',
    occupation: 'Архітектор',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 25636,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 3647,
    return_planned: true, return_date: '2022-08-08'
})-[:MIGRATION_FROM]->(from)
CREATE (m65)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Київ'})
CREATE (m66:Migration {
    id: 'mig_66',
    person_name: 'Віра Савченко',
    gender: 'Жінка',
    age: 44,
    migration_date: '2022-07-05',
    migration_time: '03:43',
    reason: 'Екологічні причини',
    distance_km: 467.53,
    education_level: 'Доктор наук',
    occupation: 'Перекладач',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 46402,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 1425,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m66)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Донецьк'})
CREATE (m67:Migration {
    id: 'mig_67',
    person_name: 'Юлія Федоренко',
    gender: 'Жінка',
    age: 48,
    migration_date: '2023-04-11',
    migration_time: '04:02',
    reason: 'Кліматичні причини',
    distance_km: 593.46,
    education_level: 'Магістр',
    occupation: 'Вчитель',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 41083,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 2061,
    return_planned: true, return_date: '2023-08-03'
})-[:MIGRATION_FROM]->(from)
CREATE (m67)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Дніпро'})
CREATE (m68:Migration {
    id: 'mig_68',
    person_name: 'Галина Олійник',
    gender: 'Жінка',
    age: 48,
    migration_date: '2023-04-17',
    migration_time: '21:01',
    reason: 'Сімейні обставини',
    distance_km: 190.50,
    education_level: 'Доктор наук',
    occupation: 'Програміст',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 15932,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1702,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m68)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Чернівці'})
CREATE (m69:Migration {
    id: 'mig_69',
    person_name: 'Уляна Пономаренко',
    gender: 'Жінка',
    age: 65,
    migration_date: '2021-10-12',
    migration_time: '19:01',
    reason: 'Навчання',
    distance_km: 409.70,
    education_level: 'Середня спеціальна',
    occupation: 'Підприємець',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 5,
    monthly_income: 48312,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 256,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m69)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Одеса'})
CREATE (m70:Migration {
    id: 'mig_70',
    person_name: 'Ніна Сидоренко',
    gender: 'Жінка',
    age: 43,
    migration_date: '2023-10-01',
    migration_time: '17:48',
    reason: 'Соціальні причини',
    distance_km: 564.31,
    education_level: 'Середня спеціальна',
    occupation: 'Юрист',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 42608,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 334,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m70)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Тернопіль'})
CREATE (m71:Migration {
    id: 'mig_71',
    person_name: 'Захар Грищенко',
    gender: 'Чоловік',
    age: 63,
    migration_date: '2021-11-07',
    migration_time: '12:02',
    reason: 'Навчання',
    distance_km: 725.45,
    education_level: 'Вища',
    occupation: 'Перекладач',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 1,
    monthly_income: 21003,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 2926,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m71)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Вінниця'})
CREATE (m72:Migration {
    id: 'mig_72',
    person_name: 'Святослав Кравчук',
    gender: 'Чоловік',
    age: 34,
    migration_date: '2023-07-26',
    migration_time: '02:43',
    reason: 'Кліматичні причини',
    distance_km: 514.88,
    education_level: 'Середня спеціальна',
    occupation: 'Студент',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 11438,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 854,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m72)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Одеса'})
CREATE (m73:Migration {
    id: 'mig_73',
    person_name: 'Катерина Васильчук',
    gender: 'Жінка',
    age: 67,
    migration_date: '2022-12-22',
    migration_time: '23:38',
    reason: 'Бізнес',
    distance_km: 344.04,
    education_level: 'Середня спеціальна',
    occupation: 'Студент',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 34684,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1433,
    return_planned: true, return_date: '2024-12-08'
})-[:MIGRATION_FROM]->(from)
CREATE (m73)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Вінниця'})
CREATE (m74:Migration {
    id: 'mig_74',
    person_name: 'Валентина Калиниченко',
    gender: 'Жінка',
    age: 35,
    migration_date: '2021-08-11',
    migration_time: '21:39',
    reason: 'Екологічні причини',
    distance_km: 261.26,
    education_level: 'Середня спеціальна',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 0,
    monthly_income: 26009,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 2357,
    return_planned: true, return_date: '2021-10-25'
})-[:MIGRATION_FROM]->(from)
CREATE (m74)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Чернівці'})
CREATE (m75:Migration {
    id: 'mig_75',
    person_name: 'Віктор Петриченко',
    gender: 'Чоловік',
    age: 38,
    migration_date: '2023-12-30',
    migration_time: '22:23',
    reason: 'Політичні причини',
    distance_km: 685.40,
    education_level: 'Магістр',
    occupation: 'Науковець',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 32525,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 1172,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m75)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Полтава'})
CREATE (m76:Migration {
    id: 'mig_76',
    person_name: 'Галина Марченко',
    gender: 'Жінка',
    age: 57,
    migration_date: '2023-09-15',
    migration_time: '10:24',
    reason: 'Політичні причини',
    distance_km: 645.50,
    education_level: 'Середня',
    occupation: 'Дизайнер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 6341,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 169,
    return_planned: true, return_date: '2024-09-26'
})-[:MIGRATION_FROM]->(from)
CREATE (m76)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Донецьк'})
CREATE (m77:Migration {
    id: 'mig_77',
    person_name: 'Лілія Ковальчук',
    gender: 'Жінка',
    age: 39,
    migration_date: '2024-03-25',
    migration_time: '17:20',
    reason: 'Політичні причини',
    distance_km: 909.55,
    education_level: 'Магістр',
    occupation: 'Науковець',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 9377,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 1317,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m77)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Кропивницький'})
CREATE (m78:Migration {
    id: 'mig_78',
    person_name: 'Лілія Кравчук',
    gender: 'Жінка',
    age: 18,
    migration_date: '2021-06-26',
    migration_time: '15:46',
    reason: 'Економічні причини',
    distance_km: 249.22,
    education_level: 'Середня',
    occupation: 'Вчитель',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 6093,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 2812,
    return_planned: true, return_date: '2021-11-13'
})-[:MIGRATION_FROM]->(from)
CREATE (m78)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Тернопіль'})
CREATE (m79:Migration {
    id: 'mig_79',
    person_name: 'Захар Васильчук',
    gender: 'Чоловік',
    age: 19,
    migration_date: '2023-06-22',
    migration_time: '07:05',
    reason: 'Екологічні причини',
    distance_km: 645.50,
    education_level: 'Доктор наук',
    occupation: 'Програміст',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 21797,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 2332,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m79)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Суми'})
CREATE (m80:Migration {
    id: 'mig_80',
    person_name: 'Зоя Іванчук',
    gender: 'Жінка',
    age: 33,
    migration_date: '2021-12-25',
    migration_time: '02:42',
    reason: 'Культурні причини',
    distance_km: 772.13,
    education_level: 'Середня спеціальна',
    occupation: 'Пенсіонер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 14858,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 3516,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m80)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Одеса'})
CREATE (m81:Migration {
    id: 'mig_81',
    person_name: 'Єгор Кравченко',
    gender: 'Чоловік',
    age: 28,
    migration_date: '2021-05-28',
    migration_time: '16:26',
    reason: 'Робота',
    distance_km: 620.77,
    education_level: 'Середня спеціальна',
    occupation: 'Лікар',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 37172,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 592,
    return_planned: true, return_date: '2022-04-15'
})-[:MIGRATION_FROM]->(from)
CREATE (m81)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Полтава'})
CREATE (m82:Migration {
    id: 'mig_82',
    person_name: 'Тетяна Марчук',
    gender: 'Жінка',
    age: 51,
    migration_date: '2024-02-05',
    migration_time: '10:43',
    reason: 'Медичні причини',
    distance_km: 645.21,
    education_level: 'Середня спеціальна',
    occupation: 'Підприємець',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 11032,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 2008,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m82)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Чернівці'})
CREATE (m83:Migration {
    id: 'mig_83',
    person_name: 'Олег Калиненко',
    gender: 'Чоловік',
    age: 57,
    migration_date: '2021-07-13',
    migration_time: '08:14',
    reason: 'Культурні причини',
    distance_km: 221.13,
    education_level: 'Середня',
    occupation: 'Дизайнер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 22882,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 2991,
    return_planned: true, return_date: '2022-03-22'
})-[:MIGRATION_FROM]->(from)
CREATE (m83)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Харків'})
CREATE (m84:Migration {
    id: 'mig_84',
    person_name: 'Віктор Кравченко',
    gender: 'Чоловік',
    age: 41,
    migration_date: '2022-07-05',
    migration_time: '20:36',
    reason: 'Культурні причини',
    distance_km: 764.67,
    education_level: 'Середня спеціальна',
    occupation: 'Підприємець',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 45848,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 1448,
    return_planned: true, return_date: '2024-01-15'
})-[:MIGRATION_FROM]->(from)
CREATE (m84)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Харків'})
CREATE (m85:Migration {
    id: 'mig_85',
    person_name: 'Ольга Марченко',
    gender: 'Жінка',
    age: 21,
    migration_date: '2021-10-06',
    migration_time: '22:21',
    reason: 'Навчання',
    distance_km: 331.82,
    education_level: 'Доктор наук',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 44017,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 3178,
    return_planned: true, return_date: '2023-01-05'
})-[:MIGRATION_FROM]->(from)
CREATE (m85)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Запоріжжя'})
CREATE (m86:Migration {
    id: 'mig_86',
    person_name: 'Іван Петриченко',
    gender: 'Чоловік',
    age: 32,
    migration_date: '2022-08-26',
    migration_time: '18:01',
    reason: 'Навчання',
    distance_km: 725.45,
    education_level: 'Середня',
    occupation: 'Підприємець',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 2,
    monthly_income: 29177,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2228,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m86)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Запоріжжя'})
CREATE (m87:Migration {
    id: 'mig_87',
    person_name: 'Юлія Лисенко',
    gender: 'Жінка',
    age: 38,
    migration_date: '2022-06-20',
    migration_time: '12:53',
    reason: 'Освітні причини',
    distance_km: 366.31,
    education_level: 'Доктор наук',
    occupation: 'Вчитель',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 39295,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 1007,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m87)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Запоріжжя'})
CREATE (m88:Migration {
    id: 'mig_88',
    person_name: 'Тимофій Савчук',
    gender: 'Чоловік',
    age: 34,
    migration_date: '2023-08-31',
    migration_time: '21:20',
    reason: 'Медичні причини',
    distance_km: 288.19,
    education_level: 'Середня',
    occupation: 'Програміст',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 3,
    monthly_income: 27047,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 3207,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m88)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Кропивницький'})
CREATE (m89:Migration {
    id: 'mig_89',
    person_name: 'Валентин Іванчук',
    gender: 'Чоловік',
    age: 56,
    migration_date: '2024-01-31',
    migration_time: '00:21',
    reason: 'Політичні причини',
    distance_km: 205.37,
    education_level: 'Середня',
    occupation: 'Пенсіонер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 2,
    monthly_income: 37701,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 172,
    return_planned: true, return_date: '2025-11-22'
})-[:MIGRATION_FROM]->(from)
CREATE (m89)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Тернопіль'})
CREATE (m90:Migration {
    id: 'mig_90',
    person_name: 'Людмила Марчук',
    gender: 'Жінка',
    age: 24,
    migration_date: '2023-09-18',
    migration_time: '01:58',
    reason: 'Соціальні причини',
    distance_km: 671.25,
    education_level: 'Середня спеціальна',
    occupation: 'Лікар',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 31807,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 1146,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m90)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Тернопіль'})
CREATE (m91:Migration {
    id: 'mig_91',
    person_name: 'Людмила Грищук',
    gender: 'Жінка',
    age: 41,
    migration_date: '2024-01-18',
    migration_time: '15:15',
    reason: 'Соціальні причини',
    distance_km: 909.55,
    education_level: 'Магістр',
    occupation: 'Студент',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 5243,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 3073,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m91)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Суми'})
CREATE (m92:Migration {
    id: 'mig_92',
    person_name: 'Петро Левченко',
    gender: 'Чоловік',
    age: 63,
    migration_date: '2022-01-29',
    migration_time: '13:34',
    reason: 'Робота',
    distance_km: 701.24,
    education_level: 'Середня спеціальна',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 7853,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 2949,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m92)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Кропивницький'})
CREATE (m93:Migration {
    id: 'mig_93',
    person_name: 'Федір Петренко',
    gender: 'Чоловік',
    age: 53,
    migration_date: '2023-06-08',
    migration_time: '09:58',
    reason: 'Екологічні причини',
    distance_km: 253.58,
    education_level: 'Середня',
    occupation: 'Вчитель',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 37163,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 205,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m93)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Харків'})
CREATE (m94:Migration {
    id: 'mig_94',
    person_name: 'Зоя Лисенко',
    gender: 'Жінка',
    age: 25,
    migration_date: '2023-04-21',
    migration_time: '09:45',
    reason: 'Відновлення після війни',
    distance_km: 305.94,
    education_level: 'Доктор наук',
    occupation: 'Лікар',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 3,
    monthly_income: 34841,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 1703,
    return_planned: true, return_date: '2025-02-28'
})-[:MIGRATION_FROM]->(from)
CREATE (m94)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Донецьк'})
CREATE (m95:Migration {
    id: 'mig_95',
    person_name: 'Марк Коваленко',
    gender: 'Чоловік',
    age: 23,
    migration_date: '2022-03-24',
    migration_time: '09:40',
    reason: 'Особисті причини',
    distance_km: 210.14,
    education_level: 'Доктор наук',
    occupation: 'Вчитель',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 2,
    monthly_income: 33400,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1776,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m95)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Львів'})
CREATE (m96:Migration {
    id: 'mig_96',
    person_name: 'Віра Марчук',
    gender: 'Жінка',
    age: 40,
    migration_date: '2023-07-27',
    migration_time: '04:38',
    reason: 'Медичні причини',
    distance_km: 579.60,
    education_level: 'Вища',
    occupation: 'Перекладач',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 4,
    monthly_income: 13341,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 988,
    return_planned: true, return_date: '2025-02-04'
})-[:MIGRATION_FROM]->(from)
CREATE (m96)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Одеса'})
CREATE (m97:Migration {
    id: 'mig_97',
    person_name: 'Олег Марченко',
    gender: 'Чоловік',
    age: 19,
    migration_date: '2022-01-20',
    migration_time: '13:07',
    reason: 'Покращення житлових умов',
    distance_km: 344.04,
    education_level: 'Доктор наук',
    occupation: 'Робітник',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 35131,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 1639,
    return_planned: true, return_date: '2023-10-31'
})-[:MIGRATION_FROM]->(from)
CREATE (m97)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Суми'})
CREATE (m98:Migration {
    id: 'mig_98',
    person_name: 'Фаїна Петриченко',
    gender: 'Жінка',
    age: 34,
    migration_date: '2024-01-12',
    migration_time: '19:53',
    reason: 'Освітні причини',
    distance_km: 387.94,
    education_level: 'Вища',
    occupation: 'Вчитель',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 29689,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 1143,
    return_planned: true, return_date: '2024-07-11'
})-[:MIGRATION_FROM]->(from)
CREATE (m98)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Дніпро'})
CREATE (m99:Migration {
    id: 'mig_99',
    person_name: 'Світлана Шевченко',
    gender: 'Жінка',
    age: 69,
    migration_date: '2021-11-25',
    migration_time: '16:36',
    reason: 'Культурні причини',
    distance_km: 672.77,
    education_level: 'Доктор наук',
    occupation: 'Робітник',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 29542,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 2908,
    return_planned: true, return_date: '2023-08-04'
})-[:MIGRATION_FROM]->(from)
CREATE (m99)-[:MIGRATION_TO]->(to)
WITH *
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Дніпро'})
CREATE (m100:Migration {
    id: 'mig_100',
    person_name: 'Дмитро Гончаренко',
    gender: 'Чоловік',
    age: 36,
    migration_date: '2021-08-08',
    migration_time: '23:56',
    reason: 'Екологічні причини',
    distance_km: 814.87,
    education_level: 'Середня',
    occupation: 'Студент',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 36124,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1329,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m100)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Запоріжжя'})
CREATE (m101:Migration {
    id: 'mig_101',
    person_name: 'Віктор Калиненко',
    gender: 'Чоловік',
    age: 42,
    migration_date: '2021-12-10',
    migration_time: '06:52',
    reason: 'Покращення житлових умов',
    distance_km: 199.26,
    education_level: 'Доктор наук',
    occupation: 'Студент',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 17318,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 2676,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m101)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Львів'})
CREATE (m102:Migration {
    id: 'mig_102',
    person_name: 'Федір Гончаренко',
    gender: 'Чоловік',
    age: 64,
    migration_date: '2022-05-29',
    migration_time: '09:51',
    reason: 'Робота',
    distance_km: 615.82,
    education_level: 'Середня спеціальна',
    occupation: 'Програміст',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 3,
    monthly_income: 29252,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 3644,
    return_planned: true, return_date: '2022-08-31'
})-[:MIGRATION_FROM]->(from)
CREATE (m102)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Кропивницький'})
CREATE (m103:Migration {
    id: 'mig_103',
    person_name: 'Володимир Васильчук',
    gender: 'Чоловік',
    age: 37,
    migration_date: '2022-06-23',
    migration_time: '17:03',
    reason: 'Бізнес',
    distance_km: 331.82,
    education_level: 'Доктор наук',
    occupation: 'Програміст',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 4,
    monthly_income: 23917,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 2643,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m103)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Тернопіль'})
CREATE (m104:Migration {
    id: 'mig_104',
    person_name: 'Катерина Грищук',
    gender: 'Жінка',
    age: 59,
    migration_date: '2022-04-27',
    migration_time: '19:38',
    reason: 'Особисті причини',
    distance_km: 671.25,
    education_level: 'Середня',
    occupation: 'Вчитель',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 0,
    monthly_income: 22766,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 3013,
    return_planned: true, return_date: '2024-01-27'
})-[:MIGRATION_FROM]->(from)
CREATE (m104)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Тернопіль'})
CREATE (m105:Migration {
    id: 'mig_105',
    person_name: 'Катерина Романенко',
    gender: 'Жінка',
    age: 23,
    migration_date: '2022-03-20',
    migration_time: '04:51',
    reason: 'Робота',
    distance_km: 909.55,
    education_level: 'Вища',
    occupation: 'Студент',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 45062,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 810,
    return_planned: true, return_date: '2023-02-01'
})-[:MIGRATION_FROM]->(from)
CREATE (m105)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Кропивницький'})
CREATE (m106:Migration {
    id: 'mig_106',
    person_name: 'Христина Ковальчук',
    gender: 'Жінка',
    age: 66,
    migration_date: '2023-12-21',
    migration_time: '13:39',
    reason: 'Бізнес',
    distance_km: 104.57,
    education_level: 'Середня',
    occupation: 'Програміст',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 21702,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 3459,
    return_planned: true, return_date: '2024-10-20'
})-[:MIGRATION_FROM]->(from)
CREATE (m106)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Дніпро'})
CREATE (m107:Migration {
    id: 'mig_107',
    person_name: 'Віктор Калиниченко',
    gender: 'Чоловік',
    age: 22,
    migration_date: '2023-07-30',
    migration_time: '11:53',
    reason: 'Сімейні обставини',
    distance_km: 699.42,
    education_level: 'Середня',
    occupation: 'Бухгалтер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 11623,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2864,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m107)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Тернопіль'})
CREATE (m108:Migration {
    id: 'mig_108',
    person_name: 'Денис Савчук',
    gender: 'Чоловік',
    age: 65,
    migration_date: '2023-05-13',
    migration_time: '17:53',
    reason: 'Політичні причини',
    distance_km: 671.25,
    education_level: 'Доктор наук',
    occupation: 'Лікар',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 35417,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 1169,
    return_planned: true, return_date: '2023-09-07'
})-[:MIGRATION_FROM]->(from)
CREATE (m108)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Київ'})
CREATE (m109:Migration {
    id: 'mig_109',
    person_name: 'Юрій Марчук',
    gender: 'Чоловік',
    age: 20,
    migration_date: '2021-04-19',
    migration_time: '11:00',
    reason: 'Сімейні обставини',
    distance_km: 303.27,
    education_level: 'Середня спеціальна',
    occupation: 'Юрист',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 34081,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 2525,
    return_planned: true, return_date: '2021-12-29'
})-[:MIGRATION_FROM]->(from)
CREATE (m109)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Запоріжжя'})
CREATE (m110:Migration {
    id: 'mig_110',
    person_name: 'Олег Лисенко',
    gender: 'Чоловік',
    age: 40,
    migration_date: '2021-07-18',
    migration_time: '22:40',
    reason: 'Бізнес',
    distance_km: 288.19,
    education_level: 'Середня',
    occupation: 'Архітектор',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 31282,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 3273,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m110)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Одеса'})
CREATE (m111:Migration {
    id: 'mig_111',
    person_name: 'Віктор Калиниченко',
    gender: 'Чоловік',
    age: 43,
    migration_date: '2021-07-02',
    migration_time: '22:40',
    reason: 'Соціальні причини',
    distance_km: 511.75,
    education_level: 'Магістр',
    occupation: 'Бухгалтер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 44293,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 2699,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m111)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Кропивницький'})
CREATE (m112:Migration {
    id: 'mig_112',
    person_name: 'Геннадій Марченко',
    gender: 'Чоловік',
    age: 59,
    migration_date: '2021-10-21',
    migration_time: '22:21',
    reason: 'Кліматичні причини',
    distance_km: 253.58,
    education_level: 'Вища',
    occupation: 'Студент',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 42780,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 658,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m112)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Київ'})
CREATE (m113:Migration {
    id: 'mig_113',
    person_name: 'Віталій Лисенко',
    gender: 'Чоловік',
    age: 23,
    migration_date: '2021-04-30',
    migration_time: '11:33',
    reason: 'Бізнес',
    distance_km: 467.53,
    education_level: 'Доктор наук',
    occupation: 'Підприємець',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 9562,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 2796,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m113)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Рівне'})
CREATE (m114:Migration {
    id: 'mig_114',
    person_name: 'Катерина Петриченко',
    gender: 'Жінка',
    age: 57,
    migration_date: '2023-12-06',
    migration_time: '20:25',
    reason: 'Медичні причини',
    distance_km: 602.61,
    education_level: 'Магістр',
    occupation: 'Пенсіонер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 38810,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1179,
    return_planned: true, return_date: '2025-04-25'
})-[:MIGRATION_FROM]->(from)
CREATE (m114)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Одеса'})
CREATE (m115:Migration {
    id: 'mig_115',
    person_name: 'Вікторія Марчук',
    gender: 'Жінка',
    age: 51,
    migration_date: '2023-04-28',
    migration_time: '06:47',
    reason: 'Покращення житлових умов',
    distance_km: 412.68,
    education_level: 'Магістр',
    occupation: 'Студент',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 48278,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 1106,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m115)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Черкаси'})
CREATE (m116:Migration {
    id: 'mig_116',
    person_name: 'Віктор Пономарчук',
    gender: 'Чоловік',
    age: 49,
    migration_date: '2021-11-16',
    migration_time: '06:29',
    reason: 'Навчання',
    distance_km: 579.60,
    education_level: 'Магістр',
    occupation: 'Архітектор',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 39006,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 2591,
    return_planned: true, return_date: '2023-08-23'
})-[:MIGRATION_FROM]->(from)
CREATE (m116)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Харків'})
CREATE (m117:Migration {
    id: 'mig_117',
    person_name: 'Маргарита Бондаренко',
    gender: 'Жінка',
    age: 38,
    migration_date: '2021-06-23',
    migration_time: '15:25',
    reason: 'Медичні причини',
    distance_km: 190.50,
    education_level: 'Середня спеціальна',
    occupation: 'Підприємець',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 46532,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 494,
    return_planned: true, return_date: '2022-09-25'
})-[:MIGRATION_FROM]->(from)
CREATE (m117)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Київ'})
CREATE (m118:Migration {
    id: 'mig_118',
    person_name: 'Уляна Грищенко',
    gender: 'Жінка',
    age: 43,
    migration_date: '2023-02-19',
    migration_time: '05:50',
    reason: 'Освітні причини',
    distance_km: 394.35,
    education_level: 'Доктор наук',
    occupation: 'Лікар',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 33703,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 543,
    return_planned: true, return_date: '2023-11-22'
})-[:MIGRATION_FROM]->(from)
CREATE (m118)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Кропивницький'})
CREATE (m119:Migration {
    id: 'mig_119',
    person_name: 'Сергій Лисенко',
    gender: 'Чоловік',
    age: 38,
    migration_date: '2023-09-17',
    migration_time: '18:12',
    reason: 'Екологічні причини',
    distance_km: 226.31,
    education_level: 'Магістр',
    occupation: 'Підприємець',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 6534,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 3080,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m119)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Рівне'})
CREATE (m120:Migration {
    id: 'mig_120',
    person_name: 'Людмила Гончаренко',
    gender: 'Жінка',
    age: 56,
    migration_date: '2023-07-02',
    migration_time: '11:08',
    reason: 'Сімейні обставини',
    distance_km: 434.83,
    education_level: 'Середня',
    occupation: 'Інженер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 1,
    monthly_income: 13666,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 962,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m120)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Вінниця'})
CREATE (m121:Migration {
    id: 'mig_121',
    person_name: 'Віктор Савчук',
    gender: 'Чоловік',
    age: 45,
    migration_date: '2023-08-31',
    migration_time: '22:20',
    reason: 'Освітні причини',
    distance_km: 441.75,
    education_level: 'Вища',
    occupation: 'Вчитель',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 4,
    monthly_income: 13507,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 199,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m121)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Львів'})
CREATE (m122:Migration {
    id: 'mig_122',
    person_name: 'Олександр Бондар',
    gender: 'Чоловік',
    age: 69,
    migration_date: '2023-01-25',
    migration_time: '16:54',
    reason: 'Екологічні причини',
    distance_km: 756.39,
    education_level: 'Середня',
    occupation: 'Робітник',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 1,
    monthly_income: 42422,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 1471,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m122)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Полтава'})
CREATE (m123:Migration {
    id: 'mig_123',
    person_name: 'Єлизавета Бондар',
    gender: 'Жінка',
    age: 36,
    migration_date: '2022-11-03',
    migration_time: '09:46',
    reason: 'Політичні причини',
    distance_km: 205.37,
    education_level: 'Середня',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 31929,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 122,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m123)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Вінниця'})
CREATE (m124:Migration {
    id: 'mig_124',
    person_name: 'Валентина Кравчук',
    gender: 'Жінка',
    age: 32,
    migration_date: '2023-07-20',
    migration_time: '08:22',
    reason: 'Сімейні обставини',
    distance_km: 288.58,
    education_level: 'Середня спеціальна',
    occupation: 'Підприємець',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 8229,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2066,
    return_planned: true, return_date: '2024-03-09'
})-[:MIGRATION_FROM]->(from)
CREATE (m124)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Запоріжжя'})
CREATE (m125:Migration {
    id: 'mig_125',
    person_name: 'Петро Коваленко',
    gender: 'Чоловік',
    age: 39,
    migration_date: '2023-02-05',
    migration_time: '13:34',
    reason: 'Освітні причини',
    distance_km: 443.76,
    education_level: 'Середня',
    occupation: 'Науковець',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 0,
    monthly_income: 27054,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 1808,
    return_planned: true, return_date: '2024-03-09'
})-[:MIGRATION_FROM]->(from)
CREATE (m125)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Рівне'})
CREATE (m126:Migration {
    id: 'mig_126',
    person_name: 'Денис Грищук',
    gender: 'Чоловік',
    age: 45,
    migration_date: '2021-11-26',
    migration_time: '16:11',
    reason: 'Економічні причини',
    distance_km: 677.78,
    education_level: 'Середня',
    occupation: 'Підприємець',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 39656,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 3541,
    return_planned: true, return_date: '2023-10-06'
})-[:MIGRATION_FROM]->(from)
CREATE (m126)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Вінниця'})
CREATE (m127:Migration {
    id: 'mig_127',
    person_name: 'Микола Іванчук',
    gender: 'Чоловік',
    age: 38,
    migration_date: '2022-08-06',
    migration_time: '03:18',
    reason: 'Економічні причини',
    distance_km: 213.11,
    education_level: 'Доктор наук',
    occupation: 'Лікар',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 25655,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 2389,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m127)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Чернівці'})
CREATE (m128:Migration {
    id: 'mig_128',
    person_name: 'Михайло Петриченко',
    gender: 'Чоловік',
    age: 20,
    migration_date: '2022-09-14',
    migration_time: '00:46',
    reason: 'Бізнес',
    distance_km: 412.68,
    education_level: 'Середня спеціальна',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 36457,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 365,
    return_planned: true, return_date: '2024-03-19'
})-[:MIGRATION_FROM]->(from)
CREATE (m128)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Кропивницький'})
CREATE (m129:Migration {
    id: 'mig_129',
    person_name: 'Віталій Сидоренко',
    gender: 'Чоловік',
    age: 41,
    migration_date: '2023-08-02',
    migration_time: '21:20',
    reason: 'Особисті причини',
    distance_km: 104.57,
    education_level: 'Середня спеціальна',
    occupation: 'Пенсіонер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 47031,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2570,
    return_planned: true, return_date: '2024-01-03'
})-[:MIGRATION_FROM]->(from)
CREATE (m129)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Дніпро'})
CREATE (m130:Migration {
    id: 'mig_130',
    person_name: 'Марина Пономарчук',
    gender: 'Жінка',
    age: 32,
    migration_date: '2023-07-03',
    migration_time: '14:33',
    reason: 'Культурні причини',
    distance_km: 814.87,
    education_level: 'Доктор наук',
    occupation: 'Інженер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 22417,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 2709,
    return_planned: true, return_date: '2024-12-30'
})-[:MIGRATION_FROM]->(from)
CREATE (m130)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Черкаси'})
CREATE (m131:Migration {
    id: 'mig_131',
    person_name: 'Зоя Марчук',
    gender: 'Жінка',
    age: 26,
    migration_date: '2023-12-17',
    migration_time: '16:01',
    reason: 'Навчання',
    distance_km: 450.03,
    education_level: 'Вища',
    occupation: 'Науковець',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 31803,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 1199,
    return_planned: true, return_date: '2024-07-18'
})-[:MIGRATION_FROM]->(from)
CREATE (m131)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Донецьк'})
CREATE (m132:Migration {
    id: 'mig_132',
    person_name: 'Віталій Олійник',
    gender: 'Чоловік',
    age: 35,
    migration_date: '2021-04-12',
    migration_time: '09:18',
    reason: 'Робота',
    distance_km: 295.38,
    education_level: 'Доктор наук',
    occupation: 'Програміст',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 3,
    monthly_income: 29615,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 2767,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m132)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Рівне'})
CREATE (m133:Migration {
    id: 'mig_133',
    person_name: 'Ростислав Федоренко',
    gender: 'Чоловік',
    age: 43,
    migration_date: '2021-07-30',
    migration_time: '16:30',
    reason: 'Відновлення після війни',
    distance_km: 180.28,
    education_level: 'Доктор наук',
    occupation: 'Пенсіонер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 0,
    monthly_income: 15341,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 643,
    return_planned: true, return_date: '2023-03-03'
})-[:MIGRATION_FROM]->(from)
CREATE (m133)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Донецьк'})
CREATE (m134:Migration {
    id: 'mig_134',
    person_name: 'Геннадій Васильчук',
    gender: 'Чоловік',
    age: 20,
    migration_date: '2023-01-06',
    migration_time: '01:07',
    reason: 'Економічні причини',
    distance_km: 295.38,
    education_level: 'Середня спеціальна',
    occupation: 'Архітектор',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 5,
    monthly_income: 20314,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 3474,
    return_planned: true, return_date: '2024-01-21'
})-[:MIGRATION_FROM]->(from)
CREATE (m134)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Суми'})
CREATE (m135:Migration {
    id: 'mig_135',
    person_name: 'Світлана Марчук',
    gender: 'Жінка',
    age: 70,
    migration_date: '2023-03-17',
    migration_time: '00:33',
    reason: 'Робота',
    distance_km: 671.25,
    education_level: 'Середня спеціальна',
    occupation: 'Архітектор',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 12850,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 254,
    return_planned: true, return_date: '2024-03-08'
})-[:MIGRATION_FROM]->(from)
CREATE (m135)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Львів'})
CREATE (m136:Migration {
    id: 'mig_136',
    person_name: 'Юлія Олійник',
    gender: 'Жінка',
    age: 44,
    migration_date: '2023-04-26',
    migration_time: '10:59',
    reason: 'Освітні причини',
    distance_km: 615.82,
    education_level: 'Середня',
    occupation: 'Студент',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 41200,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 2276,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m136)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Вінниця'})
CREATE (m137:Migration {
    id: 'mig_137',
    person_name: 'Богдана Савчук',
    gender: 'Жінка',
    age: 63,
    migration_date: '2022-11-10',
    migration_time: '00:28',
    reason: 'Особисті причини',
    distance_km: 488.68,
    education_level: 'Середня',
    occupation: 'Лікар',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 43039,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 2870,
    return_planned: true, return_date: '2023-04-28'
})-[:MIGRATION_FROM]->(from)
CREATE (m137)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Рівне'})
CREATE (m138:Migration {
    id: 'mig_138',
    person_name: 'Ярина Пономаренко',
    gender: 'Жінка',
    age: 48,
    migration_date: '2023-02-23',
    migration_time: '15:08',
    reason: 'Екологічні причини',
    distance_km: 127.50,
    education_level: 'Магістр',
    occupation: 'Пенсіонер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 27699,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 3227,
    return_planned: true, return_date: '2024-01-29'
})-[:MIGRATION_FROM]->(from)
CREATE (m138)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Черкаси'})
CREATE (m139:Migration {
    id: 'mig_139',
    person_name: 'Тимофій Бондар',
    gender: 'Чоловік',
    age: 54,
    migration_date: '2024-03-27',
    migration_time: '15:12',
    reason: 'Робота',
    distance_km: 288.19,
    education_level: 'Доктор наук',
    occupation: 'Юрист',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 17367,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 1303,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m139)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Чернівці'})
CREATE (m140:Migration {
    id: 'mig_140',
    person_name: 'Євген Савчук',
    gender: 'Чоловік',
    age: 24,
    migration_date: '2022-07-27',
    migration_time: '00:29',
    reason: 'Покращення житлових умов',
    distance_km: 701.24,
    education_level: 'Магістр',
    occupation: 'Програміст',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 5,
    monthly_income: 16125,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 2277,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m140)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Тернопіль'})
CREATE (m141:Migration {
    id: 'mig_141',
    person_name: 'Тетяна Василенко',
    gender: 'Жінка',
    age: 23,
    migration_date: '2023-12-01',
    migration_time: '08:49',
    reason: 'Особисті причини',
    distance_km: 764.67,
    education_level: 'Магістр',
    occupation: 'Бухгалтер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 30483,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 3566,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m141)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Рівне'})
CREATE (m142:Migration {
    id: 'mig_142',
    person_name: 'Зоя Сидоренко',
    gender: 'Жінка',
    age: 33,
    migration_date: '2024-03-08',
    migration_time: '12:49',
    reason: 'Культурні причини',
    distance_km: 884.81,
    education_level: 'Доктор наук',
    occupation: 'Юрист',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 2,
    monthly_income: 48314,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 624,
    return_planned: true, return_date: '2025-12-29'
})-[:MIGRATION_FROM]->(from)
CREATE (m142)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Запоріжжя'})
CREATE (m143:Migration {
    id: 'mig_143',
    person_name: 'Дмитро Кравчук',
    gender: 'Чоловік',
    age: 57,
    migration_date: '2021-06-27',
    migration_time: '16:21',
    reason: 'Політичні причини',
    distance_km: 725.45,
    education_level: 'Доктор наук',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 39160,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 159,
    return_planned: true, return_date: '2022-08-31'
})-[:MIGRATION_FROM]->(from)
CREATE (m143)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Донецьк'})
CREATE (m144:Migration {
    id: 'mig_144',
    person_name: 'Ілля Марчук',
    gender: 'Чоловік',
    age: 31,
    migration_date: '2021-09-06',
    migration_time: '22:30',
    reason: 'Політичні причини',
    distance_km: 199.40,
    education_level: 'Середня',
    occupation: 'Підприємець',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 4,
    monthly_income: 17337,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 755,
    return_planned: true, return_date: '2022-08-25'
})-[:MIGRATION_FROM]->(from)
CREATE (m144)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Дніпро'})
CREATE (m145:Migration {
    id: 'mig_145',
    person_name: 'Назар Гончар',
    gender: 'Чоловік',
    age: 70,
    migration_date: '2022-12-02',
    migration_time: '13:40',
    reason: 'Покращення житлових умов',
    distance_km: 699.42,
    education_level: 'Вища',
    occupation: 'Підприємець',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 17051,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 3051,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m145)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Чернівці'})
CREATE (m146:Migration {
    id: 'mig_146',
    person_name: 'Анастасія Кравчук',
    gender: 'Жінка',
    age: 49,
    migration_date: '2022-06-02',
    migration_time: '04:28',
    reason: 'Освітні причини',
    distance_km: 685.40,
    education_level: 'Середня',
    occupation: 'Дизайнер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 43293,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2798,
    return_planned: true, return_date: '2023-12-18'
})-[:MIGRATION_FROM]->(from)
CREATE (m146)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Кропивницький'})
CREATE (m147:Migration {
    id: 'mig_147',
    person_name: 'Назар Гончар',
    gender: 'Чоловік',
    age: 63,
    migration_date: '2021-06-27',
    migration_time: '02:15',
    reason: 'Культурні причини',
    distance_km: 467.39,
    education_level: 'Магістр',
    occupation: 'Архітектор',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 17141,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2724,
    return_planned: true, return_date: '2022-08-08'
})-[:MIGRATION_FROM]->(from)
CREATE (m147)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Львів'})
CREATE (m148:Migration {
    id: 'mig_148',
    person_name: 'Світлана Васильчук',
    gender: 'Жінка',
    age: 39,
    migration_date: '2024-03-04',
    migration_time: '14:14',
    reason: 'Навчання',
    distance_km: 327.26,
    education_level: 'Магістр',
    occupation: 'Підприємець',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 13070,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 1762,
    return_planned: true, return_date: '2025-03-14'
})-[:MIGRATION_FROM]->(from)
CREATE (m148)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Запоріжжя'})
CREATE (m149:Migration {
    id: 'mig_149',
    person_name: 'Ганна Коваленко',
    gender: 'Жінка',
    age: 22,
    migration_date: '2022-12-14',
    migration_time: '19:45',
    reason: 'Особисті причини',
    distance_km: 69.94,
    education_level: 'Середня спеціальна',
    occupation: 'Юрист',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 23156,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 2441,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m149)-[:MIGRATION_TO]->(to)
WITH *
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Суми'})
CREATE (m150:Migration {
    id: 'mig_150',
    person_name: 'Федір Кравченко',
    gender: 'Чоловік',
    age: 44,
    migration_date: '2023-07-30',
    migration_time: '04:56',
    reason: 'Політичні причини',
    distance_km: 147.76,
    education_level: 'Доктор наук',
    occupation: 'Науковець',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 27921,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1832,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m150)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Рівне'})
CREATE (m151:Migration {
    id: 'mig_151',
    person_name: 'Віталій Грищук',
    gender: 'Чоловік',
    age: 32,
    migration_date: '2024-04-02',
    migration_time: '16:07',
    reason: 'Політичні причини',
    distance_km: 711.54,
    education_level: 'Вища',
    occupation: 'Підприємець',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 2,
    monthly_income: 15013,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2484,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m151)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Чернівці'})
CREATE (m152:Migration {
    id: 'mig_152',
    person_name: 'Християн Василенко',
    gender: 'Чоловік',
    age: 54,
    migration_date: '2022-06-01',
    migration_time: '17:48',
    reason: 'Відновлення після війни',
    distance_km: 701.24,
    education_level: 'Доктор наук',
    occupation: 'Науковець',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 0,
    monthly_income: 19356,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 3646,
    return_planned: true, return_date: '2024-05-20'
})-[:MIGRATION_FROM]->(from)
CREATE (m152)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Суми'})
CREATE (m153:Migration {
    id: 'mig_153',
    person_name: 'Олександр Ткаченко',
    gender: 'Чоловік',
    age: 25,
    migration_date: '2021-12-07',
    migration_time: '01:08',
    reason: 'Медичні причини',
    distance_km: 253.94,
    education_level: 'Середня',
    occupation: 'Програміст',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 12339,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 684,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m153)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Запоріжжя'})
CREATE (m154:Migration {
    id: 'mig_154',
    person_name: 'Сергій Савчук',
    gender: 'Чоловік',
    age: 28,
    migration_date: '2024-03-14',
    migration_time: '07:48',
    reason: 'Культурні причини',
    distance_km: 199.26,
    education_level: 'Вища',
    occupation: 'Робітник',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 41524,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 1711,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m154)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Тернопіль'})
CREATE (m155:Migration {
    id: 'mig_155',
    person_name: 'Андрій Ткачук',
    gender: 'Чоловік',
    age: 20,
    migration_date: '2024-02-27',
    migration_time: '16:01',
    reason: 'Економічні причини',
    distance_km: 127.50,
    education_level: 'Середня спеціальна',
    occupation: 'Робітник',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 24696,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 2738,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m155)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Запоріжжя'})
CREATE (m156:Migration {
    id: 'mig_156',
    person_name: 'Надія Калиненко',
    gender: 'Жінка',
    age: 57,
    migration_date: '2023-07-06',
    migration_time: '14:33',
    reason: 'Бізнес',
    distance_km: 842.08,
    education_level: 'Вища',
    occupation: 'Менеджер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 16417,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 1723,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m156)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Тернопіль'})
CREATE (m157:Migration {
    id: 'mig_157',
    person_name: 'Данило Іваненко',
    gender: 'Чоловік',
    age: 50,
    migration_date: '2023-12-13',
    migration_time: '19:14',
    reason: 'Навчання',
    distance_km: 764.67,
    education_level: 'Середня спеціальна',
    occupation: 'Робітник',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 17165,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 2926,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m157)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Дніпро'})
CREATE (m158:Migration {
    id: 'mig_158',
    person_name: 'Ілля Савченко',
    gender: 'Чоловік',
    age: 33,
    migration_date: '2022-11-09',
    migration_time: '20:39',
    reason: 'Навчання',
    distance_km: 243.73,
    education_level: 'Середня',
    occupation: 'Інженер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 41219,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 2577,
    return_planned: true, return_date: '2024-01-20'
})-[:MIGRATION_FROM]->(from)
CREATE (m158)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Київ'})
CREATE (m159:Migration {
    id: 'mig_159',
    person_name: 'Андрій Бондаренко',
    gender: 'Чоловік',
    age: 50,
    migration_date: '2023-02-11',
    migration_time: '10:50',
    reason: 'Робота',
    distance_km: 441.42,
    education_level: 'Магістр',
    occupation: 'Пенсіонер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 13207,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 925,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m159)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Дніпро'})
CREATE (m160:Migration {
    id: 'mig_160',
    person_name: 'Христина Пономарчук',
    gender: 'Жінка',
    age: 60,
    migration_date: '2024-01-10',
    migration_time: '12:25',
    reason: 'Екологічні причини',
    distance_km: 190.50,
    education_level: 'Доктор наук',
    occupation: 'Пенсіонер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 0,
    monthly_income: 33217,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 2151,
    return_planned: true, return_date: '2024-08-07'
})-[:MIGRATION_FROM]->(from)
CREATE (m160)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Чернівці'})
CREATE (m161:Migration {
    id: 'mig_161',
    person_name: 'Дарія Шевченко',
    gender: 'Жінка',
    age: 36,
    migration_date: '2023-11-25',
    migration_time: '12:47',
    reason: 'Відновлення після війни',
    distance_km: 142.50,
    education_level: 'Вища',
    occupation: 'Програміст',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 27240,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 2354,
    return_planned: true, return_date: '2025-02-11'
})-[:MIGRATION_FROM]->(from)
CREATE (m161)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Кропивницький'})
CREATE (m162:Migration {
    id: 'mig_162',
    person_name: 'Назар Васильчук',
    gender: 'Чоловік',
    age: 27,
    migration_date: '2022-01-14',
    migration_time: '17:38',
    reason: 'Економічні причини',
    distance_km: 615.82,
    education_level: 'Доктор наук',
    occupation: 'Юрист',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 38945,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 3051,
    return_planned: true, return_date: '2023-08-30'
})-[:MIGRATION_FROM]->(from)
CREATE (m162)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Дніпро'})
CREATE (m163:Migration {
    id: 'mig_163',
    person_name: 'Віталій Сидоренко',
    gender: 'Чоловік',
    age: 68,
    migration_date: '2022-06-01',
    migration_time: '22:05',
    reason: 'Освітні причини',
    distance_km: 392.52,
    education_level: 'Вища',
    occupation: 'Лікар',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 42203,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2348,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m163)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Запоріжжя'})
CREATE (m164:Migration {
    id: 'mig_164',
    person_name: 'Олег Грищук',
    gender: 'Чоловік',
    age: 69,
    migration_date: '2022-01-26',
    migration_time: '23:00',
    reason: 'Робота',
    distance_km: 288.19,
    education_level: 'Магістр',
    occupation: 'Перекладач',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 37177,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 1339,
    return_planned: true, return_date: '2023-10-03'
})-[:MIGRATION_FROM]->(from)
CREATE (m164)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Київ'})
CREATE (m165:Migration {
    id: 'mig_165',
    person_name: 'Олексій Сидоренко',
    gender: 'Чоловік',
    age: 67,
    migration_date: '2023-07-13',
    migration_time: '19:00',
    reason: 'Відновлення після війни',
    distance_km: 302.46,
    education_level: 'Магістр',
    occupation: 'Пенсіонер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 24091,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 650,
    return_planned: true, return_date: '2024-12-11'
})-[:MIGRATION_FROM]->(from)
CREATE (m165)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Київ'})
CREATE (m166:Migration {
    id: 'mig_166',
    person_name: 'Наталія Савчук',
    gender: 'Жінка',
    age: 34,
    migration_date: '2022-01-26',
    migration_time: '01:12',
    reason: 'Відновлення після війни',
    distance_km: 394.35,
    education_level: 'Середня',
    occupation: 'Інженер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 39813,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 3366,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m166)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Одеса'})
CREATE (m167:Migration {
    id: 'mig_167',
    person_name: 'Тетяна Мельник',
    gender: 'Жінка',
    age: 29,
    migration_date: '2021-04-28',
    migration_time: '13:42',
    reason: 'Економічні причини',
    distance_km: 564.31,
    education_level: 'Вища',
    occupation: 'Бухгалтер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 7042,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 2842,
    return_planned: true, return_date: '2023-04-04'
})-[:MIGRATION_FROM]->(from)
CREATE (m167)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Харків'})
CREATE (m168:Migration {
    id: 'mig_168',
    person_name: 'Юлія Васильчук',
    gender: 'Жінка',
    age: 59,
    migration_date: '2022-06-12',
    migration_time: '06:31',
    reason: 'Соціальні причини',
    distance_km: 565.34,
    education_level: 'Магістр',
    occupation: 'Робітник',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 47854,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 2325,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m168)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Вінниця'})
CREATE (m169:Migration {
    id: 'mig_169',
    person_name: 'Ольга Калиненко',
    gender: 'Жінка',
    age: 55,
    migration_date: '2022-01-02',
    migration_time: '23:06',
    reason: 'Кліматичні причини',
    distance_km: 514.88,
    education_level: 'Доктор наук',
    occupation: 'Студент',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 22622,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 105,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m169)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Тернопіль'})
CREATE (m170:Migration {
    id: 'mig_170',
    person_name: 'Борис Ткаченко',
    gender: 'Чоловік',
    age: 57,
    migration_date: '2023-08-07',
    migration_time: '07:18',
    reason: 'Особисті причини',
    distance_km: 127.50,
    education_level: 'Середня',
    occupation: 'Підприємець',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 45464,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 1285,
    return_planned: true, return_date: '2025-05-05'
})-[:MIGRATION_FROM]->(from)
CREATE (m170)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Рівне'})
CREATE (m171:Migration {
    id: 'mig_171',
    person_name: 'Вікторія Іванчук',
    gender: 'Жінка',
    age: 23,
    migration_date: '2022-03-23',
    migration_time: '06:21',
    reason: 'Навчання',
    distance_km: 601.61,
    education_level: 'Середня',
    occupation: 'Перекладач',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 11989,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 641,
    return_planned: true, return_date: '2023-08-18'
})-[:MIGRATION_FROM]->(from)
CREATE (m171)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Донецьк'})
CREATE (m172:Migration {
    id: 'mig_172',
    person_name: 'Дарія Сидорчук',
    gender: 'Жінка',
    age: 18,
    migration_date: '2021-07-07',
    migration_time: '11:28',
    reason: 'Кліматичні причини',
    distance_km: 295.38,
    education_level: 'Середня спеціальна',
    occupation: 'Підприємець',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 47942,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 557,
    return_planned: true, return_date: '2021-09-11'
})-[:MIGRATION_FROM]->(from)
CREATE (m172)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Полтава'})
CREATE (m173:Migration {
    id: 'mig_173',
    person_name: 'Денис Попов',
    gender: 'Чоловік',
    age: 57,
    migration_date: '2023-11-29',
    migration_time: '22:21',
    reason: 'Відновлення після війни',
    distance_km: 147.76,
    education_level: 'Вища',
    occupation: 'Бухгалтер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 29500,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2939,
    return_planned: true, return_date: '2025-07-03'
})-[:MIGRATION_FROM]->(from)
CREATE (m173)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Тернопіль'})
CREATE (m174:Migration {
    id: 'mig_174',
    person_name: 'Людмила Лисенко',
    gender: 'Жінка',
    age: 61,
    migration_date: '2022-06-10',
    migration_time: '17:59',
    reason: 'Сімейні обставини',
    distance_km: 699.42,
    education_level: 'Середня спеціальна',
    occupation: 'Робітник',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 26798,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 3303,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m174)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Львів'})
CREATE (m175:Migration {
    id: 'mig_175',
    person_name: 'Юлія Бондаренко',
    gender: 'Жінка',
    age: 68,
    migration_date: '2022-07-11',
    migration_time: '03:06',
    reason: 'Бізнес',
    distance_km: 872.75,
    education_level: 'Середня',
    occupation: 'Вчитель',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 46153,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 1666,
    return_planned: true, return_date: '2023-12-03'
})-[:MIGRATION_FROM]->(from)
CREATE (m175)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Черкаси'})
CREATE (m176:Migration {
    id: 'mig_176',
    person_name: 'Світлана Попов',
    gender: 'Жінка',
    age: 40,
    migration_date: '2023-04-15',
    migration_time: '17:25',
    reason: 'Сімейні обставини',
    distance_km: 180.57,
    education_level: 'Середня',
    occupation: 'Підприємець',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 11196,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 519,
    return_planned: true, return_date: '2025-02-07'
})-[:MIGRATION_FROM]->(from)
CREATE (m176)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Донецьк'})
CREATE (m177:Migration {
    id: 'mig_177',
    person_name: 'Анатолій Шевчук',
    gender: 'Чоловік',
    age: 63,
    migration_date: '2023-01-07',
    migration_time: '19:53',
    reason: 'Політичні причини',
    distance_km: 884.81,
    education_level: 'Магістр',
    occupation: 'Бухгалтер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 17571,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 105,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m177)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Вінниця'})
CREATE (m178:Migration {
    id: 'mig_178',
    person_name: 'Галина Лисенко',
    gender: 'Жінка',
    age: 53,
    migration_date: '2022-12-25',
    migration_time: '13:48',
    reason: 'Навчання',
    distance_km: 261.26,
    education_level: 'Магістр',
    occupation: 'Пенсіонер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 47957,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 3573,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m178)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Запоріжжя'})
CREATE (m179:Migration {
    id: 'mig_179',
    person_name: 'Інга Іваненко',
    gender: 'Жінка',
    age: 21,
    migration_date: '2023-12-14',
    migration_time: '13:39',
    reason: 'Робота',
    distance_km: 366.31,
    education_level: 'Середня',
    occupation: 'Робітник',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 39371,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 3411,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m179)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Чернівці'})
CREATE (m180:Migration {
    id: 'mig_180',
    person_name: 'Тетяна Васильчук',
    gender: 'Жінка',
    age: 69,
    migration_date: '2023-10-26',
    migration_time: '02:19',
    reason: 'Відновлення після війни',
    distance_km: 880.00,
    education_level: 'Магістр',
    occupation: 'Перекладач',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 16162,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1843,
    return_planned: true, return_date: '2024-05-07'
})-[:MIGRATION_FROM]->(from)
CREATE (m180)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Суми'})
CREATE (m181:Migration {
    id: 'mig_181',
    person_name: 'Зінаїда Шевченко',
    gender: 'Жінка',
    age: 32,
    migration_date: '2022-06-19',
    migration_time: '20:50',
    reason: 'Культурні причини',
    distance_km: 772.13,
    education_level: 'Доктор наук',
    occupation: 'Підприємець',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 33519,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 1114,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m181)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Київ'})
CREATE (m182:Migration {
    id: 'mig_182',
    person_name: 'Ірина Савенко',
    gender: 'Жінка',
    age: 49,
    migration_date: '2021-04-11',
    migration_time: '05:05',
    reason: 'Бізнес',
    distance_km: 441.42,
    education_level: 'Магістр',
    occupation: 'Інженер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 0,
    monthly_income: 37522,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 2676,
    return_planned: true, return_date: '2022-09-14'
})-[:MIGRATION_FROM]->(from)
CREATE (m182)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Чернівці'})
CREATE (m183:Migration {
    id: 'mig_183',
    person_name: 'Зоя Гончар',
    gender: 'Жінка',
    age: 37,
    migration_date: '2022-12-18',
    migration_time: '06:02',
    reason: 'Відновлення після війни',
    distance_km: 701.24,
    education_level: 'Середня',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 31315,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 3502,
    return_planned: true, return_date: '2024-07-15'
})-[:MIGRATION_FROM]->(from)
CREATE (m183)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Рівне'})
CREATE (m184:Migration {
    id: 'mig_184',
    person_name: 'Християн Бондар',
    gender: 'Чоловік',
    age: 32,
    migration_date: '2023-03-23',
    migration_time: '20:07',
    reason: 'Медичні причини',
    distance_km: 601.61,
    education_level: 'Вища',
    occupation: 'Дизайнер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 14831,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 3513,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m184)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Суми'})
CREATE (m185:Migration {
    id: 'mig_185',
    person_name: 'Петро Пономаренко',
    gender: 'Чоловік',
    age: 69,
    migration_date: '2022-01-31',
    migration_time: '07:18',
    reason: 'Політичні причини',
    distance_km: 322.77,
    education_level: 'Магістр',
    occupation: 'Програміст',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 3,
    monthly_income: 12268,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 706,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m185)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Дніпро'})
CREATE (m186:Migration {
    id: 'mig_186',
    person_name: 'Тетяна Васильчук',
    gender: 'Жінка',
    age: 19,
    migration_date: '2022-02-27',
    migration_time: '04:56',
    reason: 'Екологічні причини',
    distance_km: 190.50,
    education_level: 'Середня спеціальна',
    occupation: 'Пенсіонер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 0,
    monthly_income: 9346,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1750,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m186)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Харків'})
CREATE (m187:Migration {
    id: 'mig_187',
    person_name: 'Петро Пономарчук',
    gender: 'Чоловік',
    age: 29,
    migration_date: '2023-11-03',
    migration_time: '19:10',
    reason: 'Кліматичні причини',
    distance_km: 248.00,
    education_level: 'Доктор наук',
    occupation: 'Лікар',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 1,
    monthly_income: 47287,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 2972,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m187)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Суми'})
CREATE (m188:Migration {
    id: 'mig_188',
    person_name: 'Михайло Бондаренко',
    gender: 'Чоловік',
    age: 29,
    migration_date: '2022-10-25',
    migration_time: '04:50',
    reason: 'Робота',
    distance_km: 305.42,
    education_level: 'Середня спеціальна',
    occupation: 'Підприємець',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 35202,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2490,
    return_planned: true, return_date: '2023-07-03'
})-[:MIGRATION_FROM]->(from)
CREATE (m188)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Харків'})
CREATE (m189:Migration {
    id: 'mig_189',
    person_name: 'Юрій Сидорчук',
    gender: 'Чоловік',
    age: 40,
    migration_date: '2022-09-13',
    migration_time: '13:54',
    reason: 'Екологічні причини',
    distance_km: 305.94,
    education_level: 'Середня спеціальна',
    occupation: 'Архітектор',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 20128,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 2693,
    return_planned: true, return_date: '2023-02-23'
})-[:MIGRATION_FROM]->(from)
CREATE (m189)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Суми'})
CREATE (m190:Migration {
    id: 'mig_190',
    person_name: 'Тетяна Васильчук',
    gender: 'Жінка',
    age: 70,
    migration_date: '2023-03-04',
    migration_time: '20:33',
    reason: 'Покращення житлових умов',
    distance_km: 601.61,
    education_level: 'Доктор наук',
    occupation: 'Програміст',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 2,
    monthly_income: 48040,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 981,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m190)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Чернівці'})
CREATE (m191:Migration {
    id: 'mig_191',
    person_name: 'Дарія Петриченко',
    gender: 'Жінка',
    age: 41,
    migration_date: '2022-03-24',
    migration_time: '20:39',
    reason: 'Економічні причини',
    distance_km: 409.70,
    education_level: 'Вища',
    occupation: 'Бухгалтер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 3,
    monthly_income: 29375,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 488,
    return_planned: true, return_date: '2023-01-14'
})-[:MIGRATION_FROM]->(from)
CREATE (m191)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Кропивницький'})
CREATE (m192:Migration {
    id: 'mig_192',
    person_name: 'Світлана Петренко',
    gender: 'Жінка',
    age: 54,
    migration_date: '2023-12-04',
    migration_time: '13:11',
    reason: 'Економічні причини',
    distance_km: 467.39,
    education_level: 'Середня спеціальна',
    occupation: 'Робітник',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 2,
    monthly_income: 28720,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 1627,
    return_planned: true, return_date: '2024-10-10'
})-[:MIGRATION_FROM]->(from)
CREATE (m192)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Кропивницький'})
CREATE (m193:Migration {
    id: 'mig_193',
    person_name: 'Кирило Левченко',
    gender: 'Чоловік',
    age: 45,
    migration_date: '2021-04-29',
    migration_time: '05:04',
    reason: 'Політичні причини',
    distance_km: 253.58,
    education_level: 'Середня',
    occupation: 'Пенсіонер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 5605,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 1130,
    return_planned: true, return_date: '2021-08-09'
})-[:MIGRATION_FROM]->(from)
CREATE (m193)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Київ'})
CREATE (m194:Migration {
    id: 'mig_194',
    person_name: 'Олена Савчук',
    gender: 'Жінка',
    age: 55,
    migration_date: '2021-09-10',
    migration_time: '13:29',
    reason: 'Сімейні обставини',
    distance_km: 366.01,
    education_level: 'Середня',
    occupation: 'Лікар',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 39637,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 2511,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m194)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Запоріжжя'})
CREATE (m195:Migration {
    id: 'mig_195',
    person_name: 'Ярина Федоренко',
    gender: 'Жінка',
    age: 43,
    migration_date: '2022-01-21',
    migration_time: '12:58',
    reason: 'Медичні причини',
    distance_km: 226.31,
    education_level: 'Доктор наук',
    occupation: 'Підприємець',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 42542,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 1402,
    return_planned: true, return_date: '2023-07-23'
})-[:MIGRATION_FROM]->(from)
CREATE (m195)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Чернівці'})
CREATE (m196:Migration {
    id: 'mig_196',
    person_name: 'Інна Марчук',
    gender: 'Жінка',
    age: 37,
    migration_date: '2022-03-20',
    migration_time: '06:49',
    reason: 'Політичні причини',
    distance_km: 685.40,
    education_level: 'Магістр',
    occupation: 'Дизайнер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 44533,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 3504,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m196)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Донецьк'})
CREATE (m197:Migration {
    id: 'mig_197',
    person_name: 'Жанна Шевчук',
    gender: 'Жінка',
    age: 63,
    migration_date: '2022-10-17',
    migration_time: '08:57',
    reason: 'Екологічні причини',
    distance_km: 1024.88,
    education_level: 'Магістр',
    occupation: 'Робітник',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 39047,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1733,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m197)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Тернопіль'})
CREATE (m198:Migration {
    id: 'mig_198',
    person_name: 'Галина Сидоренко',
    gender: 'Жінка',
    age: 56,
    migration_date: '2023-12-10',
    migration_time: '05:03',
    reason: 'Особисті причини',
    distance_km: 366.01,
    education_level: 'Доктор наук',
    occupation: 'Юрист',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 0,
    monthly_income: 5653,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 3190,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m198)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Суми'})
CREATE (m199:Migration {
    id: 'mig_199',
    person_name: 'Марія Василенко',
    gender: 'Жінка',
    age: 59,
    migration_date: '2023-07-24',
    migration_time: '09:27',
    reason: 'Відновлення після війни',
    distance_km: 387.94,
    education_level: 'Магістр',
    occupation: 'Інженер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 34132,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1005,
    return_planned: true, return_date: '2024-12-01'
})-[:MIGRATION_FROM]->(from)
CREATE (m199)-[:MIGRATION_TO]->(to)
WITH *
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Чернівці'})
CREATE (m200:Migration {
    id: 'mig_200',
    person_name: 'Ростислав Сидоренко',
    gender: 'Чоловік',
    age: 57,
    migration_date: '2022-04-03',
    migration_time: '22:06',
    reason: 'Медичні причини',
    distance_km: 645.21,
    education_level: 'Середня спеціальна',
    occupation: 'Інженер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 5,
    monthly_income: 21944,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 2603,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m200)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Донецьк'})
CREATE (m201:Migration {
    id: 'mig_201',
    person_name: 'Аліна Петриченко',
    gender: 'Жінка',
    age: 53,
    migration_date: '2021-10-08',
    migration_time: '22:56',
    reason: 'Покращення житлових умов',
    distance_km: 248.00,
    education_level: 'Середня',
    occupation: 'Підприємець',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 27219,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 3111,
    return_planned: true, return_date: '2023-03-01'
})-[:MIGRATION_FROM]->(from)
CREATE (m201)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Рівне'})
CREATE (m202:Migration {
    id: 'mig_202',
    person_name: 'Андрій Бондар',
    gender: 'Чоловік',
    age: 30,
    migration_date: '2022-09-18',
    migration_time: '13:48',
    reason: 'Робота',
    distance_km: 180.28,
    education_level: 'Середня спеціальна',
    occupation: 'Інженер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 30141,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 1732,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m202)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Кропивницький'})
CREATE (m203:Migration {
    id: 'mig_203',
    person_name: 'Єгор Петриченко',
    gender: 'Чоловік',
    age: 70,
    migration_date: '2022-07-06',
    migration_time: '13:13',
    reason: 'Соціальні причини',
    distance_km: 322.77,
    education_level: 'Вища',
    occupation: 'Робітник',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 21753,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 833,
    return_planned: true, return_date: '2023-12-12'
})-[:MIGRATION_FROM]->(from)
CREATE (m203)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Львів'})
CREATE (m204:Migration {
    id: 'mig_204',
    person_name: 'Тетяна Іванчук',
    gender: 'Жінка',
    age: 26,
    migration_date: '2022-04-21',
    migration_time: '21:53',
    reason: 'Бізнес',
    distance_km: 842.08,
    education_level: 'Середня спеціальна',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 17598,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 268,
    return_planned: true, return_date: '2022-12-05'
})-[:MIGRATION_FROM]->(from)
CREATE (m204)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Полтава'})
CREATE (m205:Migration {
    id: 'mig_205',
    person_name: 'Світлана Іваненко',
    gender: 'Жінка',
    age: 32,
    migration_date: '2024-01-08',
    migration_time: '01:00',
    reason: 'Сімейні обставини',
    distance_km: 602.61,
    education_level: 'Магістр',
    occupation: 'Бухгалтер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 3,
    monthly_income: 47157,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2409,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m205)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Дніпро'})
CREATE (m206:Migration {
    id: 'mig_206',
    person_name: 'Максим Лисенко',
    gender: 'Чоловік',
    age: 42,
    migration_date: '2022-11-30',
    migration_time: '20:36',
    reason: 'Навчання',
    distance_km: 672.77,
    education_level: 'Доктор наук',
    occupation: 'Дизайнер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 27438,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 2403,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m206)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Суми'})
CREATE (m207:Migration {
    id: 'mig_207',
    person_name: 'Дарія Іваненко',
    gender: 'Жінка',
    age: 31,
    migration_date: '2021-04-15',
    migration_time: '13:29',
    reason: 'Сімейні обставини',
    distance_km: 772.13,
    education_level: 'Магістр',
    occupation: 'Вчитель',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 7292,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 56,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m207)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Чернівці'})
CREATE (m208:Migration {
    id: 'mig_208',
    person_name: 'Олег Василенко',
    gender: 'Чоловік',
    age: 51,
    migration_date: '2022-12-24',
    migration_time: '07:32',
    reason: 'Особисті причини',
    distance_km: 880.00,
    education_level: 'Середня спеціальна',
    occupation: 'Лікар',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 5,
    monthly_income: 26791,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 958,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m208)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Полтава'})
CREATE (m209:Migration {
    id: 'mig_209',
    person_name: 'Микола Василенко',
    gender: 'Чоловік',
    age: 37,
    migration_date: '2021-08-15',
    migration_time: '06:16',
    reason: 'Бізнес',
    distance_km: 602.61,
    education_level: 'Вища',
    occupation: 'Пенсіонер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 28385,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 483,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m209)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Чернівці'})
CREATE (m210:Migration {
    id: 'mig_210',
    person_name: 'Петро Шевченко',
    gender: 'Чоловік',
    age: 64,
    migration_date: '2022-10-24',
    migration_time: '07:00',
    reason: 'Робота',
    distance_km: 645.21,
    education_level: 'Вища',
    occupation: 'Перекладач',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 47468,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 712,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m210)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Вінниця'})
CREATE (m211:Migration {
    id: 'mig_211',
    person_name: 'Данило Ковальчук',
    gender: 'Чоловік',
    age: 65,
    migration_date: '2023-02-10',
    migration_time: '21:07',
    reason: 'Бізнес',
    distance_km: 698.82,
    education_level: 'Вища',
    occupation: 'Науковець',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 47233,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 111,
    return_planned: true, return_date: '2025-02-01'
})-[:MIGRATION_FROM]->(from)
CREATE (m211)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Харків'})
CREATE (m212:Migration {
    id: 'mig_212',
    person_name: 'Жанна Кравченко',
    gender: 'Жінка',
    age: 70,
    migration_date: '2023-07-16',
    migration_time: '00:27',
    reason: 'Соціальні причини',
    distance_km: 872.75,
    education_level: 'Середня',
    occupation: 'Дизайнер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 0,
    monthly_income: 6205,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1255,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m212)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Донецьк'})
CREATE (m213:Migration {
    id: 'mig_213',
    person_name: 'Ярослав Ковальчук',
    gender: 'Чоловік',
    age: 58,
    migration_date: '2024-02-15',
    migration_time: '12:42',
    reason: 'Культурні причини',
    distance_km: 413.92,
    education_level: 'Магістр',
    occupation: 'Програміст',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 38266,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 2756,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m213)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Чернівці'})
CREATE (m214:Migration {
    id: 'mig_214',
    person_name: 'Артем Марчук',
    gender: 'Чоловік',
    age: 24,
    migration_date: '2023-03-25',
    migration_time: '22:28',
    reason: 'Екологічні причини',
    distance_km: 645.21,
    education_level: 'Середня спеціальна',
    occupation: 'Робітник',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 1,
    monthly_income: 34261,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 3627,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m214)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Кропивницький'})
CREATE (m215:Migration {
    id: 'mig_215',
    person_name: 'Олексій Попов',
    gender: 'Чоловік',
    age: 57,
    migration_date: '2021-10-04',
    migration_time: '03:31',
    reason: 'Покращення житлових умов',
    distance_km: 615.82,
    education_level: 'Доктор наук',
    occupation: 'Студент',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 34880,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 2523,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m215)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Рівне'})
CREATE (m216:Migration {
    id: 'mig_216',
    person_name: 'Уляна Коваленко',
    gender: 'Жінка',
    age: 44,
    migration_date: '2022-04-29',
    migration_time: '09:52',
    reason: 'Робота',
    distance_km: 711.54,
    education_level: 'Середня',
    occupation: 'Бухгалтер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 32256,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 3266,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m216)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Донецьк'})
CREATE (m217:Migration {
    id: 'mig_217',
    person_name: 'Зінаїда Марчук',
    gender: 'Жінка',
    age: 39,
    migration_date: '2022-09-07',
    migration_time: '03:59',
    reason: 'Економічні причини',
    distance_km: 909.55,
    education_level: 'Доктор наук',
    occupation: 'Пенсіонер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 32707,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 1750,
    return_planned: true, return_date: '2022-12-04'
})-[:MIGRATION_FROM]->(from)
CREATE (m217)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Одеса'})
CREATE (m218:Migration {
    id: 'mig_218',
    person_name: 'Маргарита Мельник',
    gender: 'Жінка',
    age: 18,
    migration_date: '2021-06-22',
    migration_time: '09:21',
    reason: 'Соціальні причини',
    distance_km: 253.58,
    education_level: 'Середня спеціальна',
    occupation: 'Бухгалтер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 41821,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 1468,
    return_planned: true, return_date: '2022-07-12'
})-[:MIGRATION_FROM]->(from)
CREATE (m218)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Чернівці'})
CREATE (m219:Migration {
    id: 'mig_219',
    person_name: 'Василь Марчук',
    gender: 'Чоловік',
    age: 58,
    migration_date: '2021-10-24',
    migration_time: '01:36',
    reason: 'Сімейні обставини',
    distance_km: 409.70,
    education_level: 'Доктор наук',
    occupation: 'Дизайнер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 31724,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 3251,
    return_planned: true, return_date: '2023-08-07'
})-[:MIGRATION_FROM]->(from)
CREATE (m219)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Вінниця'})
CREATE (m220:Migration {
    id: 'mig_220',
    person_name: 'Віктор Васильчук',
    gender: 'Чоловік',
    age: 34,
    migration_date: '2021-11-11',
    migration_time: '20:57',
    reason: 'Покращення житлових умов',
    distance_km: 514.88,
    education_level: 'Середня',
    occupation: 'Менеджер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 6324,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1892,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m220)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Дніпро'})
CREATE (m221:Migration {
    id: 'mig_221',
    person_name: 'Анна Савенко',
    gender: 'Жінка',
    age: 30,
    migration_date: '2023-06-28',
    migration_time: '16:56',
    reason: 'Сімейні обставини',
    distance_km: 130.04,
    education_level: 'Магістр',
    occupation: 'Пенсіонер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 25159,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 2022,
    return_planned: true, return_date: '2025-06-01'
})-[:MIGRATION_FROM]->(from)
CREATE (m221)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Тернопіль'})
CREATE (m222:Migration {
    id: 'mig_222',
    person_name: 'Дарія Петриченко',
    gender: 'Жінка',
    age: 31,
    migration_date: '2022-10-21',
    migration_time: '08:20',
    reason: 'Культурні причини',
    distance_km: 764.67,
    education_level: 'Магістр',
    occupation: 'Робітник',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 23664,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 927,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m222)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Донецьк'})
CREATE (m223:Migration {
    id: 'mig_223',
    person_name: 'Єлизавета Савенко',
    gender: 'Жінка',
    age: 41,
    migration_date: '2021-05-08',
    migration_time: '15:46',
    reason: 'Навчання',
    distance_km: 199.40,
    education_level: 'Вища',
    occupation: 'Підприємець',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 40074,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 307,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m223)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Черкаси'})
CREATE (m224:Migration {
    id: 'mig_224',
    person_name: 'Віктор Кравченко',
    gender: 'Чоловік',
    age: 42,
    migration_date: '2023-09-13',
    migration_time: '06:51',
    reason: 'Особисті причини',
    distance_km: 253.94,
    education_level: 'Середня',
    occupation: 'Програміст',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 13414,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 3570,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m224)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Чернівці'})
CREATE (m225:Migration {
    id: 'mig_225',
    person_name: 'Ольга Васильчук',
    gender: 'Жінка',
    age: 55,
    migration_date: '2022-04-04',
    migration_time: '05:12',
    reason: 'Економічні причини',
    distance_km: 771.72,
    education_level: 'Середня спеціальна',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 26493,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 246,
    return_planned: true, return_date: '2023-10-09'
})-[:MIGRATION_FROM]->(from)
CREATE (m225)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Львів'})
CREATE (m226:Migration {
    id: 'mig_226',
    person_name: 'Михайло Грищук',
    gender: 'Чоловік',
    age: 29,
    migration_date: '2021-06-25',
    migration_time: '12:55',
    reason: 'Навчання',
    distance_km: 221.13,
    education_level: 'Доктор наук',
    occupation: 'Менеджер',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 3,
    monthly_income: 37352,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 773,
    return_planned: true, return_date: '2023-05-10'
})-[:MIGRATION_FROM]->(from)
CREATE (m226)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Київ'})
CREATE (m227:Migration {
    id: 'mig_227',
    person_name: 'Андрій Марчук',
    gender: 'Чоловік',
    age: 61,
    migration_date: '2023-08-23',
    migration_time: '22:56',
    reason: 'Особисті причини',
    distance_km: 156.81,
    education_level: 'Магістр',
    occupation: 'Лікар',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 3,
    monthly_income: 6527,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 2285,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m227)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Полтава'})
CREATE (m228:Migration {
    id: 'mig_228',
    person_name: 'Богдана Романенко',
    gender: 'Жінка',
    age: 24,
    migration_date: '2023-07-18',
    migration_time: '04:30',
    reason: 'Покращення житлових умов',
    distance_km: 205.37,
    education_level: 'Вища',
    occupation: 'Архітектор',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 29426,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 430,
    return_planned: true, return_date: '2024-12-20'
})-[:MIGRATION_FROM]->(from)
CREATE (m228)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Донецьк'})
CREATE (m229:Migration {
    id: 'mig_229',
    person_name: 'Святослав Ткачук',
    gender: 'Чоловік',
    age: 54,
    migration_date: '2022-04-05',
    migration_time: '12:17',
    reason: 'Культурні причини',
    distance_km: 1024.88,
    education_level: 'Доктор наук',
    occupation: 'Студент',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 5,
    monthly_income: 7702,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 130,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m229)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Львів'})
CREATE (m230:Migration {
    id: 'mig_230',
    person_name: 'Поліна Пономарчук',
    gender: 'Жінка',
    age: 19,
    migration_date: '2023-01-24',
    migration_time: '22:03',
    reason: 'Сімейні обставини',
    distance_km: 467.53,
    education_level: 'Середня спеціальна',
    occupation: 'Менеджер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 2,
    monthly_income: 9922,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1975,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m230)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Запоріжжя'})
CREATE (m231:Migration {
    id: 'mig_231',
    person_name: 'Віталій Олійник',
    gender: 'Чоловік',
    age: 63,
    migration_date: '2022-03-07',
    migration_time: '20:10',
    reason: 'Екологічні причини',
    distance_km: 288.19,
    education_level: 'Магістр',
    occupation: 'Підприємець',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 6618,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 510,
    return_planned: true, return_date: '2023-12-04'
})-[:MIGRATION_FROM]->(from)
CREATE (m231)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Черкаси'})
CREATE (m232:Migration {
    id: 'mig_232',
    person_name: 'Олексій Марчук',
    gender: 'Чоловік',
    age: 55,
    migration_date: '2024-02-11',
    migration_time: '13:34',
    reason: 'Економічні причини',
    distance_km: 305.94,
    education_level: 'Середня',
    occupation: 'Лікар',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 39426,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 485,
    return_planned: true, return_date: '2025-03-23'
})-[:MIGRATION_FROM]->(from)
CREATE (m232)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Запоріжжя'})
CREATE (m233:Migration {
    id: 'mig_233',
    person_name: 'Аліна Мельник',
    gender: 'Жінка',
    age: 38,
    migration_date: '2023-01-13',
    migration_time: '23:36',
    reason: 'Сімейні обставини',
    distance_km: 725.45,
    education_level: 'Середня',
    occupation: 'Перекладач',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 22401,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 2500,
    return_planned: true, return_date: '2024-07-21'
})-[:MIGRATION_FROM]->(from)
CREATE (m233)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Запоріжжя'})
CREATE (m234:Migration {
    id: 'mig_234',
    person_name: 'Тарас Ткаченко',
    gender: 'Чоловік',
    age: 47,
    migration_date: '2021-08-29',
    migration_time: '02:25',
    reason: 'Економічні причини',
    distance_km: 685.40,
    education_level: 'Середня',
    occupation: 'Перекладач',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 13739,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2764,
    return_planned: true, return_date: '2022-03-19'
})-[:MIGRATION_FROM]->(from)
CREATE (m234)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Київ'})
CREATE (m235:Migration {
    id: 'mig_235',
    person_name: 'Марк Ковальчук',
    gender: 'Чоловік',
    age: 63,
    migration_date: '2023-04-22',
    migration_time: '06:06',
    reason: 'Економічні причини',
    distance_km: 409.70,
    education_level: 'Доктор наук',
    occupation: 'Лікар',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 35407,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 341,
    return_planned: true, return_date: '2023-10-29'
})-[:MIGRATION_FROM]->(from)
CREATE (m235)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Суми'})
CREATE (m236:Migration {
    id: 'mig_236',
    person_name: 'Маргарита Гончар',
    gender: 'Жінка',
    age: 54,
    migration_date: '2023-02-10',
    migration_time: '17:24',
    reason: 'Особисті причини',
    distance_km: 147.76,
    education_level: 'Доктор наук',
    occupation: 'Підприємець',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 44273,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1701,
    return_planned: true, return_date: '2024-11-07'
})-[:MIGRATION_FROM]->(from)
CREATE (m236)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Суми'})
CREATE (m237:Migration {
    id: 'mig_237',
    person_name: 'Людмила Ткачук',
    gender: 'Жінка',
    age: 32,
    migration_date: '2023-11-15',
    migration_time: '02:44',
    reason: 'Бізнес',
    distance_km: 671.25,
    education_level: 'Середня спеціальна',
    occupation: 'Менеджер',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 4,
    monthly_income: 10210,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 3642,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m237)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Рівне'})
CREATE (m238:Migration {
    id: 'mig_238',
    person_name: 'Юрій Бондаренко',
    gender: 'Чоловік',
    age: 49,
    migration_date: '2023-11-10',
    migration_time: '08:05',
    reason: 'Покращення житлових умов',
    distance_km: 715.03,
    education_level: 'Доктор наук',
    occupation: 'Бухгалтер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 37716,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1975,
    return_planned: true, return_date: '2025-09-22'
})-[:MIGRATION_FROM]->(from)
CREATE (m238)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Запоріжжя'})
CREATE (m239:Migration {
    id: 'mig_239',
    person_name: 'Ганна Марчук',
    gender: 'Жінка',
    age: 20,
    migration_date: '2021-05-10',
    migration_time: '15:43',
    reason: 'Особисті причини',
    distance_km: 366.31,
    education_level: 'Доктор наук',
    occupation: 'Юрист',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 48397,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 1928,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m239)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Рівне'})
CREATE (m240:Migration {
    id: 'mig_240',
    person_name: 'Юлія Петриченко',
    gender: 'Жінка',
    age: 30,
    migration_date: '2021-09-22',
    migration_time: '09:59',
    reason: 'Кліматичні причини',
    distance_km: 302.46,
    education_level: 'Магістр',
    occupation: 'Програміст',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 1,
    monthly_income: 18605,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 804,
    return_planned: true, return_date: '2022-12-01'
})-[:MIGRATION_FROM]->(from)
CREATE (m240)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Черкаси'})
CREATE (m241:Migration {
    id: 'mig_241',
    person_name: 'Катерина Коваленко',
    gender: 'Жінка',
    age: 24,
    migration_date: '2022-09-17',
    migration_time: '02:48',
    reason: 'Сімейні обставини',
    distance_km: 180.57,
    education_level: 'Середня спеціальна',
    occupation: 'Перекладач',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 8272,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 2458,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m241)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Черкаси'})
CREATE (m242:Migration {
    id: 'mig_242',
    person_name: 'Олексій Пономарчук',
    gender: 'Чоловік',
    age: 68,
    migration_date: '2022-05-23',
    migration_time: '01:12',
    reason: 'Культурні причини',
    distance_km: 180.57,
    education_level: 'Магістр',
    occupation: 'Інженер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 1,
    monthly_income: 7074,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 3380,
    return_planned: true, return_date: '2023-01-19'
})-[:MIGRATION_FROM]->(from)
CREATE (m242)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Київ'})
CREATE (m243:Migration {
    id: 'mig_243',
    person_name: 'Олексій Ткаченко',
    gender: 'Чоловік',
    age: 42,
    migration_date: '2021-12-03',
    migration_time: '21:57',
    reason: 'Відновлення після війни',
    distance_km: 409.70,
    education_level: 'Середня',
    occupation: 'Бухгалтер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 29215,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 505,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m243)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Суми'})
CREATE (m244:Migration {
    id: 'mig_244',
    person_name: 'Ростислав Калиниченко',
    gender: 'Чоловік',
    age: 64,
    migration_date: '2023-08-21',
    migration_time: '13:34',
    reason: 'Навчання',
    distance_km: 387.94,
    education_level: 'Вища',
    occupation: 'Архітектор',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 41577,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 3452,
    return_planned: true, return_date: '2024-10-29'
})-[:MIGRATION_FROM]->(from)
CREATE (m244)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Суми'})
CREATE (m245:Migration {
    id: 'mig_245',
    person_name: 'Іван Гончаренко',
    gender: 'Чоловік',
    age: 28,
    migration_date: '2023-05-31',
    migration_time: '16:27',
    reason: 'Бізнес',
    distance_km: 147.76,
    education_level: 'Середня',
    occupation: 'Архітектор',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 0,
    monthly_income: 6621,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 3477,
    return_planned: true, return_date: '2024-02-01'
})-[:MIGRATION_FROM]->(from)
CREATE (m245)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Дніпро'})
CREATE (m246:Migration {
    id: 'mig_246',
    person_name: 'Геннадій Савчук',
    gender: 'Чоловік',
    age: 63,
    migration_date: '2021-04-20',
    migration_time: '21:14',
    reason: 'Політичні причини',
    distance_km: 243.73,
    education_level: 'Доктор наук',
    occupation: 'Лікар',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 1,
    monthly_income: 39927,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 2092,
    return_planned: true, return_date: '2021-11-19'
})-[:MIGRATION_FROM]->(from)
CREATE (m246)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Полтава'})
CREATE (m247:Migration {
    id: 'mig_247',
    person_name: 'Захар Петриченко',
    gender: 'Чоловік',
    age: 53,
    migration_date: '2022-12-30',
    migration_time: '20:51',
    reason: 'Особисті причини',
    distance_km: 205.37,
    education_level: 'Середня',
    occupation: 'Робітник',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 33159,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 924,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m247)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Полтава'})
CREATE (m248:Migration {
    id: 'mig_248',
    person_name: 'Ілля Іванчук',
    gender: 'Чоловік',
    age: 48,
    migration_date: '2024-01-20',
    migration_time: '13:00',
    reason: 'Соціальні причини',
    distance_km: 441.75,
    education_level: 'Середня спеціальна',
    occupation: 'Науковець',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 6797,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 888,
    return_planned: true, return_date: '2025-11-02'
})-[:MIGRATION_FROM]->(from)
CREATE (m248)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Тернопіль'})
CREATE (m249:Migration {
    id: 'mig_249',
    person_name: 'Раїса Ткачук',
    gender: 'Жінка',
    age: 28,
    migration_date: '2022-06-29',
    migration_time: '05:54',
    reason: 'Соціальні причини',
    distance_km: 511.75,
    education_level: 'Доктор наук',
    occupation: 'Архітектор',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 45504,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 46,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m249)-[:MIGRATION_TO]->(to)
WITH *
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Дніпро'})
CREATE (m250:Migration {
    id: 'mig_250',
    person_name: 'Денис Сидорчук',
    gender: 'Чоловік',
    age: 32,
    migration_date: '2023-08-15',
    migration_time: '10:13',
    reason: 'Економічні причини',
    distance_km: 69.94,
    education_level: 'Магістр',
    occupation: 'Робітник',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 0,
    monthly_income: 33818,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 1845,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m250)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Рівне'})
CREATE (m251:Migration {
    id: 'mig_251',
    person_name: 'Тимофій Василенко',
    gender: 'Чоловік',
    age: 42,
    migration_date: '2021-05-12',
    migration_time: '01:30',
    reason: 'Соціальні причини',
    distance_km: 302.46,
    education_level: 'Магістр',
    occupation: 'Робітник',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 34313,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 248,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m251)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Рівне'})
CREATE (m252:Migration {
    id: 'mig_252',
    person_name: 'Данило Сидорчук',
    gender: 'Чоловік',
    age: 59,
    migration_date: '2023-12-21',
    migration_time: '18:02',
    reason: 'Соціальні причини',
    distance_km: 180.28,
    education_level: 'Магістр',
    occupation: 'Перекладач',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 3,
    monthly_income: 7611,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 1487,
    return_planned: true, return_date: '2024-07-29'
})-[:MIGRATION_FROM]->(from)
CREATE (m252)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Дніпро'})
CREATE (m253:Migration {
    id: 'mig_253',
    person_name: 'Євген Коваленко',
    gender: 'Чоловік',
    age: 64,
    migration_date: '2021-04-16',
    migration_time: '01:02',
    reason: 'Сімейні обставини',
    distance_km: 210.14,
    education_level: 'Магістр',
    occupation: 'Бухгалтер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 19201,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 843,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m253)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Чернівці'})
CREATE (m254:Migration {
    id: 'mig_254',
    person_name: 'Богдана Пономарчук',
    gender: 'Жінка',
    age: 31,
    migration_date: '2023-07-22',
    migration_time: '20:21',
    reason: 'Робота',
    distance_km: 467.39,
    education_level: 'Магістр',
    occupation: 'Юрист',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 0,
    monthly_income: 40883,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 1436,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m254)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Донецьк'})
CREATE (m255:Migration {
    id: 'mig_255',
    person_name: 'Світлана Сидоренко',
    gender: 'Жінка',
    age: 53,
    migration_date: '2022-04-02',
    migration_time: '23:17',
    reason: 'Культурні причини',
    distance_km: 413.92,
    education_level: 'Середня',
    occupation: 'Науковець',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 0,
    monthly_income: 11519,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 956,
    return_planned: true, return_date: '2024-01-24'
})-[:MIGRATION_FROM]->(from)
CREATE (m255)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Запоріжжя'})
CREATE (m256:Migration {
    id: 'mig_256',
    person_name: 'Ярина Лисенко',
    gender: 'Жінка',
    age: 30,
    migration_date: '2022-02-21',
    migration_time: '00:41',
    reason: 'Сімейні обставини',
    distance_km: 715.03,
    education_level: 'Доктор наук',
    occupation: 'Студент',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 38498,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1492,
    return_planned: true, return_date: '2022-09-27'
})-[:MIGRATION_FROM]->(from)
CREATE (m256)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Рівне'})
CREATE (m257:Migration {
    id: 'mig_257',
    person_name: 'Роман Калиниченко',
    gender: 'Чоловік',
    age: 60,
    migration_date: '2024-01-03',
    migration_time: '13:23',
    reason: 'Покращення житлових умов',
    distance_km: 221.24,
    education_level: 'Середня спеціальна',
    occupation: 'Дизайнер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 26829,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 2403,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m257)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Донецьк'})
CREATE (m258:Migration {
    id: 'mig_258',
    person_name: 'Вікторія Романенко',
    gender: 'Жінка',
    age: 38,
    migration_date: '2021-06-14',
    migration_time: '18:18',
    reason: 'Освітні причини',
    distance_km: 199.40,
    education_level: 'Магістр',
    occupation: 'Вчитель',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 21825,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1715,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m258)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Рівне'})
CREATE (m259:Migration {
    id: 'mig_259',
    person_name: 'Захар Кравчук',
    gender: 'Чоловік',
    age: 45,
    migration_date: '2024-04-08',
    migration_time: '13:22',
    reason: 'Економічні причини',
    distance_km: 602.61,
    education_level: 'Магістр',
    occupation: 'Дизайнер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 11195,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 373,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m259)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Харків'})
CREATE (m260:Migration {
    id: 'mig_260',
    person_name: 'Христина Петренко',
    gender: 'Жінка',
    age: 23,
    migration_date: '2021-12-29',
    migration_time: '23:49',
    reason: 'Медичні причини',
    distance_km: 331.82,
    education_level: 'Середня спеціальна',
    occupation: 'Дизайнер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 49188,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 299,
    return_planned: true, return_date: '2022-08-13'
})-[:MIGRATION_FROM]->(from)
CREATE (m260)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Донецьк'})
CREATE (m261:Migration {
    id: 'mig_261',
    person_name: 'Ольга Бондаренко',
    gender: 'Жінка',
    age: 53,
    migration_date: '2022-05-31',
    migration_time: '12:29',
    reason: 'Сімейні обставини',
    distance_km: 199.40,
    education_level: 'Середня',
    occupation: 'Лікар',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 38933,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 3313,
    return_planned: true, return_date: '2023-04-17'
})-[:MIGRATION_FROM]->(from)
CREATE (m261)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Чернівці'})
CREATE (m262:Migration {
    id: 'mig_262',
    person_name: 'Єгор Ковальчук',
    gender: 'Чоловік',
    age: 67,
    migration_date: '2023-02-16',
    migration_time: '14:46',
    reason: 'Особисті причини',
    distance_km: 645.21,
    education_level: 'Магістр',
    occupation: 'Вчитель',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 40283,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 1666,
    return_planned: true, return_date: '2024-11-01'
})-[:MIGRATION_FROM]->(from)
CREATE (m262)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Чернівці'})
CREATE (m263:Migration {
    id: 'mig_263',
    person_name: 'Анатолій Сидорчук',
    gender: 'Чоловік',
    age: 57,
    migration_date: '2022-01-21',
    migration_time: '12:18',
    reason: 'Освітні причини',
    distance_km: 259.89,
    education_level: 'Вища',
    occupation: 'Лікар',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 1,
    monthly_income: 22752,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2252,
    return_planned: true, return_date: '2022-06-14'
})-[:MIGRATION_FROM]->(from)
CREATE (m263)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Дніпро'})
CREATE (m264:Migration {
    id: 'mig_264',
    person_name: 'Леонід Попов',
    gender: 'Чоловік',
    age: 66,
    migration_date: '2021-04-09',
    migration_time: '04:21',
    reason: 'Економічні причини',
    distance_km: 210.14,
    education_level: 'Середня',
    occupation: 'Програміст',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 2,
    monthly_income: 25137,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 1947,
    return_planned: true, return_date: '2021-10-06'
})-[:MIGRATION_FROM]->(from)
CREATE (m264)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Харків'})
CREATE (m265:Migration {
    id: 'mig_265',
    person_name: 'Михайло Васильчук',
    gender: 'Чоловік',
    age: 29,
    migration_date: '2023-04-26',
    migration_time: '23:57',
    reason: 'Кліматичні причини',
    distance_km: 305.94,
    education_level: 'Вища',
    occupation: 'Програміст',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 5309,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 3599,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m265)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Київ'})
CREATE (m266:Migration {
    id: 'mig_266',
    person_name: 'Аліна Бондаренко',
    gender: 'Жінка',
    age: 62,
    migration_date: '2022-08-02',
    migration_time: '11:33',
    reason: 'Економічні причини',
    distance_km: 302.46,
    education_level: 'Вища',
    occupation: 'Вчитель',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 7796,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 1883,
    return_planned: true, return_date: '2023-08-12'
})-[:MIGRATION_FROM]->(from)
CREATE (m266)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Кропивницький'})
CREATE (m267:Migration {
    id: 'mig_267',
    person_name: 'Олександр Федоренко',
    gender: 'Чоловік',
    age: 70,
    migration_date: '2023-09-18',
    migration_time: '03:16',
    reason: 'Відновлення після війни',
    distance_km: 413.92,
    education_level: 'Вища',
    occupation: 'Юрист',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 24887,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 3226,
    return_planned: true, return_date: '2024-08-08'
})-[:MIGRATION_FROM]->(from)
CREATE (m267)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Суми'})
CREATE (m268:Migration {
    id: 'mig_268',
    person_name: 'Федір Іваненко',
    gender: 'Чоловік',
    age: 70,
    migration_date: '2021-12-28',
    migration_time: '06:09',
    reason: 'Економічні причини',
    distance_km: 488.43,
    education_level: 'Вища',
    occupation: 'Бухгалтер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 24535,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 3025,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m268)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Полтава'})
CREATE (m269:Migration {
    id: 'mig_269',
    person_name: 'Олександр Марченко',
    gender: 'Чоловік',
    age: 62,
    migration_date: '2023-04-16',
    migration_time: '11:42',
    reason: 'Сімейні обставини',
    distance_km: 199.26,
    education_level: 'Середня спеціальна',
    occupation: 'Пенсіонер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 41832,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 1387,
    return_planned: true, return_date: '2023-06-29'
})-[:MIGRATION_FROM]->(from)
CREATE (m269)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Запоріжжя'})
CREATE (m270:Migration {
    id: 'mig_270',
    person_name: 'Олена Левченко',
    gender: 'Жінка',
    age: 19,
    migration_date: '2023-03-09',
    migration_time: '15:57',
    reason: 'Робота',
    distance_km: 252.50,
    education_level: 'Магістр',
    occupation: 'Перекладач',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 48780,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 2214,
    return_planned: true, return_date: '2024-10-07'
})-[:MIGRATION_FROM]->(from)
CREATE (m270)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Львів'})
CREATE (m271:Migration {
    id: 'mig_271',
    person_name: 'Інна Грищук',
    gender: 'Жінка',
    age: 48,
    migration_date: '2023-09-13',
    migration_time: '04:48',
    reason: 'Медичні причини',
    distance_km: 116.98,
    education_level: 'Вища',
    occupation: 'Архітектор',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 5735,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 2161,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m271)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Харків'})
CREATE (m272:Migration {
    id: 'mig_272',
    person_name: 'Анна Ткачук',
    gender: 'Жінка',
    age: 62,
    migration_date: '2022-02-17',
    migration_time: '05:02',
    reason: 'Соціальні причини',
    distance_km: 248.00,
    education_level: 'Вища',
    occupation: 'Архітектор',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 9233,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 2545,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m272)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Кропивницький'})
CREATE (m273:Migration {
    id: 'mig_273',
    person_name: 'Юрій Павленко',
    gender: 'Чоловік',
    age: 68,
    migration_date: '2023-05-06',
    migration_time: '14:54',
    reason: 'Кліматичні причини',
    distance_km: 253.58,
    education_level: 'Вища',
    occupation: 'Пенсіонер',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 5,
    monthly_income: 20904,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 2881,
    return_planned: true, return_date: '2023-09-15'
})-[:MIGRATION_FROM]->(from)
CREATE (m273)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Київ'})
CREATE (m274:Migration {
    id: 'mig_274',
    person_name: 'Анатолій Романенко',
    gender: 'Чоловік',
    age: 60,
    migration_date: '2021-09-05',
    migration_time: '11:50',
    reason: 'Медичні причини',
    distance_km: 409.70,
    education_level: 'Середня',
    occupation: 'Науковець',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 35489,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 447,
    return_planned: true, return_date: '2022-04-10'
})-[:MIGRATION_FROM]->(from)
CREATE (m274)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Суми'})
CREATE (m275:Migration {
    id: 'mig_275',
    person_name: 'Тарас Пономарчук',
    gender: 'Чоловік',
    age: 61,
    migration_date: '2022-05-17',
    migration_time: '07:15',
    reason: 'Соціальні причини',
    distance_km: 147.76,
    education_level: 'Вища',
    occupation: 'Лікар',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 37385,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 437,
    return_planned: true, return_date: '2024-03-27'
})-[:MIGRATION_FROM]->(from)
CREATE (m275)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Одеса'})
CREATE (m276:Migration {
    id: 'mig_276',
    person_name: 'Тетяна Савчук',
    gender: 'Жінка',
    age: 67,
    migration_date: '2023-04-18',
    migration_time: '00:42',
    reason: 'Особисті причини',
    distance_km: 575.61,
    education_level: 'Середня',
    occupation: 'Інженер',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 2,
    monthly_income: 42738,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 1897,
    return_planned: true, return_date: '2024-06-17'
})-[:MIGRATION_FROM]->(from)
CREATE (m276)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Вінниця'})
CREATE (m277:Migration {
    id: 'mig_277',
    person_name: 'Денис Петренко',
    gender: 'Чоловік',
    age: 46,
    migration_date: '2024-02-12',
    migration_time: '00:39',
    reason: 'Відновлення після війни',
    distance_km: 514.88,
    education_level: 'Середня спеціальна',
    occupation: 'Дизайнер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 17429,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 771,
    return_planned: true, return_date: '2024-06-25'
})-[:MIGRATION_FROM]->(from)
CREATE (m277)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Полтава'})
CREATE (m278:Migration {
    id: 'mig_278',
    person_name: 'Григорій Калиненко',
    gender: 'Чоловік',
    age: 30,
    migration_date: '2022-12-06',
    migration_time: '09:00',
    reason: 'Робота',
    distance_km: 205.37,
    education_level: 'Середня спеціальна',
    occupation: 'Науковець',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 37854,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 41,
    return_planned: true, return_date: '2023-04-02'
})-[:MIGRATION_FROM]->(from)
CREATE (m278)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Тернопіль'})
CREATE (m279:Migration {
    id: 'mig_279',
    person_name: 'Тетяна Василенко',
    gender: 'Жінка',
    age: 38,
    migration_date: '2023-07-14',
    migration_time: '00:43',
    reason: 'Відновлення після війни',
    distance_km: 366.01,
    education_level: 'Магістр',
    occupation: 'Юрист',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 2,
    monthly_income: 9388,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 1858,
    return_planned: true, return_date: '2024-09-12'
})-[:MIGRATION_FROM]->(from)
CREATE (m279)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Кропивницький'})
CREATE (m280:Migration {
    id: 'mig_280',
    person_name: 'Василь Шевченко',
    gender: 'Чоловік',
    age: 39,
    migration_date: '2022-02-15',
    migration_time: '05:29',
    reason: 'Економічні причини',
    distance_km: 288.58,
    education_level: 'Середня',
    occupation: 'Бухгалтер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 36794,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 2875,
    return_planned: true, return_date: '2024-02-13'
})-[:MIGRATION_FROM]->(from)
CREATE (m280)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Харків'})
CREATE (m281:Migration {
    id: 'mig_281',
    person_name: 'Данило Петренко',
    gender: 'Чоловік',
    age: 47,
    migration_date: '2023-12-16',
    migration_time: '05:23',
    reason: 'Медичні причини',
    distance_km: 190.50,
    education_level: 'Середня',
    occupation: 'Бухгалтер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 6889,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1144,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m281)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Вінниця'})
CREATE (m282:Migration {
    id: 'mig_282',
    person_name: 'Валентин Лисенко',
    gender: 'Чоловік',
    age: 46,
    migration_date: '2022-01-19',
    migration_time: '18:16',
    reason: 'Відновлення після війни',
    distance_km: 210.97,
    education_level: 'Доктор наук',
    occupation: 'Програміст',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 11134,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 145,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m282)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Вінниця'})
CREATE (m283:Migration {
    id: 'mig_283',
    person_name: 'Павло Мельник',
    gender: 'Чоловік',
    age: 51,
    migration_date: '2022-05-24',
    migration_time: '10:48',
    reason: 'Кліматичні причини',
    distance_km: 441.75,
    education_level: 'Вища',
    occupation: 'Бухгалтер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 49833,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2179,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m283)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Тернопіль'})
CREATE (m284:Migration {
    id: 'mig_284',
    person_name: 'Інна Василенко',
    gender: 'Жінка',
    age: 63,
    migration_date: '2023-10-08',
    migration_time: '06:15',
    reason: 'Освітні причини',
    distance_km: 511.75,
    education_level: 'Магістр',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 41658,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 3046,
    return_planned: true, return_date: '2024-09-07'
})-[:MIGRATION_FROM]->(from)
CREATE (m284)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Запоріжжя'})
CREATE (m285:Migration {
    id: 'mig_285',
    person_name: 'Юлія Павленко',
    gender: 'Жінка',
    age: 32,
    migration_date: '2021-07-08',
    migration_time: '17:57',
    reason: 'Політичні причини',
    distance_km: 199.40,
    education_level: 'Вища',
    occupation: 'Студент',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 46491,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 957,
    return_planned: true, return_date: '2021-08-09'
})-[:MIGRATION_FROM]->(from)
CREATE (m285)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Суми'})
CREATE (m286:Migration {
    id: 'mig_286',
    person_name: 'Іван Калиниченко',
    gender: 'Чоловік',
    age: 20,
    migration_date: '2021-11-26',
    migration_time: '09:48',
    reason: 'Економічні причини',
    distance_km: 253.94,
    education_level: 'Середня',
    occupation: 'Підприємець',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 2,
    monthly_income: 16373,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 963,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m286)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Суми'})
CREATE (m287:Migration {
    id: 'mig_287',
    person_name: 'Леонід Гончар',
    gender: 'Чоловік',
    age: 59,
    migration_date: '2023-09-10',
    migration_time: '08:17',
    reason: 'Сімейні обставини',
    distance_km: 575.61,
    education_level: 'Середня спеціальна',
    occupation: 'Бухгалтер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 5563,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 1036,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m287)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Дніпро'})
CREATE (m288:Migration {
    id: 'mig_288',
    person_name: 'Марк Савенко',
    gender: 'Чоловік',
    age: 21,
    migration_date: '2023-04-14',
    migration_time: '19:55',
    reason: 'Освітні причини',
    distance_km: 677.78,
    education_level: 'Магістр',
    occupation: 'Архітектор',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 3,
    monthly_income: 46483,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 3435,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m288)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Рівне'})
CREATE (m289:Migration {
    id: 'mig_289',
    person_name: 'Ксенія Гончар',
    gender: 'Жінка',
    age: 68,
    migration_date: '2023-03-25',
    migration_time: '23:29',
    reason: 'Бізнес',
    distance_km: 602.61,
    education_level: 'Магістр',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 25782,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 2433,
    return_planned: true, return_date: '2024-05-05'
})-[:MIGRATION_FROM]->(from)
CREATE (m289)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Одеса'})
CREATE (m290:Migration {
    id: 'mig_290',
    person_name: 'Вікторія Попов',
    gender: 'Жінка',
    age: 66,
    migration_date: '2021-11-25',
    migration_time: '09:05',
    reason: 'Медичні причини',
    distance_km: 511.75,
    education_level: 'Середня',
    occupation: 'Менеджер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 10409,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 677,
    return_planned: true, return_date: '2022-09-20'
})-[:MIGRATION_FROM]->(from)
CREATE (m290)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Суми'})
CREATE (m291:Migration {
    id: 'mig_291',
    person_name: 'Василь Савенко',
    gender: 'Чоловік',
    age: 52,
    migration_date: '2024-03-08',
    migration_time: '09:38',
    reason: 'Екологічні причини',
    distance_km: 575.61,
    education_level: 'Доктор наук',
    occupation: 'Програміст',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 30245,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 1756,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m291)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Харків'})
CREATE (m292:Migration {
    id: 'mig_292',
    person_name: 'Зоя Ткаченко',
    gender: 'Жінка',
    age: 40,
    migration_date: '2022-11-13',
    migration_time: '14:50',
    reason: 'Економічні причини',
    distance_km: 190.50,
    education_level: 'Середня спеціальна',
    occupation: 'Програміст',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 22387,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 2408,
    return_planned: true, return_date: '2023-04-21'
})-[:MIGRATION_FROM]->(from)
CREATE (m292)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Одеса'})
CREATE (m293:Migration {
    id: 'mig_293',
    person_name: 'Єлизавета Марчук',
    gender: 'Жінка',
    age: 59,
    migration_date: '2023-09-25',
    migration_time: '18:07',
    reason: 'Бізнес',
    distance_km: 392.52,
    education_level: 'Доктор наук',
    occupation: 'Перекладач',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 12218,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 554,
    return_planned: true, return_date: '2025-09-05'
})-[:MIGRATION_FROM]->(from)
CREATE (m293)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Полтава'})
CREATE (m294:Migration {
    id: 'mig_294',
    person_name: 'Марк Калиниченко',
    gender: 'Чоловік',
    age: 47,
    migration_date: '2022-08-08',
    migration_time: '10:28',
    reason: 'Бізнес',
    distance_km: 180.57,
    education_level: 'Середня спеціальна',
    occupation: 'Перекладач',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 44398,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 3005,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m294)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Суми'})
CREATE (m295:Migration {
    id: 'mig_295',
    person_name: 'Павло Кравченко',
    gender: 'Чоловік',
    age: 24,
    migration_date: '2022-11-24',
    migration_time: '05:02',
    reason: 'Покращення житлових умов',
    distance_km: 342.14,
    education_level: 'Доктор наук',
    occupation: 'Архітектор',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 11769,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 1907,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m295)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Вінниця'})
CREATE (m296:Migration {
    id: 'mig_296',
    person_name: 'Віктор Кравчук',
    gender: 'Чоловік',
    age: 32,
    migration_date: '2023-08-27',
    migration_time: '13:54',
    reason: 'Економічні причини',
    distance_km: 210.97,
    education_level: 'Вища',
    occupation: 'Студент',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 35374,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2299,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m296)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Кропивницький'})
CREATE (m297:Migration {
    id: 'mig_297',
    person_name: 'Іван Коваленко',
    gender: 'Чоловік',
    age: 44,
    migration_date: '2022-03-18',
    migration_time: '14:11',
    reason: 'Освітні причини',
    distance_km: 104.57,
    education_level: 'Доктор наук',
    occupation: 'Студент',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 39277,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 826,
    return_planned: true, return_date: '2023-11-04'
})-[:MIGRATION_FROM]->(from)
CREATE (m297)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Чернівці'})
CREATE (m298:Migration {
    id: 'mig_298',
    person_name: 'Петро Савчук',
    gender: 'Чоловік',
    age: 26,
    migration_date: '2022-05-14',
    migration_time: '19:25',
    reason: 'Екологічні причини',
    distance_km: 465.78,
    education_level: 'Магістр',
    occupation: 'Науковець',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 3,
    monthly_income: 36306,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 2889,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m298)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Тернопіль'})
CREATE (m299:Migration {
    id: 'mig_299',
    person_name: 'Валентина Калиниченко',
    gender: 'Жінка',
    age: 54,
    migration_date: '2022-12-09',
    migration_time: '23:50',
    reason: 'Навчання',
    distance_km: 725.45,
    education_level: 'Доктор наук',
    occupation: 'Пенсіонер',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 2,
    monthly_income: 15123,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 1214,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m299)-[:MIGRATION_TO]->(to)
WITH *
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Одеса'})
CREATE (m300:Migration {
    id: 'mig_300',
    person_name: 'Костянтин Савчук',
    gender: 'Чоловік',
    age: 28,
    migration_date: '2021-07-08',
    migration_time: '02:45',
    reason: 'Робота',
    distance_km: 575.61,
    education_level: 'Магістр',
    occupation: 'Програміст',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 42730,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 1354,
    return_planned: true, return_date: '2021-11-17'
})-[:MIGRATION_FROM]->(from)
CREATE (m300)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Харків'})
CREATE (m301:Migration {
    id: 'mig_301',
    person_name: 'Іван Лисенко',
    gender: 'Чоловік',
    age: 56,
    migration_date: '2021-06-11',
    migration_time: '02:49',
    reason: 'Особисті причини',
    distance_km: 711.54,
    education_level: 'Вища',
    occupation: 'Пенсіонер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 1,
    monthly_income: 41529,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 713,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m301)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Харків'})
CREATE (m302:Migration {
    id: 'mig_302',
    person_name: 'Світлана Ткачук',
    gender: 'Жінка',
    age: 55,
    migration_date: '2024-01-17',
    migration_time: '17:03',
    reason: 'Бізнес',
    distance_km: 190.50,
    education_level: 'Доктор наук',
    occupation: 'Підприємець',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 5,
    monthly_income: 26839,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 995,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m302)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Рівне'})
CREATE (m303:Migration {
    id: 'mig_303',
    person_name: 'Лариса Гончар',
    gender: 'Жінка',
    age: 36,
    migration_date: '2024-02-21',
    migration_time: '23:38',
    reason: 'Сімейні обставини',
    distance_km: 221.24,
    education_level: 'Середня',
    occupation: 'Менеджер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 14129,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 1166,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m303)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Дніпро'})
CREATE (m304:Migration {
    id: 'mig_304',
    person_name: 'Роман Калиниченко',
    gender: 'Чоловік',
    age: 28,
    migration_date: '2022-10-09',
    migration_time: '17:03',
    reason: 'Сімейні обставини',
    distance_km: 699.42,
    education_level: 'Доктор наук',
    occupation: 'Підприємець',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 49277,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 1987,
    return_planned: true, return_date: '2024-02-16'
})-[:MIGRATION_FROM]->(from)
CREATE (m304)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Рівне'})
CREATE (m305:Migration {
    id: 'mig_305',
    person_name: 'Віктор Лисенко',
    gender: 'Чоловік',
    age: 70,
    migration_date: '2023-03-26',
    migration_time: '05:13',
    reason: 'Екологічні причини',
    distance_km: 127.50,
    education_level: 'Магістр',
    occupation: 'Юрист',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 25904,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 3069,
    return_planned: true, return_date: '2023-10-30'
})-[:MIGRATION_FROM]->(from)
CREATE (m305)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Полтава'})
CREATE (m306:Migration {
    id: 'mig_306',
    person_name: 'Аліна Грищенко',
    gender: 'Жінка',
    age: 61,
    migration_date: '2023-04-07',
    migration_time: '17:34',
    reason: 'Соціальні причини',
    distance_km: 180.57,
    education_level: 'Доктор наук',
    occupation: 'Вчитель',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 43105,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 3596,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m306)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Дніпро'})
CREATE (m307:Migration {
    id: 'mig_307',
    person_name: 'Дмитро Кравчук',
    gender: 'Чоловік',
    age: 43,
    migration_date: '2023-01-27',
    migration_time: '11:31',
    reason: 'Особисті причини',
    distance_km: 677.78,
    education_level: 'Вища',
    occupation: 'Менеджер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 29544,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 2531,
    return_planned: true, return_date: '2023-04-30'
})-[:MIGRATION_FROM]->(from)
CREATE (m307)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Суми'})
CREATE (m308:Migration {
    id: 'mig_308',
    person_name: 'Богдана Васильчук',
    gender: 'Жінка',
    age: 22,
    migration_date: '2022-04-30',
    migration_time: '02:38',
    reason: 'Економічні причини',
    distance_km: 772.13,
    education_level: 'Вища',
    occupation: 'Вчитель',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 36948,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2874,
    return_planned: true, return_date: '2022-06-27'
})-[:MIGRATION_FROM]->(from)
CREATE (m308)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Черкаси'})
CREATE (m309:Migration {
    id: 'mig_309',
    person_name: 'Лариса Петренко',
    gender: 'Жінка',
    age: 18,
    migration_date: '2022-01-13',
    migration_time: '07:03',
    reason: 'Освітні причини',
    distance_km: 344.04,
    education_level: 'Вища',
    occupation: 'Вчитель',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 44155,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 3381,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m309)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Суми'})
CREATE (m310:Migration {
    id: 'mig_310',
    person_name: 'Лариса Попов',
    gender: 'Жінка',
    age: 62,
    migration_date: '2022-06-04',
    migration_time: '15:38',
    reason: 'Екологічні причини',
    distance_km: 488.43,
    education_level: 'Середня спеціальна',
    occupation: 'Дизайнер',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 3,
    monthly_income: 8183,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 3202,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m310)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Черкаси'})
CREATE (m311:Migration {
    id: 'mig_311',
    person_name: 'Григорій Сидорчук',
    gender: 'Чоловік',
    age: 51,
    migration_date: '2024-01-05',
    migration_time: '17:26',
    reason: 'Кліматичні причини',
    distance_km: 243.73,
    education_level: 'Середня',
    occupation: 'Робітник',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 5648,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 1858,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m311)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Чернівці'})
CREATE (m312:Migration {
    id: 'mig_312',
    person_name: 'Максим Пономарчук',
    gender: 'Чоловік',
    age: 59,
    migration_date: '2024-02-28',
    migration_time: '21:31',
    reason: 'Медичні причини',
    distance_km: 645.21,
    education_level: 'Вища',
    occupation: 'Бухгалтер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 44067,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 409,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m312)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Тернопіль'})
CREATE (m313:Migration {
    id: 'mig_313',
    person_name: 'Віталій Сидорчук',
    gender: 'Чоловік',
    age: 47,
    migration_date: '2023-02-07',
    migration_time: '17:29',
    reason: 'Покращення житлових умов',
    distance_km: 127.50,
    education_level: 'Магістр',
    occupation: 'Науковець',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 37336,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1732,
    return_planned: true, return_date: '2023-09-02'
})-[:MIGRATION_FROM]->(from)
CREATE (m313)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Рівне'})
CREATE (m314:Migration {
    id: 'mig_314',
    person_name: 'Богдана Попов',
    gender: 'Жінка',
    age: 30,
    migration_date: '2023-01-07',
    migration_time: '06:47',
    reason: 'Економічні причини',
    distance_km: 259.89,
    education_level: 'Середня спеціальна',
    occupation: 'Менеджер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 6871,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 1922,
    return_planned: true, return_date: '2024-12-18'
})-[:MIGRATION_FROM]->(from)
CREATE (m314)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Черкаси'})
CREATE (m315:Migration {
    id: 'mig_315',
    person_name: 'Інга Олійник',
    gender: 'Жінка',
    age: 47,
    migration_date: '2021-09-10',
    migration_time: '00:46',
    reason: 'Кліматичні причини',
    distance_km: 579.60,
    education_level: 'Середня',
    occupation: 'Підприємець',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 44546,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 1530,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m315)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Суми'})
CREATE (m316:Migration {
    id: 'mig_316',
    person_name: 'Тетяна Попов',
    gender: 'Жінка',
    age: 55,
    migration_date: '2023-12-17',
    migration_time: '03:32',
    reason: 'Робота',
    distance_km: 342.14,
    education_level: 'Середня',
    occupation: 'Архітектор',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 3,
    monthly_income: 31648,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 1432,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m316)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Львів'})
CREATE (m317:Migration {
    id: 'mig_317',
    person_name: 'Михайло Лисенко',
    gender: 'Чоловік',
    age: 42,
    migration_date: '2022-07-29',
    migration_time: '09:33',
    reason: 'Освітні причини',
    distance_km: 872.75,
    education_level: 'Середня',
    occupation: 'Юрист',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 23688,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 769,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m317)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Чернівці'})
CREATE (m318:Migration {
    id: 'mig_318',
    person_name: 'Ольга Бондаренко',
    gender: 'Жінка',
    age: 56,
    migration_date: '2022-11-23',
    migration_time: '19:24',
    reason: 'Культурні причини',
    distance_km: 409.70,
    education_level: 'Середня',
    occupation: 'Робітник',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 8841,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 1747,
    return_planned: true, return_date: '2023-03-23'
})-[:MIGRATION_FROM]->(from)
CREATE (m318)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Рівне'})
CREATE (m319:Migration {
    id: 'mig_319',
    person_name: 'Катерина Федоренко',
    gender: 'Жінка',
    age: 66,
    migration_date: '2021-11-30',
    migration_time: '02:42',
    reason: 'Покращення житлових умов',
    distance_km: 565.45,
    education_level: 'Вища',
    occupation: 'Лікар',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 5,
    monthly_income: 41577,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1345,
    return_planned: true, return_date: '2022-04-19'
})-[:MIGRATION_FROM]->(from)
CREATE (m319)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Львів'})
CREATE (m320:Migration {
    id: 'mig_320',
    person_name: 'Валентина Марчук',
    gender: 'Жінка',
    age: 33,
    migration_date: '2024-03-01',
    migration_time: '15:54',
    reason: 'Робота',
    distance_km: 467.53,
    education_level: 'Магістр',
    occupation: 'Програміст',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 4,
    monthly_income: 18790,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 1911,
    return_planned: true, return_date: '2025-04-13'
})-[:MIGRATION_FROM]->(from)
CREATE (m320)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Кропивницький'})
CREATE (m321:Migration {
    id: 'mig_321',
    person_name: 'Інга Бондаренко',
    gender: 'Жінка',
    age: 38,
    migration_date: '2021-12-02',
    migration_time: '13:24',
    reason: 'Політичні причини',
    distance_km: 104.57,
    education_level: 'Середня',
    occupation: 'Архітектор',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 39939,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 2252,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m321)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Запоріжжя'})
CREATE (m322:Migration {
    id: 'mig_322',
    person_name: 'Наталія Попов',
    gender: 'Жінка',
    age: 23,
    migration_date: '2023-10-04',
    migration_time: '00:18',
    reason: 'Бізнес',
    distance_km: 366.31,
    education_level: 'Магістр',
    occupation: 'Бухгалтер',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 0,
    monthly_income: 39399,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 1229,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m322)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Донецьк'})
CREATE (m323:Migration {
    id: 'mig_323',
    person_name: 'Святослав Ткаченко',
    gender: 'Чоловік',
    age: 34,
    migration_date: '2024-03-13',
    migration_time: '23:18',
    reason: 'Відновлення після війни',
    distance_km: 884.81,
    education_level: 'Магістр',
    occupation: 'Вчитель',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 45432,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 2339,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m323)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Донецьк'})
CREATE (m324:Migration {
    id: 'mig_324',
    person_name: 'Валентин Ткаченко',
    gender: 'Чоловік',
    age: 42,
    migration_date: '2021-10-11',
    migration_time: '21:44',
    reason: 'Політичні причини',
    distance_km: 909.55,
    education_level: 'Середня',
    occupation: 'Лікар',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 9342,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 3115,
    return_planned: true, return_date: '2022-08-15'
})-[:MIGRATION_FROM]->(from)
CREATE (m324)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Дніпро'})
CREATE (m325:Migration {
    id: 'mig_325',
    person_name: 'Павло Лисенко',
    gender: 'Чоловік',
    age: 62,
    migration_date: '2023-02-10',
    migration_time: '18:11',
    reason: 'Культурні причини',
    distance_km: 672.77,
    education_level: 'Середня',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 10449,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 467,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m325)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Донецьк'})
CREATE (m326:Migration {
    id: 'mig_326',
    person_name: 'Вікторія Романенко',
    gender: 'Жінка',
    age: 50,
    migration_date: '2021-12-10',
    migration_time: '20:18',
    reason: 'Відновлення після війни',
    distance_km: 698.82,
    education_level: 'Магістр',
    occupation: 'Бухгалтер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 26231,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 82,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m326)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Запоріжжя'})
CREATE (m327:Migration {
    id: 'mig_327',
    person_name: 'Христина Ткаченко',
    gender: 'Жінка',
    age: 36,
    migration_date: '2022-06-26',
    migration_time: '14:33',
    reason: 'Особисті причини',
    distance_km: 366.31,
    education_level: 'Середня спеціальна',
    occupation: 'Юрист',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 40953,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 2696,
    return_planned: true, return_date: '2024-06-15'
})-[:MIGRATION_FROM]->(from)
CREATE (m327)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Рівне'})
CREATE (m328:Migration {
    id: 'mig_328',
    person_name: 'Поліна Петриченко',
    gender: 'Жінка',
    age: 52,
    migration_date: '2023-08-26',
    migration_time: '12:21',
    reason: 'Екологічні причини',
    distance_km: 492.35,
    education_level: 'Середня спеціальна',
    occupation: 'Дизайнер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 39638,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 1330,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m328)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Вінниця'})
CREATE (m329:Migration {
    id: 'mig_329',
    person_name: 'Валентина Федоренко',
    gender: 'Жінка',
    age: 50,
    migration_date: '2022-12-17',
    migration_time: '00:52',
    reason: 'Сімейні обставини',
    distance_km: 200.07,
    education_level: 'Вища',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 46501,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 2284,
    return_planned: true, return_date: '2023-06-26'
})-[:MIGRATION_FROM]->(from)
CREATE (m329)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Одеса'})
CREATE (m330:Migration {
    id: 'mig_330',
    person_name: 'Ольга Коваленко',
    gender: 'Жінка',
    age: 68,
    migration_date: '2021-08-31',
    migration_time: '21:57',
    reason: 'Культурні причини',
    distance_km: 253.58,
    education_level: 'Магістр',
    occupation: 'Вчитель',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 1,
    monthly_income: 24038,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 2104,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m330)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Рівне'})
CREATE (m331:Migration {
    id: 'mig_331',
    person_name: 'Євген Бондаренко',
    gender: 'Чоловік',
    age: 28,
    migration_date: '2021-07-30',
    migration_time: '00:07',
    reason: 'Економічні причини',
    distance_km: 711.54,
    education_level: 'Доктор наук',
    occupation: 'Програміст',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 35240,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 819,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m331)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Кропивницький'})
CREATE (m332:Migration {
    id: 'mig_332',
    person_name: 'Марина Калиниченко',
    gender: 'Жінка',
    age: 25,
    migration_date: '2021-08-24',
    migration_time: '01:19',
    reason: 'Покращення житлових умов',
    distance_km: 467.39,
    education_level: 'Вища',
    occupation: 'Програміст',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 12246,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 322,
    return_planned: true, return_date: '2022-05-19'
})-[:MIGRATION_FROM]->(from)
CREATE (m332)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Вінниця'})
CREATE (m333:Migration {
    id: 'mig_333',
    person_name: 'Маргарита Павленко',
    gender: 'Жінка',
    age: 60,
    migration_date: '2023-04-08',
    migration_time: '17:46',
    reason: 'Особисті причини',
    distance_km: 441.75,
    education_level: 'Магістр',
    occupation: 'Перекладач',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 24343,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 1191,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m333)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Одеса'})
CREATE (m334:Migration {
    id: 'mig_334',
    person_name: 'Валентин Ткачук',
    gender: 'Чоловік',
    age: 46,
    migration_date: '2024-01-14',
    migration_time: '05:46',
    reason: 'Освітні причини',
    distance_km: 511.75,
    education_level: 'Середня',
    occupation: 'Програміст',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 31022,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 1234,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m334)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Одеса'})
CREATE (m335:Migration {
    id: 'mig_335',
    person_name: 'Маргарита Іваненко',
    gender: 'Жінка',
    age: 51,
    migration_date: '2023-01-08',
    migration_time: '17:58',
    reason: 'Екологічні причини',
    distance_km: 392.52,
    education_level: 'Середня спеціальна',
    occupation: 'Робітник',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 35607,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 2351,
    return_planned: true, return_date: '2024-11-29'
})-[:MIGRATION_FROM]->(from)
CREATE (m335)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Харків'})
CREATE (m336:Migration {
    id: 'mig_336',
    person_name: 'Тетяна Савченко',
    gender: 'Жінка',
    age: 50,
    migration_date: '2021-06-28',
    migration_time: '12:07',
    reason: 'Робота',
    distance_km: 409.08,
    education_level: 'Вища',
    occupation: 'Лікар',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 15317,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 764,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m336)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Чернівці'})
CREATE (m337:Migration {
    id: 'mig_337',
    person_name: 'Юрій Лисенко',
    gender: 'Чоловік',
    age: 44,
    migration_date: '2023-12-25',
    migration_time: '13:10',
    reason: 'Навчання',
    distance_km: 213.11,
    education_level: 'Магістр',
    occupation: 'Дизайнер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 5758,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1887,
    return_planned: true, return_date: '2025-12-10'
})-[:MIGRATION_FROM]->(from)
CREATE (m337)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Суми'})
CREATE (m338:Migration {
    id: 'mig_338',
    person_name: 'Максим Ткаченко',
    gender: 'Чоловік',
    age: 23,
    migration_date: '2022-12-27',
    migration_time: '02:43',
    reason: 'Особисті причини',
    distance_km: 143.58,
    education_level: 'Магістр',
    occupation: 'Підприємець',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 4,
    monthly_income: 43860,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 417,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m338)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Запоріжжя'})
CREATE (m339:Migration {
    id: 'mig_339',
    person_name: 'Тетяна Васильчук',
    gender: 'Жінка',
    age: 32,
    migration_date: '2021-07-15',
    migration_time: '04:56',
    reason: 'Робота',
    distance_km: 715.03,
    education_level: 'Вища',
    occupation: 'Програміст',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 20125,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 1967,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m339)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Кропивницький'})
CREATE (m340:Migration {
    id: 'mig_340',
    person_name: 'Надія Бондар',
    gender: 'Жінка',
    age: 45,
    migration_date: '2022-09-20',
    migration_time: '19:13',
    reason: 'Екологічні причини',
    distance_km: 104.57,
    education_level: 'Середня',
    occupation: 'Юрист',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 45347,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 179,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m340)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Харків'})
CREATE (m341:Migration {
    id: 'mig_341',
    person_name: 'Фаїна Грищук',
    gender: 'Жінка',
    age: 68,
    migration_date: '2023-04-21',
    migration_time: '20:35',
    reason: 'Покращення житлових умов',
    distance_km: 565.34,
    education_level: 'Магістр',
    occupation: 'Бухгалтер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 0,
    monthly_income: 45101,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 596,
    return_planned: true, return_date: '2024-04-25'
})-[:MIGRATION_FROM]->(from)
CREATE (m341)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Вінниця'})
CREATE (m342:Migration {
    id: 'mig_342',
    person_name: 'Ярослав Бондаренко',
    gender: 'Чоловік',
    age: 20,
    migration_date: '2023-07-26',
    migration_time: '05:00',
    reason: 'Особисті причини',
    distance_km: 261.26,
    education_level: 'Доктор наук',
    occupation: 'Інженер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 38348,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 3388,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m342)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Рівне'})
CREATE (m343:Migration {
    id: 'mig_343',
    person_name: 'Марина Лисенко',
    gender: 'Жінка',
    age: 39,
    migration_date: '2023-01-18',
    migration_time: '09:09',
    reason: 'Культурні причини',
    distance_km: 127.50,
    education_level: 'Середня спеціальна',
    occupation: 'Вчитель',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 0,
    monthly_income: 5622,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 1662,
    return_planned: true, return_date: '2023-08-14'
})-[:MIGRATION_FROM]->(from)
CREATE (m343)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Дніпро'})
CREATE (m344:Migration {
    id: 'mig_344',
    person_name: 'Анастасія Пономарчук',
    gender: 'Жінка',
    age: 32,
    migration_date: '2022-01-12',
    migration_time: '23:37',
    reason: 'Екологічні причини',
    distance_km: 205.41,
    education_level: 'Середня спеціальна',
    occupation: 'Науковець',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 3,
    monthly_income: 41640,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 1887,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m344)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Донецьк'})
CREATE (m345:Migration {
    id: 'mig_345',
    person_name: 'Анастасія Грищенко',
    gender: 'Жінка',
    age: 21,
    migration_date: '2021-05-03',
    migration_time: '23:57',
    reason: 'Культурні причини',
    distance_km: 199.40,
    education_level: 'Середня',
    occupation: 'Вчитель',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 35916,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 1555,
    return_planned: true, return_date: '2021-10-29'
})-[:MIGRATION_FROM]->(from)
CREATE (m345)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Київ'})
CREATE (m346:Migration {
    id: 'mig_346',
    person_name: 'Тетяна Пономарчук',
    gender: 'Жінка',
    age: 37,
    migration_date: '2021-06-21',
    migration_time: '18:25',
    reason: 'Соціальні причини',
    distance_km: 443.76,
    education_level: 'Середня',
    occupation: 'Інженер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 6727,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 1760,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m346)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Суми'})
CREATE (m347:Migration {
    id: 'mig_347',
    person_name: 'Зоя Ткачук',
    gender: 'Жінка',
    age: 54,
    migration_date: '2022-05-30',
    migration_time: '17:22',
    reason: 'Бізнес',
    distance_km: 387.94,
    education_level: 'Магістр',
    occupation: 'Студент',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 41851,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 3601,
    return_planned: true, return_date: '2024-02-06'
})-[:MIGRATION_FROM]->(from)
CREATE (m347)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Кропивницький'})
CREATE (m348:Migration {
    id: 'mig_348',
    person_name: 'Аліна Марченко',
    gender: 'Жінка',
    age: 26,
    migration_date: '2021-06-25',
    migration_time: '23:26',
    reason: 'Покращення житлових умов',
    distance_km: 226.31,
    education_level: 'Магістр',
    occupation: 'Перекладач',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 5,
    monthly_income: 17778,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 1278,
    return_planned: true, return_date: '2021-08-28'
})-[:MIGRATION_FROM]->(from)
CREATE (m348)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Полтава'})
CREATE (m349:Migration {
    id: 'mig_349',
    person_name: 'Лілія Кравченко',
    gender: 'Жінка',
    age: 45,
    migration_date: '2023-06-14',
    migration_time: '17:02',
    reason: 'Сімейні обставини',
    distance_km: 645.50,
    education_level: 'Середня спеціальна',
    occupation: 'Дизайнер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 26462,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 1686,
    return_planned: true, return_date: '2024-06-10'
})-[:MIGRATION_FROM]->(from)
CREATE (m349)-[:MIGRATION_TO]->(to)
WITH *
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Дніпро'})
CREATE (m350:Migration {
    id: 'mig_350',
    person_name: 'Дмитро Іванчук',
    gender: 'Чоловік',
    age: 39,
    migration_date: '2024-01-15',
    migration_time: '21:16',
    reason: 'Бізнес',
    distance_km: 243.73,
    education_level: 'Доктор наук',
    occupation: 'Програміст',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 44080,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 2570,
    return_planned: true, return_date: '2025-08-15'
})-[:MIGRATION_FROM]->(from)
CREATE (m350)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Донецьк'})
CREATE (m351:Migration {
    id: 'mig_351',
    person_name: 'Ярина Савченко',
    gender: 'Жінка',
    age: 69,
    migration_date: '2022-01-19',
    migration_time: '08:33',
    reason: 'Бізнес',
    distance_km: 295.38,
    education_level: 'Середня',
    occupation: 'Перекладач',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 36721,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2106,
    return_planned: true, return_date: '2022-05-25'
})-[:MIGRATION_FROM]->(from)
CREATE (m351)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Чернівці'})
CREATE (m352:Migration {
    id: 'mig_352',
    person_name: 'Дарія Сидоренко',
    gender: 'Жінка',
    age: 36,
    migration_date: '2022-10-23',
    migration_time: '07:37',
    reason: 'Робота',
    distance_km: 467.39,
    education_level: 'Середня спеціальна',
    occupation: 'Юрист',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 0,
    monthly_income: 11703,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 1449,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m352)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Дніпро'})
CREATE (m353:Migration {
    id: 'mig_353',
    person_name: 'Марк Сидорчук',
    gender: 'Чоловік',
    age: 64,
    migration_date: '2022-05-01',
    migration_time: '23:07',
    reason: 'Особисті причини',
    distance_km: 130.04,
    education_level: 'Середня спеціальна',
    occupation: 'Лікар',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 38831,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 2154,
    return_planned: true, return_date: '2023-01-22'
})-[:MIGRATION_FROM]->(from)
CREATE (m353)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Харків'})
CREATE (m354:Migration {
    id: 'mig_354',
    person_name: 'Іван Марченко',
    gender: 'Чоловік',
    age: 51,
    migration_date: '2023-09-07',
    migration_time: '08:10',
    reason: 'Економічні причини',
    distance_km: 764.67,
    education_level: 'Магістр',
    occupation: 'Менеджер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 12583,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2793,
    return_planned: true, return_date: '2025-02-01'
})-[:MIGRATION_FROM]->(from)
CREATE (m354)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Вінниця'})
CREATE (m355:Migration {
    id: 'mig_355',
    person_name: 'Михайло Петриченко',
    gender: 'Чоловік',
    age: 37,
    migration_date: '2022-11-08',
    migration_time: '12:12',
    reason: 'Культурні причини',
    distance_km: 221.24,
    education_level: 'Доктор наук',
    occupation: 'Юрист',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 2,
    monthly_income: 29487,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 737,
    return_planned: true, return_date: '2023-02-20'
})-[:MIGRATION_FROM]->(from)
CREATE (m355)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Дніпро'})
CREATE (m356:Migration {
    id: 'mig_356',
    person_name: 'Павло Іванчук',
    gender: 'Чоловік',
    age: 30,
    migration_date: '2024-02-25',
    migration_time: '15:52',
    reason: 'Медичні причини',
    distance_km: 394.35,
    education_level: 'Середня спеціальна',
    occupation: 'Робітник',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 5,
    monthly_income: 40850,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 1866,
    return_planned: true, return_date: '2024-04-30'
})-[:MIGRATION_FROM]->(from)
CREATE (m356)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Рівне'})
CREATE (m357:Migration {
    id: 'mig_357',
    person_name: 'Дарія Ткачук',
    gender: 'Жінка',
    age: 58,
    migration_date: '2022-03-31',
    migration_time: '06:12',
    reason: 'Особисті причини',
    distance_km: 602.61,
    education_level: 'Доктор наук',
    occupation: 'Архітектор',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 23741,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 2766,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m357)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Одеса'})
CREATE (m358:Migration {
    id: 'mig_358',
    person_name: 'Інга Петриченко',
    gender: 'Жінка',
    age: 48,
    migration_date: '2023-12-30',
    migration_time: '05:13',
    reason: 'Покращення житлових умов',
    distance_km: 575.61,
    education_level: 'Доктор наук',
    occupation: 'Лікар',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 3,
    monthly_income: 21394,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 463,
    return_planned: true, return_date: '2024-12-21'
})-[:MIGRATION_FROM]->(from)
CREATE (m358)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Львів'})
CREATE (m359:Migration {
    id: 'mig_359',
    person_name: 'Тарас Марчук',
    gender: 'Чоловік',
    age: 22,
    migration_date: '2023-02-27',
    migration_time: '05:40',
    reason: 'Екологічні причини',
    distance_km: 756.39,
    education_level: 'Доктор наук',
    occupation: 'Робітник',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 34230,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 2620,
    return_planned: true, return_date: '2023-04-18'
})-[:MIGRATION_FROM]->(from)
CREATE (m359)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Черкаси'})
CREATE (m360:Migration {
    id: 'mig_360',
    person_name: 'Федір Бондар',
    gender: 'Чоловік',
    age: 35,
    migration_date: '2023-08-26',
    migration_time: '21:46',
    reason: 'Економічні причини',
    distance_km: 288.19,
    education_level: 'Середня',
    occupation: 'Пенсіонер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 41568,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 1227,
    return_planned: true, return_date: '2025-05-26'
})-[:MIGRATION_FROM]->(from)
CREATE (m360)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Донецьк'})
CREATE (m361:Migration {
    id: 'mig_361',
    person_name: 'Віктор Мельник',
    gender: 'Чоловік',
    age: 64,
    migration_date: '2023-07-31',
    migration_time: '04:58',
    reason: 'Освітні причини',
    distance_km: 450.03,
    education_level: 'Середня спеціальна',
    occupation: 'Програміст',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 29195,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 815,
    return_planned: true, return_date: '2024-03-02'
})-[:MIGRATION_FROM]->(from)
CREATE (m361)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Полтава'})
CREATE (m362:Migration {
    id: 'mig_362',
    person_name: 'Віталій Марчук',
    gender: 'Чоловік',
    age: 52,
    migration_date: '2022-07-12',
    migration_time: '12:47',
    reason: 'Політичні причини',
    distance_km: 756.39,
    education_level: 'Середня спеціальна',
    occupation: 'Пенсіонер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 0,
    monthly_income: 13480,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 3207,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m362)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Полтава'})
CREATE (m363:Migration {
    id: 'mig_363',
    person_name: 'Олександр Петриченко',
    gender: 'Чоловік',
    age: 32,
    migration_date: '2022-02-07',
    migration_time: '21:56',
    reason: 'Політичні причини',
    distance_km: 295.38,
    education_level: 'Середня',
    occupation: 'Пенсіонер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 15300,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 1826,
    return_planned: true, return_date: '2022-09-12'
})-[:MIGRATION_FROM]->(from)
CREATE (m363)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Черкаси'})
CREATE (m364:Migration {
    id: 'mig_364',
    person_name: 'Денис Шевченко',
    gender: 'Чоловік',
    age: 38,
    migration_date: '2022-09-25',
    migration_time: '17:21',
    reason: 'Бізнес',
    distance_km: 243.73,
    education_level: 'Вища',
    occupation: 'Менеджер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 15012,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 1128,
    return_planned: true, return_date: '2023-01-21'
})-[:MIGRATION_FROM]->(from)
CREATE (m364)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Донецьк'})
CREATE (m365:Migration {
    id: 'mig_365',
    person_name: 'Уляна Ткаченко',
    gender: 'Жінка',
    age: 31,
    migration_date: '2021-07-10',
    migration_time: '21:48',
    reason: 'Особисті причини',
    distance_km: 909.55,
    education_level: 'Магістр',
    occupation: 'Перекладач',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 40049,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 2320,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m365)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Дніпро'})
CREATE (m366:Migration {
    id: 'mig_366',
    person_name: 'Кирило Левченко',
    gender: 'Чоловік',
    age: 41,
    migration_date: '2021-04-19',
    migration_time: '01:36',
    reason: 'Освітні причини',
    distance_km: 699.42,
    education_level: 'Вища',
    occupation: 'Юрист',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 22651,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 778,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m366)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Чернівці'})
CREATE (m367:Migration {
    id: 'mig_367',
    person_name: 'Тетяна Петриченко',
    gender: 'Жінка',
    age: 41,
    migration_date: '2021-12-27',
    migration_time: '06:36',
    reason: 'Економічні причини',
    distance_km: 880.00,
    education_level: 'Доктор наук',
    occupation: 'Вчитель',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 2,
    monthly_income: 47344,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 2648,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m367)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Рівне'})
CREATE (m368:Migration {
    id: 'mig_368',
    person_name: 'Єлизавета Савченко',
    gender: 'Жінка',
    age: 21,
    migration_date: '2021-07-23',
    migration_time: '14:32',
    reason: 'Сімейні обставини',
    distance_km: 492.35,
    education_level: 'Середня спеціальна',
    occupation: 'Менеджер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 24346,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 2900,
    return_planned: true, return_date: '2021-10-14'
})-[:MIGRATION_FROM]->(from)
CREATE (m368)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Кропивницький'})
CREATE (m369:Migration {
    id: 'mig_369',
    person_name: 'Ксенія Левченко',
    gender: 'Жінка',
    age: 24,
    migration_date: '2024-02-07',
    migration_time: '15:52',
    reason: 'Екологічні причини',
    distance_km: 288.58,
    education_level: 'Середня',
    occupation: 'Архітектор',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 48739,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 478,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m369)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Харків'})
CREATE (m370:Migration {
    id: 'mig_370',
    person_name: 'Євген Сидоренко',
    gender: 'Чоловік',
    age: 55,
    migration_date: '2022-03-31',
    migration_time: '01:53',
    reason: 'Екологічні причини',
    distance_km: 711.54,
    education_level: 'Вища',
    occupation: 'Бухгалтер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 20388,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 285,
    return_planned: true, return_date: '2023-04-02'
})-[:MIGRATION_FROM]->(from)
CREATE (m370)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Полтава'})
CREATE (m371:Migration {
    id: 'mig_371',
    person_name: 'Тетяна Шевчук',
    gender: 'Жінка',
    age: 24,
    migration_date: '2022-02-03',
    migration_time: '02:52',
    reason: 'Економічні причини',
    distance_km: 128.67,
    education_level: 'Середня спеціальна',
    occupation: 'Програміст',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 21869,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2379,
    return_planned: true, return_date: '2022-09-06'
})-[:MIGRATION_FROM]->(from)
CREATE (m371)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Полтава'})
CREATE (m372:Migration {
    id: 'mig_372',
    person_name: 'Лілія Грищук',
    gender: 'Жінка',
    age: 33,
    migration_date: '2024-01-29',
    migration_time: '03:05',
    reason: 'Сімейні обставини',
    distance_km: 295.38,
    education_level: 'Середня спеціальна',
    occupation: 'Вчитель',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 48431,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 1331,
    return_planned: true, return_date: '2024-09-08'
})-[:MIGRATION_FROM]->(from)
CREATE (m372)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Київ'})
CREATE (m373:Migration {
    id: 'mig_373',
    person_name: 'Ольга Васильчук',
    gender: 'Жінка',
    age: 51,
    migration_date: '2023-09-04',
    migration_time: '22:48',
    reason: 'Покращення житлових умов',
    distance_km: 441.42,
    education_level: 'Вища',
    occupation: 'Менеджер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 14280,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 2300,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m373)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Київ'})
CREATE (m374:Migration {
    id: 'mig_374',
    person_name: 'Ілля Гончар',
    gender: 'Чоловік',
    age: 62,
    migration_date: '2023-07-28',
    migration_time: '11:11',
    reason: 'Кліматичні причини',
    distance_km: 305.42,
    education_level: 'Середня',
    occupation: 'Робітник',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 42865,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 3582,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m374)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Полтава'})
CREATE (m375:Migration {
    id: 'mig_375',
    person_name: 'Галина Попов',
    gender: 'Жінка',
    age: 60,
    migration_date: '2023-07-06',
    migration_time: '14:12',
    reason: 'Економічні причини',
    distance_km: 180.57,
    education_level: 'Середня',
    occupation: 'Вчитель',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 36240,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 2187,
    return_planned: true, return_date: '2024-05-12'
})-[:MIGRATION_FROM]->(from)
CREATE (m375)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Полтава'})
CREATE (m376:Migration {
    id: 'mig_376',
    person_name: 'Катерина Сидорчук',
    gender: 'Жінка',
    age: 43,
    migration_date: '2023-01-06',
    migration_time: '06:37',
    reason: 'Соціальні причини',
    distance_km: 645.50,
    education_level: 'Доктор наук',
    occupation: 'Підприємець',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 9580,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 3455,
    return_planned: true, return_date: '2024-08-23'
})-[:MIGRATION_FROM]->(from)
CREATE (m376)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Запоріжжя'})
CREATE (m377:Migration {
    id: 'mig_377',
    person_name: 'Єлизавета Лисенко',
    gender: 'Жінка',
    age: 32,
    migration_date: '2021-07-11',
    migration_time: '15:49',
    reason: 'Медичні причини',
    distance_km: 226.31,
    education_level: 'Вища',
    occupation: 'Дизайнер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 18256,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 512,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m377)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Запоріжжя'})
CREATE (m378:Migration {
    id: 'mig_378',
    person_name: 'Вікторія Савенко',
    gender: 'Жінка',
    age: 21,
    migration_date: '2023-03-29',
    migration_time: '04:17',
    reason: 'Покращення житлових умов',
    distance_km: 685.40,
    education_level: 'Середня спеціальна',
    occupation: 'Пенсіонер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 40570,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 2331,
    return_planned: true, return_date: '2024-04-24'
})-[:MIGRATION_FROM]->(from)
CREATE (m378)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Донецьк'})
CREATE (m379:Migration {
    id: 'mig_379',
    person_name: 'Тарас Бондаренко',
    gender: 'Чоловік',
    age: 38,
    migration_date: '2022-01-07',
    migration_time: '06:09',
    reason: 'Соціальні причини',
    distance_km: 387.94,
    education_level: 'Середня',
    occupation: 'Програміст',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 44655,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 192,
    return_planned: true, return_date: '2023-10-06'
})-[:MIGRATION_FROM]->(from)
CREATE (m379)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Вінниця'})
CREATE (m380:Migration {
    id: 'mig_380',
    person_name: 'Василь Лисенко',
    gender: 'Чоловік',
    age: 56,
    migration_date: '2022-10-18',
    migration_time: '10:19',
    reason: 'Сімейні обставини',
    distance_km: 698.82,
    education_level: 'Доктор наук',
    occupation: 'Пенсіонер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 20736,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 739,
    return_planned: true, return_date: '2024-10-11'
})-[:MIGRATION_FROM]->(from)
CREATE (m380)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Суми'})
CREATE (m381:Migration {
    id: 'mig_381',
    person_name: 'Валентина Петриченко',
    gender: 'Жінка',
    age: 42,
    migration_date: '2023-12-06',
    migration_time: '00:01',
    reason: 'Соціальні причини',
    distance_km: 601.61,
    education_level: 'Середня спеціальна',
    occupation: 'Підприємець',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 1,
    monthly_income: 12108,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 3528,
    return_planned: true, return_date: '2024-07-14'
})-[:MIGRATION_FROM]->(from)
CREATE (m381)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Чернівці'})
CREATE (m382:Migration {
    id: 'mig_382',
    person_name: 'Світлана Федоренко',
    gender: 'Жінка',
    age: 51,
    migration_date: '2023-07-06',
    migration_time: '15:05',
    reason: 'Покращення житлових умов',
    distance_km: 465.78,
    education_level: 'Магістр',
    occupation: 'Студент',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 19544,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 316,
    return_planned: true, return_date: '2025-04-06'
})-[:MIGRATION_FROM]->(from)
CREATE (m382)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Рівне'})
CREATE (m383:Migration {
    id: 'mig_383',
    person_name: 'Костянтин Калиненко',
    gender: 'Чоловік',
    age: 36,
    migration_date: '2021-06-05',
    migration_time: '06:42',
    reason: 'Екологічні причини',
    distance_km: 180.28,
    education_level: 'Середня спеціальна',
    occupation: 'Юрист',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 21406,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 966,
    return_planned: true, return_date: '2023-01-13'
})-[:MIGRATION_FROM]->(from)
CREATE (m383)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Харків'})
CREATE (m384:Migration {
    id: 'mig_384',
    person_name: 'Галина Савчук',
    gender: 'Жінка',
    age: 48,
    migration_date: '2021-09-10',
    migration_time: '22:43',
    reason: 'Навчання',
    distance_km: 252.50,
    education_level: 'Магістр',
    occupation: 'Студент',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 26704,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 1167,
    return_planned: true, return_date: '2022-12-01'
})-[:MIGRATION_FROM]->(from)
CREATE (m384)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Рівне'})
CREATE (m385:Migration {
    id: 'mig_385',
    person_name: 'Тимофій Калиненко',
    gender: 'Чоловік',
    age: 29,
    migration_date: '2022-11-06',
    migration_time: '12:43',
    reason: 'Кліматичні причини',
    distance_km: 884.81,
    education_level: 'Доктор наук',
    occupation: 'Робітник',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 10056,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 108,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m385)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Дніпро'})
CREATE (m386:Migration {
    id: 'mig_386',
    person_name: 'Надія Савчук',
    gender: 'Жінка',
    age: 23,
    migration_date: '2022-08-19',
    migration_time: '19:57',
    reason: 'Навчання',
    distance_km: 672.77,
    education_level: 'Магістр',
    occupation: 'Робітник',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 42729,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 256,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m386)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Кропивницький'})
CREATE (m387:Migration {
    id: 'mig_387',
    person_name: 'Наталія Грищук',
    gender: 'Жінка',
    age: 55,
    migration_date: '2023-01-19',
    migration_time: '15:17',
    reason: 'Особисті причини',
    distance_km: 615.82,
    education_level: 'Магістр',
    occupation: 'Юрист',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 30689,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 1266,
    return_planned: true, return_date: '2024-04-14'
})-[:MIGRATION_FROM]->(from)
CREATE (m387)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Кропивницький'})
CREATE (m388:Migration {
    id: 'mig_388',
    person_name: 'Надія Ткачук',
    gender: 'Жінка',
    age: 18,
    migration_date: '2023-05-25',
    migration_time: '09:09',
    reason: 'Особисті причини',
    distance_km: 322.77,
    education_level: 'Середня',
    occupation: 'Юрист',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 31092,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 818,
    return_planned: true, return_date: '2024-09-06'
})-[:MIGRATION_FROM]->(from)
CREATE (m388)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Черкаси'})
CREATE (m389:Migration {
    id: 'mig_389',
    person_name: 'Ганна Федоренко',
    gender: 'Жінка',
    age: 35,
    migration_date: '2021-07-06',
    migration_time: '04:09',
    reason: 'Медичні причини',
    distance_km: 450.03,
    education_level: 'Доктор наук',
    occupation: 'Перекладач',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 3,
    monthly_income: 31532,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 3511,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m389)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Донецьк'})
CREATE (m390:Migration {
    id: 'mig_390',
    person_name: 'Христина Гончаренко',
    gender: 'Жінка',
    age: 59,
    migration_date: '2023-01-07',
    migration_time: '10:51',
    reason: 'Політичні причини',
    distance_km: 1024.88,
    education_level: 'Магістр',
    occupation: 'Менеджер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 20858,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2131,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m390)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Харків'})
CREATE (m391:Migration {
    id: 'mig_391',
    person_name: 'Анатолій Марчук',
    gender: 'Чоловік',
    age: 36,
    migration_date: '2021-08-16',
    migration_time: '13:46',
    reason: 'Сімейні обставини',
    distance_km: 248.00,
    education_level: 'Доктор наук',
    occupation: 'Пенсіонер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 24940,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 3480,
    return_planned: true, return_date: '2022-07-15'
})-[:MIGRATION_FROM]->(from)
CREATE (m391)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Київ'})
CREATE (m392:Migration {
    id: 'mig_392',
    person_name: 'Віталій Савченко',
    gender: 'Чоловік',
    age: 30,
    migration_date: '2022-03-13',
    migration_time: '22:19',
    reason: 'Кліматичні причини',
    distance_km: 366.01,
    education_level: 'Вища',
    occupation: 'Студент',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 41213,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 1910,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m392)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Львів'})
CREATE (m393:Migration {
    id: 'mig_393',
    person_name: 'Фаїна Калиниченко',
    gender: 'Жінка',
    age: 19,
    migration_date: '2022-07-12',
    migration_time: '22:59',
    reason: 'Екологічні причини',
    distance_km: 579.60,
    education_level: 'Середня спеціальна',
    occupation: 'Вчитель',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 16769,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 2938,
    return_planned: true, return_date: '2023-05-30'
})-[:MIGRATION_FROM]->(from)
CREATE (m393)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Кропивницький'})
CREATE (m394:Migration {
    id: 'mig_394',
    person_name: 'Борис Савенко',
    gender: 'Чоловік',
    age: 66,
    migration_date: '2023-01-04',
    migration_time: '16:53',
    reason: 'Політичні причини',
    distance_km: 322.77,
    education_level: 'Вища',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 6284,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 899,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m394)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Рівне'})
CREATE (m395:Migration {
    id: 'mig_395',
    person_name: 'Федір Павленко',
    gender: 'Чоловік',
    age: 22,
    migration_date: '2022-05-29',
    migration_time: '07:49',
    reason: 'Кліматичні причини',
    distance_km: 602.61,
    education_level: 'Середня',
    occupation: 'Науковець',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 18368,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 807,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m395)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Дніпро'})
CREATE (m396:Migration {
    id: 'mig_396',
    person_name: 'Ніна Ткачук',
    gender: 'Жінка',
    age: 63,
    migration_date: '2023-08-07',
    migration_time: '02:16',
    reason: 'Економічні причини',
    distance_km: 699.42,
    education_level: 'Середня спеціальна',
    occupation: 'Юрист',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 3,
    monthly_income: 37311,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 3266,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m396)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Тернопіль'})
CREATE (m397:Migration {
    id: 'mig_397',
    person_name: 'Леонід Кравченко',
    gender: 'Чоловік',
    age: 31,
    migration_date: '2021-09-12',
    migration_time: '16:37',
    reason: 'Особисті причини',
    distance_km: 671.25,
    education_level: 'Доктор наук',
    occupation: 'Архітектор',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 4,
    monthly_income: 19908,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 3343,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m397)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Рівне'})
CREATE (m398:Migration {
    id: 'mig_398',
    person_name: 'Христина Марчук',
    gender: 'Жінка',
    age: 70,
    migration_date: '2022-04-06',
    migration_time: '18:39',
    reason: 'Економічні причини',
    distance_km: 677.78,
    education_level: 'Вища',
    occupation: 'Архітектор',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 5309,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 2812,
    return_planned: true, return_date: '2022-05-19'
})-[:MIGRATION_FROM]->(from)
CREATE (m398)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Суми'})
CREATE (m399:Migration {
    id: 'mig_399',
    person_name: 'Костянтин Савчук',
    gender: 'Чоловік',
    age: 48,
    migration_date: '2022-07-15',
    migration_time: '18:30',
    reason: 'Особисті причини',
    distance_km: 305.42,
    education_level: 'Середня',
    occupation: 'Юрист',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 14355,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 360,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m399)-[:MIGRATION_TO]->(to)
WITH *
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Львів'})
CREATE (m400:Migration {
    id: 'mig_400',
    person_name: 'Євген Гончар',
    gender: 'Чоловік',
    age: 69,
    migration_date: '2022-01-29',
    migration_time: '21:32',
    reason: 'Навчання',
    distance_km: 814.87,
    education_level: 'Вища',
    occupation: 'Інженер',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 2,
    monthly_income: 31433,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 1687,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m400)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Полтава'})
CREATE (m401:Migration {
    id: 'mig_401',
    person_name: 'Поліна Лисенко',
    gender: 'Жінка',
    age: 52,
    migration_date: '2022-05-23',
    migration_time: '22:14',
    reason: 'Кліматичні причини',
    distance_km: 130.04,
    education_level: 'Середня спеціальна',
    occupation: 'Підприємець',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 19059,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 445,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m401)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Запоріжжя'})
CREATE (m402:Migration {
    id: 'mig_402',
    person_name: 'Зоя Бондар',
    gender: 'Жінка',
    age: 55,
    migration_date: '2021-08-25',
    migration_time: '23:13',
    reason: 'Культурні причини',
    distance_km: 443.76,
    education_level: 'Магістр',
    occupation: 'Перекладач',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 7619,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 611,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m402)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Тернопіль'})
CREATE (m403:Migration {
    id: 'mig_403',
    person_name: 'Святослав Іваненко',
    gender: 'Чоловік',
    age: 23,
    migration_date: '2022-08-09',
    migration_time: '10:19',
    reason: 'Кліматичні причини',
    distance_km: 127.50,
    education_level: 'Середня',
    occupation: 'Дизайнер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 28196,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 210,
    return_planned: true, return_date: '2023-07-15'
})-[:MIGRATION_FROM]->(from)
CREATE (m403)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Дніпро'})
CREATE (m404:Migration {
    id: 'mig_404',
    person_name: 'Зінаїда Сидоренко',
    gender: 'Жінка',
    age: 41,
    migration_date: '2023-11-03',
    migration_time: '07:16',
    reason: 'Культурні причини',
    distance_km: 243.73,
    education_level: 'Доктор наук',
    occupation: 'Перекладач',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 44964,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 1890,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m404)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Кропивницький'})
CREATE (m405:Migration {
    id: 'mig_405',
    person_name: 'Павло Бондар',
    gender: 'Чоловік',
    age: 38,
    migration_date: '2023-02-15',
    migration_time: '02:30',
    reason: 'Навчання',
    distance_km: 288.58,
    education_level: 'Середня',
    occupation: 'Підприємець',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 14230,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 451,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m405)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Львів'})
CREATE (m406:Migration {
    id: 'mig_406',
    person_name: 'Олександр Василенко',
    gender: 'Чоловік',
    age: 54,
    migration_date: '2021-07-18',
    migration_time: '23:28',
    reason: 'Бізнес',
    distance_km: 180.28,
    education_level: 'Доктор наук',
    occupation: 'Пенсіонер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 47598,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 1726,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m406)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Черкаси'})
CREATE (m407:Migration {
    id: 'mig_407',
    person_name: 'Жанна Грищук',
    gender: 'Жінка',
    age: 51,
    migration_date: '2023-08-12',
    migration_time: '22:44',
    reason: 'Навчання',
    distance_km: 434.83,
    education_level: 'Середня спеціальна',
    occupation: 'Архітектор',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 37104,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 3628,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m407)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Харків'})
CREATE (m408:Migration {
    id: 'mig_408',
    person_name: 'Олексій Кравчук',
    gender: 'Чоловік',
    age: 59,
    migration_date: '2023-05-11',
    migration_time: '00:38',
    reason: 'Бізнес',
    distance_km: 564.31,
    education_level: 'Вища',
    occupation: 'Дизайнер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 20882,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 2500,
    return_planned: true, return_date: '2024-11-12'
})-[:MIGRATION_FROM]->(from)
CREATE (m408)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Київ'})
CREATE (m409:Migration {
    id: 'mig_409',
    person_name: 'Денис Васильчук',
    gender: 'Чоловік',
    age: 24,
    migration_date: '2021-08-19',
    migration_time: '10:47',
    reason: 'Навчання',
    distance_km: 409.70,
    education_level: 'Середня спеціальна',
    occupation: 'Вчитель',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 5,
    monthly_income: 34363,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 1001,
    return_planned: true, return_date: '2022-07-12'
})-[:MIGRATION_FROM]->(from)
CREATE (m409)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Запоріжжя'})
CREATE (m410:Migration {
    id: 'mig_410',
    person_name: 'Сергій Сидоренко',
    gender: 'Чоловік',
    age: 18,
    migration_date: '2023-12-24',
    migration_time: '04:22',
    reason: 'Відновлення після війни',
    distance_km: 685.40,
    education_level: 'Доктор наук',
    occupation: 'Архітектор',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 47539,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 1315,
    return_planned: true, return_date: '2024-11-07'
})-[:MIGRATION_FROM]->(from)
CREATE (m410)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Дніпро'})
CREATE (m411:Migration {
    id: 'mig_411',
    person_name: 'Назар Марчук',
    gender: 'Чоловік',
    age: 20,
    migration_date: '2021-10-27',
    migration_time: '22:49',
    reason: 'Кліматичні причини',
    distance_km: 210.14,
    education_level: 'Магістр',
    occupation: 'Науковець',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 37231,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1090,
    return_planned: true, return_date: '2023-03-09'
})-[:MIGRATION_FROM]->(from)
CREATE (m411)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Тернопіль'})
CREATE (m412:Migration {
    id: 'mig_412',
    person_name: 'Віктор Кравченко',
    gender: 'Чоловік',
    age: 67,
    migration_date: '2024-03-13',
    migration_time: '04:05',
    reason: 'Сімейні обставини',
    distance_km: 511.75,
    education_level: 'Магістр',
    occupation: 'Перекладач',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 6588,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2675,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m412)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Рівне'})
CREATE (m413:Migration {
    id: 'mig_413',
    person_name: 'Галина Савенко',
    gender: 'Жінка',
    age: 40,
    migration_date: '2023-06-14',
    migration_time: '05:40',
    reason: 'Особисті причини',
    distance_km: 259.89,
    education_level: 'Доктор наук',
    occupation: 'Менеджер',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 1,
    monthly_income: 43803,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 2019,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m413)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Львів'})
CREATE (m414:Migration {
    id: 'mig_414',
    person_name: 'Аліна Попов',
    gender: 'Жінка',
    age: 21,
    migration_date: '2023-10-24',
    migration_time: '23:26',
    reason: 'Бізнес',
    distance_km: 814.87,
    education_level: 'Середня спеціальна',
    occupation: 'Пенсіонер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 5883,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 370,
    return_planned: true, return_date: '2025-08-03'
})-[:MIGRATION_FROM]->(from)
CREATE (m414)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Рівне'})
CREATE (m415:Migration {
    id: 'mig_415',
    person_name: 'Ігор Ткачук',
    gender: 'Чоловік',
    age: 44,
    migration_date: '2023-12-16',
    migration_time: '04:01',
    reason: 'Економічні причини',
    distance_km: 180.28,
    education_level: 'Доктор наук',
    occupation: 'Архітектор',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 4,
    monthly_income: 19265,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 2449,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m415)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Вінниця'})
CREATE (m416:Migration {
    id: 'mig_416',
    person_name: 'Ксенія Гончар',
    gender: 'Жінка',
    age: 41,
    migration_date: '2022-09-03',
    migration_time: '10:20',
    reason: 'Відновлення після війни',
    distance_km: 441.75,
    education_level: 'Вища',
    occupation: 'Підприємець',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 0,
    monthly_income: 48521,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 612,
    return_planned: true, return_date: '2024-08-17'
})-[:MIGRATION_FROM]->(from)
CREATE (m416)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Черкаси'})
CREATE (m417:Migration {
    id: 'mig_417',
    person_name: 'Андрій Кравчук',
    gender: 'Чоловік',
    age: 51,
    migration_date: '2024-01-19',
    migration_time: '21:43',
    reason: 'Соціальні причини',
    distance_km: 156.81,
    education_level: 'Середня спеціальна',
    occupation: 'Робітник',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 39744,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 2046,
    return_planned: true, return_date: '2025-10-12'
})-[:MIGRATION_FROM]->(from)
CREATE (m417)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Львів'})
CREATE (m418:Migration {
    id: 'mig_418',
    person_name: 'Християн Грищук',
    gender: 'Чоловік',
    age: 57,
    migration_date: '2023-06-13',
    migration_time: '06:21',
    reason: 'Покращення житлових умов',
    distance_km: 116.98,
    education_level: 'Середня',
    occupation: 'Робітник',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 23172,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 1827,
    return_planned: true, return_date: '2024-10-23'
})-[:MIGRATION_FROM]->(from)
CREATE (m418)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Вінниця'})
CREATE (m419:Migration {
    id: 'mig_419',
    person_name: 'Ярина Мельник',
    gender: 'Жінка',
    age: 64,
    migration_date: '2022-03-02',
    migration_time: '12:00',
    reason: 'Кліматичні причини',
    distance_km: 213.11,
    education_level: 'Магістр',
    occupation: 'Науковець',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 5,
    monthly_income: 22595,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 335,
    return_planned: true, return_date: '2023-04-08'
})-[:MIGRATION_FROM]->(from)
CREATE (m419)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Кропивницький'})
CREATE (m420:Migration {
    id: 'mig_420',
    person_name: 'Дмитро Марченко',
    gender: 'Чоловік',
    age: 40,
    migration_date: '2021-07-05',
    migration_time: '06:10',
    reason: 'Покращення житлових умов',
    distance_km: 492.35,
    education_level: 'Вища',
    occupation: 'Перекладач',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 28082,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 626,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m420)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Чернівці'})
CREATE (m421:Migration {
    id: 'mig_421',
    person_name: 'Християн Гончар',
    gender: 'Чоловік',
    age: 58,
    migration_date: '2023-08-27',
    migration_time: '10:51',
    reason: 'Відновлення після війни',
    distance_km: 701.24,
    education_level: 'Доктор наук',
    occupation: 'Архітектор',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 26731,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2537,
    return_planned: true, return_date: '2025-01-14'
})-[:MIGRATION_FROM]->(from)
CREATE (m421)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Тернопіль'})
CREATE (m422:Migration {
    id: 'mig_422',
    person_name: 'Геннадій Кравченко',
    gender: 'Чоловік',
    age: 30,
    migration_date: '2023-03-15',
    migration_time: '21:22',
    reason: 'Сімейні обставини',
    distance_km: 645.50,
    education_level: 'Середня',
    occupation: 'Лікар',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 3,
    monthly_income: 35018,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2080,
    return_planned: true, return_date: '2023-05-04'
})-[:MIGRATION_FROM]->(from)
CREATE (m422)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Вінниця'})
CREATE (m423:Migration {
    id: 'mig_423',
    person_name: 'Богдана Гончар',
    gender: 'Жінка',
    age: 30,
    migration_date: '2021-08-14',
    migration_time: '17:42',
    reason: 'Освітні причини',
    distance_km: 514.88,
    education_level: 'Середня спеціальна',
    occupation: 'Підприємець',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 20738,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 240,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m423)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Черкаси'})
CREATE (m424:Migration {
    id: 'mig_424',
    person_name: 'Жанна Лисенко',
    gender: 'Жінка',
    age: 22,
    migration_date: '2022-09-22',
    migration_time: '19:00',
    reason: 'Кліматичні причини',
    distance_km: 305.94,
    education_level: 'Магістр',
    occupation: 'Юрист',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 0,
    monthly_income: 7214,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 1009,
    return_planned: true, return_date: '2023-04-20'
})-[:MIGRATION_FROM]->(from)
CREATE (m424)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Полтава'})
CREATE (m425:Migration {
    id: 'mig_425',
    person_name: 'Іван Савчук',
    gender: 'Чоловік',
    age: 34,
    migration_date: '2022-05-11',
    migration_time: '19:55',
    reason: 'Відновлення після війни',
    distance_km: 441.75,
    education_level: 'Вища',
    occupation: 'Пенсіонер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 15087,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 2057,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m425)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Донецьк'})
CREATE (m426:Migration {
    id: 'mig_426',
    person_name: 'Андрій Васильчук',
    gender: 'Чоловік',
    age: 30,
    migration_date: '2023-04-08',
    migration_time: '18:34',
    reason: 'Культурні причини',
    distance_km: 295.38,
    education_level: 'Середня',
    occupation: 'Робітник',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 7209,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 2353,
    return_planned: true, return_date: '2024-08-01'
})-[:MIGRATION_FROM]->(from)
CREATE (m426)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Вінниця'})
CREATE (m427:Migration {
    id: 'mig_427',
    person_name: 'Ілля Ткаченко',
    gender: 'Чоловік',
    age: 39,
    migration_date: '2021-07-15',
    migration_time: '15:22',
    reason: 'Кліматичні причини',
    distance_km: 488.68,
    education_level: 'Середня',
    occupation: 'Інженер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 29788,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 2663,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m427)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Суми'})
CREATE (m428:Migration {
    id: 'mig_428',
    person_name: 'Кирило Калиниченко',
    gender: 'Чоловік',
    age: 42,
    migration_date: '2022-01-24',
    migration_time: '07:48',
    reason: 'Економічні причини',
    distance_km: 253.94,
    education_level: 'Магістр',
    occupation: 'Юрист',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 47676,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 160,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m428)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Чернівці'})
CREATE (m429:Migration {
    id: 'mig_429',
    person_name: 'Святослав Грищук',
    gender: 'Чоловік',
    age: 50,
    migration_date: '2023-06-28',
    migration_time: '05:38',
    reason: 'Покращення житлових умов',
    distance_km: 672.77,
    education_level: 'Середня',
    occupation: 'Науковець',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 24969,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 3471,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m429)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Запоріжжя'})
CREATE (m430:Migration {
    id: 'mig_430',
    person_name: 'Костянтин Петренко',
    gender: 'Чоловік',
    age: 58,
    migration_date: '2022-09-12',
    migration_time: '19:49',
    reason: 'Економічні причини',
    distance_km: 443.76,
    education_level: 'Вища',
    occupation: 'Лікар',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 17707,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 2889,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m430)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Харків'})
CREATE (m431:Migration {
    id: 'mig_431',
    person_name: 'Лариса Калиненко',
    gender: 'Жінка',
    age: 65,
    migration_date: '2021-10-26',
    migration_time: '17:22',
    reason: 'Кліматичні причини',
    distance_km: 564.31,
    education_level: 'Середня',
    occupation: 'Інженер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 40724,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 1619,
    return_planned: true, return_date: '2022-11-06'
})-[:MIGRATION_FROM]->(from)
CREATE (m431)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Запоріжжя'})
CREATE (m432:Migration {
    id: 'mig_432',
    person_name: 'Микола Кравченко',
    gender: 'Чоловік',
    age: 65,
    migration_date: '2021-05-04',
    migration_time: '23:03',
    reason: 'Культурні причини',
    distance_km: 715.03,
    education_level: 'Доктор наук',
    occupation: 'Перекладач',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 38815,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 1708,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m432)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Дніпро'})
CREATE (m433:Migration {
    id: 'mig_433',
    person_name: 'Жанна Коваленко',
    gender: 'Жінка',
    age: 30,
    migration_date: '2021-09-01',
    migration_time: '18:50',
    reason: 'Соціальні причини',
    distance_km: 190.50,
    education_level: 'Магістр',
    occupation: 'Підприємець',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 27800,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 2101,
    return_planned: true, return_date: '2022-02-14'
})-[:MIGRATION_FROM]->(from)
CREATE (m433)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Київ'})
CREATE (m434:Migration {
    id: 'mig_434',
    person_name: 'Раїса Савчук',
    gender: 'Жінка',
    age: 35,
    migration_date: '2024-04-07',
    migration_time: '11:26',
    reason: 'Культурні причини',
    distance_km: 467.53,
    education_level: 'Доктор наук',
    occupation: 'Менеджер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 23683,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 125,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m434)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Донецьк'})
CREATE (m435:Migration {
    id: 'mig_435',
    person_name: 'Жанна Шевченко',
    gender: 'Жінка',
    age: 51,
    migration_date: '2021-11-15',
    migration_time: '05:18',
    reason: 'Покращення житлових умов',
    distance_km: 884.81,
    education_level: 'Доктор наук',
    occupation: 'Робітник',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 17136,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 3292,
    return_planned: true, return_date: '2022-02-27'
})-[:MIGRATION_FROM]->(from)
CREATE (m435)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Тернопіль'})
CREATE (m436:Migration {
    id: 'mig_436',
    person_name: 'Поліна Лисенко',
    gender: 'Жінка',
    age: 50,
    migration_date: '2022-02-02',
    migration_time: '02:21',
    reason: 'Сімейні обставини',
    distance_km: 764.67,
    education_level: 'Доктор наук',
    occupation: 'Інженер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 42253,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 1132,
    return_planned: true, return_date: '2023-08-26'
})-[:MIGRATION_FROM]->(from)
CREATE (m436)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Вінниця'})
CREATE (m437:Migration {
    id: 'mig_437',
    person_name: 'Ніна Петренко',
    gender: 'Жінка',
    age: 56,
    migration_date: '2024-03-01',
    migration_time: '13:41',
    reason: 'Покращення житлових умов',
    distance_km: 213.11,
    education_level: 'Магістр',
    occupation: 'Перекладач',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 36636,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2572,
    return_planned: true, return_date: '2024-07-10'
})-[:MIGRATION_FROM]->(from)
CREATE (m437)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Тернопіль'})
CREATE (m438:Migration {
    id: 'mig_438',
    person_name: 'Катерина Бондаренко',
    gender: 'Жінка',
    age: 70,
    migration_date: '2024-01-13',
    migration_time: '17:50',
    reason: 'Робота',
    distance_km: 764.67,
    education_level: 'Вища',
    occupation: 'Менеджер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 21860,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 1790,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m438)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Черкаси'})
CREATE (m439:Migration {
    id: 'mig_439',
    person_name: 'Катерина Іваненко',
    gender: 'Жінка',
    age: 62,
    migration_date: '2024-01-24',
    migration_time: '21:25',
    reason: 'Соціальні причини',
    distance_km: 243.73,
    education_level: 'Середня спеціальна',
    occupation: 'Бухгалтер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 22981,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 1836,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m439)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Суми'})
CREATE (m440:Migration {
    id: 'mig_440',
    person_name: 'Єгор Павленко',
    gender: 'Чоловік',
    age: 42,
    migration_date: '2021-12-27',
    migration_time: '04:02',
    reason: 'Освітні причини',
    distance_km: 143.58,
    education_level: 'Магістр',
    occupation: 'Лікар',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 2,
    monthly_income: 49943,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 1383,
    return_planned: true, return_date: '2023-05-09'
})-[:MIGRATION_FROM]->(from)
CREATE (m440)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Рівне'})
CREATE (m441:Migration {
    id: 'mig_441',
    person_name: 'Роман Олійник',
    gender: 'Чоловік',
    age: 46,
    migration_date: '2022-08-30',
    migration_time: '04:13',
    reason: 'Бізнес',
    distance_km: 711.54,
    education_level: 'Вища',
    occupation: 'Юрист',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 44779,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 1383,
    return_planned: true, return_date: '2023-06-24'
})-[:MIGRATION_FROM]->(from)
CREATE (m441)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Львів'})
CREATE (m442:Migration {
    id: 'mig_442',
    person_name: 'Костянтин Пономарчук',
    gender: 'Чоловік',
    age: 37,
    migration_date: '2022-09-14',
    migration_time: '06:07',
    reason: 'Соціальні причини',
    distance_km: 615.82,
    education_level: 'Вища',
    occupation: 'Перекладач',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 49892,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1801,
    return_planned: true, return_date: '2024-06-30'
})-[:MIGRATION_FROM]->(from)
CREATE (m442)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Одеса'})
CREATE (m443:Migration {
    id: 'mig_443',
    person_name: 'Анастасія Василенко',
    gender: 'Жінка',
    age: 28,
    migration_date: '2021-04-26',
    migration_time: '17:28',
    reason: 'Культурні причини',
    distance_km: 564.31,
    education_level: 'Вища',
    occupation: 'Пенсіонер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 48931,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 1714,
    return_planned: true, return_date: '2022-08-24'
})-[:MIGRATION_FROM]->(from)
CREATE (m443)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Черкаси'})
CREATE (m444:Migration {
    id: 'mig_444',
    person_name: 'Людмила Лисенко',
    gender: 'Жінка',
    age: 53,
    migration_date: '2022-11-24',
    migration_time: '23:41',
    reason: 'Особисті причини',
    distance_km: 305.94,
    education_level: 'Середня спеціальна',
    occupation: 'Інженер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 17550,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 95,
    return_planned: true, return_date: '2023-05-11'
})-[:MIGRATION_FROM]->(from)
CREATE (m444)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Донецьк'})
CREATE (m445:Migration {
    id: 'mig_445',
    person_name: 'Святослав Ткачук',
    gender: 'Чоловік',
    age: 46,
    migration_date: '2022-03-17',
    migration_time: '18:24',
    reason: 'Освітні причини',
    distance_km: 698.82,
    education_level: 'Вища',
    occupation: 'Дизайнер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 45632,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2698,
    return_planned: true, return_date: '2023-01-21'
})-[:MIGRATION_FROM]->(from)
CREATE (m445)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Рівне'})
CREATE (m446:Migration {
    id: 'mig_446',
    person_name: 'Денис Ткаченко',
    gender: 'Чоловік',
    age: 19,
    migration_date: '2022-09-18',
    migration_time: '09:24',
    reason: 'Політичні причини',
    distance_km: 259.89,
    education_level: 'Середня',
    occupation: 'Пенсіонер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 4,
    monthly_income: 20317,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 338,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m446)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Черкаси'})
CREATE (m447:Migration {
    id: 'mig_447',
    person_name: 'Ілля Кравчук',
    gender: 'Чоловік',
    age: 54,
    migration_date: '2022-01-25',
    migration_time: '06:33',
    reason: 'Бізнес',
    distance_km: 253.94,
    education_level: 'Вища',
    occupation: 'Програміст',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 39722,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 907,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m447)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Вінниця'})
CREATE (m448:Migration {
    id: 'mig_448',
    person_name: 'Ілля Сидорчук',
    gender: 'Чоловік',
    age: 21,
    migration_date: '2022-11-17',
    migration_time: '01:56',
    reason: 'Сімейні обставини',
    distance_km: 221.24,
    education_level: 'Магістр',
    occupation: 'Дизайнер',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 25715,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 1696,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m448)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Львів'})
CREATE (m449:Migration {
    id: 'mig_449',
    person_name: 'Федір Кравченко',
    gender: 'Чоловік',
    age: 62,
    migration_date: '2023-03-30',
    migration_time: '00:32',
    reason: 'Соціальні причини',
    distance_km: 772.13,
    education_level: 'Середня',
    occupation: 'Вчитель',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 1,
    monthly_income: 19959,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 2844,
    return_planned: true, return_date: '2023-06-26'
})-[:MIGRATION_FROM]->(from)
CREATE (m449)-[:MIGRATION_TO]->(to)
WITH *
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Рівне'})
CREATE (m450:Migration {
    id: 'mig_450',
    person_name: 'Єлизавета Федоренко',
    gender: 'Жінка',
    age: 57,
    migration_date: '2023-12-08',
    migration_time: '12:46',
    reason: 'Відновлення після війни',
    distance_km: 715.03,
    education_level: 'Вища',
    occupation: 'Програміст',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 40328,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 3120,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m450)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Львів'})
CREATE (m451:Migration {
    id: 'mig_451',
    person_name: 'Віктор Шевченко',
    gender: 'Чоловік',
    age: 59,
    migration_date: '2021-08-20',
    migration_time: '20:51',
    reason: 'Навчання',
    distance_km: 814.87,
    education_level: 'Середня спеціальна',
    occupation: 'Менеджер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 22108,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 141,
    return_planned: true, return_date: '2022-07-17'
})-[:MIGRATION_FROM]->(from)
CREATE (m451)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Запоріжжя'})
CREATE (m452:Migration {
    id: 'mig_452',
    person_name: 'Ксенія Кравчук',
    gender: 'Жінка',
    age: 59,
    migration_date: '2023-08-25',
    migration_time: '06:45',
    reason: 'Навчання',
    distance_km: 842.08,
    education_level: 'Вища',
    occupation: 'Робітник',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 0,
    monthly_income: 33715,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 149,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m452)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Київ'})
CREATE (m453:Migration {
    id: 'mig_453',
    person_name: 'Богдана Пономаренко',
    gender: 'Жінка',
    age: 41,
    migration_date: '2021-09-29',
    migration_time: '01:47',
    reason: 'Робота',
    distance_km: 200.07,
    education_level: 'Магістр',
    occupation: 'Програміст',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 5,
    monthly_income: 34967,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 3511,
    return_planned: true, return_date: '2023-03-01'
})-[:MIGRATION_FROM]->(from)
CREATE (m453)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Донецьк'})
CREATE (m454:Migration {
    id: 'mig_454',
    person_name: 'Людмила Васильчук',
    gender: 'Жінка',
    age: 27,
    migration_date: '2022-07-30',
    migration_time: '10:44',
    reason: 'Бізнес',
    distance_km: 1024.88,
    education_level: 'Середня',
    occupation: 'Програміст',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 14475,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 2503,
    return_planned: true, return_date: '2022-11-20'
})-[:MIGRATION_FROM]->(from)
CREATE (m454)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Полтава'})
CREATE (m455:Migration {
    id: 'mig_455',
    person_name: 'Валентина Марчук',
    gender: 'Жінка',
    age: 49,
    migration_date: '2022-07-14',
    migration_time: '13:03',
    reason: 'Культурні причини',
    distance_km: 130.04,
    education_level: 'Доктор наук',
    occupation: 'Підприємець',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 5362,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 2055,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m455)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Тернопіль'})
CREATE (m456:Migration {
    id: 'mig_456',
    person_name: 'Олександр Калиненко',
    gender: 'Чоловік',
    age: 31,
    migration_date: '2021-09-17',
    migration_time: '03:22',
    reason: 'Політичні причини',
    distance_km: 645.50,
    education_level: 'Магістр',
    occupation: 'Пенсіонер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 31916,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 1942,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m456)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Рівне'})
CREATE (m457:Migration {
    id: 'mig_457',
    person_name: 'Денис Ткаченко',
    gender: 'Чоловік',
    age: 18,
    migration_date: '2022-03-25',
    migration_time: '17:29',
    reason: 'Медичні причини',
    distance_km: 127.50,
    education_level: 'Середня спеціальна',
    occupation: 'Перекладач',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 37336,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 2328,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m457)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Вінниця'})
CREATE (m458:Migration {
    id: 'mig_458',
    person_name: 'Раїса Попов',
    gender: 'Жінка',
    age: 40,
    migration_date: '2021-09-25',
    migration_time: '04:27',
    reason: 'Культурні причини',
    distance_km: 488.43,
    education_level: 'Магістр',
    occupation: 'Пенсіонер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 36116,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 1387,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m458)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Одеса'}), (to:City {name: 'Донецьк'})
CREATE (m459:Migration {
    id: 'mig_459',
    person_name: 'Михайло Савченко',
    gender: 'Чоловік',
    age: 42,
    migration_date: '2024-01-29',
    migration_time: '17:56',
    reason: 'Економічні причини',
    distance_km: 560.66,
    education_level: 'Доктор наук',
    occupation: 'Робітник',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 26148,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 663,
    return_planned: true, return_date: '2025-04-03'
})-[:MIGRATION_FROM]->(from)
CREATE (m459)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Тернопіль'})
CREATE (m460:Migration {
    id: 'mig_460',
    person_name: 'Єлизавета Іваненко',
    gender: 'Жінка',
    age: 70,
    migration_date: '2023-12-02',
    migration_time: '15:22',
    reason: 'Соціальні причини',
    distance_km: 210.97,
    education_level: 'Доктор наук',
    occupation: 'Бухгалтер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 0,
    monthly_income: 45916,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 3413,
    return_planned: true, return_date: '2024-03-25'
})-[:MIGRATION_FROM]->(from)
CREATE (m460)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Донецьк'}), (to:City {name: 'Суми'})
CREATE (m461:Migration {
    id: 'mig_461',
    person_name: 'Валентин Сидоренко',
    gender: 'Чоловік',
    age: 68,
    migration_date: '2023-04-25',
    migration_time: '01:05',
    reason: 'Освітні причини',
    distance_km: 387.94,
    education_level: 'Середня спеціальна',
    occupation: 'Бухгалтер',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 30495,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 2730,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m461)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Вінниця'})
CREATE (m462:Migration {
    id: 'mig_462',
    person_name: 'Данило Іваненко',
    gender: 'Чоловік',
    age: 42,
    migration_date: '2024-03-28',
    migration_time: '09:56',
    reason: 'Екологічні причини',
    distance_km: 565.34,
    education_level: 'Середня спеціальна',
    occupation: 'Бухгалтер',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 28098,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 3549,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m462)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Львів'})
CREATE (m463:Migration {
    id: 'mig_463',
    person_name: 'Вікторія Іваненко',
    gender: 'Жінка',
    age: 23,
    migration_date: '2023-05-08',
    migration_time: '12:05',
    reason: 'Соціальні причини',
    distance_km: 116.98,
    education_level: 'Середня',
    occupation: 'Юрист',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 15015,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 3432,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m463)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Суми'})
CREATE (m464:Migration {
    id: 'mig_464',
    person_name: 'Людмила Сидорчук',
    gender: 'Жінка',
    age: 68,
    migration_date: '2021-05-17',
    migration_time: '08:17',
    reason: 'Особисті причини',
    distance_km: 305.42,
    education_level: 'Середня',
    occupation: 'Менеджер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 23676,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1330,
    return_planned: true, return_date: '2021-12-09'
})-[:MIGRATION_FROM]->(from)
CREATE (m464)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Суми'})
CREATE (m465:Migration {
    id: 'mig_465',
    person_name: 'Анатолій Ткачук',
    gender: 'Чоловік',
    age: 61,
    migration_date: '2022-08-16',
    migration_time: '21:49',
    reason: 'Екологічні причини',
    distance_km: 488.43,
    education_level: 'Доктор наук',
    occupation: 'Архітектор',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 16542,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 1778,
    return_planned: true, return_date: '2024-04-08'
})-[:MIGRATION_FROM]->(from)
CREATE (m465)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Кропивницький'})
CREATE (m466:Migration {
    id: 'mig_466',
    person_name: 'Олена Калиниченко',
    gender: 'Жінка',
    age: 30,
    migration_date: '2023-07-22',
    migration_time: '23:50',
    reason: 'Особисті причини',
    distance_km: 226.31,
    education_level: 'Магістр',
    occupation: 'Пенсіонер',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 1,
    monthly_income: 41430,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 1816,
    return_planned: true, return_date: '2024-06-15'
})-[:MIGRATION_FROM]->(from)
CREATE (m466)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Київ'})
CREATE (m467:Migration {
    id: 'mig_467',
    person_name: 'Олександр Грищенко',
    gender: 'Чоловік',
    age: 64,
    migration_date: '2024-02-08',
    migration_time: '12:05',
    reason: 'Медичні причини',
    distance_km: 156.81,
    education_level: 'Середня',
    occupation: 'Науковець',
    family_status: 'Вдівець/вдова',
    has_children: true,
    number_of_children: 2,
    monthly_income: 29364,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 1143,
    return_planned: true, return_date: '2024-05-30'
})-[:MIGRATION_FROM]->(from)
CREATE (m467)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Рівне'})
CREATE (m468:Migration {
    id: 'mig_468',
    person_name: 'Михайло Савченко',
    gender: 'Чоловік',
    age: 54,
    migration_date: '2023-03-22',
    migration_time: '09:50',
    reason: 'Відновлення після війни',
    distance_km: 259.89,
    education_level: 'Магістр',
    occupation: 'Науковець',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 3,
    monthly_income: 22899,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 1308,
    return_planned: true, return_date: '2023-06-27'
})-[:MIGRATION_FROM]->(from)
CREATE (m468)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Кропивницький'}), (to:City {name: 'Полтава'})
CREATE (m469:Migration {
    id: 'mig_469',
    person_name: 'Захар Савчук',
    gender: 'Чоловік',
    age: 52,
    migration_date: '2023-01-18',
    migration_time: '17:16',
    reason: 'Сімейні обставини',
    distance_km: 205.37,
    education_level: 'Вища',
    occupation: 'Архітектор',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 0,
    monthly_income: 11062,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 780,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m469)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Одеса'})
CREATE (m470:Migration {
    id: 'mig_470',
    person_name: 'Костянтин Савченко',
    gender: 'Чоловік',
    age: 34,
    migration_date: '2022-05-29',
    migration_time: '15:23',
    reason: 'Сімейні обставини',
    distance_km: 447.40,
    education_level: 'Доктор наук',
    occupation: 'Підприємець',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 3,
    monthly_income: 30105,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 2823,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m470)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Рівне'})
CREATE (m471:Migration {
    id: 'mig_471',
    person_name: 'Юрій Марченко',
    gender: 'Чоловік',
    age: 34,
    migration_date: '2023-08-12',
    migration_time: '02:12',
    reason: 'Кліматичні причини',
    distance_km: 259.89,
    education_level: 'Середня',
    occupation: 'Вчитель',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 6547,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 1006,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m471)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Вінниця'})
CREATE (m472:Migration {
    id: 'mig_472',
    person_name: 'Аліна Іванчук',
    gender: 'Жінка',
    age: 32,
    migration_date: '2022-10-14',
    migration_time: '14:05',
    reason: 'Бізнес',
    distance_km: 514.88,
    education_level: 'Магістр',
    occupation: 'Менеджер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 7141,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 133,
    return_planned: true, return_date: '2024-07-21'
})-[:MIGRATION_FROM]->(from)
CREATE (m472)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Одеса'})
CREATE (m473:Migration {
    id: 'mig_473',
    person_name: 'Геннадій Ковальчук',
    gender: 'Чоловік',
    age: 43,
    migration_date: '2022-07-18',
    migration_time: '12:11',
    reason: 'Бізнес',
    distance_km: 575.61,
    education_level: 'Доктор наук',
    occupation: 'Бухгалтер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 20514,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 543,
    return_planned: true, return_date: '2022-12-28'
})-[:MIGRATION_FROM]->(from)
CREATE (m473)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Донецьк'})
CREATE (m474:Migration {
    id: 'mig_474',
    person_name: 'Борис Грищук',
    gender: 'Чоловік',
    age: 53,
    migration_date: '2021-04-27',
    migration_time: '09:11',
    reason: 'Особисті причини',
    distance_km: 884.81,
    education_level: 'Середня спеціальна',
    occupation: 'Підприємець',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 18989,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 2918,
    return_planned: true, return_date: '2023-04-26'
})-[:MIGRATION_FROM]->(from)
CREATE (m474)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Дніпро'})
CREATE (m475:Migration {
    id: 'mig_475',
    person_name: 'Фаїна Павленко',
    gender: 'Жінка',
    age: 61,
    migration_date: '2023-03-04',
    migration_time: '03:02',
    reason: 'Покращення житлових умов',
    distance_km: 488.68,
    education_level: 'Вища',
    occupation: 'Підприємець',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 18675,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 624,
    return_planned: true, return_date: '2025-01-31'
})-[:MIGRATION_FROM]->(from)
CREATE (m475)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Кропивницький'})
CREATE (m476:Migration {
    id: 'mig_476',
    person_name: 'Віталій Кравченко',
    gender: 'Чоловік',
    age: 27,
    migration_date: '2021-11-16',
    migration_time: '07:26',
    reason: 'Відновлення після війни',
    distance_km: 331.82,
    education_level: 'Середня',
    occupation: 'Пенсіонер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 30683,
    housing_type: 'Будинок',
    transport_type: 'Власне авто',
    duration_of_stay: 2528,
    return_planned: true, return_date: '2022-01-24'
})-[:MIGRATION_FROM]->(from)
CREATE (m476)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Дніпро'})
CREATE (m477:Migration {
    id: 'mig_477',
    person_name: 'Святослав Петриченко',
    gender: 'Чоловік',
    age: 61,
    migration_date: '2023-10-11',
    migration_time: '17:01',
    reason: 'Особисті причини',
    distance_km: 243.73,
    education_level: 'Середня',
    occupation: 'Пенсіонер',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 37333,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 3283,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m477)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Чернівці'})
CREATE (m478:Migration {
    id: 'mig_478',
    person_name: 'Ярина Ткаченко',
    gender: 'Жінка',
    age: 37,
    migration_date: '2022-01-29',
    migration_time: '17:13',
    reason: 'Покращення житлових умов',
    distance_km: 213.11,
    education_level: 'Магістр',
    occupation: 'Юрист',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 13548,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 350,
    return_planned: true, return_date: '2022-03-30'
})-[:MIGRATION_FROM]->(from)
CREATE (m478)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Харків'})
CREATE (m479:Migration {
    id: 'mig_479',
    person_name: 'Анна Кравченко',
    gender: 'Жінка',
    age: 47,
    migration_date: '2022-08-18',
    migration_time: '07:28',
    reason: 'Покращення житлових умов',
    distance_km: 711.54,
    education_level: 'Середня',
    occupation: 'Науковець',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 6648,
    housing_type: 'Квартира',
    transport_type: 'Автобус',
    duration_of_stay: 723,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m479)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Дніпро'}), (to:City {name: 'Київ'})
CREATE (m480:Migration {
    id: 'mig_480',
    person_name: 'Зінаїда Гончаренко',
    gender: 'Жінка',
    age: 55,
    migration_date: '2023-12-10',
    migration_time: '22:35',
    reason: 'Соціальні причини',
    distance_km: 394.35,
    education_level: 'Магістр',
    occupation: 'Робітник',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 1,
    monthly_income: 45883,
    housing_type: 'Тимчасове житло',
    transport_type: 'Літак',
    duration_of_stay: 465,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m480)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Кропивницький'})
CREATE (m481:Migration {
    id: 'mig_481',
    person_name: 'Інга Марчук',
    gender: 'Жінка',
    age: 70,
    migration_date: '2022-10-07',
    migration_time: '07:45',
    reason: 'Культурні причини',
    distance_km: 205.37,
    education_level: 'Середня',
    occupation: 'Вчитель',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 29331,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 989,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m481)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Рівне'}), (to:City {name: 'Вінниця'})
CREATE (m482:Migration {
    id: 'mig_482',
    person_name: 'Василь Сидорчук',
    gender: 'Чоловік',
    age: 40,
    migration_date: '2024-02-08',
    migration_time: '05:49',
    reason: 'Освітні причини',
    distance_km: 221.24,
    education_level: 'Магістр',
    occupation: 'Бухгалтер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 10000,
    housing_type: 'Будинок',
    transport_type: 'Літак',
    duration_of_stay: 1891,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m482)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Харків'})
CREATE (m483:Migration {
    id: 'mig_483',
    person_name: 'Уляна Кравчук',
    gender: 'Жінка',
    age: 46,
    migration_date: '2021-07-08',
    migration_time: '07:09',
    reason: 'Культурні причини',
    distance_km: 128.67,
    education_level: 'Середня спеціальна',
    occupation: 'Підприємець',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 38120,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2902,
    return_planned: true, return_date: '2021-09-26'
})-[:MIGRATION_FROM]->(from)
CREATE (m483)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Вінниця'}), (to:City {name: 'Харків'})
CREATE (m484:Migration {
    id: 'mig_484',
    person_name: 'Олег Петренко',
    gender: 'Чоловік',
    age: 18,
    migration_date: '2021-10-22',
    migration_time: '01:41',
    reason: 'Відновлення після війни',
    distance_km: 565.34,
    education_level: 'Вища',
    occupation: 'Архітектор',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 8911,
    housing_type: 'Тимчасове житло',
    transport_type: 'Власне авто',
    duration_of_stay: 2924,
    return_planned: true, return_date: '2023-03-27'
})-[:MIGRATION_FROM]->(from)
CREATE (m484)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Суми'}), (to:City {name: 'Львів'})
CREATE (m485:Migration {
    id: 'mig_485',
    person_name: 'Маргарита Марчук',
    gender: 'Жінка',
    age: 67,
    migration_date: '2022-12-05',
    migration_time: '22:34',
    reason: 'Навчання',
    distance_km: 772.13,
    education_level: 'Середня',
    occupation: 'Перекладач',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 5,
    monthly_income: 47592,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 1368,
    return_planned: true, return_date: '2023-03-06'
})-[:MIGRATION_FROM]->(from)
CREATE (m485)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Тернопіль'}), (to:City {name: 'Київ'})
CREATE (m486:Migration {
    id: 'mig_486',
    person_name: 'Жанна Олійник',
    gender: 'Жінка',
    age: 34,
    migration_date: '2023-05-09',
    migration_time: '20:59',
    reason: 'Відновлення після війни',
    distance_km: 366.01,
    education_level: 'Доктор наук',
    occupation: 'Студент',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 4,
    monthly_income: 45844,
    housing_type: 'Тимчасове житло',
    transport_type: 'Автобус',
    duration_of_stay: 3121,
    return_planned: true, return_date: '2024-03-29'
})-[:MIGRATION_FROM]->(from)
CREATE (m486)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Дніпро'})
CREATE (m487:Migration {
    id: 'mig_487',
    person_name: 'Уляна Марченко',
    gender: 'Жінка',
    age: 52,
    migration_date: '2023-02-21',
    migration_time: '14:11',
    reason: 'Екологічні причини',
    distance_km: 243.73,
    education_level: 'Вища',
    occupation: 'Підприємець',
    family_status: 'Розлучений/розлучена',
    has_children: false,
    number_of_children: 0,
    monthly_income: 32595,
    housing_type: 'Будинок',
    transport_type: 'Автобус',
    duration_of_stay: 2970,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m487)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Черкаси'})
CREATE (m488:Migration {
    id: 'mig_488',
    person_name: 'Леонід Васильчук',
    gender: 'Чоловік',
    age: 46,
    migration_date: '2022-11-19',
    migration_time: '16:38',
    reason: 'Культурні причини',
    distance_km: 305.94,
    education_level: 'Середня',
    occupation: 'Бухгалтер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 3,
    monthly_income: 44129,
    housing_type: 'Квартира',
    transport_type: 'Поїзд',
    duration_of_stay: 2937,
    return_planned: true, return_date: '2023-01-21'
})-[:MIGRATION_FROM]->(from)
CREATE (m488)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Донецьк'})
CREATE (m489:Migration {
    id: 'mig_489',
    person_name: 'Наталія Савчук',
    gender: 'Жінка',
    age: 28,
    migration_date: '2022-05-15',
    migration_time: '10:38',
    reason: 'Освітні причини',
    distance_km: 1024.88,
    education_level: 'Магістр',
    occupation: 'Науковець',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 14010,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 2455,
    return_planned: true, return_date: '2023-07-14'
})-[:MIGRATION_FROM]->(from)
CREATE (m489)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Львів'}), (to:City {name: 'Харків'})
CREATE (m490:Migration {
    id: 'mig_490',
    person_name: 'Сергій Савчук',
    gender: 'Чоловік',
    age: 64,
    migration_date: '2022-09-29',
    migration_time: '13:09',
    reason: 'Культурні причини',
    distance_km: 872.75,
    education_level: 'Середня',
    occupation: 'Бухгалтер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 47518,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 3227,
    return_planned: true, return_date: '2024-05-16'
})-[:MIGRATION_FROM]->(from)
CREATE (m490)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Донецьк'})
CREATE (m491:Migration {
    id: 'mig_491',
    person_name: 'Володимир Павленко',
    gender: 'Чоловік',
    age: 47,
    migration_date: '2024-04-05',
    migration_time: '23:42',
    reason: 'Медичні причини',
    distance_km: 880.00,
    education_level: 'Середня',
    occupation: 'Студент',
    family_status: 'Вдівець/вдова',
    has_children: false,
    number_of_children: 0,
    monthly_income: 19120,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 789,
    return_planned: true, return_date: '2026-02-13'
})-[:MIGRATION_FROM]->(from)
CREATE (m491)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Вінниця'})
CREATE (m492:Migration {
    id: 'mig_492',
    person_name: 'Ганна Левченко',
    gender: 'Жінка',
    age: 21,
    migration_date: '2022-05-14',
    migration_time: '00:37',
    reason: 'Освітні причини',
    distance_km: 565.34,
    education_level: 'Вища',
    occupation: 'Програміст',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 0,
    monthly_income: 6703,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 2625,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m492)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Київ'}), (to:City {name: 'Харків'})
CREATE (m493:Migration {
    id: 'mig_493',
    person_name: 'Денис Сидоренко',
    gender: 'Чоловік',
    age: 23,
    migration_date: '2022-03-13',
    migration_time: '11:02',
    reason: 'Особисті причини',
    distance_km: 409.08,
    education_level: 'Вища',
    occupation: 'Науковець',
    family_status: 'Одружений/заміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 37983,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 3279,
    return_planned: true, return_date: '2022-09-23'
})-[:MIGRATION_FROM]->(from)
CREATE (m493)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Київ'})
CREATE (m494:Migration {
    id: 'mig_494',
    person_name: 'Анастасія Кравчук',
    gender: 'Жінка',
    age: 27,
    migration_date: '2024-03-03',
    migration_time: '04:14',
    reason: 'Політичні причини',
    distance_km: 303.27,
    education_level: 'Доктор наук',
    occupation: 'Вчитель',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 5138,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 1515,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m494)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Чернівці'}), (to:City {name: 'Полтава'})
CREATE (m495:Migration {
    id: 'mig_495',
    person_name: 'Олексій Грищук',
    gender: 'Чоловік',
    age: 37,
    migration_date: '2021-12-18',
    migration_time: '15:31',
    reason: 'Робота',
    distance_km: 645.21,
    education_level: 'Середня спеціальна',
    occupation: 'Юрист',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 0,
    monthly_income: 33446,
    housing_type: 'Квартира',
    transport_type: 'Літак',
    duration_of_stay: 3443,
    return_planned: true, return_date: '2023-04-04'
})-[:MIGRATION_FROM]->(from)
CREATE (m495)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Запоріжжя'}), (to:City {name: 'Черкаси'})
CREATE (m496:Migration {
    id: 'mig_496',
    person_name: 'Ольга Попов',
    gender: 'Жінка',
    age: 58,
    migration_date: '2022-11-21',
    migration_time: '10:56',
    reason: 'Кліматичні причини',
    distance_km: 288.19,
    education_level: 'Середня спеціальна',
    occupation: 'Бухгалтер',
    family_status: 'Одружений/заміжня',
    has_children: true,
    number_of_children: 5,
    monthly_income: 21414,
    housing_type: 'Тимчасове житло',
    transport_type: 'Поїзд',
    duration_of_stay: 758,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m496)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Полтава'}), (to:City {name: 'Тернопіль'})
CREATE (m497:Migration {
    id: 'mig_497',
    person_name: 'Анатолій Савенко',
    gender: 'Чоловік',
    age: 44,
    migration_date: '2022-03-22',
    migration_time: '07:37',
    reason: 'Особисті причини',
    distance_km: 645.50,
    education_level: 'Магістр',
    occupation: 'Програміст',
    family_status: 'Неодружений/незаміжня',
    has_children: true,
    number_of_children: 2,
    monthly_income: 49551,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 87,
    return_planned: true, return_date: '2022-08-25'
})-[:MIGRATION_FROM]->(from)
CREATE (m497)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Харків'}), (to:City {name: 'Запоріжжя'})
CREATE (m498:Migration {
    id: 'mig_498',
    person_name: 'Єлизавета Гончаренко',
    gender: 'Жінка',
    age: 23,
    migration_date: '2022-09-03',
    migration_time: '19:58',
    reason: 'Бізнес',
    distance_km: 252.50,
    education_level: 'Магістр',
    occupation: 'Лікар',
    family_status: 'Розлучений/розлучена',
    has_children: true,
    number_of_children: 2,
    monthly_income: 14294,
    housing_type: 'Будинок',
    transport_type: 'Поїзд',
    duration_of_stay: 1984,
    return_planned: false
})-[:MIGRATION_FROM]->(from)
CREATE (m498)-[:MIGRATION_TO]->(to)
WITH *
MATCH (from:City {name: 'Черкаси'}), (to:City {name: 'Полтава'})
CREATE (m499:Migration {
    id: 'mig_499',
    person_name: 'Денис Романенко',
    gender: 'Чоловік',
    age: 28,
    migration_date: '2023-10-08',
    migration_time: '20:17',
    reason: 'Освітні причини',
    distance_km: 180.57,
    education_level: 'Доктор наук',
    occupation: 'Інженер',
    family_status: 'Неодружений/незаміжня',
    has_children: false,
    number_of_children: 0,
    monthly_income: 6822,
    housing_type: 'Квартира',
    transport_type: 'Власне авто',
    duration_of_stay: 2387,
    return_planned: true, return_date: '2024-11-16'
})-[:MIGRATION_FROM]->(from)
CREATE (m499)-[:MIGRATION_TO]->(to)
WITH *
RETURN *