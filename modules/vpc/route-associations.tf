resource "aws_route_table_association" "public" {
  for_each       = var.public_cidrs
  route_table_id = aws_route_table.public[each.key].id
  subnet_id      = aws_subnet.public[each.key].id
}

resource "aws_route_table_association" "private" {
  for_each       = var.private_cidrs
  route_table_id = aws_route_table.private[each.key].id
  subnet_id      = aws_subnet.private[each.key].id
}