resource "aws_subnet" "public_subnet" {
  count                   = length(local.public_subnets)
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = element(values(local.public_subnets), count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(keys(local.public_subnets), count.index)

  tags = merge(
    local.common_tags,
    {
      Name = "VisualpathTech-public_subnet"
    }
  )
}

resource "aws_subnet" "private_subnet" {
  count                   = length(local.private_subnets)
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = element(values(local.private_subnets), count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(keys(local.private_subnets), count.index)

  tags = merge(
    local.common_tags,
    {
      Name = "VisualpathTech-private_subnet"
    }
  )
}