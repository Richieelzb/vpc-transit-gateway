//Resources///////////////////////////////////////////////////////

variable "instance-type-list" {
  type    = list(string)
  default = ["t3.micro", "t3.medium", "t3.large"]
}

variable "key-pair" {
}

///VPC Modules-1 ///////////////////////////////////////////////////////////////////////////
variable "vpc_name_vpc1" {
  type = string
  # default = "vpc-lzb"
}

variable "vpc_availability_zones_vpc1" {
  type    = list(string)
  default = []
}

variable "vpc_cidr_block_vpc1" {
  type = string
}

variable "vpc_public_subnets_vpc1" {
  type    = list(string)
  default = []
}

variable "vpc_private_subnets_vpc1" {
  type = list(string)
}

variable "vpc_enable_nat_gateway_vpc1" {
  type = bool
  default = false
}

variable "vpc_single_nat_gateway_vpc1" {
  type = bool
  default = true
}

///VPC Modules-2 ///////////////////////////////////////////////////////////////////////////
variable "vpc_name_vpc2" {
  type = string
  # default = "vpc-lzb"
}

variable "vpc_availability_zones_vpc2" {
  type    = list(string)
  default = []
}

variable "vpc_cidr_block_vpc2" {
  type = string
}

variable "vpc_public_subnets_vpc2" {
  type    = list(string)
  default = []
}

variable "vpc_private_subnets_vpc2" {
  type = list(string)
}

variable "vpc_enable_nat_gateway_vpc2" {
  type    = bool
  default = false
}

variable "vpc_single_nat_gateway_vpc2" {
  type    = bool
  default = false
}

///VPC Modules-3 ///////////////////////////////////////////////////////////////////////////
variable "vpc_name_vpc3" {
  type = string
  # default = "vpc-lzb"
}

variable "vpc_availability_zones_vpc3" {
  type    = list(string)
  default = []
}

variable "vpc_cidr_block_vpc3" {
  type = string
}

variable "vpc_public_subnets_vpc3" {
  type    = list(string)
  default = []
}

variable "vpc_private_subnets_vpc3" {
  type = list(string)
}

variable "vpc_enable_nat_gateway_vpc3" {
  type    = bool
  default = false
}

variable "vpc_single_nat_gateway_vpc3" {
  type    = bool
  default = true
}


//////generals/////////////////////////////
variable "aws-region" {
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "business-division" {
  type    = string
  default = "wallawalla"
}