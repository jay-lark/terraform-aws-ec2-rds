resource "aws_security_group" "rds" {
  name        = "${var.name}-rds"
  description = "${var.name}-rds"
  vpc_id      = var.vpc

}

resource "aws_security_group_rule" "rds-inbound" {
  security_group_id        = aws_security_group.rds.id
  source_security_group_id = aws_security_group.instance.id
  type                     = "ingress"
  protocol                 = "TCP"
  from_port                = 3306
  to_port                  = 3306
}
