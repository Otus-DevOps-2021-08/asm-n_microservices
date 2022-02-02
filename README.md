# asm-n_microservices
asm-n microservices repository

## ДЗ№21: Ingress-контроллеры и сервисы в Kubernetes

- Ingress Controller
- Ingress
- Secret
- TLS
- LoadBalancer Service
- Network Policies
- PersistentVolumes
- PersistentVolumeClaims

Для запуска:

``` bash
cd kubernetes/terraform-managed-k8s/ && terraform apply && cd ../../
kubectl apply -f kubernetes/reddit/dev-namespace.yml
kubectl apply -n dev -f kubernetes/reddit/
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.34.1/deploy/static/provider/cloud/deploy.yaml
```
