resource "aws_db_subnet_group" "mysql-rds-db-subnet" {

  name       = "${var.name}-mysql-subnet"
  subnet_ids = var.private_subnets

  tags = {
    "Name" = var.name
  }
}
