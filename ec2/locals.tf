locals {
  subnet_id = var.publicly_accessible == true ? var.public_subnets[0] : var.private_subnets[0]
}
