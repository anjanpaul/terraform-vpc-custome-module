resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.public[keys(var.public_cidrs)[0]].id
  tags          = merge(var.tags, {
    Name = join("-", [var.tags["Env"], var.tags["Project"], "nat-gateway"])
  })
}

