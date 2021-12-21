output "control_nodes_ips" {
  value = yandex_compute_instance.k8s_control_nodes[*].network_interface[0].nat_ip_address
}

output "worker_nodes_ips" {
  value = yandex_compute_instance.k8s_worker_nodes[*].network_interface[0].nat_ip_address
}
