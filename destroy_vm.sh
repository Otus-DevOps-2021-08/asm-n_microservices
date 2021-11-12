#!/bin/bash -x

VM_NAME=docker-host

echo 'y' | docker-machine rm ${VM_NAME}

yc compute instance delete ${VM_NAME}
