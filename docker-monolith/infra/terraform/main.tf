terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.66.0"
    }
  }
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

data "yandex_compute_image" "docker_host_image" {
  family    = var.docker_host_image_family
  folder_id = var.docker_host_image_folder_id
}

module "docker-host" {
  source         = "./modules/docker-host/"
  count          = var.docker_host_instances_to_create
  instance_index = count.index
  instance_labels = {
    group = "docker_hosts"
  }
  instance_cores       = 2
  instance_memory      = 4
  instance_disk_size   = 10
  instance_image_id    = data.yandex_compute_image.docker_host_image.id
  subnet_id            = var.subnet_id
  ssh_username         = var.ssh_username
  ssh_public_key_file  = var.ssh_public_key_file
  ssh_private_key_file = var.ssh_private_key_file
}
