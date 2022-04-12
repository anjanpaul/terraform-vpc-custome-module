locals {
  env  = terraform.workspace
  tags = merge(var.tags, {
    Env = local.env
  })
}