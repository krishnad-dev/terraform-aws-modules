variable "name" {
  description = "Name prefix applied to all VPC resources."
  type        = string
}

variable "cidr_block" {
  description = "IPv4 CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrhost(var.cidr_block, 0))
    error_message = "cidr_block must be a valid IPv4 CIDR, e.g. 10.0.0.0/16."
  }
}

variable "azs" {
  description = "Availability zones to spread subnets across (2-3 recommended)."
  type        = list(string)

  validation {
    condition     = length(var.azs) >= 2
    error_message = "At least two availability zones are required for high availability."
  }
}

variable "public_subnet_newbits" {
  description = "Bits added to the VPC prefix for public subnets (/16 + 8 = /24)."
  type        = number
  default     = 8
}

variable "private_subnet_newbits" {
  description = "Bits added to the VPC prefix for private subnets (/16 + 4 = /20, sized for EKS pod IPs)."
  type        = number
  default     = 4
}

variable "nat_gateway_mode" {
  description = "NAT strategy: 'none', 'single' (cheap, non-prod) or 'per_az' (highly available, prod)."
  type        = string
  default     = "single"

  validation {
    condition     = contains(["none", "single", "per_az"], var.nat_gateway_mode)
    error_message = "nat_gateway_mode must be one of: none, single, per_az."
  }
}

variable "enable_flow_logs" {
  description = "Send VPC flow logs to CloudWatch Logs."
  type        = bool
  default     = true
}

variable "flow_log_retention_days" {
  description = "Retention period for VPC flow logs."
  type        = number
  default     = 30
}

variable "eks_cluster_name" {
  description = "If set, subnets get the tags required by the AWS Load Balancer Controller for this EKS cluster."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags applied to every resource."
  type        = map(string)
  default     = {}
}
