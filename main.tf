
provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2_instance" {
    ami = "ami-"
    instance_type = "t2.micro"
    tags = {
        Name = "terraform-instance"
    }
=====
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_instance" "web-server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "ubuntu-web-server"
  }

/*
# use data source to get a registered amazon linux 2 ami
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}


# launch the ec2 instance and install website
resource "aws_instance" "ec2_instance" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t2.micro"
  subnet_id              = aws_default_subnet.default_az1.id
  vpc_security_group_ids = [aws_security_group.ec2_security_grp.id]
  key_name               = "jenkins-key"
  # user_data            = file("install_jenkins.sh")

  tags = {
    Name = "jenkins-server"
  }
}
*/
