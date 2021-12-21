terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.68.0"
    }
  }
}

resource "yandex_compute_instance" "k8s_control_nodes" {
  count = var.controls_count

  name        = "k8s-control-node-${count.index}"
  platform_id = "standard-v1"

  hostname = "control-node-${count.index}"

  resources {
    cores  = var.control_cpus
    memory = var.control_memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.control_disk_size
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ansible_groups = "k8s_control_nodes"
    user-data      = "#cloud-config\nusers:\n  - name: ${var.username}\n    groups: sudo\n    shell: /bin/bash\n    sudo: ['ALL=(ALL) NOPASSWD:ALL']\n    ssh-authorized-keys:\n      - ${file(var.ssh_public_key_file_path)}"
  }
}

resource "yandex_compute_instance" "k8s_worker_nodes" {
  count = var.workers_count

  name        = "k8s-worker-node-${count.index}"
  platform_id = "standard-v1"

  hostname = "worker-node-${count.index}"

  resources {
    cores  = var.worker_cpus
    memory = var.worker_memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.worker_disk_size
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ansible_groups = "k8s_worker_nodes"
    user-data      = "#cloud-config\nusers:\n  - name: ${var.username}\n    groups: sudo\n    shell: /bin/bash\n    sudo: ['ALL=(ALL) NOPASSWD:ALL']\n    ssh-authorized-keys:\n      - ${file(var.ssh_public_key_file_path)}"
  }
}
