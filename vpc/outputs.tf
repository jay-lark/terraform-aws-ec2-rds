output "vpc" {
  value = aws_vpc.vpc
}

output "private_subnets" {
  value = aws_subnet.private-subnet.*.id
}

output "public_subnets" {
  value = aws_subnet.public-subnet.*.id
}

output "private_route_table" {
  value = aws_route_table.vpc_private_route_table.*.id
}

output "public_route_table" {
  value = aws_route_table.vpc_public_route_table.*.id
}

output "nat_gateway" {
  value = {
    public_ip  = aws_nat_gateway.vpc_ngw.*.public_ip
    private_ip = aws_nat_gateway.vpc_ngw.*.private_ip
    id         = aws_nat_gateway.vpc_ngw.*.id
  }
}

output "vpc_default_security_group" {
  value = aws_default_security_group.vpc-default
}

