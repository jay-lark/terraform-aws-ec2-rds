output "rds_sg" {
  value = aws_security_group.rds.id
}
output "instance_sg" {
  value = aws_security_group.instance.id
}
