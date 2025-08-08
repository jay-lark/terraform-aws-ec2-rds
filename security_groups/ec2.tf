resource "aws_security_group" "instance" {
  name        = "${var.name}-instance"
  description = "${var.name}-instance"
  vpc_id      = var.vpc

}

resource "aws_security_group_rule" "instance-outbound" {
  security_group_id = aws_security_group.instance.id
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
