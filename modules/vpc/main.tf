/*======= VPC ========*/

resource "aws_vpc" "vpc" {
    cidr_block = "${var.vpc_cidr_block}"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "air-bringer- ${var.env_prifix[0]}-vpc"
        Environment = var.env_prifix[0]
        ManagedBy = "terrform"
    }
  
}

/* Internet gateway */

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
      Name = "${var.env_prifix[2]}-igw"
      Environment = "${var.env_prifix[2]}"
    }

  
}

/* public Subnet block */

resource "aws_subnet" "public-subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.subnet_cidr_block[0]
    availability_zone = var.availability_zone[0]
    map_public_ip_on_launch = "true"

    tags = {
      Name = "${var.env_prifix[2]}-subnet"
    }
  
}

/* private subnet block */
resource "aws_subnet" "private-subnet-1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.subnet_cidr_block[1]
    availability_zone = var.availability_zone[1]
    map_public_ip_on_launch = "false"

    tags = {
      Name = "private${var.env_prifix[1]}-subnet-1"
    }
  
}

resource "aws_subnet" "private-subnet-2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.subnet_cidr_block[2]
    availability_zone = var.availability_zone[2]
    map_public_ip_on_launch = "false"

    tags = {
      Name = "private${var.env_prifix[0]}-subnet-1"
    }
  
}
/* public route table block */

resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name = "${var.env_prifix[2]}-rtb"
    }
  
}

/* Elastic Ip */

resource "aws_eip" "eip" {
    vpc = true
  
}

/* Nat gateway */

resource "aws_nat_gateway" "nat-gateway" {
    allocation_id = "${aws_eip.eip.id}"
    subnet_id = "${aws_subnet.public-subnet.id}"
  
}

/* Private route table block */

resource "aws_route_table" "private-rt-1" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.nat-gateway.id}"
    }

    tags = {
        Name = "${var.env_prifix[0]}-rtb"
    }
  
}

resource "aws_route_table" "private-rt-2" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.nat-gateway.id}"
    }

    tags = {
        Name = "${var.env_prifix[1]}-rtb"
    }
  
}

/* Subnet association on route table */



resource "aws_route_table_association" "public_subnet_association" {
    route_table_id = aws_route_table.public-rt.id
    subnet_id = aws_subnet.public-subnet.id
  
}

resource "aws_route_table_association" "private_subnet_association-1" {
    route_table_id = aws_route_table.private-rt-1.id
    subnet_id = aws_subnet.private-subnet-1.id
  
}


resource "aws_route_table_association" "private_subnet_association-2" {
    route_table_id = aws_route_table.private-rt-2.id
    subnet_id = aws_subnet.private-subnet-2.id
  
}
