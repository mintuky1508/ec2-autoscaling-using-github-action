variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
}

variable "security_groups" {
  description = "The security group IDs for the EC2 instance"
  type        = list(string)
}

variable "subnet" {
  description = "The subnet ID for the EC2 instance"
  type        = string
}