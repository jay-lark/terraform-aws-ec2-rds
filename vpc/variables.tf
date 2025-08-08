variable "name" {
  type = string
}
variable "vpc_cidr" {
  type = string
}

variable "enable_dns_hostnames" {
  type = bool
}
variable "instance_tenancy" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "map_public_ip_addresses" {
  type = bool
}
