resource "aws_subnet" "public" {
  for_each                = var.public_cidrs
  vpc_id                  = aws_vpc.main.id
  availability_zone       = each.key
  cidr_block              = each.value
  tags                    = merge(var.tags, {
    Name = join("-", [var.tags["Env"], var.tags["Project"], "public-subnet", each.key])
  })
}

resource "aws_subnet" "private" {
  for_each                = var.private_cidrs
  vpc_id                  = aws_vpc.main.id
  availability_zone       = each.key
  cidr_block              = each.value
  tags                    = merge(var.tags, {
    Name = join("-", [var.tags["Env"], var.tags["Project"], "private-subnet", each.key])
  })
}