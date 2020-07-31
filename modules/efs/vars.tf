//variable "subnet_id" {
//  default: ""
//}

//variable subnet_cidr {
//  default: "10.0.0.0/16"
//}

variable efs_subnet_id {
  default = ""
  type = string
}

variable security_group_id {
  type = string
}

//variable availability_zone {
//  default: "us-east-1a"
//}