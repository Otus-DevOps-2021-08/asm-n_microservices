# asm-n_microservices
asm-n microservices repository

## ДЗ№20: Основные модели безопасности и контроллеры в Kubernetes

- Развернуть локальное окружение для работы с Kubernetes
- Развернуть Kubernetes в Yandex Cloud
- Запустить reddit в Kubernetes

Для запуска:

``` bash
cd kubernetes/terraform-managed-k8s/ && terraform apply && cd ../../
kubectl apply -f kubernetes/reddit/dev-namespace.yml
kubectl apply -n dev -f kubernetes/reddit/
```
