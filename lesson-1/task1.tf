provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my_ubuntu" {
  count         = 0
  ami           = "ami-0e0102e3ff768559b"
  instance_type = "t2.micro"
  tags = {
    Name    = "My Ubuntu Server"
    Owner   = "student"
    Project = "Terraform Lessons"
  }
}

resource "aws_instance" "my_Amazon" {
  count         = 0
  ami           = "ami-0db9040eb3ab74509"
  instance_type = "t2.micro"

  tags = {
    Name    = "My Amazon Server"
    Owner   = "student"
    Project = "Terraform Lessons"
  }
}
