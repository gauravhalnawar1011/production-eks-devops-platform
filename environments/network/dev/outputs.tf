output "network_summary" {

  value = {

    vpc_id = module.network.vpc_id

    public_subnets = module.network.public_subnet_ids

    private_subnets = module.network.private_subnet_ids

    nat_gateways = module.network.nat_gateway_ids
  }
}