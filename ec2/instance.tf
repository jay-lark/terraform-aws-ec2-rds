resource "aws_instance" "instance" {
  ami                         = data.aws_ami.al2023.id
  instance_type               = var.instance_type
  iam_instance_profile        = var.instance_profile
  subnet_id                   = local.subnet_id
  associate_public_ip_address = var.publicly_accessible
  security_groups             = [var.instance_sg]

  tags = {
    Name = var.name
  }
}
