# Complete Example

Deploys VPC, EKS, S3, and RDS together. Set `environment = "prod"` for HA settings.

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init && terraform apply
terraform destroy   # clean up
```
