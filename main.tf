terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.27.1"
    }
  }
}

variable "root-password" {
    description = "Root user's password"
    type = string
    sensitive = true
}

variable "linode-token" {
    description = "Linode API key"
    type = string
    sensitive = true
}

variable "ssh-pubkey" {
    description = "Public SSH key"
    type = string
    sensitive = true
}

provider "linode" {
  token = var.linode-token
}


resource "linode_instance" "workportal-server" {
        image = "linode/centos-stream9"
        label = "workportal-server"
        group = "Terraform-managed"
        region = "ca-central"
        type = "g6-standard-1"
        authorized_keys = [ var.ssh-pubkey ]
        root_pass = var.root-password
}
