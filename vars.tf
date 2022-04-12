variable "tags" {
  type = map(string)
}

variable "cidr_block" {
  type = string
}

variable "private_cidrs" {
  type = map(string)
}

variable "public_cidrs" {
  type = map(string)
}
