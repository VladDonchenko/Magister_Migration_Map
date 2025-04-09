# Migration Map

Веб-приложение для визуализации и анализа миграционных потоков в Украине.

## Описание

Migration Map - это интерактивное веб-приложение, которое позволяет визуализировать и анализировать миграционные потоки между городами Украины. Приложение предоставляет следующие возможности:

- Интерактивная карта с отображением городов и миграционных потоков
- Статистика миграции по городам
- Анализ причин миграции
- Демографическая статистика мигрантов
- Визуализация направлений миграционных потоков

## Технологии

### Backend
- Python 3.11+
- FastAPI
- Neo4j (графовая база данных)
- Docker

### Frontend
- React
- TypeScript
- Material-UI
- Leaflet (для интерактивных карт)

## Установка и запуск

### Предварительные требования
- Docker и Docker Compose
- Node.js 18+
- Python 3.11+

### Запуск с помощью Docker

1. Клонируйте репозиторий:
```bash
git clone https://github.com/yourusername/migration-map.git
cd migration-map
```

2. Запустите приложение с помощью Docker Compose:
```bash
docker-compose up -d
```

Приложение будет доступно по адресу: http://localhost:3000

### Ручная установка

1. Клонируйте репозиторий:
```bash
git clone https://github.com/yourusername/migration-map.git
cd migration-map
```

2. Установите зависимости backend:
```bash
cd backend
python -m venv venv
source venv/bin/activate  # для Linux/Mac
# или
.env\Scriptsctivate  # для Windows
pip install -r requirements.txt
```

3. Установите зависимости frontend:
```bash
cd frontend
npm install
```

4. Запустите Neo4j:
```bash
docker-compose up -d neo4j
```

5. Запустите backend:
```bash
cd backend
uvicorn src.main:app --reload
```

6. Запустите frontend:
```bash
cd frontend
npm start
```

## Структура проекта

```
migration-map/
├── backend/
│   ├── src/
│   │   ├── api/
│   │   ├── services/
│   │   └── utils/
│   ├── data/
│   │   └── neo4j/
│   └── requirements.txt
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   ├── services/
│   │   └── utils/
│   └── package.json
└── docker-compose.yml
```

## API Endpoints

- `GET /api/v1/cities` - получение списка городов
- `GET /api/v1/migration/stats` - получение статистики миграции
- `GET /api/v1/migration/flows` - получение данных о миграционных потоках

## Лицензия

MIT

## Авторы

- Ваше имя - Основной разработчик