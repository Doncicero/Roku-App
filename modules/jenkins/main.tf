provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "jenkins" {
  name        = "jenkins"
  description = "Jenkins security group"
  
  # Define your security group rules for Jenkins here
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Add more ingress rules as needed (e.g., HTTP on port 8080, etc.)
}

resource "aws_instance" "jenkins" {
  ami           = "ami-0c55b159cbfafe1f0"  # Jenkins image (choose an appropriate one)
  instance_type = "t2.micro"  # Choose an appropriate instance type
  key_name      = "your-key-pair"  # Specify your key pair name

  vpc_security_group_ids = [aws_security_group.jenkins.id]
}
