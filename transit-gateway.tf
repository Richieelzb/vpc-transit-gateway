# 1. Create Transit Gateway
resource "aws_ec2_transit_gateway" "tgw-lzb" {
  description = "lzb Transit Gateway"
  amazon_side_asn = 64512
  auto_accept_shared_attachments = "enable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
}

# 2. Attach VPCs to TGW
resource "aws_ec2_transit_gateway_vpc_attachment" "vpc1_attach" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw-lzb.id
  vpc_id             = module.VPC-A.vpc_id
  subnet_ids         = [module.VPC-A.private_subnets[0]]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc2_attach" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw-lzb.id
  vpc_id             = module.VPC-B.vpc_id
  subnet_ids         = [module.VPC-B.private_subnets[0]]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc3_attach" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw-lzb.id
  vpc_id             = module.VPC-C.vpc_id
  subnet_ids         = [module.VPC-C.private_subnets[0]]
}


# 3. Propagate routes to default TGW route table
resource "aws_ec2_transit_gateway_route_table_propagation" "vpc1_propagation" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpc1_attach.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway.tgw-lzb.association_default_route_table_id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "vpc2_propagation" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpc2_attach.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway.tgw-lzb.association_default_route_table_id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "vpc3_propagation" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpc3_attach.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway.tgw-lzb.association_default_route_table_id
}
