#Internet gateway
resource "aws_internet_gateway" "vpc_ig" {
  vpc_id = "${aws_vpc.vpc_name.id}"

  tags {
    Name = "${var.vpc_name}_ig"
  }
}
