// Создаем города
CREATE (kyiv:Location {name: 'Киев', latitude: 50.4501, longitude: 30.5234, region: 'Киевская область'})
CREATE (lviv:Location {name: 'Львов', latitude: 49.8397, longitude: 24.0297, region: 'Львовская область'})
CREATE (odesa:Location {name: 'Одесса', latitude: 46.4825, longitude: 30.7233, region: 'Одесская область'})
CREATE (kharkiv:Location {name: 'Харьков', latitude: 49.9935, longitude: 36.2304, region: 'Харьковская область'})
CREATE (dnipro:Location {name: 'Днепр', latitude: 48.4647, longitude: 35.0462, region: 'Днепропетровская область'})

// Создаем людей и миграции
CREATE (p1:Person {first_name: 'Иван', last_name: 'Петренко', age: 25, gender: 'male'})
CREATE (p1)-[:MIGRATES_FROM {reason: 'Работа', transport_type: 'Поезд', housing_type: 'Аренда'}]->(kyiv)
CREATE (p1)-[:MIGRATES_TO {reason: 'Работа', transport_type: 'Поезд', housing_type: 'Аренда'}]->(lviv)

CREATE (p2:Person {first_name: 'Мария', last_name: 'Коваленко', age: 30, gender: 'female'})
CREATE (p2)-[:MIGRATES_FROM {reason: 'Образование', transport_type: 'Автобус', housing_type: 'Общежитие'}]->(odesa)
CREATE (p2)-[:MIGRATES_TO {reason: 'Образование', transport_type: 'Автобус', housing_type: 'Общежитие'}]->(kyiv)

CREATE (p3:Person {first_name: 'Александр', last_name: 'Сидоренко', age: 35, gender: 'male'})
CREATE (p3)-[:MIGRATES_FROM {reason: 'Семья', transport_type: 'Автомобиль', housing_type: 'Собственное жилье'}]->(kharkiv)
CREATE (p3)-[:MIGRATES_TO {reason: 'Семья', transport_type: 'Автомобиль', housing_type: 'Собственное жилье'}]->(dnipro)

CREATE (p4:Person {first_name: 'Елена', last_name: 'Мельник', age: 28, gender: 'female'})
CREATE (p4)-[:MIGRATES_FROM {reason: 'Работа', transport_type: 'Поезд', housing_type: 'Аренда'}]->(dnipro)
CREATE (p4)-[:MIGRATES_TO {reason: 'Работа', transport_type: 'Поезд', housing_type: 'Аренда'}]->(kyiv)

CREATE (p5:Person {first_name: 'Павел', last_name: 'Шевченко', age: 40, gender: 'male'})
CREATE (p5)-[:MIGRATES_FROM {reason: 'Бизнес', transport_type: 'Самолет', housing_type: 'Аренда'}]->(lviv)
CREATE (p5)-[:MIGRATES_TO {reason: 'Бизнес', transport_type: 'Самолет', housing_type: 'Аренда'}]->(odesa) 