resource "aws_eip" "this" {
  vpc  = true
  tags = merge(var.tags, {
    Name = join("-", [var.tags["Env"], var.tags["Project"], "eip"])
  })

  lifecycle {
    prevent_destroy = true
  }
}

