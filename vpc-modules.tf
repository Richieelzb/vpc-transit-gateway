module "VPC-A" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.17.0"


  name = "${local.Name}-${var.vpc_name_vpc1}"
  cidr = var.vpc_cidr_block_vpc1

  azs             = var.vpc_availability_zones_vpc1
  private_subnets = var.vpc_private_subnets_vpc1
  public_subnets  = var.vpc_public_subnets_vpc1

  manage_default_network_acl    = false
  manage_default_route_table    = false
  manage_default_security_group = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = var.vpc_enable_nat_gateway_vpc1
  single_nat_gateway = var.vpc_single_nat_gateway_vpc1

  enable_dhcp_options     = true
  map_public_ip_on_launch = true

  tags = local.common_tags
}

module "VPC-B" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.17.0"


  name = "${local.Name}-${var.vpc_name_vpc2}"
  cidr = var.vpc_cidr_block_vpc2

  azs             = var.vpc_availability_zones_vpc2
  private_subnets = var.vpc_private_subnets_vpc2
  public_subnets  = var.vpc_public_subnets_vpc2

  manage_default_network_acl    = false
  manage_default_route_table    = false
  manage_default_security_group = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = var.vpc_enable_nat_gateway_vpc2
  single_nat_gateway = var.vpc_single_nat_gateway_vpc2

  enable_dhcp_options     = true
  map_public_ip_on_launch = true

  tags = local.common_tags
}

module "VPC-C" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.17.0"


  name = "${local.Name}-${var.vpc_name_vpc3}"
  cidr = var.vpc_cidr_block_vpc3

  azs             = var.vpc_availability_zones_vpc3
  private_subnets = var.vpc_private_subnets_vpc3
  public_subnets  = var.vpc_public_subnets_vpc3

  manage_default_network_acl    = false
  manage_default_route_table    = false
  manage_default_security_group = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = var.vpc_enable_nat_gateway_vpc3
  single_nat_gateway = var.vpc_single_nat_gateway_vpc3

  enable_dhcp_options     = true
  map_public_ip_on_launch = true

  tags = local.common_tags
}
