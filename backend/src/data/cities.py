"""Дані про українські міста та інші константи для генерації даних"""

CITIES = [
    {
        "name": "Київ",
        "region": "Київська область",
        "population": 2967360,
        "latitude": 50.4501,
        "longitude": 30.5234
    },
    {
        "name": "Харків",
        "region": "Харківська область",
        "population": 1443207,
        "latitude": 49.9935,
        "longitude": 36.2304
    },
    {
        "name": "Одеса",
        "region": "Одеська область",
        "population": 1017699,
        "latitude": 46.4825,
        "longitude": 30.7233
    },
    {
        "name": "Дніпро",
        "region": "Дніпропетровська область",
        "population": 990724,
        "latitude": 48.4647,
        "longitude": 35.0462
    },
    {
        "name": "Запоріжжя",
        "region": "Запорізька область",
        "population": 731922,
        "latitude": 47.8388,
        "longitude": 35.1396
    },
    {
        "name": "Львів",
        "region": "Львівська область",
        "population": 721301,
        "latitude": 49.8397,
        "longitude": 24.0297
    },
    {
        "name": "Вінниця",
        "region": "Вінницька область",
        "population": 370707,
        "latitude": 49.2331,
        "longitude": 28.4682
    },
    {
        "name": "Полтава",
        "region": "Полтавська область",
        "population": 283402,
        "latitude": 49.5883,
        "longitude": 34.5514
    },
    {
        "name": "Чернігів",
        "region": "Чернігівська область",
        "population": 285234,
        "latitude": 51.4982,
        "longitude": 31.2893
    },
    {
        "name": "Черкаси",
        "region": "Черкаська область",
        "population": 273360,
        "latitude": 49.4444,
        "longitude": 32.0598
    },
    {
        "name": "Житомир",
        "region": "Житомирська область",
        "population": 264318,
        "latitude": 50.2649,
        "longitude": 28.6767
    },
    {
        "name": "Суми",
        "region": "Сумська область",
        "population": 259660,
        "latitude": 50.9077,
        "longitude": 34.7981
    },
    {
        "name": "Хмельницький",
        "region": "Хмельницька область",
        "population": 273713,
        "latitude": 49.4229,
        "longitude": 26.9873
    },
    {
        "name": "Чернівці",
        "region": "Чернівецька область",
        "population": 265471,
        "latitude": 48.2921,
        "longitude": 25.9358
    },
    {
        "name": "Рівне",
        "region": "Рівненська область",
        "population": 245289,
        "latitude": 50.6199,
        "longitude": 26.2516
    },
    {
        "name": "Івано-Франківськ",
        "region": "Івано-Франківська область",
        "population": 237686,
        "latitude": 48.9226,
        "longitude": 24.7111
    },
    {
        "name": "Тернопіль",
        "region": "Тернопільська область",
        "population": 225238,
        "latitude": 49.5535,
        "longitude": 25.5948
    },
    {
        "name": "Луцьк",
        "region": "Волинська область",
        "population": 217315,
        "latitude": 50.7472,
        "longitude": 25.3254
    },
    {
        "name": "Ужгород",
        "region": "Закарпатська область",
        "population": 115512,
        "latitude": 48.6208,
        "longitude": 22.2879
    },
    # Районні центри
    {
        "name": "Сміла",
        "region": "Черкаська область",
        "population": 68000,
        "latitude": 49.2222,
        "longitude": 31.8889
    },
    {
        "name": "Шостка",
        "region": "Сумська область",
        "population": 75000,
        "latitude": 51.8667,
        "longitude": 33.4833
    },
    {
        "name": "Ніжин",
        "region": "Чернігівська область",
        "population": 72000,
        "latitude": 51.0500,
        "longitude": 31.8833
    },
    {
        "name": "Коростень",
        "region": "Житомирська область",
        "population": 65000,
        "latitude": 50.9500,
        "longitude": 28.6500
    },
    {
        "name": "Бердичів",
        "region": "Житомирська область",
        "population": 78000,
        "latitude": 49.9000,
        "longitude": 28.5667
    },
    {
        "name": "Кременчук",
        "region": "Полтавська область",
        "population": 220000,
        "latitude": 49.0667,
        "longitude": 33.4167
    },
    {
        "name": "Кам'янець-Подільський",
        "region": "Хмельницька область",
        "population": 100000,
        "latitude": 48.6833,
        "longitude": 26.5833
    },
    {
        "name": "Новоград-Волинський",
        "region": "Житомирська область",
        "population": 56000,
        "latitude": 50.5833,
        "longitude": 27.6333
    },
    {
        "name": "Коростишів",
        "region": "Житомирська область",
        "population": 25000,
        "latitude": 50.3167,
        "longitude": 29.0500
    },
    {
        "name": "Малин",
        "region": "Житомирська область",
        "population": 28000,
        "latitude": 50.7667,
        "longitude": 29.2500
    },
    {
        "name": "Овруч",
        "region": "Житомирська область",
        "population": 16000,
        "latitude": 51.3167,
        "longitude": 28.8000
    },
    {
        "name": "Звягель",
        "region": "Житомирська область",
        "population": 55000,
        "latitude": 50.5833,
        "longitude": 27.6333
    },
    {
        "name": "Біла Церква",
        "region": "Київська область",
        "population": 210000,
        "latitude": 49.8000,
        "longitude": 30.1167
    },
    {
        "name": "Бориспіль",
        "region": "Київська область",
        "population": 63000,
        "latitude": 50.3500,
        "longitude": 30.9500
    },
    {
        "name": "Бровари",
        "region": "Київська область",
        "population": 110000,
        "latitude": 50.5167,
        "longitude": 30.8000
    },
    {
        "name": "Фастів",
        "region": "Київська область",
        "population": 45000,
        "latitude": 50.0833,
        "longitude": 29.9167
    },
    {
        "name": "Ірпінь",
        "region": "Київська область",
        "population": 60000,
        "latitude": 50.5167,
        "longitude": 30.2500
    },
    {
        "name": "Васильків",
        "region": "Київська область",
        "population": 38000,
        "latitude": 50.1833,
        "longitude": 30.3167
    },
    # Додаткові районні центри
    {
        "name": "Бершадь",
        "region": "Вінницька область",
        "population": 13000,
        "latitude": 48.3667,
        "longitude": 29.5333
    },
    {
        "name": "Гайсин",
        "region": "Вінницька область",
        "population": 25000,
        "latitude": 48.8000,
        "longitude": 29.3833
    },
    {
        "name": "Жмеринка",
        "region": "Вінницька область",
        "population": 35000,
        "latitude": 49.0333,
        "longitude": 28.1000
    },
    {
        "name": "Могилів-Подільський",
        "region": "Вінницька область",
        "population": 32000,
        "latitude": 48.4500,
        "longitude": 27.8000
    },
    {
        "name": "Тульчин",
        "region": "Вінницька область",
        "population": 15000,
        "latitude": 48.6667,
        "longitude": 28.8500
    },
    {
        "name": "Хмільник",
        "region": "Вінницька область",
        "population": 28000,
        "latitude": 49.5500,
        "longitude": 27.9500
    },
    {
        "name": "Бар",
        "region": "Вінницька область",
        "population": 16000,
        "latitude": 49.0667,
        "longitude": 27.6667
    },
    {
        "name": "Ладижин",
        "region": "Вінницька область",
        "population": 22000,
        "latitude": 48.6667,
        "longitude": 29.2333
    },
    {
        "name": "Калинівка",
        "region": "Вінницька область",
        "population": 19000,
        "latitude": 49.4500,
        "longitude": 28.5167
    },
    {
        "name": "Козятин",
        "region": "Вінницька область",
        "population": 25000,
        "latitude": 49.7167,
        "longitude": 28.8333
    },
    {
        "name": "Літин",
        "region": "Вінницька область",
        "population": 7000,
        "latitude": 49.3333,
        "longitude": 28.0833
    },
    {
        "name": "Немирів",
        "region": "Вінницька область",
        "population": 12000,
        "latitude": 48.9667,
        "longitude": 28.8333
    },
    {
        "name": "Погребище",
        "region": "Вінницька область",
        "population": 10000,
        "latitude": 49.4833,
        "longitude": 29.2667
    },
    {
        "name": "Шаргород",
        "region": "Вінницька область",
        "population": 7000,
        "latitude": 48.7500,
        "longitude": 28.0833
    },
    {
        "name": "Ямпіль",
        "region": "Вінницька область",
        "population": 11000,
        "latitude": 48.2500,
        "longitude": 28.2833
    },
    {
        "name": "Радомишль",
        "region": "Житомирська область",
        "population": 15000,
        "latitude": 50.5000,
        "longitude": 29.2333
    },
    {
        "name": "Чуднів",
        "region": "Житомирська область",
        "population": 6000,
        "latitude": 50.0500,
        "longitude": 28.1167
    },
    {
        "name": "Андрушівка",
        "region": "Житомирська область",
        "population": 9000,
        "latitude": 50.0167,
        "longitude": 29.0167
    },
    {
        "name": "Брусилів",
        "region": "Житомирська область",
        "population": 5000,
        "latitude": 50.2833,
        "longitude": 29.5333
    },
    {
        "name": "Черняхів",
        "region": "Житомирська область",
        "population": 10000,
        "latitude": 50.4500,
        "longitude": 28.6667
    },
    {
        "name": "Романів",
        "region": "Житомирська область",
        "population": 8000,
        "latitude": 50.1500,
        "longitude": 27.9333
    },
    {
        "name": "Любар",
        "region": "Житомирська область",
        "population": 2200,
        "latitude": 49.9167,
        "longitude": 27.7500
    },
    {
        "name": "Ємільчине",
        "region": "Житомирська область",
        "population": 5000,
        "latitude": 50.8667,
        "longitude": 27.8000
    },
    {
        "name": "Народичі",
        "region": "Житомирська область",
        "population": 3000,
        "latitude": 51.2000,
        "longitude": 29.0833
    },
    {
        "name": "Олевськ",
        "region": "Житомирська область",
        "population": 10000,
        "latitude": 51.2167,
        "longitude": 27.6500
    },
    {
        "name": "Вишгород",
        "region": "Київська область",
        "population": 30000,
        "latitude": 50.5833,
        "longitude": 30.5000
    },
    {
        "name": "Вишневе",
        "region": "Київська область",
        "population": 40000,
        "latitude": 50.3833,
        "longitude": 30.3667
    },
    {
        "name": "Обухів",
        "region": "Київська область",
        "population": 33000,
        "latitude": 50.1000,
        "longitude": 30.6333
    },
    {
        "name": "Переяслав",
        "region": "Київська область",
        "population": 28000,
        "latitude": 50.0667,
        "longitude": 31.4500
    },
    {
        "name": "Прип'ять",
        "region": "Київська область",
        "population": 0,
        "latitude": 51.4000,
        "longitude": 30.0500
    },
    {
        "name": "Ржищів",
        "region": "Київська область",
        "population": 8000,
        "latitude": 49.9667,
        "longitude": 31.0333
    },
    {
        "name": "Славутич",
        "region": "Київська область",
        "population": 25000,
        "latitude": 51.5167,
        "longitude": 30.7500
    },
    {
        "name": "Тараща",
        "region": "Київська область",
        "population": 11000,
        "latitude": 49.5500,
        "longitude": 30.5000
    },
    {
        "name": "Тетіїв",
        "region": "Київська область",
        "population": 13000,
        "latitude": 49.3667,
        "longitude": 29.6833
    },
    {
        "name": "Узин",
        "region": "Київська область",
        "population": 12000,
        "latitude": 49.8167,
        "longitude": 30.4333
    },
    {
        "name": "Українка",
        "region": "Київська область",
        "population": 16000,
        "latitude": 50.1500,
        "longitude": 30.7500
    },
    {
        "name": "Яготин",
        "region": "Київська область",
        "population": 20000,
        "latitude": 50.2500,
        "longitude": 31.7833
    },
    # Додаткові районні центри по 3 для кожної області
    # Дніпропетровська область
    {
        "name": "Нікополь",
        "region": "Дніпропетровська область",
        "population": 120000,
        "latitude": 47.5667,
        "longitude": 34.4000
    },
    {
        "name": "Павлоград",
        "region": "Дніпропетровська область",
        "population": 110000,
        "latitude": 48.5167,
        "longitude": 35.8667
    },
    {
        "name": "Новомосковськ",
        "region": "Дніпропетровська область",
        "population": 70000,
        "latitude": 48.6333,
        "longitude": 35.2167
    },
    # Донецька область
    {
        "name": "Маріуполь",
        "region": "Донецька область",
        "population": 450000,
        "latitude": 47.1333,
        "longitude": 37.5500
    },
    {
        "name": "Краматорськ",
        "region": "Донецька область",
        "population": 160000,
        "latitude": 48.7333,
        "longitude": 37.5833
    },
    {
        "name": "Слов'янськ",
        "region": "Донецька область",
        "population": 115000,
        "latitude": 48.8667,
        "longitude": 37.6167
    },
    # Запорізька область
    {
        "name": "Мелітополь",
        "region": "Запорізька область",
        "population": 150000,
        "latitude": 46.8500,
        "longitude": 35.3667
    },
    {
        "name": "Бердянськ",
        "region": "Запорізька область",
        "population": 110000,
        "latitude": 46.7667,
        "longitude": 36.7833
    },
    {
        "name": "Енергодар",
        "region": "Запорізька область",
        "population": 55000,
        "latitude": 47.5000,
        "longitude": 34.6500
    },
    # Івано-Франківська область
    {
        "name": "Коломия",
        "region": "Івано-Франківська область",
        "population": 61000,
        "latitude": 48.5333,
        "longitude": 25.0333
    },
    {
        "name": "Калуш",
        "region": "Івано-Франківська область",
        "population": 67000,
        "latitude": 49.0167,
        "longitude": 24.3667
    },
    {
        "name": "Долина",
        "region": "Івано-Франківська область",
        "population": 20000,
        "latitude": 48.9667,
        "longitude": 24.0167
    },
    # Кіровоградська область
    {
        "name": "Олександрія",
        "region": "Кіровоградська область",
        "population": 82000,
        "latitude": 48.6667,
        "longitude": 33.1167
    },
    {
        "name": "Світловодськ",
        "region": "Кіровоградська область",
        "population": 45000,
        "latitude": 49.0833,
        "longitude": 33.2500
    },
    {
        "name": "Знам'янка",
        "region": "Кіровоградська область",
        "population": 23000,
        "latitude": 48.7167,
        "longitude": 32.6667
    },
    # Луганська область
    {
        "name": "Сєвєродонецьк",
        "region": "Луганська область",
        "population": 100000,
        "latitude": 48.9500,
        "longitude": 38.5000
    },
    {
        "name": "Лисичанськ",
        "region": "Луганська область",
        "population": 95000,
        "latitude": 48.9167,
        "longitude": 38.4167
    },
    {
        "name": "Рубіжне",
        "region": "Луганська область",
        "population": 60000,
        "latitude": 49.0167,
        "longitude": 38.3667
    },
    # Львівська область
    {
        "name": "Дрогобич",
        "region": "Львівська область",
        "population": 75000,
        "latitude": 49.3500,
        "longitude": 23.5000
    },
    {
        "name": "Стрий",
        "region": "Львівська область",
        "population": 60000,
        "latitude": 49.2500,
        "longitude": 23.8500
    },
    {
        "name": "Червоноград",
        "region": "Львівська область",
        "population": 67000,
        "latitude": 50.3833,
        "longitude": 24.2333
    },
    # Миколаївська область
    {
        "name": "Первомайськ",
        "region": "Миколаївська область",
        "population": 65000,
        "latitude": 48.0500,
        "longitude": 30.8500
    },
    {
        "name": "Вознесенськ",
        "region": "Миколаївська область",
        "population": 35000,
        "latitude": 47.5667,
        "longitude": 31.3333
    },
    {
        "name": "Южноукраїнськ",
        "region": "Миколаївська область",
        "population": 40000,
        "latitude": 47.8167,
        "longitude": 31.1833
    },
    # Одеська область
    {
        "name": "Ізмаїл",
        "region": "Одеська область",
        "population": 72000,
        "latitude": 45.3500,
        "longitude": 28.8333
    },
    {
        "name": "Білгород-Дністровський",
        "region": "Одеська область",
        "population": 50000,
        "latitude": 46.1833,
        "longitude": 30.3333
    },
    {
        "name": "Подільськ",
        "region": "Одеська область",
        "population": 40000,
        "latitude": 47.7500,
        "longitude": 29.5333
    },
    # Полтавська область
    {
        "name": "Кременчук",
        "region": "Полтавська область",
        "population": 220000,
        "latitude": 49.0667,
        "longitude": 33.4167
    },
    {
        "name": "Лубни",
        "region": "Полтавська область",
        "population": 47000,
        "latitude": 50.0167,
        "longitude": 33.0000
    },
    {
        "name": "Миргород",
        "region": "Полтавська область",
        "population": 40000,
        "latitude": 49.9667,
        "longitude": 33.6000
    },
    # Рівненська область
    {
        "name": "Дубно",
        "region": "Рівненська область",
        "population": 38000,
        "latitude": 50.4000,
        "longitude": 25.7333
    },
    {
        "name": "Костопіль",
        "region": "Рівненська область",
        "population": 30000,
        "latitude": 50.8833,
        "longitude": 26.4500
    },
    {
        "name": "Сарни",
        "region": "Рівненська область",
        "population": 28000,
        "latitude": 51.3333,
        "longitude": 26.6000
    },
    # Сумська область
    {
        "name": "Конотоп",
        "region": "Сумська область",
        "population": 88000,
        "latitude": 51.2333,
        "longitude": 33.2000
    },
    {
        "name": "Ромни",
        "region": "Сумська область",
        "population": 42000,
        "latitude": 50.7500,
        "longitude": 33.4667
    },
    {
        "name": "Охтирка",
        "region": "Сумська область",
        "population": 48000,
        "latitude": 50.3000,
        "longitude": 34.9000
    },
    # Тернопільська область
    {
        "name": "Чортків",
        "region": "Тернопільська область",
        "population": 29000,
        "latitude": 49.0167,
        "longitude": 25.8000
    },
    {
        "name": "Бережани",
        "region": "Тернопільська область",
        "population": 17000,
        "latitude": 49.4500,
        "longitude": 24.9333
    },
    {
        "name": "Збараж",
        "region": "Тернопільська область",
        "population": 14000,
        "latitude": 49.6667,
        "longitude": 25.7667
    },
    # Харківська область
    {
        "name": "Ізюм",
        "region": "Харківська область",
        "population": 45000,
        "latitude": 49.2167,
        "longitude": 37.2833
    },
    {
        "name": "Лозова",
        "region": "Харківська область",
        "population": 65000,
        "latitude": 48.8833,
        "longitude": 36.3167
    },
    {
        "name": "Чугуїв",
        "region": "Харківська область",
        "population": 32000,
        "latitude": 49.8333,
        "longitude": 36.6833
    },
    # Херсонська область
    {
        "name": "Нова Каховка",
        "region": "Херсонська область",
        "population": 45000,
        "latitude": 46.7500,
        "longitude": 33.3667
    },
    {
        "name": "Каховка",
        "region": "Херсонська область",
        "population": 35000,
        "latitude": 46.8000,
        "longitude": 33.4833
    },
    {
        "name": "Генічеськ",
        "region": "Херсонська область",
        "population": 20000,
        "latitude": 46.1833,
        "longitude": 34.8000
    },
    # Хмельницька область
    {
        "name": "Шепетівка",
        "region": "Хмельницька область",
        "population": 40000,
        "latitude": 50.1833,
        "longitude": 27.0667
    },
    {
        "name": "Нетішин",
        "region": "Хмельницька область",
        "population": 35000,
        "latitude": 50.3333,
        "longitude": 26.6500
    },
    {
        "name": "Старокостянтинів",
        "region": "Хмельницька область",
        "population": 34000,
        "latitude": 49.7500,
        "longitude": 27.2167
    },
    # Черкаська область
    {
        "name": "Умань",
        "region": "Черкаська область",
        "population": 85000,
        "latitude": 48.7500,
        "longitude": 30.2167
    },
    {
        "name": "Золотоноша",
        "region": "Черкаська область",
        "population": 28000,
        "latitude": 49.6667,
        "longitude": 32.0333
    },
    {
        "name": "Канів",
        "region": "Черкаська область",
        "population": 26000,
        "latitude": 49.7500,
        "longitude": 31.4667
    },
    # Чернівецька область
    {
        "name": "Сторожинець",
        "region": "Чернівецька область",
        "population": 14000,
        "latitude": 48.1667,
        "longitude": 25.7167
    },
    {
        "name": "Новодністровськ",
        "region": "Чернівецька область",
        "population": 10000,
        "latitude": 48.5833,
        "longitude": 27.4333
    },
    {
        "name": "Хотин",
        "region": "Чернівецька область",
        "population": 9000,
        "latitude": 48.5000,
        "longitude": 26.5000
    },
    # Чернігівська область
    {
        "name": "Прилуки",
        "region": "Чернігівська область",
        "population": 58000,
        "latitude": 50.6000,
        "longitude": 32.4000
    },
    {
        "name": "Новгород-Сіверський",
        "region": "Чернігівська область",
        "population": 13000,
        "latitude": 52.0000,
        "longitude": 33.2500
    },
    {
        "name": "Бахмач",
        "region": "Чернігівська область",
        "population": 11000,
        "latitude": 51.1833,
        "longitude": 32.8333
    }
]

MIGRATION_REASONS = [
    "Робота",
    "Навчання",
    "Сімейні обставини",
    "Безпека",
    "Покращення умов життя",
    "Медичні причини",
    "Возз'єднання сім'ї",
    "Економічні причини",
    "Екологічні причини",
    "Зміна клімату"
]

TRANSPORT_TYPES = [
    "Автомобіль",
    "Автобус",
    "Поїзд",
    "Літак",
    "Інше"
]

HOUSING_TYPES = [
    "Квартира",
    "Будинок",
    "Гуртожиток",
    "Оренда кімнати",
    "Тимчасове житло"
]

EDUCATION_LEVELS = [
    "Середня",
    "Професійно-технічна",
    "Бакалавр",
    "Магістр",
    "Кандидат наук",
    "Доктор наук"
]

OCCUPATIONS = [
    "IT-спеціаліст",
    "Менеджер",
    "Вчитель",
    "Медичний працівник",
    "Інженер",
    "Продавець",
    "Студент",
    "Робітник",
    "Підприємець",
    "Водій",
    "Бухгалтер",
    "Юрист",
    "Військовослужбовець",
    "Державний службовець",
    "Пенсіонер",
    "Безробітний"
]

MARITAL_STATUSES = [
    "Неодружений/Незаміжня",
    "Одружений/Заміжня",
    "Розлучений/Розлучена",
    "Вдівець/Вдова"
] 