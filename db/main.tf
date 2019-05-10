resource "aws_db_subnet_group" "main" {
    name            = "${var.environment}"
    subnet_ids      = ["${var.subnet_id_0}", "${var.subnet_id_1}", "${var.subnet_id_2}"]
    tags            = {
        Name        = "${var.environment}"
    }
}

resource "aws_db_instance" "main" {
    name                    = "invoicer"
    identifier              = "${var.environment}"
    vpc_security_group_ids  = ["${var.db_security_group}"]
    allocated_storage       = "${var.dbstorage}"
    instance_class          = "${var.dbinstclass}"
    engine                  = "postgres"
    engine_version          = "9.6.2"
    publicly_accessible     = "true"
    username                = "invoicer"
    password                = "${var.db_password}"
    multi_az                = "false"
    db_subnet_group_name    = "${aws_db_subnet_group.main.name}"
    skip_final_snapshot     = "true"
    tags                    = [
        {"environment-name" = "invoicer-api"},
        {"Owner"            = "neil"}
    ]
}
