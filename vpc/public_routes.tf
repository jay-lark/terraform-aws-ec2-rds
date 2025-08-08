resource "aws_route_table" "vpc_public_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = "${var.name}-public"
  }

  count = length(var.availability_zones)
}

# add subnet association for public subnet to public route table
resource "aws_route_table_association" "vpc_public_rtb_assoc" {
  subnet_id      = element(aws_subnet.public-subnet.*.id, count.index)
  route_table_id = aws_route_table.vpc_public_route_table.*.id[count.index]

  count = length(var.public_subnets)
}

# create the default public route via igw
resource "aws_route" "vpc_igw_route" {
  route_table_id         = aws_route_table.vpc_public_route_table.*.id[count.index]
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc_igw.id

  count = length(var.availability_zones)
}
