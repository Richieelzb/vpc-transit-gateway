/*module "tgw" {
  source  = "terraform-aws-modules/transit-gateway/aws"
  name    = "lzb-tgw"
  description = "TGW shared with other accounts"

  vpc_attachments = {
    vpc1 = {
      vpc_id     = var.tgw-vpc1
      subnet_ids = var.sube
      dns_support = true
      ipv6_support = false
      tgw_routes = [
        { destination_cidr_block = "10.0.0.0/16" }
      ]
    }
  }

  ram_allow_external_principals = true
  ram_principals = [123456789012]
}*/