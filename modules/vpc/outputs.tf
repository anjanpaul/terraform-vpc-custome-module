output "vpc_id" {
    value = aws_vpc.vpc.id
  
}

output "public_subnets" {
  value = aws_subnet.public-subnet.id
}

output "private_subnet-1" {
  value = aws_subnet.private-subnet-1.id
}

output "private_subnet-2" {
  value = aws_subnet.private-subnet-2.id
}

output "eip" {
  value = aws_eip.eip
}