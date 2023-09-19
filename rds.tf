module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "3.5.0"

  identifier = var.rds_name

  engine               = "postgres"
  engine_version       = "13.7"
  family               = "postgres13" # DB parameter group
  major_engine_version = "13"         # DB option group
  instance_class       = var.rds_instance_type

  allocated_storage     = var.rds_allocated_storage_in_gb
  max_allocated_storage = var.rds_max_allocated_storage_in_gb

  name     = var.rds_pg_name
  username = var.rds_pg_user
  password = var.rds_pg_password
  port     = var.rds_pg_port

  iam_database_authentication_enabled = false
  deletion_protection                 = true

  multi_az               = true
  create_db_subnet_group = false
  db_subnet_group_name   = module.vpc.database_subnet_group
  vpc_security_group_ids = [aws_security_group.sec_group_worker_database.id]
}