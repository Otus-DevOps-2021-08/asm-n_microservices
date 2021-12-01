#!/bin/bash -x

VM_NAME=docker-host

yc compute instance create \
  --name ${VM_NAME} \
  --zone ru-central1-a \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1804-lts,size=15 \
  --ssh-key ~/.ssh/id_rsa.pub > /dev/null 2>&1

VM_ADDRESS=$(yc compute instance get ${VM_NAME} --format json | python3 -c "import sys, json; print(json.load(sys.stdin)['network_interfaces'][0]['primary_v4_address']['one_to_one_nat']['address'])")

docker-machine create \
  --driver generic \
  --generic-ip-address=${VM_ADDRESS} \
  --generic-ssh-user yc-user \
  --generic-ssh-key ~/.ssh/id_rsa \
  ${VM_NAME}

eval $(docker-machine env ${VM_NAME})

docker run --rm -p 9090:9090 -d --name prometheus  prom/prometheus

echo "${VM_ADDRESS}"
