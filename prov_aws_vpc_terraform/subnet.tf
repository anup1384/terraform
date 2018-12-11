data "aws_availability_zones" "available" {}

#Public Subnet
resource "aws_subnet" "vpc_public_sn_1" {
  vpc_id            = "${aws_vpc.vpc_name.id}"
  cidr_block        = "${var.vpc_public_subnet_1_cidr}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = "true"
  tags {
    Name = "${var.vpc_name}_vpc_public_sn_1"
  }
}

#Private subnet 
resource "aws_subnet" "vpc_private_sn_1" {
  vpc_id            = "${aws_vpc.vpc_name.id}"
  cidr_block        = "${var.vpc_private_subnet_1_cidr}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = "false"

  tags {
    Name = "${var.vpc_name}_vpc_private_sn_1"
  }
}
