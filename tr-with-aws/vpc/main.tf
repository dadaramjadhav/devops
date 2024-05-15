resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "pb_sn" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pb_cidr
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name = "pb_sn1"
  }
}

resource "aws_security_group" "pb_sg" {
  name = "allow_tls"
  description = "allow tls inbound and all outbound traffic"
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "allow_tls"
  }
  ingress  {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.ext_ip]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.ext_ip]
  }
}