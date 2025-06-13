import requests
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np

# Получаем данные из API
response = requests.get('http://localhost:8000/api/v1/migration/flows')
data = response.json()

# Преобразуем данные в DataFrame
df = pd.DataFrame(data)

# Создаем тепловую карту миграционных потоков
plt.figure(figsize=(15, 12))
pivot_table = df.pivot_table(
    values='count',
    index='from_city',
    columns='to_city',
    fill_value=0
)
sns.heatmap(pivot_table, annot=True, fmt='.0f', cmap='YlOrRd')
plt.title('Тепловая карта миграционных потоков между городами')
plt.tight_layout()
plt.savefig('migration_heatmap.png')
plt.close()

# Анализ причин миграции
all_reasons = []
for reasons in df['reasons']:
    all_reasons.extend(reasons)
reason_counts = pd.Series(all_reasons).value_counts()

plt.figure(figsize=(12, 6))
reason_counts.plot(kind='bar')
plt.title('Распределение причин миграции')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.savefig('migration_reasons.png')
plt.close()

# Средний возраст по городам
plt.figure(figsize=(12, 6))
df.groupby('from_city')['average_age'].mean().sort_values(ascending=False).plot(kind='bar')
plt.title('Средний возраст мигрантов по городам')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.savefig('average_age.png')
plt.close()

# Средняя продолжительность миграции по городам
plt.figure(figsize=(12, 6))
df.groupby('from_city')['average_duration'].mean().sort_values(ascending=False).plot(kind='bar')
plt.title('Средняя продолжительность миграции по городам')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.savefig('average_duration.png')
plt.close()

print("Визуализации сохранены в файлы:")
print("- migration_heatmap.png")
print("- migration_reasons.png")
print("- average_age.png")
print("- average_duration.png") 