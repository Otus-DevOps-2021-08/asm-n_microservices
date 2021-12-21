output "k8s_control_nodes" {
  value = module.k8s.control_nodes_ips
}

output "k8s_worker_nodes" {
  value = module.k8s.worker_nodes_ips
}
