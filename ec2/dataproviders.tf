data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = [var.cpu_architecture]
  }
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}
