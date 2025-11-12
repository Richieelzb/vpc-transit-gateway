resource "aws_instance" "ec2-vpc-A" {
  ami                    = data.aws_ami.my-data-ami.id
  instance_type          = var.instance-type-list[0]
  key_name               = var.key-pair
  subnet_id              = module.VPC-A.private_subnets[0]
  vpc_security_group_ids = [aws_security_group.private-sg1-ec2.id]

  tags = {
    Name = "ec2-vpc-A"
  }
}

resource "aws_instance" "ec2-vpc-B" {
  ami                    = data.aws_ami.my-data-ami.id
  instance_type          = var.instance-type-list[0]
  key_name               = var.key-pair
  subnet_id              = module.VPC-B.private_subnets[0]
  vpc_security_group_ids = [aws_security_group.private-sg2-ec2.id]
  tags = {
    Name = "ec2-vpc-B"
  }
}

resource "aws_instance" "ec2-vpc-C" {
  ami                    = data.aws_ami.my-data-ami.id
  instance_type          = var.instance-type-list[0]
  key_name               = var.key-pair
  subnet_id              = module.VPC-C.private_subnets[0]
  vpc_security_group_ids = [aws_security_group.private-sg3-ec2.id]
  tags = {
    Name = "ec2-vpc-C"
  }
}


