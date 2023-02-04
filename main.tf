terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.1"
    }
  }
}

variable "root-password" {
  description = "Root user's password"
  type        = string
  sensitive   = true
}

variable "linode-token" {
  description = "Linode API key"
  type        = string
  sensitive   = true
}

variable "ssh-pubkey" {
  description = "Public SSH key"
  type        = string
  sensitive   = true
}

provider "linode" {
  token = var.linode-token
}

resource "linode_instance" "workportal-server" {
  image           = "linode/almalinux9"
  label           = "workportal-server"
  group           = "Terraform-managed"
  region          = "ca-central"
  type            = "g6-nanode-1"
  authorized_keys = [var.ssh-pubkey]
  root_pass       = var.root-password

  provisioner "remote-exec" {
    inline = ["sudo dnf -y install python3-libs"]

    connection {
      host = "${linode_instance.workportal-server.ip_address}"
      type        = "ssh"
      private_key = file("~/.ssh/id_rsa")
      user        = "root"
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${linode_instance.workportal-server.ip_address},' -u root ../server/rhel-playbook.yml"
  }
}
