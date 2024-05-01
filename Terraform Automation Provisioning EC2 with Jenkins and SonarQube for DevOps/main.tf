resource "aws_instance" "jenkins-sq" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.large"
  key_name = "dm_kp"
  vpc_security_group_ids = [ aws_security_group.jenkins-sq.id ]
  user_data = templatefile("./install.sh", {})
  tags = {
    Name = "jenkins-sq"
  }
  root_block_device {
    volume_size = 30
  }
  
  
}

resource "aws_security_group" "jenkins-sq" {
  name        = "jenkins-sq"
  description = "Allow jenkins-sq inbound traffic and all outbound traffic"

  ingress = [
    for port in [22, 80, 8080, 9000, 443] : {
        description = "inbound rules"
        from_port = port
        to_port = port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        self = false
    }
  ]    
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  tags = {
    Name = "jenkins-sq"
  }
}

 