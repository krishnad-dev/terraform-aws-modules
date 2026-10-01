# S3 Bucket

Private, encrypted, versioned S3 bucket with TLS-only access and lifecycle cost controls.

```hcl
module "bucket" {
  source      = "../../modules/s3-bucket"
  bucket_name = "my-unique-bucket-name"
}
```

**Outputs:** `bucket_id`, `bucket_arn`
