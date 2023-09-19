variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 80]
}

resource "aws_security_group" "sec_group_worker_one" {
  name_prefix = "sec_group_worker_one"
  vpc_id      = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "sec_group_worker_two" {
  name_prefix = "sec_group_worker_two"
  vpc_id      = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

#resource "aws_security_group" "sec_group_worker_three" {
#  name_prefix = "sec_group_worker_three"
#  vpc_id      = module.vpc.vpc_id
#
#  dynamic "ingress" {
#    for_each = var.sg_ports
#    iterator = port
#    content {
#      from_port   = port.value
#      to_port     = port.value
#      protocol    = "tcp"
#      cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
#    }
#  }
#
#  lifecycle {
#    create_before_destroy = true
#  }
#}

resource "aws_security_group" "sec_group_worker_all" {
  name_prefix = "sec_group_worker_all"
  vpc_id      = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "sec_group_worker_database" {
  name_prefix = "sec_group_worker_all"
  vpc_id      = module.vpc.vpc_id

  // To Allow DB Port 5432 for Postgres
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
    #    cidr_blocks = module.vpc.vpc_cidr_block
  }

  lifecycle {
    create_before_destroy = true
  }
}