variable "name" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "cluster_engine" {
  type = string
}

variable "cluster_engine_version" {
  type = string
}

variable "storage_encrypted" {
  type = bool
}

variable "deletion_protection" {
  type = bool
}

variable "skip_final_snapshot" {
  type = bool
}

variable "iam_database_authentication_enabled" {
  type = bool
}

variable "security_group_ids" {
  type = list(string)
}

variable "rds_instance_class" {
  type = string
}

variable "auto_minor_version_upgrade" {
  type = bool
}

variable "ca_cert_identifier" {
  type = string
}

variable "apply_immediately" {
  type = bool
}
