resource "aws_route_table" "public" {
  for_each = var.public_cidrs
  vpc_id   = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = merge(var.tags, {
    Name = join("-", [var.tags["Env"], var.tags["Project"], "public", each.key])
  })
}

resource "aws_route_table" "private" {
  for_each = var.private_cidrs
  vpc_id   = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = merge(var.tags, {
    Name = join("-", [var.tags["Env"], var.tags["Project"], "private", each.key])
  })
}





