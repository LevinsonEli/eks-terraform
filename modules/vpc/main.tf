resource "aws_vpc" "eks_vpc" {
  cidr_block = var.vpc_cidr


  tags = merge(
    var.bootcamp_tags,
    {
      Name = "${var.naming_prefix}-${var.project_name}-vpc"
    }
  )
}

resource "aws_subnet" "eks_subnet" {
  count             = length(var.subnet_cidrs)
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "${var.naming_prefix}-${var.project_name}-subnet-${count.index}"
    }
  )
}

resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "${var.naming_prefix}-${var.project_name}-igw"
    }
  )
}

resource "aws_route_table" "eks_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = merge(
    var.bootcamp_tags,
    {
      Name = "${var.naming_prefix}-${var.project_name}-route-table"
    }
  )
}

resource "aws_route_table_association" "eks_route_table_association" {
  count          = length(var.subnet_cidrs)
  subnet_id      = aws_subnet.eks_subnet[count.index].id
  route_table_id = aws_route_table.eks_route_table.id
}
