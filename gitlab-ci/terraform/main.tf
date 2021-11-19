terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.66.0"
    }
  }
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file_path
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

data "yandex_compute_image" "ubuntu_1804_lts_image" {
  family    = "ubuntu-1804-lts"
  folder_id = "standard-images"
}

resource "yandex_compute_instance" "gitlab_ci_instance" {
  name        = "gitlab-ci-instance"
  platform_id = "standard-v1"

  labels = {
    group = "docker_hosts"
  }

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_1804_lts_image.image_id
      size     = 50
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    user-data = "#cloud-config\nusers:\n  - name: ${var.username}\n    groups: sudo\n    shell: /bin/bash\n    sudo: ['ALL=(ALL) NOPASSWD:ALL']\n    ssh-authorized-keys:\n      - ${file(var.ssh_public_key_file_path)}"
  }
}
