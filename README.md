# asm-n_microservices
asm-n microservices repository

## ДЗ№13: Запуск VM с установленным Docker Engine при помощи Docker Machine. Написание Dockerfile и сборка образа с тестовым приложением. Сохранение образа на DockerHub.

- Собран и загружен на DockerHub образ приложения.
- Созданы конфигурации Packer, Terraform, Ansible для развертывания инстансов с приложением.

```
cd packer && packer build docker_host.json
```
```
cd terraform && terraform apply -auto-approve
```
```
cd ansible && ansible-playbook -i dynamic_inventory.py playbooks/all.yml
```
