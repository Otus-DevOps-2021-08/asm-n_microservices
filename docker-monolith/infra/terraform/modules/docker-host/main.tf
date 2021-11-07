terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.66.0"
    }
  }
}

resource "yandex_compute_instance" "docker_host_instance" {
  name = "${var.instance_basename}-${var.instance_index}"

  labels = var.instance_labels

  resources {
    cores  = var.instance_cores
    memory = var.instance_memory
  }

  boot_disk {
    initialize_params {
      image_id = var.instance_image_id
      size     = var.instance_disk_size
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.ssh_username}:${file(var.ssh_public_key_file)}"
  }
}
