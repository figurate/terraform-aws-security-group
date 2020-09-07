/**
 * # ![AWS](aws-logo.png) Security Group
 *
 * Purpose: Blueprints for AWS Security Groups.
 */
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc]
  }
}

resource "aws_security_group" "securitygroup" {
  description = var.description
  tags = {
    Name = var.name
  }
  vpc_id = data.aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = local.rules[ingress.value][0]
      to_port     = local.rules[ingress.value][1]
      protocol    = local.rules[ingress.value][2]
      description = local.rules[ingress.value][3]
      cidr_blocks = [data.aws_vpc.vpc.cidr_block]
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = local.rules[egress.value][0]
      to_port     = local.rules[egress.value][1]
      protocol    = local.rules[egress.value][2]
      description = local.rules[egress.value][3]
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
