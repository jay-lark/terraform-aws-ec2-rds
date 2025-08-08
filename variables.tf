variable "name" {
  description = "Commond name for resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}
variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "availability_zones" {
  description = "List of availability zones for the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "Array of subnet addresses for the private primary subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "Array of subnet addresses for the public primary subnets"
  type        = list(string)
}

variable "map_public_ip_addresses" {
  description = "Whether public IP addresses should be mapped to launched instances in the public subnet"
  type        = bool
  default     = false
}


variable "cpu_architecture" {
  description = "The CPU architecture for the instance"
  type        = string
  default     = "arm64"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t4g.large"
}

variable "publicly_accessible" {
  description = "Whether the EC2 instance should be publicly accessible"
  type        = bool
  default     = false
}

variable "cluster_engine" {
  description = "The engine type for the RDS cluster"
  type        = string
  default     = "aurora-mysql"
}

variable "cluster_engine_version" {
  description = "The engine version for the RDS cluster"
  type        = string
  default     = "8.0.mysql_aurora.3.07.1"
}

variable "storage_encrypted" {
  description = "Whether the RDS storage should be encrypted"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Whether deletion protection is enabled for the RDS cluster"
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot when deleting the RDS cluster"
  type        = bool
  default     = false
}

variable "iam_database_authentication_enabled" {
  description = "Whether IAM database authentication is enabled for the RDS cluster"
  type        = bool
  default     = false
}

variable "rds_instance_class" {
  description = "The instance class for the RDS cluster instances"
  type        = string
  default     = "db.t4g.large"
}

variable "auto_minor_version_upgrade" {
  description = "Whether to enable auto minor version upgrade for the RDS cluster instances"
  type        = bool
  default     = true
}

variable "ca_cert_identifier" {
  description = "The CA certificate identifier for the RDS cluster"
  type        = string
  default     = "rds-ca-rsa2048-g1"
}

variable "apply_immediately" {
  description = "Whether to apply changes immediately"
  type        = bool
  default     = false
}
