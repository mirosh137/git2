provider "aws" {
  region     = "us-east-1"
}

# Reference the existing security group
data "aws_security_group" "existing" {
  id = var.security_group_id
}

resource "aws_instance" "app_instance" {
  count                  = 2
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.ssh_key_name
  vpc_security_group_ids = [data.aws_security_group.existing.id]

  user_data = <<-EOF
    #!/bin/bash
    # Update packages and install required software using yum (for Amazon Linux)
    yum update -y
    yum install -y docker git

    # Install docker-compose if not available
    curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose

    # Start Docker and enable it on boot
    service docker start
    chkconfig docker on

    # Clone the repository into /home/ec2-user/flaskapp as the ec2-user
    sudo -u ec2-user git clone --branch master ${var.github_repo_url} /home/ec2-user/flaskapp

    # Change directory to the cloned repo and bring up docker-compose services
    cd /home/ec2-user/flaskapp
    /usr/local/bin/docker-compose up -d
  EOF

  tags = {
    Name = "flask-app-instance-${count.index + 1}"
  }
}


output "instance_public_ips" {
  value       = [for instance in aws_instance.app_instance : instance.public_ip]
  description = "Public IPs of the app instances"
}

