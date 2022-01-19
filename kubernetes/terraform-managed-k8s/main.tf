terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.70.0"
    }
  }
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file_path
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_kubernetes_cluster" "reddit_k8s" {
  name = "reddit-k8s"

  network_id = var.network_id

  master {
    version = var.k8s_version

    zonal {
      zone      = var.zone
      subnet_id = var.subnet_id
    }

    public_ip = true
  }

  service_account_id      = var.k8s_service_account_id
  node_service_account_id = var.k8s_service_account_id

  release_channel = "RAPID"
}

resource "yandex_kubernetes_node_group" "reddit_k8s_node_group_01" {
  cluster_id = yandex_kubernetes_cluster.reddit_k8s.id
  name       = "reddit-k8s-node-group-01"
  version    = var.k8s_version

  instance_template {
    platform_id = "standard-v1"

    resources {
      memory = 8
      cores  = 4
    }

    network_interface {
      nat        = true
      subnet_ids = [var.subnet_id]
    }

    boot_disk {
      type = "network-hdd"
      size = 64
    }

    metadata = {
      "ssh-keys" = "${var.k8s_username}:${file(var.k8s_ssh_public_key_file_path)}"
    }

    container_runtime {
      type = "containerd"
    }
  }

  scale_policy {
    fixed_scale {
      size = var.k8s_nodes_count
    }
  }

  allocation_policy {
    location {
      zone = var.zone
    }
  }
}
