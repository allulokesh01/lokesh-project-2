# Public subnet EC2 instance 1
resource "aws_instance" "pro2-web-server-1" {
  ami             = "ami-0230bd60aa48260c6"
  instance_type   = "t3.micro"
  security_groups = [aws_security_group.pro2-ec2-sg.id]
  subnet_id       = aws_subnet.pro2-pub-sub-1.id
  key_name   = "pro2-key"

  tags = {
    Name = "pro2-web-server-1"
  }

  user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y 
sudo systemctl enable nginx
sudo systemctl start nginx
EOF
}

# Public subnet  EC2 instance 2
resource "aws_instance" "pro2-web-server-2" {
  ami             = "ami-0230bd60aa48260c6"
  instance_type   = "t3.micro"
  security_groups = [aws_security_group.pro2-ec2-sg.id]
  subnet_id       = aws_subnet.pro2-pub-sub-2.id
  key_name   = "pro2-key"

  tags = {
    Name = "pro2-web-server-2"
  }

  user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y 
sudo systemctl enable nginx
sudo systemctl start nginx
EOF
}

#EIP

resource "aws_eip" "pro2-web-server-1-eip" {
  vpc = true

  instance                  = aws_instance.pro2-web-server-1.id
  depends_on                = [aws_internet_gateway.pro2-igw]
}

resource "aws_eip" "pro2-web-server-2-eip" {
  vpc = true

  instance                  = aws_instance.pro2-web-server-2.id
  depends_on                = [aws_internet_gateway.pro2-igw]
}
