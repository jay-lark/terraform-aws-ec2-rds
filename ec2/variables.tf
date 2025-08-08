variable "name" {
  type = string
}
variable "instance_profile" {
  type = string
}

variable "cpu_architecture" {
  description = "The CPU architecture for the instance"
  type        = string
}
variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "publicly_accessible" {
  description = "Whether the EC2 instance should be publicly accessible"
  type        = bool
  default     = false
}

variable "public_subnets" {
  description = "Array of subnet addresses for the public primary subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "Array of subnet addresses for the private primary subnets"
  type        = list(string)
}

variable "instance_sg" {
  description = "Security group for the EC2 instance"
  type        = string
}
