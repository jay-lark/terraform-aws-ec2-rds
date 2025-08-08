resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = var.name
  }
}

# Get an EIP for each NAT gateway for this environment
resource "aws_eip" "vpc_eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.vpc_igw]

  tags = {
    "Name" = var.name
  }

  count = length(var.availability_zones)
}

# Create a NAT gateway for each subnet in this environment
resource "aws_nat_gateway" "vpc_ngw" {
  allocation_id = aws_eip.vpc_eip.*.id[count.index]
  subnet_id     = aws_subnet.public-subnet.*.id[count.index]

  tags = {
    "Name" = var.name
  }

  count = length(var.availability_zones)
}
