variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes control plane version."
  type        = string
  default     = "1.31"
}

variable "vpc_id" {
  description = "VPC the cluster runs in."
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs for the control plane ENIs and worker nodes."
  type        = list(string)
}

variable "endpoint_public_access" {
  description = "Expose the Kubernetes API publicly. Keep false in prod and reach the API over VPN/bastion."
  type        = bool
  default     = false
}

variable "endpoint_public_access_cidrs" {
  description = "CIDRs allowed to reach the public API endpoint (only used when public access is on)."
  type        = list(string)
  default     = []
}

variable "enabled_log_types" {
  description = "Control plane log types sent to CloudWatch."
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "log_retention_days" {
  description = "Retention for control plane logs."
  type        = number
  default     = 30
}

variable "admin_principal_arns" {
  description = "IAM role/user ARNs granted cluster-admin through EKS access entries."
  type        = list(string)
  default     = []
}

variable "node_groups" {
  description = <<-EOT
    Managed node groups keyed by name. Example:
    {
      general = { instance_types = ["m6i.large"], min_size = 2, max_size = 6, desired_size = 2 }
      spot    = { instance_types = ["m6i.large", "m5.large"], capacity_type = "SPOT", min_size = 0, max_size = 10, desired_size = 0,
                  labels = { workload = "batch" }, taints = [{ key = "spot", value = "true", effect = "NO_SCHEDULE" }] }
    }
  EOT
  type = map(object({
    instance_types = list(string)
    capacity_type  = optional(string, "ON_DEMAND")
    min_size       = number
    max_size       = number
    desired_size   = number
    disk_size_gb   = optional(number, 50)
    labels         = optional(map(string), {})
    taints = optional(list(object({
      key    = string
      value  = optional(string)
      effect = string
    })), [])
  }))
  default = {
    general = {
      instance_types = ["m6i.large"]
      min_size       = 2
      max_size       = 4
      desired_size   = 2
    }
  }
}

variable "cluster_addons" {
  description = "EKS managed add-ons to install. Versions default to the latest compatible version."
  type        = list(string)
  default     = ["vpc-cni", "coredns", "kube-proxy", "eks-pod-identity-agent"]
}

variable "tags" {
  description = "Tags applied to every resource."
  type        = map(string)
  default     = {}
}
