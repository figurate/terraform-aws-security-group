module "securitygroup" {
  source = "../.."

  name          = var.name
  description   = var.description
  vpc_default   = var.vpc_default
  vpc_tags      = var.vpc_tags
  ingress_rules = ["https-443-tcp"]
  egress_rules  = var.egress_rules
}
