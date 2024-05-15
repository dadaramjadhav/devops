resource "aws_instance" "myvm" {
  ami = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  subnet_id = var.sn
  security_groups = [var.sg]

  tags ={
    Name = "myvm"
  }
}