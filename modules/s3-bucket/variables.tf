variable "bucket_name" {
  description = "Globally unique bucket name."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.bucket_name))
    error_message = "Bucket name must be 3-63 chars of lowercase letters, numbers, dots, and hyphens."
  }
}

variable "kms_key_arn" {
  description = "KMS key for SSE-KMS. When null, SSE-S3 (AES256) is used."
  type        = string
  default     = null
}

variable "versioning_enabled" {
  description = "Enable object versioning."
  type        = bool
  default     = true
}

variable "noncurrent_version_expiration_days" {
  description = "Delete old object versions after this many days (controls versioning cost). 0 disables."
  type        = number
  default     = 90
}

variable "transition_to_ia_days" {
  description = "Move current objects to STANDARD_IA after this many days. 0 disables."
  type        = number
  default     = 0
}

variable "expiration_days" {
  description = "Delete current objects after this many days (for logs/temp data). 0 disables."
  type        = number
  default     = 0
}

variable "force_destroy" {
  description = "Allow Terraform to delete a non-empty bucket. Only use for dev/test."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags applied to every resource."
  type        = map(string)
  default     = {}
}
