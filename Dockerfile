FROM python:3.9-slim

# Встановлюємо необхідні системні залежності
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libpq-dev

# Встановлюємо робочий каталог
WORKDIR /app

# Копіюємо всі файли в контейнер
COPY . /app

# Встановлюємо залежності з requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Відкриваємо порт 8000
EXPOSE 8000

# Команда для запуску програми
CMD ["python", "main.py"]
