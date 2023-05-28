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
  default     = "focal-server-cloudimg-amd64"
}

variable "vm_id" {
  description = "Proxmox vm id"
  type        = string
  default     = "12345"
}

variable "user" {
  description = "Username"
  type        = string
  default     = "ubuntu"
}

variable "cpu_count" {
  description = "cpu_count"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory"
  type        = number
  default     = 4096
}

variable "hostname" {
  description = "Hostname"
  type        = string
  default     = "vm-module"
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
  default     = "16G"
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
  default = "vm-module"
}

# variable "glusterfs_server" {
#   description = "Glusterfs server"
#   type        = string
#   default     = ""
# }

# variable "glusterfs_mounts" {
#   description = "GlusterFS mounts"
#   type        = list(string)
#   default     = []
# }

# variable "glusterfs_home_mounts"{
#   description = "GlusterFS home mounts"
#   type        = list(string)
#   default     = []
# }

variable "config_path" {
  description = "Path to store the config files"
  type = string
  default = "/vm-config"
}

variable "cifs_credentials_file" {
  default = ""
  type = string
  description = "Path to the cifs credentials file"
}


variable "config_files" {
  description = "List of config files for the target VM"
  type = list(object({
    source_path      = string
    destination_path = string
  }))
  default = []
}

variable "github_account" {
  description = "Github account"
  type = string
  default = "prashantsolanki3"
}

variable "github_repos" {
  description = "Github runner repos"
  type = list(string)
  default = []
}

variable "github_access_token" {
  description = "Github access token"
  type = string
  default = ""
}