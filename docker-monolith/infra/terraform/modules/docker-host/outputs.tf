output "ip_address_ext" {
  description = "Instance external ip address"
  value       = yandex_compute_instance.docker_host_instance.network_interface.0.nat_ip_address
}
output "ip_address_int" {
  description = "Instance internal ip address"
  value       = yandex_compute_instance.docker_host_instance.network_interface.0.ip_address
}
