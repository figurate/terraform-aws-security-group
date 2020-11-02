/**
 * # ![AWS](aws-logo.png) Security Group
 *
 * Purpose: Blueprints for AWS Security Groups.
 *
 * ![AWS Security Group](aws_security_group.png)
 *
 * <div>Icons made by <a href="https://www.flaticon.com/authors/vitaly-gorbachev" title="Vitaly Gorbachev">Vitaly Gorbachev</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
 * <div>Icons made by <a href="https://www.flaticon.com/authors/those-icons" title="Those Icons">Those Icons</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
 */
data "aws_vpc" "tenant" {
  default = var.vpc_default
  tags    = var.vpc_tags
}

resource "aws_security_group" "securitygroup" {
  description = var.description
  tags = {
    Name = var.name
  }
  vpc_id = data.aws_vpc.tenant.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = local.rules[ingress.value][0]
      to_port     = local.rules[ingress.value][1]
      protocol    = local.rules[ingress.value][2]
      description = local.rules[ingress.value][3]
      cidr_blocks = [data.aws_vpc.tenant.cidr_block]
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
