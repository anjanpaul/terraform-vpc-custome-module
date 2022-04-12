variable "cidr_block" {
  type = string
}

variable "enable_dns_support" {
  default = true
  type    = bool
}

variable "enable_dns_hostname" {
  default = true
  type    = bool

}

variable "tags" {
  type = map(string)
}

variable "public_cidrs" {
  type = map(string)
}

variable "private_cidrs" {
  type = map(string)
}


