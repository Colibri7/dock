# базовый образ Python
FROM python:3.8.10

# переменные окружения для Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Устанавливаем зависимости для Postgre

# рабочая директория внутри контейнера
# WORKDIR /app
WORKDIR /usr/src/app

# устанавливаем зависимости
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install cryptography==3.4.6
RUN pip install -r requirements.txt

# копируем файлы приложения
COPY . .

# команда для запуска приложения
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
