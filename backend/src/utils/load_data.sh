#!/bin/bash

# Перевіряємо чи існує директорія з партіями
if [ ! -d "data/processed/batches" ]; then
    echo "Директорія з партіями не знайдена!"
    exit 1
fi

# Очищаємо базу даних
echo "Очищення бази даних..."
docker exec -i migratio_map_neo4j_1 cypher-shell -u neo4j -p password "MATCH (n) DETACH DELETE n"

# Створюємо файл для збереження прогресу
PROGRESS_FILE="data/processed/load_progress.txt"
echo "0" > "$PROGRESS_FILE"

# Завантажуємо кожну партію
for file in data/processed/batches/batch_*.cypher; do
    # Отримуємо номер партії
    batch_num=$(echo "$file" | grep -o 'batch_[0-9]*' | cut -d'_' -f2)
    
    # Перевіряємо чи ця партія вже була завантажена
    if [ "$batch_num" -le "$(cat $PROGRESS_FILE)" ]; then
        echo "Пропускаємо партію $batch_num (вже завантажена)"
        continue
    fi
    
    echo "Завантаження файлу $file..."
    
    # Спробуємо завантажити дані
    if docker exec -i migratio_map_neo4j_1 cypher-shell -u neo4j -p password < "$file"; then
        echo "Файл $file успішно завантажено"
        # Зберігаємо прогрес
        echo "$batch_num" > "$PROGRESS_FILE"
        
        # Перевіряємо кількість завантажених міграцій
        count=$(docker exec -i migratio_map_neo4j_1 cypher-shell -u neo4j -p password "MATCH (m:Migration) RETURN count(m) as count" | tail -n 1)
        echo "Загальна кількість завантажених міграцій: $count"
    else
        echo "Помилка при завантаженні файлу $file"
        echo "Остання успішно завантажена партія: $(cat $PROGRESS_FILE)"
        exit 1
    fi
done

echo "Всі дані успішно завантажено!" 