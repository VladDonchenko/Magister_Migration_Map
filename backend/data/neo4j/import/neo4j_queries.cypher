CREATE (kyiv:City {
    name: 'Київ',
    lat: 50.4501,
    lng: 30.5234
});

CREATE (kharkiv:City {
    name: 'Харків',
    lat: 49.9935,
    lng: 36.2304
});

CREATE (odesa:City {
    name: 'Одеса',
    lat: 46.4825,
    lng: 30.7233
});

CREATE (dnipro:City {
    name: 'Дніпро',
    lat: 48.4647,
    lng: 35.0462
});

CREATE (donetsk:City {
    name: 'Донецьк',
    lat: 48.0159,
    lng: 37.8028
});

CREATE (zaporizhzhia:City {
    name: 'Запоріжжя',
    lat: 47.8388,
    lng: 35.1396
});

CREATE (lviv:City {
    name: 'Львів',
    lat: 49.8397,
    lng: 24.0297
});

CREATE (sumy:City {
    name: 'Суми',
    lat: 50.9077,
    lng: 34.7981
});

CREATE (poltava:City {
    name: 'Полтава',
    lat: 49.5883,
    lng: 34.5514
});

CREATE (vinnytsia:City {
    name: 'Вінниця',
    lat: 49.2331,
    lng: 28.4682
});

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Одеса'})
CREATE (m1:Migration {
    id: 'mig_5707',
    person_name: 'Person_671',
    gender: 'Чоловік',
    age: 29,
    migration_date: '2025-02-25',
    reason: 'Сімейні обставини',
    distance_km: 576.11
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-25'}]->(m1)
CREATE (m1)-[:MIGRATION_TO {date: '2025-02-25'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Харків'})
CREATE (m2:Migration {
    id: 'mig_3882',
    person_name: 'Person_282',
    gender: 'Жінка',
    age: 19,
    migration_date: '2025-02-23',
    reason: 'Екологічні причини',
    distance_km: 410.33
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-23'}]->(m2)
CREATE (m2)-[:MIGRATION_TO {date: '2025-02-23'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m3:Migration {
    id: 'mig_1326',
    person_name: 'Person_826',
    gender: 'Чоловік',
    age: 18,
    migration_date: '2025-03-06',
    reason: 'Екологічні причини',
    distance_km: 210.74
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-06'}]->(m3)
CREATE (m3)-[:MIGRATION_TO {date: '2025-03-06'}]->(to)

MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m4:Migration {
    id: 'mig_3089',
    person_name: 'Person_458',
    gender: 'Чоловік',
    age: 42,
    migration_date: '2025-01-11',
    reason: 'Відновлення після війни',
    distance_km: 393.29
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-11'}]->(m4)
CREATE (m4)-[:MIGRATION_TO {date: '2025-01-11'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Вінниця'})
CREATE (m5:Migration {
    id: 'mig_7637',
    person_name: 'Person_889',
    gender: 'Чоловік',
    age: 67,
    migration_date: '2025-03-12',
    reason: 'Відновлення після війни',
    distance_km: 490.12
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-12'}]->(m5)
CREATE (m5)-[:MIGRATION_TO {date: '2025-03-12'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Вінниця'})
CREATE (m6:Migration {
    id: 'mig_5276',
    person_name: 'Person_745',
    gender: 'Жінка',
    age: 68,
    migration_date: '2025-02-01',
    reason: 'Покращення житлових умов',
    distance_km: 443.09
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-01'}]->(m6)
CREATE (m6)-[:MIGRATION_TO {date: '2025-02-01'}]->(to)

MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Київ'})
CREATE (m7:Migration {
    id: 'mig_7423',
    person_name: 'Person_157',
    gender: 'Чоловік',
    age: 26,
    migration_date: '2025-01-19',
    reason: 'Екологічні причини',
    distance_km: 441.44
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-19'}]->(m7)
CREATE (m7)-[:MIGRATION_TO {date: '2025-01-19'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Одеса'})
CREATE (m8:Migration {
    id: 'mig_2386',
    person_name: 'Person_921',
    gender: 'Чоловік',
    age: 41,
    migration_date: '2025-03-25',
    reason: 'Навчання',
    distance_km: 565.19
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-25'}]->(m8)
CREATE (m8)-[:MIGRATION_TO {date: '2025-03-25'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Львів'})
CREATE (m9:Migration {
    id: 'mig_9193',
    person_name: 'Person_66',
    gender: 'Чоловік',
    age: 21,
    migration_date: '2025-02-15',
    reason: 'Робота',
    distance_km: 774.48
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-15'}]->(m9)
CREATE (m9)-[:MIGRATION_TO {date: '2025-02-15'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Полтава'})
CREATE (m10:Migration {
    id: 'mig_4257',
    person_name: 'Person_612',
    gender: 'Чоловік',
    age: 41,
    migration_date: '2025-01-09',
    reason: 'Покращення житлових умов',
    distance_km: 199.31
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-09'}]->(m10)
CREATE (m10)-[:MIGRATION_TO {date: '2025-01-09'}]->(to)

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
    reason: 'Відновлення після війни',
    distance_km: 395.21
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-07'}]->(m14)
CREATE (m14)-[:MIGRATION_TO {date: '2025-01-07'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Суми'})
CREATE (m15:Migration {
    id: 'mig_6505',
    person_name: 'Person_839',
    gender: 'Жінка',
    age: 45,
    migration_date: '2025-02-14',
    reason: 'Особисті причини',
    distance_km: 143.83
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-14'}]->(m15)
CREATE (m15)-[:MIGRATION_TO {date: '2025-02-14'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Харків'})
CREATE (m16:Migration {
    id: 'mig_5521',
    person_name: 'Person_909',
    gender: 'Жінка',
    age: 60,
    migration_date: '2025-03-23',
    reason: 'Особисті причини',
    distance_km: 143.83
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-23'}]->(m16)
CREATE (m16)-[:MIGRATION_TO {date: '2025-03-23'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m17:Migration {
    id: 'mig_4112',
    person_name: 'Person_166',
    gender: 'Жінка',
    age: 20,
    migration_date: '2025-03-19',
    reason: 'Бізнес',
    distance_km: 444.56
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-19'}]->(m17)
CREATE (m17)-[:MIGRATION_TO {date: '2025-03-19'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m18:Migration {
    id: 'mig_1128',
    person_name: 'Person_637',
    gender: 'Чоловік',
    age: 26,
    migration_date: '2024-12-27',
    reason: 'Робота',
    distance_km: 248.19
})
CREATE (from)-[:MIGRATION_TO {date: '2024-12-27'}]->(m18)
CREATE (m18)-[:MIGRATION_TO {date: '2024-12-27'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Вінниця'})
CREATE (m19:Migration {
    id: 'mig_5492',
    person_name: 'Person_639',
    gender: 'Чоловік',
    age: 61,
    migration_date: '2025-02-18',
    reason: 'Робота',
    distance_km: 700.85
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-18'}]->(m19)
CREATE (m19)-[:MIGRATION_TO {date: '2025-02-18'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Одеса'})
CREATE (m20:Migration {
    id: 'mig_8497',
    person_name: 'Person_869',
    gender: 'Жінка',
    age: 33,
    migration_date: '2025-03-18',
    reason: 'Відновлення після війни',
    distance_km: 441.44
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-18'}]->(m20)
CREATE (m20)-[:MIGRATION_TO {date: '2025-03-18'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Львів'})
CREATE (m21:Migration {
    id: 'mig_6208',
    person_name: 'Person_716',
    gender: 'Чоловік',
    age: 21,
    migration_date: '2025-03-17',
    reason: 'Робота',
    distance_km: 468.95
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-17'}]->(m21)
CREATE (m21)-[:MIGRATION_TO {date: '2025-03-17'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Суми'})
CREATE (m22:Migration {
    id: 'mig_6157',
    person_name: 'Person_458',
    gender: 'Жінка',
    age: 53,
    migration_date: '2025-02-18',
    reason: 'Відновлення після війни',
    distance_km: 147.81
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-18'}]->(m22)
CREATE (m22)-[:MIGRATION_TO {date: '2025-02-18'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m23:Migration {
    id: 'mig_8886',
    person_name: 'Person_405',
    gender: 'Жінка',
    age: 48,
    migration_date: '2025-03-04',
    reason: 'Сімейні обставини',
    distance_km: 199.98
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-04'}]->(m23)
CREATE (m23)-[:MIGRATION_TO {date: '2025-03-04'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Одеса'})
CREATE (m24:Migration {
    id: 'mig_4386',
    person_name: 'Person_104',
    gender: 'Жінка',
    age: 19,
    migration_date: '2025-02-19',
    reason: 'Бізнес',
    distance_km: 576.11
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-19'}]->(m24)
CREATE (m24)-[:MIGRATION_TO {date: '2025-02-19'}]->(to)

MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m25:Migration {
    id: 'mig_3991',
    person_name: 'Person_428',
    gender: 'Чоловік',
    age: 45,
    migration_date: '2025-03-16',
    reason: 'Екологічні причини',
    distance_km: 393.29
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-16'}]->(m25)
CREATE (m25)-[:MIGRATION_TO {date: '2025-03-16'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Суми'})
CREATE (m26:Migration {
    id: 'mig_3589',
    person_name: 'Person_892',
    gender: 'Чоловік',
    age: 27,
    migration_date: '2025-01-23',
    reason: 'Робота',
    distance_km: 143.83
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-23'}]->(m26)
CREATE (m26)-[:MIGRATION_TO {date: '2025-01-23'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Полтава'})
CREATE (m27:Migration {
    id: 'mig_3340',
    person_name: 'Person_282',
    gender: 'Жінка',
    age: 28,
    migration_date: '2025-03-21',
    reason: 'Сімейні обставини',
    distance_km: 129.02
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-21'}]->(m27)
CREATE (m27)-[:MIGRATION_TO {date: '2025-03-21'}]->(to)

MATCH (from:City {name: 'Вінниця'})
MATCH (to:City {name: 'Суми'})
CREATE (m28:Migration {
    id: 'mig_3786',
    person_name: 'Person_321',
    gender: 'Жінка',
    age: 23,
    migration_date: '2025-03-03',
    reason: 'Бізнес',
    distance_km: 489.75
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-03'}]->(m28)
CREATE (m28)-[:MIGRATION_TO {date: '2025-03-03'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Полтава'})
CREATE (m29:Migration {
    id: 'mig_7598',
    person_name: 'Person_221',
    gender: 'Жінка',
    age: 38,
    migration_date: '2025-03-09',
    reason: 'Відновлення після війни',
    distance_km: 199.31
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-09'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-09'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m:Migration {
    id: 'mig_8525',
    person_name: 'Person_52',
    gender: 'Чоловік',
    age: 42,
    migration_date: '2025-01-15',
    reason: 'Відновлення після війни',
    distance_km: 199.98
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-15'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-15'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m:Migration {
    id: 'mig_2830',
    person_name: 'Person_901',
    gender: 'Чоловік',
    age: 50,
    migration_date: '2025-01-03',
    reason: 'Покращення житлових умов',
    distance_km: 248.19
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-03'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-03'}]->(to)

MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Київ'})
CREATE (m:Migration {
    id: 'mig_1954',
    person_name: 'Person_632',
    gender: 'Жінка',
    age: 42,
    migration_date: '2025-03-14',
    reason: 'Навчання',
    distance_km: 441.44
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-14'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-14'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Київ'})
CREATE (m:Migration {
    id: 'mig_7100',
    person_name: 'Person_756',
    gender: 'Жінка',
    age: 67,
    migration_date: '2024-12-28',
    reason: 'Особисті причини',
    distance_km: 306.35
})
CREATE (from)-[:MIGRATION_TO {date: '2024-12-28'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2024-12-28'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_3622',
    person_name: 'Person_85',
    gender: 'Чоловік',
    age: 54,
    migration_date: '2025-01-31',
    reason: 'Відновлення після війни',
    distance_km: 1027.87
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-31'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-31'}]->(to)

MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Вінниця'})
CREATE (m:Migration {
    id: 'mig_6195',
    person_name: 'Person_293',
    gender: 'Чоловік',
    age: 32,
    migration_date: '2025-01-20',
    reason: 'Особисті причини',
    distance_km: 349.26
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-20'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-20'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Київ'})
CREATE (m:Migration {
    id: 'mig_7704',
    person_name: 'Person_610',
    gender: 'Жінка',
    age: 41,
    migration_date: '2025-03-11',
    reason: 'Бізнес',
    distance_km: 304.13
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-11'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-11'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_7579',
    person_name: 'Person_945',
    gender: 'Жінка',
    age: 33,
    migration_date: '2025-01-16',
    reason: 'Навчання',
    distance_km: 447.93
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-16'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-16'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m:Migration {
    id: 'mig_2308',
    person_name: 'Person_953',
    gender: 'Чоловік',
    age: 24,
    migration_date: '2025-02-07',
    reason: 'Екологічні причини',
    distance_km: 199.98
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-07'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-07'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_8439',
    person_name: 'Person_896',
    gender: 'Жінка',
    age: 41,
    migration_date: '2025-01-29',
    reason: 'Бізнес',
    distance_km: 393.29
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-29'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-29'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Вінниця'})
CREATE (m:Migration {
    id: 'mig_4828',
    person_name: 'Person_672',
    gender: 'Чоловік',
    age: 59,
    migration_date: '2025-02-16',
    reason: 'Покращення житлових умов',
    distance_km: 443.09
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-16'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-16'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Київ'})
CREATE (m:Migration {
    id: 'mig_2462',
    person_name: 'Person_120',
    gender: 'Жінка',
    age: 67,
    migration_date: '2025-03-05',
    reason: 'Навчання',
    distance_km: 594.92
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-05'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-05'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_8574',
    person_name: 'Person_319',
    gender: 'Жінка',
    age: 52,
    migration_date: '2025-02-05',
    reason: 'Екологічні причини',
    distance_km: 342.21
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-05'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-05'}]->(to)

MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Харків'})
CREATE (m:Migration {
    id: 'mig_7972',
    person_name: 'Person_660',
    gender: 'Чоловік',
    age: 21,
    migration_date: '2025-01-17',
    reason: 'Робота',
    distance_km: 565.19
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-17'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-17'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_2831',
    person_name: 'Person_946',
    gender: 'Чоловік',
    age: 44,
    migration_date: '2025-02-17',
    reason: 'Сімейні обставини',
    distance_km: 272.31
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-17'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-17'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_1223',
    person_name: 'Person_853',
    gender: 'Жінка',
    age: 30,
    migration_date: '2025-03-16',
    reason: 'Покращення житлових умов',
    distance_km: 199.98
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-16'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-16'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_7819',
    person_name: 'Person_610',
    gender: 'Жінка',
    age: 59,
    migration_date: '2025-03-26',
    reason: 'Сімейні обставини',
    distance_km: 272.31
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-26'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-26'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Вінниця'})
CREATE (m:Migration {
    id: 'mig_7297',
    person_name: 'Person_132',
    gender: 'Жінка',
    age: 64,
    migration_date: '2025-02-26',
    reason: 'Відновлення після війни',
    distance_km: 443.09
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-26'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-26'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_3571',
    person_name: 'Person_701',
    gender: 'Чоловік',
    age: 51,
    migration_date: '2025-01-06',
    reason: 'Відновлення після війни',
    distance_km: 468.95
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-06'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-06'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Харків'})
CREATE (m:Migration {
    id: 'mig_1044',
    person_name: 'Person_977',
    gender: 'Чоловік',
    age: 65,
    migration_date: '2025-02-10',
    reason: 'Робота',
    distance_km: 252.6
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-10'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-10'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Київ'})
CREATE (m:Migration {
    id: 'mig_8717',
    person_name: 'Person_385',
    gender: 'Жінка',
    age: 65,
    migration_date: '2025-03-03',
    reason: 'Відновлення після війни',
    distance_km: 468.95
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-03'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-03'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_8874',
    person_name: 'Person_489',
    gender: 'Чоловік',
    age: 53,
    migration_date: '2025-03-19',
    reason: 'Бізнес',
    distance_km: 441.44
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-19'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-19'}]->(to)

MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_8778',
    person_name: 'Person_153',
    gender: 'Чоловік',
    age: 24,
    migration_date: '2025-03-10',
    reason: 'Робота',
    distance_km: 576.11
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-10'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-10'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_3806',
    person_name: 'Person_894',
    gender: 'Чоловік',
    age: 58,
    migration_date: '2025-02-13',
    reason: 'Особисті причини',
    distance_km: 774.48
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-13'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-13'}]->(to)

MATCH (from:City {name: 'Вінниця'})
MATCH (to:City {name: 'Харків'})
CREATE (m:Migration {
    id: 'mig_9627',
    person_name: 'Person_357',
    gender: 'Чоловік',
    age: 21,
    migration_date: '2025-01-26',
    reason: 'Відновлення після війни',
    distance_km: 567.04
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-26'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-26'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_6950',
    person_name: 'Person_978',
    gender: 'Чоловік',
    age: 60,
    migration_date: '2025-01-09',
    reason: 'Навчання',
    distance_km: 272.31
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-09'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-09'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Харків'})
CREATE (m:Migration {
    id: 'mig_5193',
    person_name: 'Person_633',
    gender: 'Чоловік',
    age: 56,
    migration_date: '2025-02-10',
    reason: 'Відновлення після війни',
    distance_km: 410.33
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-10'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-10'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_7987',
    person_name: 'Person_548',
    gender: 'Чоловік',
    age: 29,
    migration_date: '2025-02-06',
    reason: 'Робота',
    distance_km: 147.81
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-06'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-06'}]->(to)

MATCH (from:City {name: 'Вінниця'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_3113',
    person_name: 'Person_60',
    gender: 'Чоловік',
    age: 40,
    migration_date: '2025-03-20',
    reason: 'Особисті причини',
    distance_km: 328.23
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-20'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-20'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_3408',
    person_name: 'Person_772',
    gender: 'Чоловік',
    age: 32,
    migration_date: '2025-03-16',
    reason: 'Особисті причини',
    distance_km: 395.21
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-16'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-16'}]->(to)

MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_5894',
    person_name: 'Person_750',
    gender: 'Чоловік',
    age: 49,
    migration_date: '2025-02-26',
    reason: 'Сімейні обставини',
    distance_km: 367.19
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-26'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-26'}]->(to)

MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_7310',
    person_name: 'Person_280',
    gender: 'Чоловік',
    age: 50,
    migration_date: '2025-01-12',
    reason: 'Робота',
    distance_km: 393.29
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-12'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-12'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_7667',
    person_name: 'Person_359',
    gender: 'Жінка',
    age: 59,
    migration_date: '2025-03-05',
    reason: 'Робота',
    distance_km: 252.6
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-05'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-05'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Харків'})
CREATE (m:Migration {
    id: 'mig_9408',
    person_name: 'Person_653',
    gender: 'Жінка',
    age: 59,
    migration_date: '2025-03-08',
    reason: 'Екологічні причини',
    distance_km: 410.33
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-08'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-08'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m:Migration {
    id: 'mig_6269',
    person_name: 'Person_906',
    gender: 'Чоловік',
    age: 19,
    migration_date: '2025-01-14',
    reason: 'Відновлення після війни',
    distance_km: 210.74
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-14'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-14'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_6046',
    person_name: 'Person_530',
    gender: 'Жінка',
    age: 27,
    migration_date: '2025-02-01',
    reason: 'Відновлення після війни',
    distance_km: 190.64
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-01'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-01'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Київ'})
CREATE (m:Migration {
    id: 'mig_3835',
    person_name: 'Person_116',
    gender: 'Чоловік',
    age: 52,
    migration_date: '2025-03-17',
    reason: 'Особисті причини',
    distance_km: 304.13
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-17'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-17'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_6603',
    person_name: 'Person_7',
    gender: 'Жінка',
    age: 29,
    migration_date: '2025-03-06',
    reason: 'Навчання',
    distance_km: 565.19
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-06'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-06'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_5104',
    person_name: 'Person_780',
    gender: 'Чоловік',
    age: 50,
    migration_date: '2025-01-05',
    reason: 'Покращення житлових умов',
    distance_km: 69.94
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-05'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-05'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Київ'})
CREATE (m:Migration {
    id: 'mig_4093',
    person_name: 'Person_777',
    gender: 'Чоловік',
    age: 64,
    migration_date: '2024-12-27',
    reason: 'Особисті причини',
    distance_km: 410.33
})
CREATE (from)-[:MIGRATION_TO {date: '2024-12-27'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2024-12-27'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_2730',
    person_name: 'Person_23',
    gender: 'Жінка',
    age: 41,
    migration_date: '2025-01-22',
    reason: 'Бізнес',
    distance_km: 199.98
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-22'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-22'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_6043',
    person_name: 'Person_490',
    gender: 'Чоловік',
    age: 53,
    migration_date: '2025-02-09',
    reason: 'Бізнес',
    distance_km: 844.46
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-09'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-09'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_3288',
    person_name: 'Person_388',
    gender: 'Чоловік',
    age: 24,
    migration_date: '2025-03-25',
    reason: 'Робота',
    distance_km: 306.35
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-25'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-25'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m:Migration {
    id: 'mig_4503',
    person_name: 'Person_395',
    gender: 'Чоловік',
    age: 58,
    migration_date: '2025-01-30',
    reason: 'Відновлення після війни',
    distance_km: 295.97
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-30'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-30'}]->(to)

MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_1851',
    person_name: 'Person_967',
    gender: 'Чоловік',
    age: 42,
    migration_date: '2025-01-20',
    reason: 'Екологічні причини',
    distance_km: 367.19
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-20'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-20'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m:Migration {
    id: 'mig_5383',
    person_name: 'Person_171',
    gender: 'Жінка',
    age: 45,
    migration_date: '2025-01-01',
    reason: 'Екологічні причини',
    distance_km: 594.92
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-01'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-01'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_5954',
    person_name: 'Person_984',
    gender: 'Чоловік',
    age: 38,
    migration_date: '2025-03-07',
    reason: 'Сімейні обставини',
    distance_km: 774.48
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-07'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-07'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_9824',
    person_name: 'Person_255',
    gender: 'Жінка',
    age: 59,
    migration_date: '2025-01-27',
    reason: 'Особисті причини',
    distance_km: 774.48
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-27'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-27'}]->(to)

MATCH (from:City {name: 'Вінниця'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_9787',
    person_name: 'Person_128',
    gender: 'Жінка',
    age: 60,
    migration_date: '2025-02-28',
    reason: 'Бізнес',
    distance_km: 490.12
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-28'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-28'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_9547',
    person_name: 'Person_795',
    gender: 'Жінка',
    age: 35,
    migration_date: '2025-02-20',
    reason: 'Робота',
    distance_km: 844.46
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-20'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-20'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_3088',
    person_name: 'Person_352',
    gender: 'Чоловік',
    age: 20,
    migration_date: '2024-12-31',
    reason: 'Робота',
    distance_km: 272.31
})
CREATE (from)-[:MIGRATION_TO {date: '2024-12-31'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2024-12-31'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_9567',
    person_name: 'Person_144',
    gender: 'Чоловік',
    age: 23,
    migration_date: '2025-02-03',
    reason: 'Бізнес',
    distance_km: 199.31
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-03'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-03'}]->(to)

MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m:Migration {
    id: 'mig_4098',
    person_name: 'Person_928',
    gender: 'Жінка',
    age: 23,
    migration_date: '2025-01-26',
    reason: 'Покращення житлових умов',
    distance_km: 562.15
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-26'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-26'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_7050',
    person_name: 'Person_762',
    gender: 'Чоловік',
    age: 53,
    migration_date: '2025-03-16',
    reason: 'Навчання',
    distance_km: 774.48
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-16'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-16'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_8324',
    person_name: 'Person_565',
    gender: 'Чоловік',
    age: 25,
    migration_date: '2025-02-04',
    reason: 'Екологічні причини',
    distance_km: 306.35
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-04'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-04'}]->(to)

MATCH (from:City {name: 'Вінниця'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_3224',
    person_name: 'Person_827',
    gender: 'Жінка',
    age: 25,
    migration_date: '2024-12-31',
    reason: 'Робота',
    distance_km: 516.29
})
CREATE (from)-[:MIGRATION_TO {date: '2024-12-31'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2024-12-31'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Київ'})
CREATE (m:Migration {
    id: 'mig_4388',
    person_name: 'Person_67',
    gender: 'Чоловік',
    age: 37,
    migration_date: '2025-01-19',
    reason: 'Сімейні обставини',
    distance_km: 410.33
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-19'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-19'}]->(to)

MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Вінниця'})
CREATE (m:Migration {
    id: 'mig_5345',
    person_name: 'Person_225',
    gender: 'Чоловік',
    age: 55,
    migration_date: '2025-03-13',
    reason: 'Навчання',
    distance_km: 349.26
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-13'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-13'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Київ'})
CREATE (m:Migration {
    id: 'mig_9389',
    person_name: 'Person_821',
    gender: 'Жінка',
    age: 56,
    migration_date: '2025-03-09',
    reason: 'Особисті причини',
    distance_km: 468.95
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-09'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-09'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_2009',
    person_name: 'Person_996',
    gender: 'Жінка',
    age: 47,
    migration_date: '2025-03-11',
    reason: 'Сімейні обставини',
    distance_km: 758.72
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-11'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-11'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Київ'})
CREATE (m:Migration {
    id: 'mig_8378',
    person_name: 'Person_309',
    gender: 'Жінка',
    age: 60,
    migration_date: '2025-01-26',
    reason: 'Покращення житлових умов',
    distance_km: 410.33
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-26'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-26'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_2516',
    person_name: 'Person_109',
    gender: 'Жінка',
    age: 18,
    migration_date: '2025-02-06',
    reason: 'Відновлення після війни',
    distance_km: 1027.87
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-06'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-06'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Київ'})
CREATE (m:Migration {
    id: 'mig_6632',
    person_name: 'Person_102',
    gender: 'Жінка',
    age: 62,
    migration_date: '2025-02-07',
    reason: 'Покращення житлових умов',
    distance_km: 395.21
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-07'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-07'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Полтава'})
CREATE (m:Migration {
    id: 'mig_3951',
    person_name: 'Person_749',
    gender: 'Чоловік',
    age: 68,
    migration_date: '2025-03-23',
    reason: 'Навчання',
    distance_km: 295.97
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-23'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-23'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Київ'})
CREATE (m:Migration {
    id: 'mig_5796',
    person_name: 'Person_178',
    gender: 'Чоловік',
    age: 59,
    migration_date: '2025-01-17',
    reason: 'Відновлення після війни',
    distance_km: 304.13
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-17'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-17'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_5993',
    person_name: 'Person_881',
    gender: 'Жінка',
    age: 51,
    migration_date: '2025-03-12',
    reason: 'Покращення житлових умов',
    distance_km: 199.98
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-12'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-12'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_9916',
    person_name: 'Person_928',
    gender: 'Чоловік',
    age: 41,
    migration_date: '2025-02-26',
    reason: 'Навчання',
    distance_km: 272.31
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-26'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-26'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m:Migration {
    id: 'mig_8365',
    person_name: 'Person_726',
    gender: 'Чоловік',
    age: 45,
    migration_date: '2025-01-27',
    reason: 'Покращення житлових умов',
    distance_km: 594.92
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-27'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-27'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_9807',
    person_name: 'Person_729',
    gender: 'Жінка',
    age: 66,
    migration_date: '2025-02-07',
    reason: 'Відновлення після війни',
    distance_km: 395.21
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-07'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-07'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_3988',
    person_name: 'Person_227',
    gender: 'Чоловік',
    age: 61,
    migration_date: '2025-02-13',
    reason: 'Бізнес',
    distance_km: 393.29
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-13'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-13'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_1347',
    person_name: 'Person_345',
    gender: 'Чоловік',
    age: 57,
    migration_date: '2024-12-30',
    reason: 'Покращення житлових умов',
    distance_km: 272.31
})
CREATE (from)-[:MIGRATION_TO {date: '2024-12-30'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2024-12-30'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_7907',
    person_name: 'Person_848',
    gender: 'Чоловік',
    age: 66,
    migration_date: '2025-03-19',
    reason: 'Відновлення після війни',
    distance_km: 468.95
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-19'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-19'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Полтава'})
CREATE (m:Migration {
    id: 'mig_5687',
    person_name: 'Person_504',
    gender: 'Чоловік',
    age: 39,
    migration_date: '2025-02-16',
    reason: 'Сімейні обставини',
    distance_km: 147.81
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-16'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-16'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_1797',
    person_name: 'Person_630',
    gender: 'Жінка',
    age: 29,
    migration_date: '2025-02-16',
    reason: 'Сімейні обставини',
    distance_km: 565.19
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-16'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-16'}]->(to)

MATCH (from:City {name: 'Вінниця'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_2048',
    person_name: 'Person_18',
    gender: 'Чоловік',
    age: 27,
    migration_date: '2025-01-06',
    reason: 'Екологічні причини',
    distance_km: 349.26
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-06'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-06'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_5664',
    person_name: 'Person_645',
    gender: 'Жінка',
    age: 32,
    migration_date: '2025-01-09',
    reason: 'Бізнес',
    distance_km: 774.48
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-09'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-09'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_1418',
    person_name: 'Person_841',
    gender: 'Чоловік',
    age: 54,
    migration_date: '2025-02-15',
    reason: 'Сімейні обставини',
    distance_km: 367.19
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-15'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-15'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_7613',
    person_name: 'Person_397',
    gender: 'Чоловік',
    age: 62,
    migration_date: '2024-12-28',
    reason: 'Сімейні обставини',
    distance_km: 621.95
})
CREATE (from)-[:MIGRATION_TO {date: '2024-12-28'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2024-12-28'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_3854',
    person_name: 'Person_765',
    gender: 'Чоловік',
    age: 49,
    migration_date: '2025-01-27',
    reason: 'Покращення житлових умов',
    distance_km: 130.09
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-27'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-27'}]->(to)

MATCH (from:City {name: 'Вінниця'})
MATCH (to:City {name: 'Харків'})
CREATE (m:Migration {
    id: 'mig_1399',
    person_name: 'Person_272',
    gender: 'Жінка',
    age: 34,
    migration_date: '2025-01-25',
    reason: 'Робота',
    distance_km: 567.04
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-25'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-25'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Полтава'})
CREATE (m:Migration {
    id: 'mig_2932',
    person_name: 'Person_682',
    gender: 'Жінка',
    age: 21,
    migration_date: '2025-01-28',
    reason: 'Бізнес',
    distance_km: 304.13
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-28'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-28'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_4014',
    person_name: 'Person_85',
    gender: 'Чоловік',
    age: 21,
    migration_date: '2025-02-25',
    reason: 'Сімейні обставини',
    distance_km: 468.95
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-25'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-25'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_1706',
    person_name: 'Person_929',
    gender: 'Чоловік',
    age: 51,
    migration_date: '2025-03-23',
    reason: 'Особисті причини',
    distance_km: 817.27
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-23'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-23'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Харків'})
CREATE (m:Migration {
    id: 'mig_1969',
    person_name: 'Person_362',
    gender: 'Жінка',
    age: 50,
    migration_date: '2025-02-07',
    reason: 'Робота',
    distance_km: 129.02
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-07'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-07'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_4315',
    person_name: 'Person_512',
    gender: 'Чоловік',
    age: 29,
    migration_date: '2025-01-21',
    reason: 'Бізнес',
    distance_km: 190.64
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-21'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-21'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_2023',
    person_name: 'Person_282',
    gender: 'Жінка',
    age: 52,
    migration_date: '2025-02-14',
    reason: 'Екологічні причини',
    distance_km: 342.21
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-14'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-14'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_4269',
    person_name: 'Person_107',
    gender: 'Чоловік',
    age: 51,
    migration_date: '2025-01-02',
    reason: 'Покращення житлових умов',
    distance_km: 210.74
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-02'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-02'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m:Migration {
    id: 'mig_9512',
    person_name: 'Person_534',
    gender: 'Жінка',
    age: 40,
    migration_date: '2025-03-21',
    reason: 'Бізнес',
    distance_km: 1027.87
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-21'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-21'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Вінниця'})
CREATE (m:Migration {
    id: 'mig_4120',
    person_name: 'Person_725',
    gender: 'Чоловік',
    age: 35,
    migration_date: '2025-02-20',
    reason: 'Відновлення після війни',
    distance_km: 516.29
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-20'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-20'}]->(to)

MATCH (from:City {name: 'Вінниця'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_6548',
    person_name: 'Person_890',
    gender: 'Чоловік',
    age: 43,
    migration_date: '2025-02-24',
    reason: 'Навчання',
    distance_km: 328.23
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-24'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-24'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m:Migration {
    id: 'mig_6682',
    person_name: 'Person_233',
    gender: 'Жінка',
    age: 34,
    migration_date: '2025-01-18',
    reason: 'Робота',
    distance_km: 199.98
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-18'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-18'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_1041',
    person_name: 'Person_345',
    gender: 'Чоловік',
    age: 49,
    migration_date: '2025-01-08',
    reason: 'Навчання',
    distance_km: 306.35
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-08'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-08'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_9638',
    person_name: 'Person_457',
    gender: 'Чоловік',
    age: 29,
    migration_date: '2025-03-24',
    reason: 'Навчання',
    distance_km: 272.31
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-24'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-24'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Харків'})
CREATE (m:Migration {
    id: 'mig_7188',
    person_name: 'Person_764',
    gender: 'Жінка',
    age: 42,
    migration_date: '2025-01-13',
    reason: 'Навчання',
    distance_km: 410.33
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-13'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-13'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_2711',
    person_name: 'Person_835',
    gender: 'Жінка',
    age: 30,
    migration_date: '2025-02-17',
    reason: 'Особисті причини',
    distance_km: 393.29
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-17'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-17'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_8719',
    person_name: 'Person_649',
    gender: 'Чоловік',
    age: 60,
    migration_date: '2025-01-08',
    reason: 'Відновлення після війни',
    distance_km: 147.81
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-08'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-08'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_6368',
    person_name: 'Person_646',
    gender: 'Жінка',
    age: 66,
    migration_date: '2024-12-31',
    reason: 'Сімейні обставини',
    distance_km: 147.81
})
CREATE (from)-[:MIGRATION_TO {date: '2024-12-31'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2024-12-31'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_9472',
    person_name: 'Person_717',
    gender: 'Чоловік',
    age: 32,
    migration_date: '2025-01-22',
    reason: 'Сімейні обставини',
    distance_km: 447.93
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-22'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-22'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Полтава'})
CREATE (m:Migration {
    id: 'mig_3960',
    person_name: 'Person_348',
    gender: 'Чоловік',
    age: 67,
    migration_date: '2025-02-15',
    reason: 'Покращення житлових умов',
    distance_km: 129.02
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-15'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-15'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_7201',
    person_name: 'Person_728',
    gender: 'Жінка',
    age: 55,
    migration_date: '2025-02-15',
    reason: 'Бізнес',
    distance_km: 147.81
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-15'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-15'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_8633',
    person_name: 'Person_179',
    gender: 'Чоловік',
    age: 46,
    migration_date: '2024-12-31',
    reason: 'Сімейні обставини',
    distance_km: 444.56
})
CREATE (from)-[:MIGRATION_TO {date: '2024-12-31'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2024-12-31'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_6805',
    person_name: 'Person_133',
    gender: 'Чоловік',
    age: 18,
    migration_date: '2025-03-03',
    reason: 'Покращення житлових умов',
    distance_km: 395.21
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-03'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-03'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_3307',
    person_name: 'Person_719',
    gender: 'Чоловік',
    age: 58,
    migration_date: '2025-03-20',
    reason: 'Сімейні обставини',
    distance_km: 441.44
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-20'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-20'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m:Migration {
    id: 'mig_5268',
    person_name: 'Person_930',
    gender: 'Чоловік',
    age: 67,
    migration_date: '2025-01-02',
    reason: 'Покращення житлових умов',
    distance_km: 199.98
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-02'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-02'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_6482',
    person_name: 'Person_277',
    gender: 'Жінка',
    age: 26,
    migration_date: '2025-02-12',
    reason: 'Робота',
    distance_km: 199.98
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-12'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-12'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Харків'})
CREATE (m:Migration {
    id: 'mig_2838',
    person_name: 'Person_468',
    gender: 'Чоловік',
    age: 40,
    migration_date: '2025-03-22',
    reason: 'Робота',
    distance_km: 410.33
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-22'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-22'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Київ'})
CREATE (m:Migration {
    id: 'mig_6453',
    person_name: 'Person_421',
    gender: 'Жінка',
    age: 21,
    migration_date: '2025-02-20',
    reason: 'Бізнес',
    distance_km: 594.92
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-20'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-20'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Вінниця'})
CREATE (m:Migration {
    id: 'mig_5002',
    person_name: 'Person_206',
    gender: 'Чоловік',
    age: 21,
    migration_date: '2025-03-19',
    reason: 'Особисті причини',
    distance_km: 328.23
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-19'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-19'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_7983',
    person_name: 'Person_921',
    gender: 'Чоловік',
    age: 36,
    migration_date: '2025-01-17',
    reason: 'Бізнес',
    distance_km: 199.31
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-17'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-17'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_2060',
    person_name: 'Person_405',
    gender: 'Чоловік',
    age: 28,
    migration_date: '2025-01-07',
    reason: 'Особисті причини',
    distance_km: 210.74
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-07'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-07'}]->(to)

MATCH (from:City {name: 'Вінниця'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_3960',
    person_name: 'Person_557',
    gender: 'Жінка',
    age: 26,
    migration_date: '2025-02-15',
    reason: 'Екологічні причини',
    distance_km: 328.23
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-15'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-15'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_7620',
    person_name: 'Person_887',
    gender: 'Жінка',
    age: 30,
    migration_date: '2025-02-11',
    reason: 'Бізнес',
    distance_km: 844.46
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-11'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-11'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m:Migration {
    id: 'mig_8547',
    person_name: 'Person_445',
    gender: 'Жінка',
    age: 41,
    migration_date: '2025-01-11',
    reason: 'Екологічні причини',
    distance_km: 248.19
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-11'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-11'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Вінниця'})
CREATE (m:Migration {
    id: 'mig_2399',
    person_name: 'Person_642',
    gender: 'Жінка',
    age: 22,
    migration_date: '2025-01-26',
    reason: 'Робота',
    distance_km: 490.12
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-26'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-26'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_5806',
    person_name: 'Person_578',
    gender: 'Чоловік',
    age: 55,
    migration_date: '2025-01-04',
    reason: 'Покращення житлових умов',
    distance_km: 199.31
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-04'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-04'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Харків'})
CREATE (m:Migration {
    id: 'mig_8398',
    person_name: 'Person_219',
    gender: 'Чоловік',
    age: 44,
    migration_date: '2025-02-08',
    reason: 'Особисті причини',
    distance_km: 410.33
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-08'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-08'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_4825',
    person_name: 'Person_349',
    gender: 'Жінка',
    age: 33,
    migration_date: '2025-03-22',
    reason: 'Сімейні обставини',
    distance_km: 875.45
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-22'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-22'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Вінниця'})
CREATE (m:Migration {
    id: 'mig_9503',
    person_name: 'Person_86',
    gender: 'Жінка',
    age: 64,
    migration_date: '2025-02-14',
    reason: 'Бізнес',
    distance_km: 443.09
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-14'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-14'}]->(to)

MATCH (from:City {name: 'Вінниця'})
MATCH (to:City {name: 'Харків'})
CREATE (m:Migration {
    id: 'mig_7053',
    person_name: 'Person_256',
    gender: 'Чоловік',
    age: 55,
    migration_date: '2025-02-01',
    reason: 'Навчання',
    distance_km: 567.04
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-01'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-01'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_8917',
    person_name: 'Person_813',
    gender: 'Чоловік',
    age: 49,
    migration_date: '2025-03-20',
    reason: 'Навчання',
    distance_km: 844.46
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-20'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-20'}]->(to)

MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_5343',
    person_name: 'Person_724',
    gender: 'Жінка',
    age: 40,
    migration_date: '2025-03-08',
    reason: 'Особисті причини',
    distance_km: 621.95
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-08'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-08'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_8320',
    person_name: 'Person_579',
    gender: 'Чоловік',
    age: 33,
    migration_date: '2025-01-21',
    reason: 'Навчання',
    distance_km: 576.11
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-21'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-21'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_2416',
    person_name: 'Person_436',
    gender: 'Чоловік',
    age: 45,
    migration_date: '2025-02-01',
    reason: 'Робота',
    distance_km: 342.21
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-01'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-01'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_9805',
    person_name: 'Person_588',
    gender: 'Чоловік',
    age: 25,
    migration_date: '2025-01-29',
    reason: 'Особисті причини',
    distance_km: 817.27
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-29'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-29'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_1229',
    person_name: 'Person_751',
    gender: 'Чоловік',
    age: 63,
    migration_date: '2025-01-10',
    reason: 'Особисті причини',
    distance_km: 69.94
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-10'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-10'}]->(to)

MATCH (from:City {name: 'Вінниця'})
MATCH (to:City {name: 'Полтава'})
CREATE (m:Migration {
    id: 'mig_6162',
    person_name: 'Person_959',
    gender: 'Жінка',
    age: 26,
    migration_date: '2025-03-13',
    reason: 'Навчання',
    distance_km: 443.09
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-13'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-13'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_5028',
    person_name: 'Person_264',
    gender: 'Жінка',
    age: 31,
    migration_date: '2025-03-20',
    reason: 'Покращення житлових умов',
    distance_km: 367.19
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-20'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-20'}]->(to)

MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m:Migration {
    id: 'mig_2100',
    person_name: 'Person_425',
    gender: 'Жінка',
    age: 46,
    migration_date: '2025-03-12',
    reason: 'Бізнес',
    distance_km: 562.15
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-12'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-12'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Київ'})
CREATE (m:Migration {
    id: 'mig_7702',
    person_name: 'Person_298',
    gender: 'Чоловік',
    age: 70,
    migration_date: '2025-02-12',
    reason: 'Навчання',
    distance_km: 304.13
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-12'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-12'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_7779',
    person_name: 'Person_346',
    gender: 'Жінка',
    age: 20,
    migration_date: '2025-01-26',
    reason: 'Покращення житлових умов',
    distance_km: 444.56
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-26'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-26'}]->(to)

MATCH (from:City {name: 'Вінниця'})
MATCH (to:City {name: 'Харків'})
CREATE (m:Migration {
    id: 'mig_4361',
    person_name: 'Person_15',
    gender: 'Жінка',
    age: 30,
    migration_date: '2025-03-09',
    reason: 'Робота',
    distance_km: 567.04
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-09'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-09'}]->(to)

MATCH (from:City {name: 'Вінниця'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_7067',
    person_name: 'Person_639',
    gender: 'Жінка',
    age: 26,
    migration_date: '2025-02-02',
    reason: 'Робота',
    distance_km: 516.29
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-02'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-02'}]->(to)

MATCH (from:City {name: 'Вінниця'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_9013',
    person_name: 'Person_412',
    gender: 'Чоловік',
    age: 66,
    migration_date: '2025-02-25',
    reason: 'Навчання',
    distance_km: 489.75
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-25'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-25'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_7697',
    person_name: 'Person_217',
    gender: 'Жінка',
    age: 38,
    migration_date: '2025-01-27',
    reason: 'Відновлення після війни',
    distance_km: 576.11
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-27'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-27'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_1094',
    person_name: 'Person_469',
    gender: 'Чоловік',
    age: 66,
    migration_date: '2024-12-29',
    reason: 'Сімейні обставини',
    distance_km: 395.21
})
CREATE (from)-[:MIGRATION_TO {date: '2024-12-29'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2024-12-29'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Вінниця'})
CREATE (m:Migration {
    id: 'mig_8711',
    person_name: 'Person_443',
    gender: 'Чоловік',
    age: 39,
    migration_date: '2025-02-15',
    reason: 'Покращення житлових умов',
    distance_km: 516.29
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-15'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-15'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Полтава'})
CREATE (m:Migration {
    id: 'mig_9521',
    person_name: 'Person_718',
    gender: 'Жінка',
    age: 58,
    migration_date: '2025-02-03',
    reason: 'Покращення житлових умов',
    distance_km: 295.97
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-03'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-03'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_7006',
    person_name: 'Person_872',
    gender: 'Чоловік',
    age: 56,
    migration_date: '2025-01-29',
    reason: 'Сімейні обставини',
    distance_km: 621.95
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-29'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-29'}]->(to)

MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_3162',
    person_name: 'Person_208',
    gender: 'Чоловік',
    age: 60,
    migration_date: '2025-02-16',
    reason: 'Відновлення після війни',
    distance_km: 393.29
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-16'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-16'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Харків'})
CREATE (m:Migration {
    id: 'mig_4954',
    person_name: 'Person_271',
    gender: 'Жінка',
    age: 67,
    migration_date: '2025-02-23',
    reason: 'Покращення житлових умов',
    distance_km: 190.64
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-23'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-23'}]->(to)

MATCH (from:City {name: 'Вінниця'})
MATCH (to:City {name: 'Харків'})
CREATE (m:Migration {
    id: 'mig_9944',
    person_name: 'Person_684',
    gender: 'Жінка',
    age: 53,
    migration_date: '2025-01-04',
    reason: 'Навчання',
    distance_km: 567.04
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-04'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-04'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_5311',
    person_name: 'Person_32',
    gender: 'Жінка',
    age: 28,
    migration_date: '2024-12-30',
    reason: 'Сімейні обставини',
    distance_km: 468.95
})
CREATE (from)-[:MIGRATION_TO {date: '2024-12-30'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2024-12-30'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_5345',
    person_name: 'Person_563',
    gender: 'Чоловік',
    age: 18,
    migration_date: '2025-02-01',
    reason: 'Екологічні причини',
    distance_km: 210.74
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-01'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-01'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_6653',
    person_name: 'Person_292',
    gender: 'Чоловік',
    age: 55,
    migration_date: '2025-01-04',
    reason: 'Навчання',
    distance_km: 441.44
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-04'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-04'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Полтава'})
CREATE (m:Migration {
    id: 'mig_3911',
    person_name: 'Person_629',
    gender: 'Жінка',
    age: 66,
    migration_date: '2025-01-20',
    reason: 'Сімейні обставини',
    distance_km: 758.72
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-20'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-20'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Вінниця'})
CREATE (m:Migration {
    id: 'mig_6345',
    person_name: 'Person_944',
    gender: 'Жінка',
    age: 19,
    migration_date: '2024-12-31',
    reason: 'Навчання',
    distance_km: 700.85
})
CREATE (from)-[:MIGRATION_TO {date: '2024-12-31'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2024-12-31'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Вінниця'})
CREATE (m:Migration {
    id: 'mig_7162',
    person_name: 'Person_820',
    gender: 'Жінка',
    age: 42,
    migration_date: '2025-03-07',
    reason: 'Навчання',
    distance_km: 328.23
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-07'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-07'}]->(to)

MATCH (from:City {name: 'Запоріжжя'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_9840',
    person_name: 'Person_533',
    gender: 'Жінка',
    age: 47,
    migration_date: '2025-02-06',
    reason: 'Робота',
    distance_km: 69.94
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-06'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-06'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_3024',
    person_name: 'Person_771',
    gender: 'Жінка',
    age: 55,
    migration_date: '2025-02-27',
    reason: 'Покращення житлових умов',
    distance_km: 468.95
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-27'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-27'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_7712',
    person_name: 'Person_62',
    gender: 'Чоловік',
    age: 38,
    migration_date: '2025-01-13',
    reason: 'Відновлення після війни',
    distance_km: 272.31
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-13'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-13'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Полтава'})
CREATE (m:Migration {
    id: 'mig_1083',
    person_name: 'Person_196',
    gender: 'Жінка',
    age: 19,
    migration_date: '2025-01-24',
    reason: 'Покращення житлових умов',
    distance_km: 129.02
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-24'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-24'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_3827',
    person_name: 'Person_879',
    gender: 'Чоловік',
    age: 18,
    migration_date: '2025-02-07',
    reason: 'Покращення житлових умов',
    distance_km: 199.98
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-07'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-07'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_3780',
    person_name: 'Person_152',
    gender: 'Чоловік',
    age: 38,
    migration_date: '2025-01-06',
    reason: 'Сімейні обставини',
    distance_km: 758.72
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-06'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-06'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Київ'})
CREATE (m:Migration {
    id: 'mig_5608',
    person_name: 'Person_128',
    gender: 'Жінка',
    age: 48,
    migration_date: '2025-03-06',
    reason: 'Робота',
    distance_km: 594.92
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-06'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-06'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_3625',
    person_name: 'Person_834',
    gender: 'Жінка',
    age: 47,
    migration_date: '2025-01-09',
    reason: 'Відновлення після війни',
    distance_km: 342.21
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-09'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-09'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_5848',
    person_name: 'Person_96',
    gender: 'Чоловік',
    age: 23,
    migration_date: '2025-02-03',
    reason: 'Бізнес',
    distance_km: 143.83
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-03'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-03'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_9471',
    person_name: 'Person_319',
    gender: 'Чоловік',
    age: 69,
    migration_date: '2025-02-06',
    reason: 'Екологічні причини',
    distance_km: 844.46
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-06'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-06'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_5311',
    person_name: 'Person_964',
    gender: 'Чоловік',
    age: 59,
    migration_date: '2025-03-10',
    reason: 'Екологічні причини',
    distance_km: 621.95
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-10'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-10'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Львів'})
CREATE (m:Migration {
    id: 'mig_1813',
    person_name: 'Person_125',
    gender: 'Жінка',
    age: 25,
    migration_date: '2025-01-12',
    reason: 'Екологічні причини',
    distance_km: 758.72
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-12'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-12'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_1786',
    person_name: 'Person_20',
    gender: 'Чоловік',
    age: 30,
    migration_date: '2025-03-09',
    reason: 'Покращення житлових умов',
    distance_km: 395.21
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-09'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-09'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Полтава'})
CREATE (m:Migration {
    id: 'mig_6108',
    person_name: 'Person_961',
    gender: 'Жінка',
    age: 58,
    migration_date: '2025-01-04',
    reason: 'Сімейні обставини',
    distance_km: 130.09
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-04'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-04'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_4594',
    person_name: 'Person_987',
    gender: 'Чоловік',
    age: 22,
    migration_date: '2025-01-21',
    reason: 'Покращення житлових умов',
    distance_km: 817.27
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-21'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-21'}]->(to)

MATCH (from:City {name: 'Суми'})
MATCH (to:City {name: 'Полтава'})
CREATE (m:Migration {
    id: 'mig_5550',
    person_name: 'Person_692',
    gender: 'Жінка',
    age: 47,
    migration_date: '2025-01-13',
    reason: 'Навчання',
    distance_km: 147.81
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-13'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-13'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m:Migration {
    id: 'mig_3469',
    person_name: 'Person_216',
    gender: 'Жінка',
    age: 24,
    migration_date: '2025-03-24',
    reason: 'Навчання',
    distance_km: 817.27
})
CREATE (from)-[:MIGRATION_TO {date: '2025-03-24'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-03-24'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Донецьк'})
CREATE (m:Migration {
    id: 'mig_3111',
    person_name: 'Person_893',
    gender: 'Жінка',
    age: 38,
    migration_date: '2025-02-28',
    reason: 'Екологічні причини',
    distance_km: 594.92
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-28'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-28'}]->(to)

MATCH (from:City {name: 'Донецьк'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_9692',
    person_name: 'Person_741',
    gender: 'Жінка',
    age: 61,
    migration_date: '2025-01-02',
    reason: 'Бізнес',
    distance_km: 199.98
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-02'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-02'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Полтава'})
CREATE (m:Migration {
    id: 'mig_1588',
    person_name: 'Person_485',
    gender: 'Чоловік',
    age: 18,
    migration_date: '2025-01-21',
    reason: 'Відновлення після війни',
    distance_km: 758.72
})
CREATE (from)-[:MIGRATION_TO {date: '2025-01-21'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-01-21'}]->(to)

MATCH (from:City {name: 'Львів'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_8351',
    person_name: 'Person_847',
    gender: 'Чоловік',
    age: 32,
    migration_date: '2025-02-02',
    reason: 'Навчання',
    distance_km: 844.46
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-02'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-02'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Одеса'})
CREATE (m:Migration {
    id: 'mig_5456',
    person_name: 'Person_414',
    gender: 'Чоловік',
    age: 69,
    migration_date: '2025-02-19',
    reason: 'Відновлення після війни',
    distance_km: 393.29
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-19'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-19'}]->(to)

MATCH (from:City {name: 'Полтава'})
MATCH (to:City {name: 'Суми'})
CREATE (m:Migration {
    id: 'mig_9691',
    person_name: 'Person_77',
    gender: 'Чоловік',
    age: 43,
    migration_date: '2025-02-08',
    reason: 'Сімейні обставини',
    distance_km: 147.81
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-08'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-08'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m:Migration {
    id: 'mig_8393',
    person_name: 'Person_273',
    gender: 'Жінка',
    age: 53,
    migration_date: '2025-02-28',
    reason: 'Покращення житлових умов',
    distance_km: 69.94
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-28'}]->(m)
CREATE (m)-[:MIGRATION_TO {date: '2025-02-28'}]->(to)

MATCH (from:City {name: 'Київ'})
MATCH (to:City {name: 'Дніпро'})
CREATE (m1:Migration {
    id: 'mig_8391',
    person_name: 'Person_271',
    gender: 'Чоловік',
    age: 45,
    migration_date: '2025-02-15',
    reason: 'Робота',
    distance_km: 478.23
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-15'}]->(m1)
CREATE (m1)-[:MIGRATION_TO {date: '2025-02-15'}]->(to)

MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Одеса'})
CREATE (m2:Migration {
    id: 'mig_8392',
    person_name: 'Person_272',
    gender: 'Жінка',
    age: 31,
    migration_date: '2025-02-08',
    reason: 'Сімейні обставини',
    distance_km: 147.81
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-08'}]->(m2)
CREATE (m2)-[:MIGRATION_TO {date: '2025-02-08'}]->(to)

MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Запоріжжя'})
CREATE (m3:Migration {
    id: 'mig_8393',
    person_name: 'Person_273',
    gender: 'Жінка',
    age: 53,
    migration_date: '2025-02-28',
    reason: 'Покращення житлових умов',
    distance_km: 69.94
})
CREATE (from)-[:MIGRATION_TO {date: '2025-02-28'}]->(m3)
CREATE (m3)-[:MIGRATION_TO {date: '2025-02-28'}]->(to)
