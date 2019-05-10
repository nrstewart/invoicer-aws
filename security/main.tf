resource "aws_security_group" "ivcr_postgresDB" {
    name              = "${var.identifier}"
    description       = "access control to Invoicer Postgres DB"
    vpc_id            = "${var.vpc_id}"
    tags              = {
        service       = "${var.environment}"
    }
}

resource "aws_security_group_rule" "port_5432" {
    type                     = "ingress"
    from_port                = 5432
    to_port                  = 5432
    protocol                 = "tcp"
    source_security_group_id = "${var.ebs_id}"
    security_group_id        = "${aws_security_group.ivcr_postgresDB.id}"
}
