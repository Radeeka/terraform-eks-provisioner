terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
  profile    = var.aws_profile
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


#module "eks" {
#  source       = "terraform-aws-modules/eks/aws"
#  version      = "18.20.5"
#  cluster_name = var.cluster_name
#}


#resource "aws_vpc" "sbca_server_dev" {
#  cidr_block = "10.0.0.0/16"
#}


#resource "aws_instance" "sbca-server-ins-1" {
#  ami           = "ami-2757f631"
#  instance_type = "t2.micro"
#
#  vpc_security_group_ids = [
#    aws_security_group.worker_group_one.id
#  ]
#  root_block_device {
#    delete_on_termination = true
#    #    iops                  = 150
#    #    volume_size           = 50
#    volume_type           = "gp2"
#  }
#
#  tags = {
#    Name        = "SERVER01"
#    Environment = "DEV"
#    OS          = "UBUNTU"
#  }
#
#  depends_on = [aws_security_group.worker_group_one]
#}


#output "ec2instance" {
#  value = aws_instance.sbca-server-ins-1.public_ip
#}
