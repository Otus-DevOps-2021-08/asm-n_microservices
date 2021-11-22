output "gitlab_ip_address_ext" {
  description = "Gitlab instance external ip address"
  value       = yandex_compute_instance.gitlab_ci_instance.network_interface.0.nat_ip_address
}
