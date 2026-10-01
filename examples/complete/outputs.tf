output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "configure_kubectl" {
  value = module.eks.kubeconfig_command
}

output "artifacts_bucket" {
  value = module.artifacts_bucket.bucket_id
}

output "db_endpoint" {
  value = module.db.endpoint
}

output "db_secret_arn" {
  value = module.db.master_user_secret_arn
}
