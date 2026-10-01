# VPC

Multi-AZ VPC with public/private subnets, NAT (`none`, `single`, or `per_az`), S3 endpoint, and flow logs.

```hcl
module "vpc" {
  source           = "../../modules/vpc"
  name             = "platform-dev"
  azs              = ["us-east-1a", "us-east-1b"]
  nat_gateway_mode = "single"
}
```

**Outputs:** `vpc_id`, `public_subnet_ids`, `private_subnet_ids`
