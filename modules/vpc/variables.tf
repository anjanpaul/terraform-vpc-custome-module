variable "region" {
  description = "AWS Deployment region.."
  default = "ap-southeast-1"
  type = string
  sensitive = true
}

variable "vpc_cidr_block"{
    description = "vpc cidr range"
    default = "10.0.0.0/16"
    type = string
    sensitive = true

}

variable "subnet_cidr_block" {
  description = "public subnet cidr range"
  default = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
  type = list
  sensitive = true
}


variable "env_prifix" {
  default = ["dev", "prod", "public"]
  type = list
  sensitive = false
}

variable "availability_zone" {
  description = "subnets availability zone"
  default = ["ap-southeast-1a", "ap-southeast-1a", "ap-southeast-1a"]
  type = list
  sensitive = false
  
}