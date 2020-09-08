module "securitygroup" {
  source = "../.."

  name          = var.name
  description   = var.description
  vpc           = var.vpc
  ingress_rules = ["https-443-tcp"]
  egress_rules  = var.egress_rules
}
