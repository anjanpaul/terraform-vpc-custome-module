resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostname
  tags                 = merge(var.tags, {
    Name = join("-", [var.tags["Env"], var.tags["Project"]])
  })

  lifecycle {
    prevent_destroy = true
  }
}