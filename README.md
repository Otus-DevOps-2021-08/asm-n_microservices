# asm-n_microservices
asm-n microservices repository

## ДЗ№16: Gitlab CI. Построение процесса непрерывной интеграции

- Создана конфигурация terraform для запуска вм
- Созданы плейбуки ansible развертывания GitLab CI и GitLab runner
- Создан пайплайн в GitLab CI для сборки, тестирования и деплоя приложения

Для запуска:

- cd terraform && terraform apply -auto-approve
- cd ansible && ansible-playbook -i dynamic_inventory.py playbooks/all.yml
- vim register_gitlab_runner.sh && ./register_gitlab_runner.sh
- project -> settings -> variables:
  CI_REGISTRY_IMAGE my-app
  DEPLOY_HOST x.x.x.x
