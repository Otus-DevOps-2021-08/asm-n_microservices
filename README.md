# asm-n_microservices
asm-n microservices repository

## ДЗ№18: Логирование приложений

- Подготовка окружения
- Логирование Docker-контейнеров
- Сбор неструктурированных логов
- Визуализация логов
- Сбор структурированных логов
- Распределенный трейсинг

Для запуска:

- Собрать образы
  ```
  make
  ```
- Запустить
  ```
  cd docker && docker-compose -f docker-compose.yml -f docker-compose-logging.yml up -d
  ```
