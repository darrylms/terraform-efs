//network.tf
resource "aws_vpc" "test-env" {
  cidr_block           = var.subnet_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "test-env"
  }
}

resource "aws_subnet" "subnet-efs" {
  cidr_block        = cidrsubnet(aws_vpc.test-env.cidr_block, 8, 8)
  vpc_id            = aws_vpc.test-env.id
  availability_zone = var.availability_zone
}

output "efs_subnet_id" {
  value = aws_subnet.subnet-efs.id
}

output "network_vpc_id" {
  value = aws_vpc.test-env.id
}
