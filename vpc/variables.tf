variable "identifier"        {}
variable "environment"       {}
variable "az-subnet-mapping" {
    type         = "list"
    default      = [
        {
            name = "us-east-2a"
            az   = "us-east-2a"
            cidr = "172.32.0.0/20"
        },
        {
            name = "us-east-2b"
            az   = "us-east-2b"
            cidr = "172.32.16.0/20"
        },
        {
            name = "us-east-2c"
            az   = "us-east-2c"
            cidr = "172.32.32.0/20"
        },
    ]
}

