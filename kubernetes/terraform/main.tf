terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.68.0"
    }
  }
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file_path
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

data "yandex_compute_image" "ubuntu_2004_lts_image" {
  family    = "ubuntu-2004-lts"
  folder_id = "standard-images"
}

module "k8s" {
  source = "./k8s-module"

  image_id  = data.yandex_compute_image.ubuntu_2004_lts_image.image_id
  subnet_id = var.subnet_id

  controls_count    = 1
  control_cpus      = 2
  control_memory    = 4
  control_disk_size = 40

  workers_count    = 2
  worker_cpus      = 2
  worker_memory    = 4
  worker_disk_size = 40

  username                 = var.username
  ssh_public_key_file_path = var.ssh_public_key_file_path
}
