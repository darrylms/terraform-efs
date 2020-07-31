
//variable "subnet_id" {
//  default: ""
//}

variable subnet_cidr {
  default = "10.0.0.0/16"
  type = string
}

//variable efs_subnet_id {
//  default: ""
//}

variable availability_zone {
  default = "us-east-1a"
  type = string
}