data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_caller_identity" "current" {}

locals {
  name    = "${var.name}-${var.environment}"
  is_prod = var.environment == "prod"
  azs     = slice(data.aws_availability_zones.available.names, 0, 3)
}

module "vpc" {
  source = "../../modules/vpc"

  name             = local.name
  cidr_block       = "10.20.0.0/16"
  azs              = local.azs
  nat_gateway_mode = local.is_prod ? "per_az" : "single"
  eks_cluster_name = local.name
}

module "eks" {
  source = "../../modules/eks"

  cluster_name         = local.name
  kubernetes_version   = "1.31"
  vpc_id               = module.vpc.vpc_id
  subnet_ids           = module.vpc.private_subnet_ids
  admin_principal_arns = var.admin_principal_arns

  node_groups = {
    general = {
      instance_types = ["m6i.large"]
      min_size       = local.is_prod ? 3 : 2
      max_size       = local.is_prod ? 10 : 4
      desired_size   = local.is_prod ? 3 : 2
    }
    spot = {
      instance_types = ["m6i.large", "m5.large", "m5a.large"]
      capacity_type  = "SPOT"
      min_size       = 0
      max_size       = 10
      desired_size   = 0
      labels         = { workload = "batch" }
      taints         = [{ key = "spot", value = "true", effect = "NO_SCHEDULE" }]
    }
  }
}

module "artifacts_bucket" {
  source = "../../modules/s3-bucket"

  bucket_name           = "${local.name}-artifacts-${data.aws_caller_identity.current.account_id}"
  transition_to_ia_days = 30
  force_destroy         = !local.is_prod
}

module "db" {
  source = "../../modules/rds-postgres"

  identifier                 = "${local.name}-db"
  vpc_id                     = module.vpc.vpc_id
  subnet_ids                 = module.vpc.private_subnet_ids
  allowed_security_group_ids = [module.eks.cluster_security_group_id]

  multi_az            = local.is_prod
  deletion_protection = local.is_prod
  skip_final_snapshot = !local.is_prod
}
