resource "aws_default_security_group" "vpc-default" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = "${var.name}-vpc-default-sg"
  }

  ingress = []
  egress  = []
}
