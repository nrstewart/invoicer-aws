output "db_hostname" {
    value = "${aws_db_instance.main.address}"
}
