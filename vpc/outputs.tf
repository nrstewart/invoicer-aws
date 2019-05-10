output "vpc_id" {
    value = "${aws_vpc.main.id}"
}

output "subnet_id_0" {
    value = "${element(aws_subnet.main.*.id, 0)}"
}

output "subnet_id_1" {
    value = "${element(aws_subnet.main.*.id, 1)}"
}

output "subnet_id_2" {
    value = "${element(aws_subnet.main.*.id, 2)}"
}
