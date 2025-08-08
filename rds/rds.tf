resource "aws_rds_cluster" "mysql-cluster" {
  cluster_identifier  = "${var.name}-mysql"
  engine              = var.cluster_engine
  engine_version      = var.cluster_engine_version
  storage_encrypted   = var.storage_encrypted
  deletion_protection = var.deletion_protection

  skip_final_snapshot = var.skip_final_snapshot

  manage_master_user_password = true
  master_username             = "root"

  db_subnet_group_name = aws_db_subnet_group.mysql-rds-db-subnet.name

  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  vpc_security_group_ids = var.security_group_ids

  tags = {
    "Name" = var.name
  }
}
resource "aws_rds_cluster_instance" "mysql-instance-1" {
  count                      = 1
  engine                     = aws_rds_cluster.mysql-cluster.engine
  identifier                 = "${var.name}-mysql-1"
  cluster_identifier         = aws_rds_cluster.mysql-cluster.id
  instance_class             = var.rds_instance_class
  db_subnet_group_name       = aws_db_subnet_group.mysql-rds-db-subnet.name
  promotion_tier             = 5
  auto_minor_version_upgrade = false

  ca_cert_identifier = var.ca_cert_identifier

  tags = {
    "Name" = var.name
  }

  apply_immediately = var.apply_immediately
}

