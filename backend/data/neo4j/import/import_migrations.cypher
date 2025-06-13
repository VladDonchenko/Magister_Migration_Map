// Создание людей
CREATE (p1:Person {id: 'mig_1', first_name: 'Іван', last_name: 'Петренко', gender: 'Чоловіча', age: 25});
CREATE (p2:Person {id: 'mig_2', first_name: 'Марія', last_name: 'Коваленко', gender: 'Жіноча', age: 30});
CREATE (p3:Person {id: 'mig_3', first_name: 'Олег', last_name: 'Сидоренко', gender: 'Чоловіча', age: 35});

// Создание связей миграции
MATCH (p:Person {id: 'mig_1'})
MATCH (from:City {name: 'Харків'})
MATCH (to:City {name: 'Київ'})
CREATE (p)-[:MIGRATES_FROM]->(from)
CREATE (p)-[:MIGRATES_TO]->(to);

MATCH (p:Person {id: 'mig_2'})
MATCH (from:City {name: 'Одеса'})
MATCH (to:City {name: 'Львів'})
CREATE (p)-[:MIGRATES_FROM]->(from)
CREATE (p)-[:MIGRATES_TO]->(to);

MATCH (p:Person {id: 'mig_3'})
MATCH (from:City {name: 'Дніпро'})
MATCH (to:City {name: 'Київ'})
CREATE (p)-[:MIGRATES_FROM]->(from)
CREATE (p)-[:MIGRATES_TO]->(to); 