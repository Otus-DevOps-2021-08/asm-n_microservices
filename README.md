# asm-n_microservices
asm-n microservices repository

## ДЗ№17: Создание и запуск системы мониторинга Prometheus

- Создан образ prometheus
- Создан образ blackbox-exporter
- Добавлены экспортеры в prometheus:
  - prom/node-exporter
  - percona/mongodb_exporter
  - prom/blackbox-exporter
- Добавлены сервисы в docker-compose.yml:
  - prometheus
  - node-exporter
  - mongodb-exporter
  - blackbox-exporter
- Созданы Makefile для сборки образов

Для запуска:

- Собрать образы
  ```
  make
  ```
- Запустить
  ```
  cd docker && docker-compose up -d
  ```
