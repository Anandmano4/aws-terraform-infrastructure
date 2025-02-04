# Define the provider (AWS)
provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

# Create a Virtual Private Cloud (VPC)
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"  # CIDR block for the VPC
  enable_dns_support = true
  enable_dns_hostnames = true
}

# Create a Subnet inside the VPC
resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"  # CIDR block for the subnet
  availability_zone       = "us-east-1a"    # Availability zone (adjust as necessary)
  map_public_ip_on_launch = true  # Make sure instances get public IPs
}

# Create a Security Group to allow SSH (port 22)
resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow_ssh_"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (you can restrict this for security)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = var.ami  # AMI ID passed as a variable
  instance_type = var.instance_type  # Instance type passed as a variable
  subnet_id     = aws_subnet.main.id
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "TerraformExample"
  }
}

# Output the EC2 instance's public IP
output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.example.public_ip
}
