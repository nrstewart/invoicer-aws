module "vpc" {
    source            = "./vpc"
    identifier        = "${var.identifier}-${random_uuid.main.result}"
    environment       = "${var.environment}"
}

module "security" {
    source            = "./security"
    environment       = "${var.environment}"
    identifier        = "${var.identifier}-${random_uuid.main.result}"
    vpc_id            = "${module.vpc.vpc_id}"
    ebs_id            = "${module.app.ebs_id}"
}

module "db" {
    source            = "./db"
    identifier        = "${var.identifier}-${random_uuid.main.result}"
    environment       = "${var.environment}"
    db_security_group = "${module.security.db_security_group}"
    db_password       = "${random_string.db_password.result}"
    subnet_id_0       = "${module.vpc.subnet_id_0}"
    subnet_id_1       = "${module.vpc.subnet_id_1}"
    subnet_id_2       = "${module.vpc.subnet_id_2}"
}

module "app" {
    source            = "./app"
    environment       = "${var.environment}"
    identifier        = "${var.identifier}-${random_uuid.main.result}"
    db_password       = "${random_string.db_password.result}"
    db_hostname       = "${module.db.db_hostname}"
    vpc_id            = "${module.vpc.vpc_id}"
    subnet_id_0       = "${module.vpc.subnet_id_0}"
    subnet_id_1       = "${module.vpc.subnet_id_1}"
    subnet_id_2       = "${module.vpc.subnet_id_2}"
}

resource "random_string" "db_password" {
    length            = 16
    special           = false
}

resource "random_uuid" "main" {}
