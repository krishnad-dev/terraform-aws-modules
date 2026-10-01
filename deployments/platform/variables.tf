variable "region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "us-east-1"
}

variable "azs" {
  description = "Availability zones to use. Pinned explicitly so the network layout never shifts when AWS adds a new AZ."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "environment" {
  description = "Environment name (dev, staging, prod)."
  type        = string
  default     = "dev"
}

variable "name" {
  description = "Base name for the platform."
  type        = string
  default     = "platform"
}

variable "admin_principal_arns" {
  description = "IAM roles/users that get cluster-admin on EKS."
  type        = list(string)
  default     = []
}
