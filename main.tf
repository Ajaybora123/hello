provider "aws" {
    region = "us-east-2"
}

data "aws_availability_zones" "azs" {
    state = "available"
}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = "my-vpc"
    cidr = var.vpc_cidr

    azs             = data.aws_availability_zones.azs.names
    public_subnets  = var.public_subnets

    enable_dns_hostnames    = true
    map_public_ip_on_launch = true

    tags = {
        Name        = "jenkins_vpc"
        Terraform   = "true"
        Environment = "dev"
    }

    public_subnet_tags = {
        Name = "jenkins_public_subnet"
    }
}

resource "aws_security_group" "my_security_group" {
    name        = var.security_group
    description = "My security group"

    ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = var.security_group
    }
}

resource "aws_instance" "my_instance" {
    ami                         = var.ami_id
    key_name                    = var.key_name
    instance_type               = var.instance_type
    security_groups             = [aws_security_group.my_security_group.name]
    vpc_security_group_ids      = [aws_security_group.my_security_group.id]
    tags = {
        Name = var.tag_name
    }
}

resource "aws_eip" "my_instance" {
    instance = aws_instance.my_instance.id
    tags = {
        Name = "my_elastic_ip"
    }
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}
