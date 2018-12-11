# Routing table for public subnet
resource "aws_route_table" "vpc_public_sn_rt" {
  vpc_id = "${aws_vpc.vpc_name.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.vpc_ig.id}"
  }

  tags {
    Name = "vpc_public_sn_rt"
  }
}

# Routing table for private subnet

resource "aws_route_table" "vpc_private_sn_rt" {
  vpc_id = "${aws_vpc.vpc_name.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.vpc_nat.id}"
  }

  tags {
    Name = "vpc_private_sn_rt"
  }
}

# Associate the routing table to public subnet

resource "aws_route_table_association" "vpc_public_sn_rt_assn" {
  subnet_id      = "${aws_subnet.vpc_public_sn_1.id}"
  route_table_id = "${aws_route_table.vpc_public_sn_rt.id}"
}

# Associate the routing table to private subnet

resource "aws_route_table_association" "vpc_private_sn_rt_assn" {
  subnet_id      = "${aws_subnet.vpc_private_sn_1.id}"
  route_table_id = "${aws_route_table.vpc_private_sn_rt.id}"
}
