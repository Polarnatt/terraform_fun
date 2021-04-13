provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "webserver" {
  ami                    = "ami-0db9040eb3ab74509"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver.id]
  user_data              = <<EOF
#!/bin/bash
yum -y update
yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>Webserver with IP: $myip</h2><br>Build by Terraform!" > /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
EOF
  tags = {
    Name  = "Web server build by Terraform"
    Owner = "Student"
  }
}

resource "aws_security_group" "webserver" {
  name        = "webserver_security_group"
  description = "My first Security Group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Web server security group Terraform"
    Owner = "Student"
  }
}
