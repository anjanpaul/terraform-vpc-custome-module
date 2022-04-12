module "vpc" {
  source        = "./modules/vpc"
  cidr_block    = var.cidr_block
  private_cidrs = var.private_cidrs
  public_cidrs  = var.public_cidrs
  tags          = local.tags
}