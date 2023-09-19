module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_name    = var.cluster_name
  cluster_version = "1.23"
  subnets         = module.vpc.private_subnets

  vpc_id                          = module.vpc.vpc_id
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_additional_security_group_ids = [aws_security_group.sec_group_worker_all.id]

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = var.worker_instance_type_one
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.sec_group_worker_one.id]
      asg_desired_capacity          = var.worker_type_one_count
    },
    {
      name                          = "worker-group-2"
      instance_type                 = var.worker_instance_type_two
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.sec_group_worker_two.id]
      asg_desired_capacity          = var.worker_type_two_count
    } #,
    #{
    #  name                          = "worker-group-3"
    #  instance_type                 = var.worker_instance_type_three
    #  additional_userdata           = "echo foo bar"
    #  additional_security_group_ids = [aws_security_group.sec_group_worker_three.id]
    #  asg_desired_capacity          = var.worker_type_three_count
    #}
  ]

}

#resource "aws_eks_addon" "example" {
#  depends_on    = [module.eks]
#  cluster_name  = var.cluster_name
#  addon_name    = "vpc-cni"
#  addon_version = "v1.8.0-eksbuild.1"
#}


data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}