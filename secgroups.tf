# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = var.region
}

resource "aws_security_group" "clients_security_group" {
  name   = "hashicups-ingress"
  vpc_id = module.nomad-cluster.nomad_vpc_id

  # Nginx
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Frontend
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # DB
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Payments API
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Public API
  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Product API
  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# This resource can only be added after the initial terraform apply
# as the IDs it needs are only available after the apply
# Uncomment after the initial apply and re-run terraform apply

# resource "aws_network_interface_sg_attachment" "sg_attachment" {
#   for_each = toset(module.nomad-cluster.nomad_client_network_ids)
#   security_group_id    = aws_security_group.clients_security_group.id
#   network_interface_id = each.value
# }