# RDS PostgreSQL

Private, encrypted PostgreSQL. Password is managed by AWS Secrets Manager.

```hcl
module "db" {
  source     = "../../modules/rds-postgres"
  identifier = "platform-dev-db"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
}
```

**Outputs:** `endpoint`, `master_user_secret_arn`
