terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.27.1"
    }
  }
}

provider "linode" {
  token = "ffdaea345ea79bfe4b34fbe67d13ba3bfd4c3d6396f43e356f002e91a2c8c0b0"
}

variable "root-password" {
    description = "Root user's password"
    type = string
    sensitive = true
}

resource "linode_instance" "workportal-server" {
        image = "linode/centos-stream9"
        label = "workportal-server"
        group = "Terraform-managed"
        region = "ca-central"
        type = "g6-standard-1"
        authorized_keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQChHg2eObwKm4m+FqAx8c3geJfmBryaUsbf+C1ilRvdMMfROTYbEp/6YEaAF1hB9tVvDYdMb0QFoRIuElak8ArXqGS1ufpwrJN3qyWlColU2DeK98Efy7+BrsRwMi+RZoNsdku1QX5LmfF3phzu9u4Gbk7399sqWhkzf3Hgty4a2neD+uTfRXLUKfQgI5YUNOaEeBJUCOIYKTkt0NOLKXvyTgtMhxkT8OLbR3WBbIoetQl8sQh06kdzlNN//S/IF5YKak6pTv/9Z+PqD9SPwbhTt1xGSAxGurNSTVWbZ5KwzJk06BNEJR7nApHs/IH1QvhbbcSYVBaTQ+guExG430a42HQQWV/uZE3CdVumwtpA/5VvjH7OgztgTDJ+zdTAR9pOjCnWqlno5KoDsSz+4yVYLMN1CMlYhjtWs9YEVUAa4sRk6zEem+2bPsASwkBCNw1yxgVPmTEuY6EHIQ80GA6mPg+3uKA4oCFckGwud4uM/agOjIey1zhvAPq4VdOfC70= trevorcurtis@fedora" ]
        root_pass = var.root-password
}
