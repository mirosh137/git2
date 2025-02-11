// variables.tf

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  
}

variable "aws_secret_key" {
  description = "AWS Secret Access Key"
  type        = string
  
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances (Ubuntu, etc.)"
  type        = string
  default     = "ami-032ae1bccc5be78ca"
}

variable "ssh_key_name" {
  description = "Name of the SSH key pair for EC2 instances"
  type        = string
  default     = "MyDynamicKey"
}

variable "vpc_id" {
  description = "VPC ID where the instances will be deployed"
  type        = string
  default     = "vpc-06537dc8a299b877c"
}

variable "security_group_id" {
  description = "Existing Security Group ID to attach to the EC2 instances"
  type        = string
  default     = "sg-0c9ee9ee2981a85e7"
}

variable "github_repo_url" {
  description = "GitHub repository URL for the application"
  type        = string
  default     = "https://github.com/mirosh137/git2.git"
}

variable "instance_type" {
  description = "EC2 instance type to use"
  type        = string
  default     = "t2.micro"
}

