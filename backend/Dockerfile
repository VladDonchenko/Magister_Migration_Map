FROM python:3.9-slim

# Установка системных зависимостей
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    python3-dev \
    wget \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libpq-dev \
    curl \
    gnupg \
    software-properties-common \
    python3-numpy \
    && rm -rf /var/lib/apt/lists/*

# Установка Java
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app/src

# Копирование файлов зависимостей
COPY requirements.txt ../

# Обновление pip и установка зависимостей
RUN pip install --upgrade pip && pip install --no-deps --no-cache-dir -r ../requirements.txt

# Копирование исходного кода
COPY . ../

# Установка переменных окружения
ENV PYTHONPATH=/app
ENV PYTHONUNBUFFERED=1

# Открытие порта
EXPOSE 8000

# Запуск приложения
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
