provider "aws" {
    region = "ap-southeast-1"
}

module "vpc" {
    source = "./modules/vpc"

}