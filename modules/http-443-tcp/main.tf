module "securitygroup" {
  source = "../.."

  name          = var.name
  description   = var.description
  vpc           = var.vpc
  ingress_rules = ["http-443-tcp"]
  egress_rules  = var.egress_rules
}
