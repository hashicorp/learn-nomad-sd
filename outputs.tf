# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "lb_address_consul_nomad" {
  value = module.nomad-cluster.lb_address_consul_nomad
}

output "consul_bootstrap_token_secret" {
  value = var.nomad_consul_token_secret
}

output "IP_Addresses" {
  value = module.nomad-cluster.IP_Addresses
}