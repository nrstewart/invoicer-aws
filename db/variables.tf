variable "db_security_group" {}
variable "db_password"       {}
#variable "subnet_ids"        {
#    type = "list"
#}
variable "subnet_id_0" {}
variable "subnet_id_1" {}
variable "subnet_id_2" {}
variable "environment" {}
variable "dbstorage" {
    default = "5"
}
variable "dbinstclass" {
    default = "db.t2.micro"
}
