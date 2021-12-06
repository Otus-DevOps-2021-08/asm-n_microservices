variable "service_account_key_file" {
  description = "Path to the .json key file"
}
variable "cloud_id" {
  description = "Cloud ID"
}
variable "folder_id" {
  description = "Folder ID"
}

variable "zone" {
  description = "Zone"
}

variable "subnet_id" {
  description = "VPC subnet ID"
}

variable "docker_host_instances_to_create" {
  description = "Total instances to create"
  default     = 1
}

variable "docker_host_image_folder_id" {
  description = "Folder ID to search image by family"
  default     = "standard-images"
}

variable "docker_host_image_family" {
  description = "Image os family"
  default     = "ubuntu-2004-lts"
}

variable "ssh_username" {
  default = "ubuntu"
}

variable "ssh_public_key_file" {
  description = "Path to ssh public key file"
}

variable "ssh_private_key_file" {
  description = "Path to ssh private key file"
}
