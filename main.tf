# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

module "nomad-cluster" {
  source                    = "github.com/hashicorp/learn-nomad-cluster-setup/aws"
  ami                       = var.ami
  client_count              = var.client_count
  client_instance_type      = var.client_instance_type
  key_name                  = var.key_name
  name                      = var.name
  nomad_consul_token_id     = var.nomad_consul_token_id
  nomad_consul_token_secret = var.nomad_consul_token_secret
  region                    = var.region
  server_count              = var.server_count
  server_instance_type      = var.server_instance_type
  allowlist_ip              = var.allowlist_ip
}
