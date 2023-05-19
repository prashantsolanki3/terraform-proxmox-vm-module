# generate files for Ansible
resource "local_file" "ansible_hosts" {
  content = templatefile("${path.module}/templates/hosts.tpl",
    {
      dev  = var.ipv4
      user = var.user
    }
  )
  filename = "./.dots/${var.module_name}_hosts"
}

resource "local_file" "module_info" {
# Required while destroying the VM
  content = templatefile("${path.module}/templates/simple-yaml.tpl",
    {
      vars = {
        ipv4  = var.ipv4,
        module_name = var.module_name
      }
    }
  )
  filename = "./.dots/${var.module_name}_module_info"
}

locals {
  host_vars = concat([
        { key = "env", value = var.env }, 
        { key = "host_username", value = var.user},
        { key = "authorized_keys", value = file(var.public_key_file),},
        { key = "glusterfs_mounts", value = join(",", var.glusterfs_mounts)},
        { key = "glusterfs_home_mounts", value = join(",", var.glusterfs_home_mounts)},
        { key = "glusterfs_server", value = var.glusterfs_server}
        ], var.host_vars)
}

resource "local_file" "host_vars" {
  # Ansible Variables
  content = templatefile("${path.module}/templates/simple-yaml.tpl",
    {
      vars = local.host_vars
    }
  )
  filename = "./.dots/${var.module_name}_host_vars.yaml"
}

# resource "local_file" "cleanup" {
#   # Cleanup Script
#   content = templatefile("${path.module}/templates/cleanup.tpl",
#     {
#       vars = {
#         "module_name" = var.module_name
#       }
#     }
#   )
#   filename = "./scripts/${var.module_name}_cleanup.sh"
# }