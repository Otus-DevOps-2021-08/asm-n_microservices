output "ip_address_ext" {
  value = [for i in module.docker-host : i.ip_address_ext]
}

output "ip_address_int" {
  value = [for i in module.docker-host : i.ip_address_int]
}
