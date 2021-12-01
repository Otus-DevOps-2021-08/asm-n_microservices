variable "instance_basename" {
  default = "docker-host"
}

variable "instance_index" {
  default = "0"
}

variable "instance_labels" {
  description = "Optional instance labels"
  default     = {}
}

variable "instance_cores" {
  description = "Instance CPU cores"
  default     = 2
}

variable "instance_memory" {
  description = "Instance memory in GB"
  default     = 4
}

variable "instance_disk_size" {
  description = "Instance disk size in GB"
  default     = 10
}

variable "instance_image_id" {
  description = "Disk image ID to initialize boot disk from"
}

variable "subnet_id" {
  description = "Subnet ID"
}

variable "ssh_username" {
  description = "Ssh username"
}

variable "ssh_public_key_file" {
  description = "Path to ssh public file"
}

variable "ssh_private_key_file" {
  description = "Path to ssh private file"
}
