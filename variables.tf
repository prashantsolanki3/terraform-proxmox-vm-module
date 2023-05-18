variable "env" {
  description = "Environment - dev, live. Default is dev"
  default     = "dev"
  type        = string
}

variable "target_node" {
  description = "TARGET_NODE"
  type        = string
}

variable "public_key_file" {
  description = "public_key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_key_file" {
  description = "private_key_file"
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "template" {
  description = "Template Name"
  type        = string
  default     = "U2004-DOCKER-TEMPLATE"
}

variable "vm_id" {
  description = "Proxmox vm id"
  type        = string
}

variable "user" {
  description = "Username"
  type        = string
}

variable "cpu_count" {
  description = "cpu_count"
  type        = number
  default     = 4
}

variable "memory" {
  description = "Memory"
  type        = number
  default     = 4096
}

variable "hostname" {
  description = "Hostname"
  type        = string
  default     = "dev-box"
}

variable "ipv4_gateway" {
  description = "Default Gateway"
  type        = string
}

variable "ipv4" {
  description = "The ipv4"
  type        = string
  default     = "10.2.21.12"
}

variable "ipv4_data" {
  description = "The ipv4 data network"
  type        = string
  default     = "10.2.21.12"
}

variable "disk_size" {
  description = "Disk size"
  type        = string
  default     = "32G"
}

variable "disk_storage" {
  description = "storage location"
  type        = string
  default     = "local-lvm"
}

variable "dots_ansible_repo" {
  description = "Point to you ansible based dot repo"
  type = string
  default = "https://github.com/prashantsolanki3/dots.git"
}

variable "module_name" {
  description = "Module Name"
  type = string
}

variable "glusterfs_server" {
  description = "Glusterfs server"
  type        = string
}

variable "glusterfs_mounts" {
  description = "GlusterFS mounts"
  type        = list(string)
}

variable "config_files" {
  description = "List of config files for the target VM"
  type = list(object({
    source_path      = string
    destination_path = string
  }))
}