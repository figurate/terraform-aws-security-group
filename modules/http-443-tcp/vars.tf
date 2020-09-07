variable "name" {
  description = "Name of the firewall configuration"
}

variable "description" {
  description = "An optional description for the security group"
  default     = null
}

variable "vpc" {
  description = "Name of the VPC to deploy to"
}

variable "egress_rules" {
  description = "A list of predefined rules for egress traffic"
  type        = list(string)
  default     = ["all-tcp", "all-udp"]
}
