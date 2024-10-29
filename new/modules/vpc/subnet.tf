resource "aws_subnet" "public" {
  # count             = length(var.public_subnet_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = var.availability_zones


  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-public-subnet-",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_route_table_association" "public" {
  # count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "private" {
  # count             = length(var.private_subnet_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = var.availability_zones
  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-private-subnet",
      Environment = var.environment,
      Owner       = var.owner,
      CostCenter  = var.cost_center,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}



