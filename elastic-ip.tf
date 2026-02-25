# Create Elastic IP for Bastion Host
# Resource - depends_on Meta-Argument
resource "aws_eip" "bastion_eip" {
  depends_on = [aws_instance.ec2-public-vpc1, module.VPC-A ]
  instance = aws_instance.ec2-public-vpc1.id
  //vpc      = true
  tags = local.common_tags  
}
