variable "instance_type" {
  description = "EC2 Instance Type"
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}
