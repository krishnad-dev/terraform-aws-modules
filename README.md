# terraform-aws-modules

![CI](https://github.com/YOUR_GITHUB_USERNAME/terraform-aws-modules/actions/workflows/ci.yml/badge.svg)

Reusable, secure-by-default Terraform modules for an AWS platform.

| Module | Builds |
|--------|--------|
| [`vpc`](modules/vpc) | Multi-AZ VPC, subnets, NAT, flow logs |
| [`eks`](modules/eks) | Hardened EKS cluster with node groups and IRSA |
| [`s3-bucket`](modules/s3-bucket) | Private, encrypted S3 bucket |
| [`rds-postgres`](modules/rds-postgres) | Private RDS PostgreSQL |

## Quick start

```bash
cd examples/complete
terraform init && terraform apply
```

CI runs `fmt`, `validate`, TFLint, and Checkov on every push. Run locally with `make check`.

**Author:** Krishna Danda · [LinkedIn](https://www.linkedin.com/in/krishnad15) · MIT License
