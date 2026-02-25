# 1. Create Transit Gateway
resource "aws_ec2_transit_gateway" "tgw_lzb" {
  description = "lzb Transit Gateway"
  amazon_side_asn = 64512
  auto_accept_shared_attachments = "enable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = local.common_tags

}

# 2. Attach VPCs to TGW
resource "aws_ec2_transit_gateway_vpc_attachment" "vpc1_attach" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_lzb.id
  vpc_id             = module.VPC-A.vpc_id
  subnet_ids         = [module.VPC-A.private_subnets[0]]

  tags = {
    Name = "tgw-attach-vpc1"
  }

}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc2_attach" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_lzb.id
  vpc_id             = module.VPC-B.vpc_id
  subnet_ids         = [module.VPC-B.private_subnets[0]]
 
  tags = {
    Name = "tgw-attach-vpc2"
  }

}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc3_attach" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_lzb.id
  vpc_id             = module.VPC-C.vpc_id
  subnet_ids         = [module.VPC-C.private_subnets[0]]
  
  tags = {
    Name = "tgw-attach-vpc3"
  }

}

#3. Create a TGW Route Table
resource "aws_ec2_transit_gateway_route_table" "main" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_lzb.id
}

 
#4. Associate each attachment with the route table
#    (Required because default associations are disabled)
resource "aws_ec2_transit_gateway_route_table_association" "vpc1_assoc" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.main.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc1_attach.id
}

resource "aws_ec2_transit_gateway_route_table_association" "vpc2_assoc" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.main.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc2_attach.id
}

resource "aws_ec2_transit_gateway_route_table_association" "vpc3_assoc" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.main.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc3_attach.id
}

# 5. Propagate routes from each attachment into the route table
resource "aws_ec2_transit_gateway_route_table_propagation" "vpc1_propagation" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.main.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc1_attach.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "vpc2_propagation" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.main.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc2_attach.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "vpc3_propagation" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.main.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc3_attach.id
}
