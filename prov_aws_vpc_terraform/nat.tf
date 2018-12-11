#nat gw
resource "aws_eip" "nat" {
  vpc = true

  tags {
    Name = "${var.vpc_name}_nat_eip"
  }
}

resource "aws_nat_gateway" "vpc_nat" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.vpc_public_sn_1.id}"
  depends_on    = ["aws_internet_gateway.vpc_ig"]

  tags {
    Name = "${var.vpc_name}_nat"
  }
}
