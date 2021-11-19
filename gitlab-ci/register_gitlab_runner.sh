#!/bin/bash -x

REG_TOKEN=
VM_IP_ADDRESS=51.250.12.114
USERNAME=gitlab
SSH_PRIVATE_KEY_FILE=../secrets/ssh-key

ssh -i ${SSH_PRIVATE_KEY_FILE} ${USERNAME}@${VM_IP_ADDRESS} \
  docker exec -it gitlab-runner gitlab-runner register \
    --url http://${VM_IP_ADDRESS}/ \
    --non-interactive \
    --locked=false \
    --name DockerRunner \
    --executor docker \
    --docker-image alpine:latest \
    --registration-token ${REG_TOKEN} \
    --tag-list "linux,xenial,ubuntu,docker" \
    --run-untagged
