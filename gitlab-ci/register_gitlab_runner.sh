#!/bin/bash -x

REG_TOKEN=YUuqAAYfUFf1W1uLysDy
GITLAB_URL=http://51.250.4.175/
GITLAB_RUNNERS=2

RUNNER_HOST=51.250.4.175
USERNAME=gitlab
SSH_PRIVATE_KEY_FILE=./secrets/ssh-key

for (( i=1; i<=${GITLAB_RUNNERS}; i++ )); do
  ssh -i ${SSH_PRIVATE_KEY_FILE} ${USERNAME}@${RUNNER_HOST} \
    docker run --rm -v /srv/gitlab-runner-${i}/config:/etc/gitlab-runner gitlab/gitlab-runner register \
      --url ${GITLAB_URL} \
      --non-interactive \
      --locked=false \
      --name DockerRunner-${i} \
      --executor docker \
      --docker-image alpine:latest \
      --docker-volumes /var/run/docker.sock:/var/run/docker.sock \
      --registration-token ${REG_TOKEN} \
      --tag-list "linux,xenial,ubuntu,docker" \
      --run-untagged
done
