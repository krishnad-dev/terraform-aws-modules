# EKS

EKS cluster with private API, KMS-encrypted secrets, IRSA, access entries, and managed node groups.

```hcl
module "eks" {
  source       = "../../modules/eks"
  cluster_name = "platform-dev"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnet_ids
}
```

**Outputs:** `cluster_name`, `cluster_endpoint`, `oidc_provider_arn`, `kubeconfig_command`
