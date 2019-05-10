output "url" {
    value = "${aws_elastic_beanstalk_environment.ivcr_ebs_env.cname}"
}

output "ebs_id" {
    value = "${data.aws_security_group.ebs_instance.id}"
}
