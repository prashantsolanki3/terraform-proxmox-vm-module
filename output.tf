# generate files for Ansible
resource "local_file" "ansible_hosts" {
  content = templatefile("${path.module}/templates/hosts.tpl",
    {
      dev  = var.ipv4
      user = var.user
      private_key = var.private_key_file
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

resource "local_file" "host_vars" {
  # Ansible Variables
  content = templatefile("${path.module}/templates/simple-yaml.tpl",
    {
      vars = {
        "env" = var.env,
        "host_username" = var.user,
        "authorized_keys" = file(var.public_key_file),
        "glusterfs_mounts" = join(",", var.glusterfs_mounts),
        "glusterfs_home_mounts" = join(",", var.glusterfs_home_mounts),
        "glusterfs_server" = var.glusterfs_server,
        "github_account" = var.github_account,
        "github_repos" = join(",", var.github_repos),
        "access_token" = var.github_access_token
        }
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