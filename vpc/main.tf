resource "aws_vpc" "main" {
    cidr_block              = "172.32.0.0/16"
    enable_dns_hostnames    = true
    instance_tenancy        = "default"

    tags                    = {
        Name                = "${var.environment}"
        service             = "${var.identifier}"
    }
}

resource "aws_subnet" "main" {
    count                   = "${length(var.az-subnet-mapping)}"

    cidr_block              = "${lookup(var.az-subnet-mapping[count.index], "cidr")}"
    vpc_id                  = "${aws_vpc.main.id}"
    map_public_ip_on_launch = true
    availability_zone       = "${lookup(var.az-subnet-mapping[count.index], "az")}"

    tags                    = {
        Name                = "${var.environment}"
        service             = "${var.identifier}"
    }
}

resource "aws_internet_gateway" "main" {
    vpc_id                  = "${aws_vpc.main.id}"
}

resource "aws_route" "main" {
    route_table_id          = "${aws_vpc.main.main_route_table_id}"
    destination_cidr_block  = "0.0.0.0/0"
    gateway_id              = "${aws_internet_gateway.main.id}"
}

resource "aws_route_table_association" "main" {
    count                   = "${length(var.az-subnet-mapping)}"
    route_table_id          = "${aws_vpc.main.main_route_table_id}"
    subnet_id               = "${element(aws_subnet.main.*.id, count.index)}"
}
