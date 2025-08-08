resource "aws_route_table" "vpc_private_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = "${var.name}-private"
  }

  count = length(var.availability_zones)
}
# add subnet association for private subnet to private route table
resource "aws_route_table_association" "vpc_private_rtb_assoc" {
  subnet_id      = element(aws_subnet.private-subnet.*.id, count.index)
  route_table_id = aws_route_table.vpc_private_route_table.*.id[count.index]

  count = length(var.private_subnets)
}

# create default private route via ngw
resource "aws_route" "vpc_ngw_route" {
  route_table_id         = aws_route_table.vpc_private_route_table.*.id[count.index]
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.vpc_ngw.*.id[count.index]

  count = length(var.availability_zones)
}
