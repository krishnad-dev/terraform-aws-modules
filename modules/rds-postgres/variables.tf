variable "identifier" {
  description = "Name of the RDS instance."
  type        = string
}

variable "engine_version" {
  description = "PostgreSQL major or major.minor version."
  type        = string
  default     = "16"
}

variable "instance_class" {
  description = "Instance size."
  type        = string
  default     = "db.t4g.medium"
}

variable "allocated_storage" {
  description = "Initial storage in GB."
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Upper limit for storage autoscaling in GB."
  type        = number
  default     = 100
}

variable "database_name" {
  description = "Name of the initial database."
  type        = string
  default     = "app"
}

variable "master_username" {
  description = "Master username. The password is generated and stored in Secrets Manager by RDS."
  type        = string
  default     = "dbadmin"
}

variable "vpc_id" {
  description = "VPC to deploy into."
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs (at least two AZs)."
  type        = list(string)
}

variable "allowed_security_group_ids" {
  description = "Security groups allowed to connect on 5432 (e.g. the EKS cluster security group)."
  type        = list(string)
  default     = []
}

variable "multi_az" {
  description = "Run a synchronous standby in a second AZ. Recommended for prod."
  type        = bool
  default     = false
}

variable "backup_retention_days" {
  description = "Days of automated backups to keep."
  type        = number
  default     = 7
}

variable "deletion_protection" {
  description = "Block accidental deletion."
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "Skip the final snapshot on destroy. Only set true for throwaway environments."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags applied to every resource."
  type        = map(string)
  default     = {}
}
