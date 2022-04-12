resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.main.id
  tags   = {
    Name        = var.tags["Project"]
    Environment = var.tags["Project"]
  }

  lifecycle {
    prevent_destroy = true
  }
}