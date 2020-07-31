// security.tf
resource "aws_security_group" "ingress-efs-test" {
  name   = "ingress-efs-test-sg"
  vpc_id = var.vpc_id

  // NFS
//  ingress {
//    # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
//    # force an interpolation expression to be interpreted as a list by wrapping it
//    # in an extra set of list brackets. That form was supported for compatibility in
//    # v0.11, but is no longer supported in Terraform v0.12.
//    #
//    # If the expression in the following list itself returns a list, remove the
//    # brackets to avoid interpretation as a list of lists. If the expression
//    # returns a single list item then leave it as-is and remove this TODO comment.
//    security_groups = [aws_security_group.ingress-efs-test.id]
//    from_port       = 2049
//    to_port         = 2049
//    protocol        = "tcp"
//  }
//
//  // Terraform removes the default rule
//  egress {
//    # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
//    # force an interpolation expression to be interpreted as a list by wrapping it
//    # in an extra set of list brackets. That form was supported for compatibility in
//    # v0.11, but is no longer supported in Terraform v0.12.
//    #
//    # If the expression in the following list itself returns a list, remove the
//    # brackets to avoid interpretation as a list of lists. If the expression
//    # returns a single list item then leave it as-is and remove this TODO comment.
//    security_groups = [aws_security_group.ingress-efs-test.id]
//    from_port       = 0
//    to_port         = 0
//    protocol        = "-1"
//  }
}

resource "aws_security_group_rule" "ingress" {
  type            = "ingress"
  from_port       = 2049
  to_port         = 2049
  protocol        = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.ingress-efs-test.id
}

resource "aws_security_group_rule" "egress" {
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.ingress-efs-test.id
}

output "security_group_id" {
  value = aws_security_group.ingress-efs-test.id
}

